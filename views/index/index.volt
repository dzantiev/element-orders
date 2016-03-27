{% extends "layouts/main.volt" %}
{% block topBredcrumbs %}
	<li class="arr"><span class="icon topBreadcrumbArrow"></span></li>
	<li class="last"><a href="#">Заказы</a></li>
{% endblock %}
{% block titleLine %}
	<div id="titleButtons">
		<div class="titleBlock">
			<div class="ttl">
				<h2>Заказы</h2>
			</div>
		</div>
	</div>
{% endblock %}
{% block tabsLine %}
	<div id="topTabs">
		<ul>
			<li class="act" onclick="el.tabs.show(this)">Новые</li>
			<li onclick="el.tabs.show(this)">Принятые</li>
			<li onclick="el.tabs.show(this)">Завершенные</li>
			<li onclick="el.tabs.show(this)">Отмененные</li>
		</ul>
	</div>
{% endblock %}
{% block contentBoxAttributes %}class="withTabs"{% endblock %}
{% block content %}
	<div class="tabCont cont_1 act">	
		{{ partial("../extensions/em_orders/views/index/new_orders") }}
	</div>
	<div class="tabCont cont_2">
		{{ partial("../extensions/em_orders/views/index/accept_orders") }}
	</div>
	<div class="tabCont cont_3">
		{{ partial("../extensions/em_orders/views/index/compleate_orders") }}
	</div>
	<div class="tabCont cont_4">
		{{ partial("../extensions/em_orders/views/index/cancel_orders") }}
	</div>
	<script src="{{baseUri}}extensions/em_orders/src/js/init.js"></script>
{% endblock %}
{% block pageScripts %}{% endblock %}