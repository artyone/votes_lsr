<?php

require_once 'bootstrap.php';
$connection = connection($config['dbWork']);
$md5email = $_GET['code'] ?? null;
$language = $_GET['lang'] ?? null;
$mail = $_GET['mail'] ?? '0';
$userID = getUserByMd5($connection, $md5email);
$checkPost = true;  //переменная для проверки ошибок/подмены заполнения анкеты

if ($language == 'eng') {
    $pages = [
        'header' => 'headerEng.php',
        'thanks' => 'thanksEng.php',
        'error' => 'errorEng.php',
        'votes' => 'votesEng.php'
    ];
} else {
    $language = 'ru';
    $pages = [
        'header' => 'headerRu.php',
        'thanks' => 'thanksRu.php',
        'error' => 'errorRu.php',
        'votes' => 'votesRu.php'
    ];
}

if ($userID && getUserInAnswer($connection, $userID)) {
    $answers = $_POST ?? null;

    if (!empty($answers) && $checkPost = checkAnswers($answers)) {
        foreach ($answers as $qid => $answer) {
            insertAnswers($connection, $userID, (int)substr($qid, 1), $answer);
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
        'pageContent' => $pageContent,
        'checkPost' => $checkPost
    ]
);

print $layoutContent;

//блок рассылки с сервера
if ($mail == '1') {
    $users = getUser($connection);
    foreach ($users as $user) {
        $to = $user['email'];
        if ($user['language'] == 'ru') {
            $subject = 'Оценка существенности в области устойчивого развития';
            $message = '<p>' . $user['name'] . ', добрый день, </p>
 
                    <p>Благодарим за сотрудничество при подготовке Отчета об устойчивом развитии за 2018 год, 
                    который доступен по <a href="https://www.lsrgroup.ru/assets/files/sustainability-report-rus-25072019.pdf">ссылке</a>.</p>
                     
                    <p>Для подготовки следующего Отчета об устойчивом развитии за 2019 год в соответствии с международными Стандартами GRI
                     <b>просим Вас заполнить небольшую анкету до <span style="color:red"> 
                    25 ноября (включительно) </span> <u><a href="' . $user['link'] . '">по этой ссылке</a></u></b>.
                    Анкета содержит предварительный список существенных тем для раскрытия в Отчете об устойчивом развитии за 2019 год. <br>
                    Буду рада ответить на любые вопросы.</p>
                     
                    <p>Спасибо за сотрудничество!</p>
                    
                    <p>С уважением, <br>
                    <b>Елена Деева</b> <br>
                    Начальник отдела по устойчивому развитию <br>
                    Дирекция по работе с инвесторами и устойчивому развитию <br>
                    ПАО «Группа ЛСР» <br>
                    
                    Тел.: +7 (495) 139 29 50 доб. 46011 <br>
                    Моб.: +7 929 5269126 <br>
                    E-mail: Deeva.EA@lsrgroup.ru <br>
                    www.lsrgroup.ru </p>
                    <img src="https://www.lsrgroup.ru/assets/img/lsr-rus.png" width="123" height="40" alt="lsr">';
        } else {
            $subject = 'LSR Group ESG materiality assessment';
            $message = '<p>Dear ' . $user['name'] . ',</p>
 
                    <p>In order to improve LSR Group’s non-financial disclosure and reporting we would like to ask you 
                    to participate in the process to identify significant topics that, in your opinion, shall be disclosed 
                    in our sustainability report 2019.</p>
                     
                    <p><b>Could you please fill out the questionnaire on significant topics to be disclosed in the 2019 Sustainability Report <u><a href="' . $user['link'] . '">via 
                     the link</a></u> by <span style="color:red">November 25</span>.</b> Your feedback is extremely valuable to us. </p>
                     
                    <p>I will be happy to answer any questions regarding the questionnaire or ESG issues. </p>
                    
                    <p>Thank you very much for your kind cooperation!  </p>
                    
                    <p>Best regards, <br>
                    <b>Elena Deeva</b> <br>
                    Head of Sustainable Development <br>
                    
                    Tel.: +7 (495) 139 29 50 ext. 46011 <br>
                    Mob.: +7 929 5269126 <br>
                    E-mail: Deeva.EA@lsrgroup.ru <br>
                    www.lsrgroup.ru </p>
                    <img src="https://www.lsrgroup.ru/assets/img/lsr-rus.png" width="123" height="40" alt="lsr">';
        }
        $headers = 'FROM: Deeva.EA@lsrgroup.ru' . "\r\n";
        $headers .= 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; windows-1251' . "\r\n";
        print 'Письмо ' . $user['email'] . ' ' . (mail($to, $subject, $message, $headers)) . 'отправлено <br>';
        sleep(1);  //задержка для избежания ошибки сервера рассылки

    }

}

//запросы на добавление хэша в базу и создания ссылки
//UPDATE users SET HASH = MD5(email);
//UPDATE users SET link = CONCAT('http://esg.lsrgroup.ru/?code=', HASH,'&lang=', LANGUAGE );
//запрос на вывод результатов голосования
//SELECT email AS Почта, language AS Язык, name_tome_ru AS Раздел, question_ru AS Вопрос, answer AS Ответ FROM (SELECT a.uid, q.question_ru, a.answer, q.name_tome_ru FROM answers AS a JOIN questions AS q WHERE a.qid = q.id ORDER BY q.tome ASC) AS ans JOIN users AS u WHERE u.id = ans.uid ORDER by email ASC;
