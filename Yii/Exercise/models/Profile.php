<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "profile".
 *
 * @property integer $ID
 * @property string $FirstName
 * @property string $LastName
 * @property string $NickName
 * @property string $EmailAddress
 * @property string $HomeAddress
 * @property string $Gender
 * @property integer $Cellphone
 * @property string $Comment
 */
class Profile extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'profile';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['FirstName', 'LastName', 'NickName', 'EmailAddress', 'HomeAddress', 'Gender', 'Cellphone', 'Comment'], 'required'],
            [['Cellphone'], 'integer'],
            [['Comment'], 'string'],
            [['FirstName', 'LastName', 'NickName'], 'string', 'max' => 10],
            [['EmailAddress'], 'string', 'max' => 20],
            [['HomeAddress'], 'string', 'max' => 50],
            [['Gender'], 'string', 'max' => 6],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'FirstName' => 'First Name',
            'LastName' => 'Last Name',
            'NickName' => 'Nick Name',
            'EmailAddress' => 'Email Address',
            'HomeAddress' => 'Home Address',
            'Gender' => 'Gender',
            'Cellphone' => 'Cellphone',
            'Comment' => 'Comment',
        ];
    }
}
