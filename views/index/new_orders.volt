<div class="contWrap" style="width:1650px;">
	<table class="elements" cellspacing='0'>
		<tr>
			<th class="centered"><button class="elbutton dotts"><span class="icon buttonDotts"></span></button></th>
			<th>id</th>
			<th>Имя</th>
			<th>Телефон</th>
			<th>Адрес</th>
			<th>Заказа</th>
			<th>Сумма</th>
			<th>Комментарий</th>
			<th>Email</th>
			<th>Время_доставки</th>
		</tr>
		{% if orders %}
			{% for resLine in orders if resLine['status'] == 'N' %}
				<tr data-id="{{resLine[id]}}">
					<td class="centered">
						<div class="editLine">
							<a href="javascript:void(0)" onclick="em_orders.applyOrder(this)">Принять заказ</a>
							<a href="javascript:void(0);" onclick="em_orders.compleateOrder(this)">Завершить</a>
							<a href="javascript:void(0);" onclick="em_orders.cancelOrder(this)">Отменить</a>
						</div>
						<button class="elbutton dotts"><span class="icon buttonDotts"></span></button>
					</td>
					<td class="centered">{{resLine['id']}}</td>
					<td class="centered">{{resLine['name']}}</td>
					<td>+7 {{resLine['phone']}}</td>
					<td>{{resLine['address']}}</td>
					<td style="width:340px"><pre>{{resLine['products']}}</pre></td>
					<td class="centered">{{resLine['summa']}}</td>
					<td class="centered">{{resLine['comment']}}</td>
					<td class="centered">{{resLine['email']}}</td>
					<td class="centered">{{resLine['timedelivery']}}</td>
				</tr>
			{% endfor %}
		{% else %}
				<tr>
					<td class="centered">no data</td>
				</tr>
		{% endif %}
	</table>
</div>