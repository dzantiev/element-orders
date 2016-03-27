var em_orders = 
{
	newOrder:function(instance)
	{
		var orderId = $(instance).parents('tr').data('id');
		this._setStatus(orderId,'N',function()
		{
			var trClone = $(instance).parents('tr').first()[0].cloneNode(true);
			var compleateTable = $('.js-neworders');
			compleateTable.find('tr').first().after(trClone);
			$(instance).parents('tr').fadeOut(200);
		});
	},
	cancelOrder:function(instance)
	{
		var orderId = $(instance).parents('tr').data('id');
		this._setStatus(orderId,'X',function()
		{
			var trClone = $(instance).parents('tr').first()[0].cloneNode(true);
			var compleateTable = $('.js-cancelorders');
			compleateTable.find('tr').first().after(trClone);
			$(instance).parents('tr').fadeOut(200);
		});
	},
	applyOrder:function(instance)
	{
		var orderId = $(instance).parents('tr').data('id');
		this._setStatus(orderId,'A',function()
		{
			var trClone = $(instance).parents('tr').first()[0].cloneNode(true);
			var compleateTable = $('.js-applyorders');
			compleateTable.find('tr').first().after(trClone);
			$(instance).parents('tr').fadeOut(200);
		});
	},
	compleateOrder:function(instance)
	{
		var orderId = $(instance).parents('tr').data('id');
		this._setStatus(orderId,'C',function()
		{
			var trClone = $(instance).parents('tr').first()[0].cloneNode(true);
			var compleateTable = $('.js-compleateorders');
			compleateTable.find('tr').first().after(trClone);
			$(instance).parents('tr').fadeOut(200);
		});
	},
	_setStatus:function(id,status,callback)
	{
		var orderId = id;
		$.ajax({
			url      : el.config.baseUri+"ext/em_orders/index/setStatus",
			type     :'POST',
			dataType :'json',
			data     : {id:orderId,status:status}
		}).done(function(e)
		{
			if(typeof e.success != 'undefined')
			{
				callback.call();
			}
		});
	}
}