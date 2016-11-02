function bind1() {
    $('.cost').blur(VAT_total());
    $('.qty').blur(VAT_total());
}

function bind2(main, modal) {
    var n = main.text();
    modal.empty();
    modal.append("" + n);
}

function bind3(main, modal) {
    var n = main.val();
    modal.empty();
    modal.append("" + n);
}

function bind4(main, modal) {
    var n = Number(main.val()) + 2016000;
    modal.empty();
    modal.append("" + n);
}

function collapse_field() {
    $('.collapse-link.vat_declaration').each(function() {
        this.click();
    });
}
