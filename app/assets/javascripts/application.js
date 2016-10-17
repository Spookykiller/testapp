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

//= require js/custom.js

//= require js/pace/pace.min.js

//= require  js/select/select2.full.js

//= require js/dropzone/dropzone.js

//= require chartkick
//= require toastr
//= require_tree .


$(document).on('ready page:load', function () {
    $('#datepicker').each(function(){
        $(this).daterangepicker({
            singleDatePicker: true,
            showDropdowns: true,
            format: 'DD/MM/YYYY'
        });
    });
    
    $('#definitive').find('form').each(function() {
        $(this).find('input.form-control').prop('disabled', true);
        $(this).find('select').prop('disabled', true);
        $(this).find('.add_fields').hide();
        $(this).find('#invoicing').prop('disabled', false);
    })

    update_numbers();
    
    $('#items').on('cocoon:after-insert', function(e, insertedItem){
        update_numbers();
    });
    
    $('#items').on('cocoon:before-insert', function(e, insertedItem) {
        insertedItem.fadeIn('slow');
        update_numbers();
    });
    
    $('#invoicing').click(function() {
        update_numbers();
    });
    
        
    $('#invoice_button').click(function() {
        update_numbers();
    });
    
});

function VAT_total() {
    
    var total_VAT6 = 0.00;
    var total_VAT21 = 0.00;
    var total_VAT = 0.00;
    var subtotal = 0.00;
    var total = 0.00;
	$('tr.nested-fields').each(function(){

	    var column_qty = Number($(this).find('#item_qty').val());
	    var colum_item_cost = Number($(this).find('#item_cost').val());
	    var column_total_price = Number(column_qty) * Number(colum_item_cost);
	    
	    $(this).find('.price').html(column_total_price.toFixed(2));
	    
	    var column_price = Number($(this).find('.price').html());
	    var column_VAT = 0.01 * Number($(this).find('#item_VAT').val());

        if (column_VAT == 0.06) {
            var column_VAT_total6 = Number(column_VAT) * Number(column_price);

            if (!isNaN(column_VAT_total6)) total_VAT6 += Number(column_VAT_total6);
        } else if (column_VAT == 0.21){
            var column_VAT_total21 = Number(column_VAT) * Number(column_price);

            if (!isNaN(column_VAT_total21)) total_VAT21 += Number(column_VAT_total21);
        }
        
        subtotal += Number(column_total_price);
	});
	
	total = Number(subtotal) + Number(total_VAT6) + Number(total_VAT21);
	total_VAT = Number(total_VAT6) + Number(total_VAT21);
	
	$('.VAT_6').html(Number(total_VAT6.toFixed(2)));
	$('.VAT_21').html(Number(total_VAT21.toFixed(2)));
    $('.due').html(total.toFixed(2));
    
    $('#invoice_VAT6').val(Number(total_VAT6.toFixed(2)));
	$('#invoice_VAT21').val(Number(total_VAT21.toFixed(2)));
        $('#invoice_invoice_VAT').val(total_VAT.toFixed(2));
    
    $('#subtotal').html(subtotal.toFixed(2));
    $('#invoice_invoice_exclusive_VAT').val(subtotal.toFixed(2));

    $('#invoice_invoice_including_VAT').val(total.toFixed(2));

}

function update_numbers() {
    $('input').click(function(){
	    $(this).select();
	    VAT_total();
	});
	
	VAT_total();
    
	$('#addrow').click(function(){
		if ($('.delete').length > 0) $('.delete').show();
		VAT_total();
	});
    
	$('body').on('click', '.delete', function(){
		$(this).parents('.nested-fields').remove();
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
		bind2($('.VAT_6'), $("#modal_VAT_6"));
		bind2($('.VAT_21'), $("#modal_VAT_21"));
		bind3($('#9'), $("#modal_9"));
		bind3($('#invoicing_number'), $("#modal_invoice_number"));
		bind3($('#datepicker'), $('#modal_invoice_date'));
		bind4($('#invoice_id'), $('#modal_invoice_number'));
		
		// Showing rows in invoice if value is not 0
		if ($('.VAT_6').html() == 0) {
		    $('#invoice_VAT_6').hide();
		} else {
		    $('#invoice_VAT_6').show();
		}
		if ($('.VAT_21').html() == 0) {
		    $('#invoice_VAT_21').hide();
		} else {
		    $('#invoice_VAT_21').show();
		}

		var rows = $('.nested-fields');
		$('#modal_tbody').empty();
		
		for (i=0; i < rows.length; i++) {
			var row = rows[i];
			$('#modal_tbody').append('<tr class="modal-nested-fields"></tr>');

			var desc = $(row).find('.item_desc').val();
			$('.modal-nested-fields:last').append('<td>' + desc + '</td>');

			var unit = $(row).find('.item_unit').val();
			$('.modal-nested-fields:last').append('<td>' + unit + '</td>');

			var VAT = $(row).find('.item_VAT_percentage').find(":selected").text();
			$('.modal-nested-fields:last').append('<td>' + VAT + '</td>');

			var qty = $(row).find('.qty').val();
			$('.modal-nested-fields:last').append('<td>' + qty + '</td>');
			
			var cost = $(row).find('.cost').val();
			$('.modal-nested-fields:last').append('<td> € ' + cost + '</td>');
			
			var price = $(row).find('.price').text();
			$('.modal-nested-fields:last').append('<td> € ' + price + '</td>');

		}
		
	});
    
}