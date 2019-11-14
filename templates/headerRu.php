<!DOCTYPE html>
<html lang="ru">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/image/favicon.ico">
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/main.css">

    <title>Голосование</title>
</head>
<body>

<div class="container">
    <h2 class="text-center">Анкета по существенным ESG темам для раскрытия в <br>
        Отчете об устойчивом развитии за 2019 год</h2>
    <br>
    <div class="text-justify">
        <p>
            <em>Оценка существенности проводится в соответствии с рекомендациями международных Стандартов отчетности
                в области устойчивого развития Глобальной инициативы по отчетности GRI. </em> <br><br>
            Ниже представлен перечень тем по результатам оценки существенности, а также примеры показателей. <br>
            Какие темы, по Вашему мнению, являются наиболее существенными  для Группы ЛСР? <br>
            Варианты оценки: высокий, средний и низкий уровень существенности, несущественная тема.
        </p>
    </div>
    <?php if (!$checkPost) { ?>
        <p style="color:#DF1E42"><b>Некорректно выбраны варианты ответов. Пожалуйста, повторите попытку. </b></p>
    <?php } ?>
<form name="form" action="/?<?= http_build_query(['code'=> $md5email, 'lang' => $language]) ?>" method="post" id="form-votes">

    <?= $pageContent ?>

    <?php if ($pageContent <> '<p><b>Вы уже прошли данный опрос или ссылка неверная</b></p>' &&
        $pageContent <> '<p><b>Спасибо за сотрудничество.</b></p>') { ?>
        <div class="form-group text-center">
            <br>
            <button type="submit" class="btn btn-primary">Отправить</button>
        </div>
    <?php } ?>
</form>
</div>

<script src="../assets/js/main.js"></script>

</body>


</html>