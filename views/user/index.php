<?php

use yii\helpers\Html;
use yii\widgets\LinkPager;

$this->title = 'Users';
?>
<?= $users?>
<?= LinkPager::widget(['pagination' => $pagination]) ?>