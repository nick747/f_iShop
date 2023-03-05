var language = {
  "promtMessage": ["Hai speso ", "You've spent "],
  "helpMessage": [
    "Clicca su un prodotto per avere più informazioni. Per salvarlo, clicca sul pulsante con la stella. Per filtrare i tuoi prodotti clicca sulla stellina in alto a destra nella schermata principale.",
    "Click on a product for more information. To save it, click on the star button. To filter your products, click on the star at the top right of the main screen."
  ],
  "settingsTitle": ["Impostazioni", "Settings"],
  "settings1" : ["Modalità Notte", "Dark Mode"],
  "settings2" : ["Stile Moderno", "Modern Style"],
  "settings3" : ["Inglese", "English"],
  "settings4title" : ["Valuta Utilizzata", "Currency Used"],
  "settings4a" : ["\$ Dollari", "\$ Dollars"],
  "settings4b" : ["€ Euro", "€ Euros"],
  "settings4c" : ["£ Sterline", "£ Pounds"],
};

String getTextLanguage(String key, int lang) {
  return language[key]![lang];
}
