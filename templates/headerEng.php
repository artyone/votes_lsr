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
    <h2 class="text-center">Questionnaire on significant ESG<sup><a href="#hint1" class="hint__link">[1]</a></sup>
        topics to be disclosed
        <br> in the 2019 Sustainability Report </h2>
    <br>
    <div class="text-justify">
        <p>
            <em>Materiality assessment is carried out in accordance with the recommendations of international Sustainability Reporting Standards of the Global
                Reporting Initiative (GRI).</em><br><br>
            Below is a list of topics based on our materiality assessment, as well as examples of indicators.<br>
            Which topics do you think have the most significant effect on LSR Group’s performance<sup><a href="#hint2" class="hint__link">[2]</a></sup>?<br><br>
            Evaluation options: high, moderate, low, non-material topic.
        </p>
    </div>
    <?php if (!$checkPost) { ?>
        <p style="color:#DF1E42"><b>The answer choices are not correct. Please try again. </b></p>
    <?php } ?>
<form name="form" action="/?<?= http_build_query(['code'=> $md5email, 'lang' => $language]) ?>" method="post" id="form-votes">

    <?= $pageContent ?>

    <?php if ($pageContent <> '<p><b>You have already passed this survey or the link is incorrect</b></p>' &&
        $pageContent <> '<p><b>Thank you for your kind cooperation.</b></p>') { ?>
        <div class="form-group text-center">
            <br>
            <button type="submit" class="btn btn-primary">Send</button>
        </div>
    <?php } ?>
</form>

    <div class="hint__block">
        <div class="hint" id="hint1">
            [1] - ESG – environmental, social, governance.
        </div>
        <div class="hint" id="hint2">
            [2] - Including financial performance, environmental and social impact,
            as well as the effect on company valuation and decision-making of stakeholders.
        </div>
    </div>

</div>

<script src="../assets/js/main.js"></script>

</body>


</html>