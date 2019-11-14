<?php

/**
 * Функция подключения к базе данных
 * @param array $config массив с данными подключениями
 * @return false|mysqli результат выполненения функции mysqli_connect
 */
function connection(array $config): mysqli
{
    $connect = mysqli_connect($config['host'], $config['user'], $config['password'], $config['database']);
    if (!$connect) {
        print 'Ошибка при подключении к БД: ' . mysqli_connect_error();
        die();
    }
    mysqli_set_charset($connect, "utf8");
    return $connect;
}

/**
 * Создает подготовленное выражение на основе готового SQL запроса и переданных данных из академии
 *
 * @param $link mysqli Ресурс соединения
 * @param $sql string SQL запрос с плейсхолдерами вместо значений
 * @param array $data Данные для вставки на место плейсхолдеров
 *
 * @return mysqli_stmt Подготовленное выражение
 */
function db_get_prepare_stmt($link, $sql, $data = [])
{
    $stmt = mysqli_prepare($link, $sql);

    if ($stmt === false) {
        $errorMsg = 'Не удалось инициализировать подготовленное выражение: ' . mysqli_error($link);
        die($errorMsg);
    }

    if ($data) {
        $types = '';
        $stmt_data = [];

        foreach ($data as $value) {
            $type = 's';

            if (is_int($value)) {
                $type = 'i';
            } else if (is_string($value)) {
                $type = 's';
            } else if (is_double($value)) {
                $type = 'd';
            }

            if ($type) {
                $types .= $type;
                $stmt_data[] = $value;
            }
        }

        $values = array_merge([$stmt, $types], $stmt_data);

        $func = 'mysqli_stmt_bind_param';
        $func(...$values);

        if (mysqli_errno($link) > 0) {
            $errorMsg = 'Не удалось связать подготовленное выражение с параметрами: ' . mysqli_error($link);
            die($errorMsg);
        }
    }

    return $stmt;
}

/**
 * Функция получения пользователя из базы данных из хэша
 * @param mysqli $connection результат выполнения функции подключения к БД
 * @param string $md5email хэш эл. почты
 * @return int возвращает null или id пользователя в зависимости от наличия пользователя в бд
 */
function getUserByMd5(mysqli $connection, ?string $md5email) : ?int
{
    $sqlQuery = "SELECT id FROM users WHERE hash = ?";  //completed <> 1 and
    $stmt = db_get_prepare_stmt($connection, $sqlQuery, [$md5email]);
    mysqli_stmt_execute($stmt);
    $resource = mysqli_stmt_get_result($stmt);
    $result = mysqli_fetch_assoc($resource);

    if (!$result) {
        return null;
    }
    return $result['id'];
}

/**
 * Функция получения всех вопросов, тем и айди из базы
 * @param mysqli $connection результат выполнения функции подключения к БД
 * @param $language язык пользователя
 * @return array возвращает массив вопросов
 */
function getAllQuestions(mysqli $connection, $language) : array
{
    $sqlQuery = "SELECT id, tome, name_tome_". $language ." as name_tome, number, question_".$language." as question, opisanie_" .$language." as opisanie 
    FROM (SELECT * FROM (SELECT * FROM questions ORDER BY `number` ASC) AS a ORDER BY `tome` ASC) as b";
    $stmt = db_get_prepare_stmt($connection, $sqlQuery, []);
    mysqli_stmt_execute($stmt);
    $resource = mysqli_stmt_get_result($stmt);
    $result = mysqli_fetch_all($resource, MYSQLI_ASSOC);

    if (!$result) {
        return [];
    }
    return $result;
}

//записывает результаты ответов из $_POST
/**
 * @param mysqli $connection результат выполнения функции подключения к БД
 * @param $userID id пользователя
 * @param $qid id вопроса
 * @param $answer ответ пользователя
 * @return int|null возвращает результат записи
 */
function insertAnswers(mysqli $connection, int $userID, int $qid, string $answer) : ?int
{

    $sqlQuery = "INSERT INTO answers (uid, qid, answer) VALUES (?,?,?)";
    $stmt = db_get_prepare_stmt($connection, $sqlQuery, [$userID, $qid, htmlspecialchars($answer)]);
    mysqli_stmt_execute($stmt);
    $resource = mysqli_insert_id($connection);
    return $resource;
}

/**
 * @param mysqli $connection результат выполнения функции подключения к БД
 * @param $userID int id пользователя
 * @return bool возвращает есть ли пользователь в ответах или нет
 */
function getUserInAnswer(mysqli $connection, int $userID) : bool
{
    $sqlQuery = "SELECT id FROM answers WHERE uid = (?)";
    $stmt = db_get_prepare_stmt($connection, $sqlQuery, [$userID]);
    mysqli_stmt_execute($stmt);
    $resource = mysqli_stmt_get_result($stmt);
    $result = mysqli_fetch_assoc($resource);
    if (empty($result)) {
        return true;
    }
    return false;
}