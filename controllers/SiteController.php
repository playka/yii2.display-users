<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;


class SiteController extends Controller
{

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        $this->redirect("index.php?r=/user/index");
    }

}