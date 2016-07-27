function update_VAT(){
    var VATtotal = 0;
    var total_cost = 0;
    $('#item_VAT').each(function(i){
        var VAT = $('#item_VAT').val();
        if (VAT == 6)
            if (!isNaN(VAT)) VATtotal = Number(VAT);
            var cost = $(this).closest('tr.nested-fields').find('.price').html();
            console.log(cost);
            if (!isNaN(cost)) total_cost += Number(cost);
    });
    
    VATtotal = VATtotal.toFixed(2) * 0.01;
    total_cost = total_cost.toFixed(2);
    VAT6 = (total_cost * VATtotal);
    $('.VAT_6').html(VAT6);
}

function update_subtotal() {
    var subtotal = 0;
    $('.price').each(function(i){
        var price = $(this).html();
        if (!isNaN(price)) subtotal += Number(price);
    });
    
    subtotal = subtotal.toFixed(2);
    $('#subtotal').html(subtotal);
    
    update_balance();
    update_VAT();
};

function update_balance() {
    var total = Number($('#subtotal').html()) * (Number($('#9').val() * 0.01 + 1 ));
    total = total.toFixed(2);
    
    $('.due').html(total);
};

function update_price() {
    var row = $(this).parents('.nested-fields');
    var price = row.find('.cost').val() * row.find('.qty').val();
    price = price.toFixed(2);
    isNaN(price) ? row.find('.price').html('Geen nummer') : row.find('.price').html(price);
    update_subtotal();
    update_VAT();
};

function bind1() {
    $('.cost').blur(update_price);
    $('.qty').blur(update_price);
    $('#item_VAT').blur(update_VAT);
};

function bind2(main, modal) {
    var n = main.text();
    modal.empty();
    modal.append("" + n)
};

function bind3(main, modal) {
    var n = main.val();
    modal.empty();
    modal.append("" + n)
};
