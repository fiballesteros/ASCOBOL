<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "trivia".
 *
 * @property integer $ID
 * @property string $Question
 * @property string $Answer
 */
class Trivia extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'trivia';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Question', 'Answer'], 'required'],
            [['Question', 'Answer'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'Question' => 'Question',
            'Answer' => 'Answer',
        ];
    }
}
