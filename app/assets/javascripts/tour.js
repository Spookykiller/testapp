if ($('.right_col').is( "#dashboard" )) {
  // Instance the dashboard tour
  var tourDashboard = new Tour({
    steps: [
    {
      element: "#dashboard",
      title: "Welkom op het dashboard.",
      content: "Op het dashboard staat een overzicht van handige informatie voor uw bedrijf.",
      placement: "top"
    },
    {
      element: "#open_creditors",
      title: "Openstaande crediteuren",
      content: "Hier zie je een overzicht van de openstaande crediteuren.",
      placement: "top"
    },
    {
      element: "#open_debtors",
      title: "Openstaande debiteuren",
      content: "Hier zie je een overzicht van de openstaande debiteuren.",
      placement: "top"
    },
    {
      element: "#projects",
      title: "Projecten",
      content: "Hier zie je een overzicht van al je projecten.",
      placement: "top"
    },
    {
      element: "#all_invoices",
      title: "Facturen",
      content: "Overzicht van wanneer er facturen aangemaakt zijn.",
      placement: "top"
    },
    {
      element: "#time_registration",
      title: "Tijd registratie",
      content: "Geeft aan hoeveel uren er per project geregristreed staan.",
      placement: "top"
    }
  ]});
  
  $('.help-link').each(function(e){
    $(this).click(function(){  
  
      tourDashboard.init();
    
      // Initialize the tour
      
      tourDashboard.restart();
      tourDashboard.goTo(e + 1);
  
    });
  });
  
  
} else if ($('.right_col').is( "#company" )) {
  
  
  // Instance the Company tour
  var tourCompany = new Tour({
    steps: [
    {
      element: "#company_info",
      title: "Welkom bij uw bedrijfsinformatie.",
      content: "Hier kunt u al uw bedrijfsgegevens kwijt die nodig zijn voor het boekhoudprogramma.",
      placement: "top"
    }
  ]});
  
  $('.help-link').each(function(e){
    $(this).click(function(){  
  
      tourCompany.init();
    
      // Initialize the tour
      
      tourCompany.restart();
  
    });
  });
  
  
} else if ($('.right_col').is( "#clients" )) {
  
  
  // Instance the client tour
  var tourClient = new Tour({
    steps: [
    {
      element: "#client_info",
      title: "Welkom bij uw klanteninformatie.",
      content: "Hier ziet u een klantenoverzicht en kunt u al uw klanten opslaan.",
      placement: "top"
    },
    {
      element: ".edit_icon:first",
      title: "Klanten wijzigen.",
      content: "Wanneer u klantengegevens op wilt wijzigen kunt u dat doen door op dit icoontje te klikken.",
      placement: "top"
    },
    {
      element: ".delete_icon:first",
      title: "Klanten verwijderen.",
      content: "Wanneer u een klant wilt verwijderen kan dat door hier op te klikken. Pas op verwijderd is verwijderd.",
      placement: "top"
    },
    {
      element: ".btn.btn-primary:first",
      title: "Klanten toevoegen.",
      content: "Met deze knop ga je naar het formulier waar je een nieuwe klant aan kan maken.",
      placement: "top"
    }
  ]});
  
  $('.help-link').each(function(e){
    $(this).click(function(){  
  
      tourClient.init();
    
      // Initialize the tour
      
      tourClient.restart();
      tourClient.goTo(e);
  
    });
  });
  
  
} else if ($('.right_col').is( "#projects" )) {
  
  
  // Instance the project tour
  var tourProject = new Tour({
    steps: [
    {
      element: "#projects",
      title: "Welkom bij uw projecten.",
      content: "Hier ziet u een overzicht van al uw projecten op bepaalde klanten.",
      placement: "top"
    },
    {
      element: ".edit_icon:first",
      title: "Project wijzigen.",
      content: "Wanneer u projectgegevens wilt wijzigen kunt u dat doen door op dit icoontje te klikken.",
      placement: "top"
    },
    {
      element: ".delete_icon:first",
      title: "Project verwijderen.",
      content: "Wanneer u een project wilt verwijderen kan dat door hier op te klikken. Pas op verwijderd is verwijderd.",
      placement: "top"
    },
    {
      element: ".btn.btn-primary:first",
      title: "Project toevoegen.",
      content: "Met deze knop ga je naar het formulier waar je een nieuw project aan kan maken.",
      placement: "top"
    }
  ]});
  
  $('.help-link').each(function(e){
    $(this).click(function(){  
  
      tourProject.init();
    
      // Initialize the tour
      
      tourProject.restart();
      tourProject.goTo(e);
  
    });
  });
  
  
} else if ($('.right_col').is( "#timesheet" ))   {
  
  
  // Instance the timesheet tour
  var tourTimesheet = new Tour({
    steps: [
    {
      element: "#timesheet",
      title: "Welkom bij uw urenregistratie.",
      content: "Hier ziet u een overzicht van al uw geregristreerde uren op bepaalde projecten.",
      placement: "top"
    },
    {
      element: ".edit_icon:first",
      title: "Urenregistratie wijzigen.",
      content: "Wanneer u urenregistratie wilt wijzigen kunt u dat doen door op dit icoontje te klikken.",
      placement: "top"
    },
    {
      element: ".delete_icon:first",
      title: "Urenregistratie verwijderen.",
      content: "Wanneer u een urenregistratie wilt verwijderen kan dat door hier op te klikken. Pas op verwijderd is verwijderd.",
      placement: "top"
    },
    {
      element: ".btn.btn-primary:first",
      title: "Urenregistratie bijwerken.",
      content: "Met deze knop ga je naar het formulier waar je een nieuwe urenregistratie aan kan maken.",
      placement: "top"
    }
  ]});
  
  $('.help-link').each(function(e){
    $(this).click(function(){  
  
      tourTimesheet.init();
    
      // Initialize the tour
      
      tourTimesheet.restart();
      tourTimesheet.goTo(e);
  
    });
  });
  
  
} else if ($('.right_col').is( "#articles" ))   {

  
  // Instance the article tour
  var tourArticle = new Tour({
    steps: [
    {
      element: "#articles",
      title: "Welkom bij uw artikelen.",
      content: "Hier ziet u een overzicht van al uw artikelen die u op uw factuur kunt invullen.",
      placement: "top"
    },
    {
      element: ".edit_icon:first",
      title: "Artikel wijzigen.",
      content: "Wanneer u artikel wilt wijzigen kunt u dat doen door op dit icoontje te klikken.",
      placement: "top"
    },
    {
      element: ".delete_icon:first",
      title: "Artikel verwijderen.",
      content: "Wanneer u een artikel wilt verwijderen kan dat door hier op te klikken. Pas op verwijderd is verwijderd.",
      placement: "top"
    },
    {
      element: ".btn.btn-primary:first",
      title: "Artikel aanmaken.",
      content: "Met deze knop ga je naar het formulier waar je een nieuw artikel aan kan maken.",
      placement: "top"
    }
  ]});
  
  $('.help-link').each(function(e){
    $(this).click(function(){  
  
      tourArticle.init();
    
      // Initialize the tour
      
      tourArticle.restart();
      tourArticle.goTo(e);
  
    });
  });
  
  
} else if ($('.right_col').is( "#mileages" ))   {
  
  
  // Instance the mileages tour
  var tourMileage = new Tour({
    steps: [
    {
      element: "#mileages",
      title: "Welkom bij uw kilometerregistratie.",
      content: "Hier ziet u een overzicht van al uw kilometerregistraties.",
      placement: "top"
    },
    {
      element: ".edit_icon:first",
      title: "Artikel wijzigen.",
      content: "Wanneer u kilometerregistratie wilt wijzigen kunt u dat doen door op dit icoontje te klikken.",
      placement: "top"
    },
    {
      element: ".delete_icon:first",
      title: "Artikel verwijderen.",
      content: "Wanneer u een kilometerregistratie wilt verwijderen kan dat door hier op te klikken. Pas op verwijderd is verwijderd.",
      placement: "top"
    },
    {
      element: ".btn.btn-primary:first",
      title: "Kilometerregistratie aanmaken.",
      content: "Met deze knop ga je naar het formulier waar je je kilometerregistratie overzicht kan bijwerken.",
      placement: "top"
    }
  ]});
  
  $('.help-link').each(function(e){
    $(this).click(function(){  
  
      tourMileage.init();
    
      // Initialize the tour
      
      tourMileage.restart();
      tourMileage.goTo(e);
  
    });
  });
  
  
} else if ($('.right_col').is( "#offers" ))   {
  
  
  // Instance the offer tour
  var tourOffer = new Tour({
    steps: [
    {
      element: "#offers",
      title: "Welkom bij uw offerte overzicht.",
      content: "Hier ziet u een overzicht van al uw aangemaakte offertes.",
      placement: "top"
    },
    {
      element: ".edit_icon:first",
      title: "Artikel wijzigen.",
      content: "Wanneer u kilometerregistratie wilt wijzigen kunt u dat doen door op dit icoontje te klikken.",
      placement: "top"
    },
    {
      element: ".delete_icon:first",
      title: "Artikel verwijderen.",
      content: "Wanneer u een kilometerregistratie wilt verwijderen kan dat door hier op te klikken. Pas op verwijderd is verwijderd.",
      placement: "top"
    },
    {
      element: ".btn.btn-primary:first",
      title: "Omzetten naar factuur.",
      content: "Met deze knop kun je de offerte gelijk omzetten naar een concept-factuur.",
      placement: "top"
    },
    {
      element: ".btn.btn-primary:last",
      title: "Nieuwe offerte.",
      content: "Met deze knop kun je een nieuwe offerte aanmaken.",
      placement: "top"
    },
  ]}
  );
  
  $('.help-link').each(function(e){
    $(this).click(function(){  
  
      tourOffer.init();
    
      // Initialize the tour
      
      tourOffer.restart();
      tourOffer.goTo(e);
  
    });
  });
  

} else if ($('.right_col').is( "#invoices" ))   {
  
    // Instance the offer tour
  var tourInvoice = new Tour({
    steps: [
    {
      element: "#invoice-concept",
      title: "Welkom bij uw concept facturen overzicht.",
      content: "Hier ziet u een overzicht van al uw aangemaakte concept facturen.",
      placement: "top"
    },
    {
      element: ".edit_icon:first",
      title: "Concept factuur wijzigen.",
      content: "Wanneer u concept factuur wilt wijzigen kunt u dat doen door op dit icoontje te klikken.",
      placement: "top"
    },
    {
      element: ".delete_icon:first",
      title: "Concept factuur verwijderen.",
      content: "Wanneer u een concept factuur wilt verwijderen kan dat door hier op te klikken. Pas op verwijderd is verwijderd.",
      placement: "top"
    },
    {
      element: ".btn.btn-primary:first",
      title: "Concept factuur omzetten naar definitieve factuur.",
      content: "Met deze knop kun je de concept factuur gelijk omzetten naar een definitieve factuur",
      placement: "top"
    },
    {
      element: ".btn.btn-primary:last",
      title: "Nieuwe concept factuur.",
      content: "Met deze knop kun je een nieuwe concept factuur aanmaken.",
      placement: "top"
    },
    {
      element: "#invoice_definitive",
      title: "Welkom bij uw definitieve facturen overzicht.",
      content: "Hier vindt u een overzicht van al uw definitieve facturen",
      placement: "top"
    },
    {
      element: ".factuurnummer:first",
      title: "Factuurnummer",
      content: "Uw factuur heeft nu een factuurnummer wegens dat hij definitief is.",
      placement: "top"
    },
    {
      element: ".show_invoice:first",
      title: "Definitieve factuur bekijken.",
      content: "Hier kunt u uw definitieve factuur bekijken.",
      placement: "top"
    },
  ]}
  );
  
  $('.help-link').each(function(e){
    $(this).click(function(){  
  
      tourInvoice.init();
    
      // Initialize the tour
      
      tourInvoice.restart();
      tourInvoice.goTo(e);
  
    });
  });
  
  
} else if ($('.right_col').is( "#earnings" ))   {
  
  
    // Instance the offer tour
  var tourEarning = new Tour({
    steps: [
    {
      element: "#earning",
      title: "Welkom bij uw inkomsten overzicht.",
      content: "Hier ziet u een overzicht van al uw inkomsten en definitieve facturen waar nog geen inkomsten over geschreven zijn..",
      placement: "top"
    },
    {
      element: "#datepicker:first",
      title: "Factuur betalingsdatum invoeren.",
      content: "Vul hier de betalingsdatum van de desbetreffende definitieve factuur in.",
      placement: "top"
    },
    {
      element: "#invoice_paid:first",
      title: "Factuur inkomsten invoeren.",
      content: "Vul hier de ontvangen inkomsten van de desbetreffende definitieve factuur in.",
      placement: "top"
    },
    {
      element: "#save_earning:first",
      title: "Betalingsinfo opslaan",
      content: "Sla uw ontvangen betalingsinfo van desbetreffende definitieve factuur op.",
      placement: "top"
    },
    {
      element: ".edit_icon:first",
      title: "Factuur inkomsten of datum wijzigen.",
      content: "Wanneer u uw factuur inkomsten of datum wilt wijzigen kunt u dat doen door op dit icoontje te klikken.",
      placement: "top"
    }
  ]}
  );
  
  $('.help-link').each(function(e){
    $(this).click(function(){  
  
      tourEarning.init();
    
      // Initialize the tour
      
      tourEarning.restart();
      tourEarning.goTo(e);
  
    });
  });


} else {
  $('.help-link').each(function(e){
    $(this).click(function(){ 
      toastr.warning('Sorry, deze help methode is nog niet aangemaakt of is nog onder constructie.')
    });
  });
}

$('.close-link').each(function(e){
  $(this).click(function(){ 
    toastr.warning('U heeft een tablad tijdelijk verwijderd! Om het tablad weer toe te voegen moet u de pagina herladen.')
  });
});
