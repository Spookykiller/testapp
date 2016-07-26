// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require dataTables/jquery.dataTables
//= require js/flot/jquery.flot.js
//= require js/flot/jquery.flot.pie.js
//= require js/flot/jquery.flot.orderBars.js
//= require js/flot/jquery.flot.time.min.js
//= require js/flot/date.js
//= require js/flot/jquery.flot.spline.js
//= require js/flot/jquery.flot.stack.js
//= require js/flot/curvedLines.js
//= require js/flot/jquery.flot.resize.js


//= require js/maps/jquery-jvectormap-2.0.3.min.js
//= require js/maps/gdp-data.js
//= require js/maps/jquery-jvectormap-world-mill-en.js
//= require js/maps/jquery-jvectormap-us-aea-en.js


//= require js/bootstrap.min.js

//= require js/gauge/gauge.min.js
//= require js/gauge/gauge_demo.js

//= require js/progressbar/bootstrap-progressbar.min.js

//= require js/icheck/icheck.min.js

//= require js/moment/moment.min.js
//= require js/datepicker/daterangepicker.js

//= require js/chartjs/chart.min.js

//= require js/main.js
//= require js/custom.js

//= require js/pace/pace.min.js

//= require  js/select/select2.full.js

//= require js/dropzone/dropzone.js

//= require chartkick
//= require toastr
//= require_tree .


$(document).on('ready page:load', function () {
    $('#items').on('cocoon:after-insert', function(e, insertedItem){
		$('input').click(function(){
		    $(this).select();
    	});
    
        $('#9').blur(update_balance);
        
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
});