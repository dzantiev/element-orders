<?php
class IndexEController extends ControllerBase
{
	public $settingsPath = '/../settings.json';
	public function indexAction($page = 1)
	{
		// достаем файл settings.json
		// определяем таблицу с заказами
		if(file_exists(__DIR__.$this->settingsPath))
		{
			$settings = json_decode(file_get_contents(__DIR__.$this->settingsPath),true);
			if(!empty($settings['orderstable']))
			{
				// достаем заказы из БД
				$db       = $this->di->get('db');
				$limit    = 20;
				$from     = $limit*(intval($page)-1);
				$sqlWhere = $settings['orderstable'];
				$tableResult = $db->fetchAll(
					"SELECT * FROM ".$sqlWhere." ORDER BY id DESC LIMIT $from,$limit",
					Phalcon\Db::FETCH_ASSOC
				);
				$this->view->setVar('orders',$tableResult);
			}
			else
				exit('no orderstable in settings.json File');
		}
		else
			exit('no settings.json File');
	}
}	

