<?php

namespace backend\controllers;

use Yii;
use backend\models\Ulog;
use backend\models\search\UlogSearch;
use common\helpers\FuncHelper;

//require dirname(dirname(__FILE__)).'../excel/PHPExcel.php';

class UlogController extends BaseController
{
	/**
	 * 构造方法
	 */
	public function init() {
		parent::init();
	}
	
	public function actionIndex()
	{
		$this->setForward();
		$searchModel = new UlogSearch();
		$dataProvider = $searchModel->search(yii::$app->request->queryParams);
		return $this->render('index', [
				'searchModel'=> $searchModel,
				'dataProvider' => $dataProvider,
		]);
	}
	
	/**
	 * ---------------------------------------
	 * 添加
	 * ---------------------------------------
	 */
	public function actionAdd(){
	
		$model = new Ulog();
	
		if (Yii::$app->request->isPost) {
			/* 表单验证 */
			$data = Yii::$app->request->post('Ulog');
			$data['reg_time'] = time();
			//$data['ip']   = ip2long(Yii::$app->request->getUserIP());
			$data['ip']   = Yii::$app->request->getUserIP();//要用字符串形式保存到数据库的ip字段  
			$data['lastLoginTime'] = 0;
			$data['lastLoginTime']   = ip2long(Yii::$app->request->getUserIP());
			//$data['update_time']     = 0;
			/* 表单数据加载和验证，具体验证规则在模型rule中配置 */
			/* 密码单独验证，否则setPassword后密码肯定符合rule */
			if (empty($data['password']) || strlen($data['password']) < 6) {
				$this->error('密码为空或小于6字符'); //调用heard报错不影响破存储但会掩盖后面的错误，要注释掉//use function Symfony\Component\Debug\header即可
			}
			$model->setAttributes($data);
			//$model->generateAuthKey(); //对应表没有salt字段要注释
			$model->setPassword($data['password']); //保存密码提示没有定义password,只能把edit.php中的密码输入框改为同用户名类似的才行 比如 <?= $form->field($model, 'username')->iconTextInput
			/* 保存用户数据到数据库  在添加时common模型规则中要求的字段必须要填 图像不需要*/ 
			if ($model->save()) {
				$this->success('操作成功', $this->getForward()); //调用heard报错不影响破存储但不能显示成功信息
			}else{
				//$this->error('操作错误');
				$this->error('database save failed', dump($model->errors));
			}
		}
	
		return $this->render('edit',[
				'model' => $model,
		]);
	}
	
	/**
	 * ---------------------------------------
	 * 编辑
	 * ---------------------------------------
	 */
	public function actionEdit($id){
		$model = Ulog::findOne($id);
	
		if (Yii::$app->request->isPost) {
			/* 表单验证 */
			$data = Yii::$app->request->post('Ulog');
			$data['update_time'] = time();
			/* 如果设置密码则重置密码，否则不修改密码 */
			if (!empty($data['password'])) {
				//$model->generateAuthKey();//对应表没有salt字段要注释
				$model->setPassword($data['password']);
			}
			unset($data['password']);
	
			$model->setAttributes($data);
			/* 保存用户数据到数据库 */
			if ($model->save()) {
				$this->success('操作成功');
			}else{
				$this->error('操作错误');
			}
		}
	
		return $this->render('edit',[
				'model' => $model,
		]);
	}
	
	/**
	 * ---------------------------------------
	 * 删除
	 * ---------------------------------------
	 */
	public function actionDelete(){
		$ids = Yii::$app->request->param('id',0);
		$ids = implode(',', array_unique((array)$ids));
	
		if ( empty($ids) ) {
			$this->error('请选择要操作的数据!');
		}
	
		$_where = 'id in('.$ids.')';
		if(Ulog::deleteAll($_where)){
			$this->success('删除成功');
		} else {
			$this->error('删除失败！');
		}
		
		return $this->render('edit',[
				'model' => $model,
		]);
	}
	
	
	/**
	 * ---------------------------------------
	 * 导出excel
	 * ---------------------------------------
	 */
	public function actionExport(){
		//indBySql执行sql语句之后得到的数据时对象格式通过asArray()已经变成数组了，Yii::app()->db->createCommand($sql)->queryRow();这是会返回数组形式
		$data = Ulog::findBySql("select id, name, email, mobile, ip from yii2_ulog where id > 1 and name=:name",array(':name' => 'test'))->andFilterWhere([
				//查找id大于1且name等于test的值如是数字不用引号，可以把语句改为Ulog::find()->asArray()->all()会返回所有的数据，但下面的标题只写了几个;
            'id' => $this->id,
        	//'name' => $this->name,
    ])
		 ->orderBy('id DESC')
		 ->asArray()->all();
		$arr = [];
		$title = ['id','name','email','mobile','ip'];
		if ($data) {
			foreach ($data as $key => $value) {
				$arr[$key] = $value;
				/* $arr[$key]['start_time'] = date('Y-m-d H:i', $value['start_time']);
				$arr[$key]['end_time'] = date('Y-m-d H:i', $value['end_time']);
				$arr[$key]['pay_time'] = $value['pay_time'] ? date('Y-m-d H:i', $value['end_time']):0;
				$arr[$key]['create_time'] = $value['create_time'] ? date('Y-m-d H:i', $value['create_time']):0;
				$arr[$key]['pay_status'] = Yii::$app->params['pay_status'][$value['pay_status']];
				$arr[$key]['pay_type'] = Yii::$app->params['pay_type'][$value['pay_type']];
				$arr[$key]['pay_source'] = Yii::$app->params['pay_source'][$value['pay_source']];
				$arr[$key]['status'] = '订单正常'; */
			}
		}
	
		FuncHelper::exportexcel($arr,$title);
	}
	

