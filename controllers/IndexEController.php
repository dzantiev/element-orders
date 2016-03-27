<?php
class IndexEController extends ControllerBase
{
	public $settingsPath = '/../settings.json';
	public $settings = false;
	public function onConstruct()
	{
		if(file_exists(__DIR__.$this->settingsPath))
		{
			$this->settings = json_decode(file_get_contents(__DIR__.$this->settingsPath),true);
			if(empty($this->settings['orderstable']))
				exit('no orderstable in settings.json File');
		}
		else
			exit('no settings.json File');
	}

	public function indexAction($page = 1)
	{
		// достаем заказы из БД
		$db       = $this->di->get('db');
		$limit    = 20;
		$from     = $limit*(intval($page)-1);
		$sqlWhere = $this->settings['orderstable'];
		$tableResult = $db->fetchAll(
			"SELECT * FROM ".$sqlWhere." ORDER BY id DESC LIMIT $from,$limit",
			Phalcon\Db::FETCH_ASSOC
		);
		$this->view->setVar('orders',$tableResult);
	}

	public function setStatusAction()
	{
		$orderId = $this->request->getPost('id');
		$statusS = $this->request->getPost('status');
		if(!empty($orderId))
		{
			$db = $this->di->get('db');
			$sqlWhere = $this->settings['orderstable'];
			$phql = "UPDATE ".$sqlWhere." SET status = '".$statusS."' WHERE id = ".intval($orderId);
			if($db->query($phql))
				$this->jsonResult(['success'=>true]);
			else
				$this->jsonResult(['error'=>true]);
		}
		else
			$this->jsonResult(['error'=>true]);
	}
}	

