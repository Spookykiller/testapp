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

//= require jquery.inputmask
//= require jquery.inputmask.extensions
//= require jquery.inputmask.numeric.extensions
//= require jquery.inputmask.date.extensions

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
//= require js/tour/bootstrap-tour.min.js

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
    
    $('table.jambo_table').DataTable( {
    	"info": false
    });

    $('.datepicker').each(function(){
        $(this).daterangepicker({
            singleDatePicker: true,
            showDropdowns: true,
            format: 'DD/MM/YYYY'
        });
    });
    
    $('#spending_type').change(function() {
    	if (this.value == "Consumptiekosten") {
    		$('#spending_VAT').attr('disabled','disabled');
    		$('#spending_VAT').val(0);
    	} else {
    		$('#spending_VAT').removeAttr('disabled');
    	};
    })
    
    $('#phone_number').inputmask("9999999999");
    $('#client_zipcode').inputmask("9999 aa");
    $('#company_zipcode').inputmask("9999 aa");

    $('#definitive').find('form').each(function() {
        $(this).find('input.form-control').prop('disabled', true);
        $(this).find('select').prop('disabled', true);
        $(this).find('.add_fields').hide();
        $(this).find('#invoicing').prop('disabled', false);
    })

    update_numbers();
    VAT_total();
    
    $('#items').on('cocoon:after-insert', function(e, insertedItem){
        update_numbers();
    });
    
    $('#items').on('cocoon:before-insert', function(e, insertedItem) {
        insertedItem.fadeIn('slo');
        update_numbers();
    });
    
    $('#invoicing').click(function() {
        update_numbers();
    });
    
        
    $('#invoice_button').click(function() {
        update_numbers();
    });
    
    collapse_field();
    
    $('body').on('keydown', 'input, select, textarea', function(e) {
	    var self = $(this)
	      , form = self.parents('form:eq(0)')
	      , focusable
	      , next
	      ;
	    if (e.keyCode == 13) {
	        focusable = form.find('input,a,select,button,textarea').filter(':visible');
	        next = focusable.eq(focusable.index(this)+1);
	        if (next.length) {
	            next.focus();
	        } else {
	            form.submit();
	        }
	        return false;
	    }
	});
    
});

var total_VAT6_final = 0.00;
var total_VAT21_final = 0.00;
var subtotal_final = 0.00;


function VAT_total() {
	
    var total_VAT6 = 0.00;
	var total_VAT21 = 0.00;
    var total_VAT = 0.00;
    var subtotal = 0.00;
    var subtotal_0 = 0.00;
    var subtotal_6 = 0.00;
    var subtotal_21 = 0.00;
    var total = 0.00;
	$('tr.nested-fields').each(function(){

	    var column_qty = deformat($(this).find('#item_qty').val());
	    var colum_item_cost = deformat($(this).find('#item_cost').val());
	    var column_total_price = Number(column_qty) * Number(colum_item_cost);
	    
	    var column_price = deformat($(this).find('.price').html());
	    var column_VAT = 0.01 * deformat($(this).find('#item_VAT').val());
		
        if (column_VAT == 0.06) {
            var column_VAT_total6 = Number(column_VAT) * Number(column_price);
            subtotal_6 += Number(column_total_price);

            if (!isNaN(column_VAT_total6)) total_VAT6 += Number(column_VAT_total6);
        } else if (column_VAT == 0.21){
            var column_VAT_total21 = Number(column_VAT) * Number(column_price);
            
            subtotal_21 += Number(column_total_price);

            if (!isNaN(column_VAT_total21)) total_VAT21 += Number(column_VAT_total21);
        } else if (column_VAT == 0.00 ) {
        	subtotal_0 += Number(column_total_price);
        }
        
        subtotal += Number(column_total_price);
        $(this).find('.price').html(column_total_price.toFixed(2));
	});
	
	total = Number(subtotal) + Number(total_VAT6) + Number(total_VAT21);
	total_VAT = Number(total_VAT6) + Number(total_VAT21);
	total_VAT6_final = Number(total_VAT6);
	total_VAT21_final = Number(total_VAT21);
	
	subtotal_final = Number(subtotal);
	
	$('.VAT_6').html(format(Number(total_VAT6)));
	$('.VAT_21').html(format(Number(total_VAT21)));
    $('.due').html(format(total));
    
    $('#invoice_VAT6').val(Number(total_VAT6.toFixed(2)));
	$('#invoice_VAT21').val(Number(total_VAT21.toFixed(2)));
    $('#invoice_invoice_VAT').val(total_VAT.toFixed(2));
    
    $('#subtotal').html(format(subtotal));

    $('#subtotal_0').html(format(subtotal_0));
    $('#subtotal_6').html(format(subtotal_6));
    $('#subtotal_21').html(format(subtotal_21));
    
    $('#invoice_subtotal_0').val(format(subtotal_0));
    $('#invoice_subtotal_6').val(format(subtotal_6));
    $('#invoice_subtotal_21').val(format(subtotal_21));
    
    $('#invoice_invoice_exclusive_VAT').val(subtotal.toFixed(2));
    $('#invoice_invoice_including_VAT').val(total);;

}

function update_numbers() {
    $('input').click(function(){
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
		var e = deformat($('#9').val());
		$('#invoice_invoice_VAT_percentage').empty();
		$('#invoice_invoice_VAT_percentage').val(Number(e));

		$('#invoice_invoice_exclusive_VAT').empty();
		$('#invoice_invoice_exclusive_VAT').val(Number(subtotal_final));
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
		if (Number(total_VAT6_final) == 0) {
		    $('#invoice_VAT_6').hide();
		} else {
		    $('#invoice_VAT_6').show();
		}
		if (Number(total_VAT21_final) == 0) {
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
			$('.modal-nested-fields:last').append('<td>' + format(Number(qty)) + '</td>');
			
			var cost = $(row).find('.cost').val();
			$('.modal-nested-fields:last').append('<td> € ' + format(Number(cost)) + '</td>');
			
			var price = $(row).find('.price').text();
			$('.modal-nested-fields:last').append('<td> € ' + format(Number(price)) + '</td>');

		}
		
	});
    
}

function format(yourNumber) {
	yourNumber = yourNumber.toFixed(2);

    var n= yourNumber.toString().split(".");
    //Comma-fies the first part
    n[0] = n[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    //Combines the two sections
    return n.join(",");
}

function deformat(yourNumber) {
	var n = yourNumber.replace(/,/g, '.');
	
	console.log(n);
	return n;
}