<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%ulog}}".
 *
 * @property string $uid
 * @property string $username
 * @property string $password
 * @property string $salt
 * @property string $email
 * @property string $mobile
 * @property string $reg_time
 * @property string $reg_ip
 * @property string $last_login_time
 * @property string $last_login_ip
 * @property string $update_time
 * @property string $tuid
 * @property string $image
 * @property string $score
 * @property string $score_all
 * @property integer $status
 */
class Ulog extends \common\core\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%ulog}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [[ 'mobile', 'email','lastLoginTime','account'], 'required'], //注释不影响保存数据，这是限制字些字段必须要有否则会有提示，暂时去掉了name免得搜索框提示名字为空
            [['account', 'ok_num'], 'integer'],
            [['name'], 'string', 'max' => 20],  //必须要有这个语句才能保存数据库
            [['password'], 'string', 'max' => 128], //必须要有这个语句才能保存数据库，下同
            [['email'], 'string', 'max' => 32],
            [['mobile'], 'string', 'max' => 15],
            [['email'], 'unique'],
        	[['ip'], 'string', 'max' => 16]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'id',
            'name' => 'name',
            'password' => 'password',
        //    'salt' => 'Salt',
            'email' => 'email',
            'mobile' => 'mobile',
          //  'reg_time' => 'Reg Time',
          //  'reg_ip' => 'Reg Ip',
          //  'last_login_time' => 'Last Login Time',
          //  'last_login_ip' => 'Last Login Ip',
          //  'update_time' => 'Update Time',
          //  'tuid' => 'Tuid',
         //   'image' => 'Image',
         //   'score' => 'Score',
         //   'score_all' => 'Score All',
         //   'status' => 'Status',
        ];
    }
}
