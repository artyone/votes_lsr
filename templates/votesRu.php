<?php if (!empty($name_tome)) { ?>

    <div>
        <h3>
            <span class="head3"><?= $name_tome ?></span>
            <?php switch ($tome) {
                case 1 :
                    print '<span class="abbreviate"><span>E</span>SG</span>';
                    break;
                case 2 :
                    print '<span class="abbreviate">E<span>S</span>G</span>';
                    break;
                case 3:
                    print '<span class="abbreviate">ES<span>G</span></span>';
                    break;
            } ?>
        </h3>
    </div>

<?php } ?>


<div class="form-group">

    <?php if ($name_tome <> 'Комментарии') {?>
    <p>
        <strong><?= $question; ?></strong>
        <br>
        <?= $opisanie; ?>
    </p>
    <p><i>Оцените уровень существенности:</i></p>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" id="<?= $id . 1 ?>"
               name="<?='r' . $id ?>" value="4">
        <label class="form-check-label" for="<?= $id . 1 ?>">Высокий</label>

        <input class="form-check-input" type="radio" id="<?= $id . 2 ?>"
               name="<?='r' . $id ?>" value="3">
        <label class="form-check-label" for="<?= $id . 2 ?>">Средний</label>

        <input class="form-check-input" type="radio" id="<?= $id . 3 ?>"
               name="<?='r' . $id ?>" value="2">
        <label class="form-check-label" for="<?= $id . 3 ?>">Низкий</label>

        <input class="form-check-input" type="radio" id="<?= $id . 4 ?>"
               name="<?='r' . $id ?>" value="1">
        <label class="form-check-label" for="<?= $id . 4 ?>">Несущественная тема</label>
    </div>
    <?php } else { ?>
        <p><strong><?= $question ?></strong></p>
        <textarea class="form-control" rows="5" id="<?= $id . 1 ?>" name="<?='t' .  $id ?>"></textarea>
    <?php } ?>
</div>