<div class="tabsLine">
	<div class="tab act" data-tab="1" onclick="el.tabs.sub.show(this)"> Настройка </div>
	{% if vk['settings'] is defined and vk['settings']['access_token'] is defined %}
		<div class="tab" data-tab="2" onclick="el.tabs.sub.show(this)">Новости</div>
		<div class="tab" data-tab="3" onclick="el.tabs.sub.show(this)">Друзья</div>
		<div class="tab" data-tab="4" onclick="el.tabs.sub.show(this)">Лайки</div>
	{% endif %}
</div>
<div class="subTabsCont">
	<div class="subTabCont act" data-tab="1">
		<div class="elementDetail">
			<form onsubmit="return avk.settings.save(this)">
				<div class="line">
					<div class="name">client_id</div>
					<div class="filedEdit">
						<input type="text" name="vk[client_id]" placeholder="client_id" {% if vk['settings']['client_id'] is defined %}value="{{vk['settings']['client_id']}}"{% endif %} required />
					</div>
				</div>
				<div class="line">
					<div class="name">client_secret</div>
					<div class="filedEdit">
						<input type="text" name="vk[client_secret]" placeholder="client_secret" {% if vk['settings']['client_secret'] is defined %}value="{{vk['settings']['client_secret']}}"{% endif %} required />
					</div>
				</div>
				<div class="line">
					<div class="name">access_token</div>
					<div class="filedEdit">
						<input type="text" name="vk[access_token]" placeholder="access_token" {% if vk['settings']['access_token'] is defined %}value="{{vk['settings']['access_token']}}"{% endif %} />
						<button onclick="avk.settings.getToken(this)" class="elbutton blue">Получить токен</button>
						<div id="getTokenLinkPlace"></div>
					</div>
				</div>
				<div class="line">
					<div class="name">ид группы (если есть)</div>
					<div class="filedEdit">
						<input type="text" name="vk[group_id]" placeholder="group_id" {% if vk['settings']['group_id'] is defined %}value="{{vk['settings']['group_id']}}"{% endif %} />
					</div>
				</div>
				<div class="line">
					<button type="submit" class="elbutton blue">Сохранить</button>
				</div>
			</form>
		</div>
	</div>
	<div class="subTabCont" data-tab="2">
		<pre>
			публикация новостей в группе и на стене аккаунта по расписанию 
			НОВОСТЬ
			- название
			- дата публикации
			- текст
			- ссылка
			- картинка
			- публиковать в группе (галочка)
		</pre>
	</div>
	<div class="subTabCont" data-tab="3">
		<div class="elementDetail">
			<form onsubmit="return avk.friends.save(this)">
				<div class="line">
					<div class="name">Список id групп через (,)</div>
					<div class="filedEdit">
						<input type="text" name="vk[groups]" placeholder="groups" {% if vk['params']['friends']['groups'] is defined %}value="{{vk['params']['friends']['groups'] }}"{% endif %} required />
					</div>
				</div>
				<div class="line">
					<button type="submit" class="elbutton blue">Сохранить</button>
				</div>
			</form>
		</div>
	</div>
	<div class="subTabCont" data-tab="4">
		<div class="elementDetail">
			<form onsubmit="return avk.likes.save(this)">
				<div class="line">
					<div class="name">Ключевые слова</div>
					<div class="filedEdit">
						<input type="text" name="vk[keywords]" placeholder="keywords" {% if vk['params']['likes']['keywords'] is defined %}value="{{vk['params']['likes']['keywords'] }}"{% endif %} required />
					</div>
				</div>
				<div class="line">
					<button type="submit" class="elbutton blue">Сохранить</button>
				</div>
			</form>
		</div>
	</div>
</div>