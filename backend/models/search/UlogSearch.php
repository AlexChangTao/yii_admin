<?php

namespace backend\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Ulog;

/**
 * UserSearch represents the model behind the search form about `common\models\User`.
 */
class UlogSearch extends Ulog
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [[ 'reg_time', 'lastLoginTime', 'ip',  'account', 'ok_num'], 'integer'],
            [['name', 'password', 'email', 'mobile'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Ulog::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => 8,
            ],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
        	//'name' => $this->name,
            'reg_time' => $this->reg_time,
            'ip' => $this->ip,
            'lastLoginTime' => $this->lastLoginTime,
           // 'last_login_ip' => $this->last_login_ip,
           // 'update_time' => $this->update_time,
          //  'tuid' => $this->tuid,
            'account' => $this->account,
         //   'score_all' => $this->score_all,
            'ok_num' => $this->ok_num,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'password', $this->password])
           // ->andFilterWhere(['like', 'salt', $this->salt])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'mobile', $this->mobile]);
           // ->andFilterWhere(['like', 'image', $this->image]);

        return $dataProvider;
    }
}
