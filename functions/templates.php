<?php


/**
 * Подключает шаблон, передает туда данные и возвращает итоговый HTML контент. Функция предоставлена академией
 * @param string $name Путь к файлу шаблона относительно папки templates
 * @param array $data Ассоциативный массив с данными для шаблона
 * @return string Итоговый HTML
 */
function includeTemplate(string $name, array $data = []) : string
{
    $name = 'templates/' . $name;
    $result = '';

    if (!is_readable($name)) {
        return $result;
    }

    ob_start();
    extract($data);
    require $name;

    $result = ob_get_clean();

    return $result;
}

/**
 * функция проверки результата ответа пользователя, проверяет ли совпадает ли количество ответов с количеством вопросов
 * и входит ли ответ в отрезок от 1 до 4
 * @param $answers array массив ответов
 * @return bool возвращает результат проверки
 */
function checkAnswers(array $answers) : bool
{
    if (count($answers) == 22) {
        foreach($answers as $qid => $answer) {
            if (substr($qid, 0, 1) === 'r') {
                $newAnswer = (int)$answer;
                if (strcmp($newAnswer, $answer) !== 0 || ($answer < 1 || $answer > 4)) {
                    return false;
                }
            }

        }
        return true;
    }
    return false;
}