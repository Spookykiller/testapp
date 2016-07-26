$(function() {
	
    $('input').click(function(){
		$(this).select();
	});

    $('#9').blur(update_balance);
    $('#9').blur(update_VAT);
    
	$('#addrow').click(function(){
		if ($('.delete').length > 0) $('.delete').show();
		bind1();
	});
	
    bind1();

	$('body').on('click', '.delete', function(){
		$(this).parents('.nested-fields').remove();
		update_subtotal();
		if ($('.delete').length < 2) $('.delete').hide();
	});
	
	$('body').on('click', '#invoicing', function(){
		var e = $('#9').val();
		$('#invoice_invoice_VAT_percentage').empty();
		$('#invoice_invoice_VAT_percentage').val(Number(e));
	});
	
	$('body').on('click', '#invoicing', function(){
		var f = $('#subtotal').html();
		$('#invoice_invoice_exclusive_VAT').empty();
		$('#invoice_invoice_exclusive_VAT').val(Number(f));
	});
	
	$('body').on('click', '#invoice_button', function(){
		var f = $('#invoice_invoice_client_name').val();
	});
	
	$('body').on('click', '#invoice_button', function(){
		bind2($('#subtotal'), $("#modal_subtotal"));
		bind3($('#9'), $("#modal_9"));
		bind3($('#invoicing_number'), $("#modal_invoice_number"));

		var rows = $('.nested-fields');
		$('#modal_tbody').empty();
		
		for (i=0; i < rows.length; i++) {
			var row = rows[i];
			var name = $(row).find('.item_name').val();
			$('#modal_tbody').append('<tr class="modal-nested-fields"></tr>');
			$('.modal-nested-fields:last').append('<td>' + name + '</td>');

			var desc = $(row).find('.item_desc').val();
			$('.modal-nested-fields:last').append('<td>' + desc + '</td>');
			
			var cost = $(row).find('.cost').val();
			$('.modal-nested-fields:last').append('<td>' + cost + '</td>');
			
			var qty = $(row).find('.qty').val();
			$('.modal-nested-fields:last').append('<td>' + qty + '</td>');
			
			var price = $(row).find('.price').text();
			$('.modal-nested-fields:last').append('<td>' + price + '</td>');
			
			
		}
		
	});
	
});