<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "news".
 *
 * @property integer $id
 * @property string $title
 * @property string $slug
 * @property string $text
 * @property string $FirstName
 * @property string $LastName
 * @property string $Nickname
 * @property string $Gender
 * @property string $EmailAddress
 * @property string $HomeAddress
 * @property integer $Cellphone
 * @property string $Comment
 */
class News extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'news';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'slug', 'text', 'FirstName', 'LastName', 'Nickname', 'Gender', 'EmailAddress', 'HomeAddress', 'Cellphone', 'Comment'], 'required'],
            [['text'], 'string'],
            [['Cellphone'], 'integer'],
            [['title', 'slug'], 'string', 'max' => 128],
            [['FirstName', 'LastName', 'EmailAddress', 'HomeAddress'], 'string', 'max' => 20],
            [['Nickname'], 'string', 'max' => 2],
            [['Gender'], 'string', 'max' => 10],
            [['Comment'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'slug' => 'Slug',
            'text' => 'Text',
            'FirstName' => 'First Name',
            'LastName' => 'Last Name',
            'Nickname' => 'Nickname',
            'Gender' => 'Gender',
            'EmailAddress' => 'Email Address',
            'HomeAddress' => 'Home Address',
            'Cellphone' => 'Cellphone',
            'Comment' => 'Comment',
        ];
    }
}
