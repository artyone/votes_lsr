<?php

require_once 'bootstrap.php';
$connection = connection($config['dbWork']);
$md5email = $_GET['code'] ?? null;
$language = $_GET['lang'] ?? 'ru';
$userID = getUserByMd5($connection, $md5email);
if ($language == 'ru') {
    $pages = [
        'header' => 'headerRu.php',
        'thanks' => 'thanksRu.php',
        'error' => 'errorRu.php',
        'votes' => 'votesRu.php'
    ];
} else {
    $pages = [
        'header' => 'headerEng.php',
        'thanks' => 'thanksEng.php',
        'error' => 'errorEng.php',
        'votes' => 'votesEng.php'
    ];
}

if ($userID && getUserInAnswer($connection, $userID)) {

    if (!empty($_POST) && count($_POST) == 22) {
        foreach ($_POST as $key => $value) {
            insertAnswers($connection, $userID, $key, $value);
        }

        $pageContent = includeTemplate($pages['thanks'], []);
    }

    else {
        $questions = getAllQuestions($connection, $language);
        $pageContent = '';
        $oldQuestion = '';
        foreach ($questions as $question) {

            if ($question['name_tome'] == $oldQuestion) {
                $question['name_tome'] = null;
            } else {
                $oldQuestion = $question['name_tome'];
            }
            $pageContent = $pageContent . includeTemplate($pages['votes'], $question);
        }
    }

} else {
    $pageContent = includeTemplate($pages['error'], []);
}

$layoutContent = includeTemplate($pages['header'],
    [
        'md5email' => $md5email,
        'language' => $language,
        'pageContent' => $pageContent
    ]
);

print $layoutContent;




//UPDATE users SET link = CONCAT('http://esg.lsrgroup.ru/?code=', HASH,'&lang=', LANGUAGE );
//UPDATE users SET HASH = MD5(email);
///SELECT email AS Почта, language AS Язык, name_tome_ru AS Раздел, question_ru AS Вопрос, answer AS Ответ FROM (SELECT a.uid, q.question_ru, a.answer, q.name_tome_ru FROM answers AS a JOIN questions AS q WHERE a.qid = q.id ORDER BY q.tome ASC) AS ans JOIN users AS u WHERE u.id = ans.uid ORDER by email ASC;