	/**
	 * yii2框架(略修改可用于其它框架)excel2007表格导出保证打开时无警告且有完整2007的功能
	 * 如果要把表格导入数据库可以直接用数据库命令或参考pingan1212项目的浏览器调用控制器打开文件导入适当修改可以适用yii2
	 * 前提条件把PHPExcel文件夹放到适当位置，这里是放到backend/excel/PHPExcel
	 */
	public function actionExport2007()
	{
		$data = Ulog::find()->asArray()->all(); //数据来源保证为数组格式
		$header = ["id", "姓名", "年龄"];
		$title = 'excel2007_export_test';
		$filename = "测试excel2007表格导出保证打开时无警告且有完整2007的功能";
		$this->exportData($data, $header, $title, $filename);
	}
	
	/**
	 *  @DESC 数据导
	 *  @notice 解决了上面导出列数过多的问题
	 *  @example
	 *  $data = [1, "小明", "25"];
	 *  $header = ["id", "姓名", "年龄"];
	 *  Myhelpers::exportData($data, $header);
	 *  @return void, Browser direct output
	 */
	public static function exportData ($data, $header, $title = "simple", $filename = "data")
	{
		//require relation class files
		//require(Yii::getAlias("@common")."/components/phpexcel/PHPExcel.php");
		//require(Yii::getAlias("@common")."/components/phpexcel/PHPExcel/Writer/Excel2007.php");
		require dirname(dirname(__FILE__)).'../excel/PHPExcel.php';
		require dirname(dirname(__FILE__)).'../excel/PHPExcel/Writer/Excel2007.php';
		if (!is_array ($data) || !is_array ($header)) return false;
		$objPHPExcel = new \PHPExcel();
		// Set properties
		$objPHPExcel->getProperties()->setCreator("Maarten Balliauw");
		$objPHPExcel->getProperties()->setLastModifiedBy("Maarten Balliauw");
		$objPHPExcel->getProperties()->setTitle("Office 2007 XLSX Test Document");
		$objPHPExcel->getProperties()->setSubject("Office 2007 XLSX Test Document");
		$objPHPExcel->getProperties()->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.");
		// Add some data
		$objPHPExcel->setActiveSheetIndex(0);
		//添加头部
		$hk = 0;
		foreach ($header as $k => $v)
		{
			$colum = \PHPExcel_Cell::stringFromColumnIndex($hk);
			$objPHPExcel->setActiveSheetIndex(0) ->setCellValue($colum."1", $v);
			$hk += 1;
		}
		$column = 2;
		$objActSheet = $objPHPExcel->getActiveSheet();
		foreach($data as $key => $rows)  //行写入
		{
			$span = 0;
			foreach($rows as $keyName => $value) // 列写入
			{
				$j = \PHPExcel_Cell::stringFromColumnIndex($span);
				$objActSheet->setCellValue($j.$column, $value);
				$span++;
			}
			$column++;
		}
		// Rename sheet
		$objPHPExcel->getActiveSheet()->setTitle($title);
		// Save Excel 2007 file
		$objWriter = new \PHPExcel_Writer_Excel2007($objPHPExcel);
		header("Pragma:public");
		header("Content-Type:application/x-msexecl;name=\"{$filename}.xlsx\"");
		header("Content-Disposition:inline;filename=\"{$filename}.xlsx\"");
		$objWriter->save("php://output");
	}
	
	
	
}
