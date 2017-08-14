<?php

namespace app\controllers;

use yii\web\Controller;
use yii\data\Pagination;
use app\models\Address;
use app\models\User;
use yii\grid\GridView;
use yii\data\SqlDataProvider;
use Yii;
use app\models\SignUpForm;
use yii\helpers\Html;
use \yii\db\Exception;
use yii\bootstrap\Alert;

class UserController extends Controller
{
    public function actionIndex()
    {
        $pagination = new Pagination([
            'defaultPageSize' => 10,
        ]);


        $dataProvider = new SqlDataProvider([
            'sql' => 'SELECT user.*,address.postcode, address.code as country, address.street FROM `user` ' .
                'RIGHT JOIN address ON address.user_id = user.id ' .
                'GROUP BY login'
        ]);

        return $this->render('index', [
            'users' => GridView::widget([
                'dataProvider' => $dataProvider,
            ]),
            'pagination' => $pagination
        ]);


    }

    public function actionSignup()
    {
        $html = new Html();
        $request = Yii::$app->request;
        $model = new SignUpForm();
        if ($model->load($request->post()) && $model->signUp()) {
            $data = $request->post('SignUpForm');
            $response = $this->saveUser($data, $html);
            if ($response['status']){
                $user = User::find()->where(['login' => $data['username']])->one();
                $user_id = $user->id;
                $response = $this->saveAddress($data, $html, $user_id);
            }
        }
        return $this->render('sign_up', [
            'model' => $model,
            'alert' => isset($response['alert']) ? $response['alert'] : ''
        ]);
    }

    public function saveUser($data, $html){
        $user = new User();
        $user->login = $html->encode($data['username']);
        $user->password = md5($html->encode($data['password']));
        $user->name = $html->encode($data['name']);
        $user->last_name = $html->encode($data['lastName']);
        $user->gender = ($html->encode($data['gender'])) ? 'male' : 'female';
        
        try{
            $user->save(false);
            $alert = Alert::widget([
                'options' => [
                    'class' => 'alert-success',
                ],
                'body' => 'Added successful!',
            ]);
            $status = true;

        } catch (Exception $e){
            $alert = Alert::widget([
                'options' => [
                    'class' => 'alert-danger',
                ],
                'body' => 'Smth went wrong with table User:(',
            ]);
            $status = false;
        }
        $response = array(
            'alert' => $alert,
            'status' => $status
        );
        return $response;
    }

    public function saveAddress($data, $html, $user_id){
        $address = new Address();
        $address->user_id = $user_id;
        $address->postcode = $html->encode($data['postcode']);
        $address->code = $html->encode($data['country']);
        $address->city = $html->encode($data['city']);
        $address->street = $html->encode($data['street']);
        $address->house_number = $html->encode($data['houseNumber']);
        $address->apartment_number = $html->encode($data['apartmentNumber']);

        try{
            $address->save(false);
            $alert = Alert::widget([
                'options' => [
                    'class' => 'alert-success',
                ],
                'body' => 'Added successful!',
            ]);
            $status = true;

        } catch (Exception $e){
            $alert = Alert::widget([
                'options' => [
                    'class' => 'alert-danger',
                ],
                'body' => 'Smth went wrong with table Address:(',
            ]);
            $status = false;
        }
        $response = array(
            'alert' => $alert,
            'status' => $status
        );
        return $response;
    }
}