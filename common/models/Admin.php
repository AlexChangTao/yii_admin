<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%admin}}".
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
 * @property integer $status
 */
//\yii\db\ActiveRecord
class Admin extends \common\core\BaseActiveRecord
//class Admin extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%admin}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'password', 'salt', 'email'], 'required'],
            //[['reg_time', 'reg_ip', 'last_login_time', 'last_login_ip', 'update_time', 'status'], 'integer'], //限制得太死，不方便存IP地址
        	[['reg_time', 'last_login_time', 'update_time', 'status'], 'integer'], //一次只能是一个验证类型，所以要分两行来验证ip和时间
        	[['reg_ip',  'last_login_ip'], 'string'],
            [['username'], 'string', 'max' => 16],
            [['password'], 'string', 'max' => 60],
            [['salt', 'email'], 'string', 'max' => 32],
            [['mobile'], 'string', 'max' => 15],
            [['username'], 'unique'],
            [['email'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'uid' => 'Uid',
            'username' => 'Username',
            'password' => 'Password',
            'salt' => 'Salt',
            'email' => 'Email',
            'mobile' => 'Mobile',
            'reg_time' => 'Reg Time',
            'reg_ip' => 'Reg Ip',
            'last_login_time' => 'Last Login Time',
            'last_login_ip' => 'Last Login Ip',
            'update_time' => 'Update Time',
            'status' => 'Status',
        ];
    }
}
