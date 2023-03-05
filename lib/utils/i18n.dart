var language = {
  "promtMessage": [
    "Hai speso ",
    "You've spent ",
  ],
  "helpMessage": [
    "Clicca su un prodotto per avere più informazioni. Per salvarlo, clicca sul pulsante con la stella. Per filtrare i tuoi prodotti clicca sulla stellina in alto a destra nella schermata principale.",
    "Click on a product for more information. To save it, click on the star button. To filter your products, click on the star at the top right of the main screen.",
  ],
  "appBar1": [
    "Prodotti",
    "Products",
  ],
  "appBar2": [
    "Carrelo",
    "Cart",
  ],
  "appBar3": [
    "Impostazioni",
    "Settings",
  ],
  "products" : [
    "Prodotti",
    "Products",
  ],
  "favourite": [
    "Preferiti",
    "Favourites",
  ],
  "settingsTitle": [
    "Impostazioni",
    "Settings",
  ],
  "settings1": [
    "Modalità Notte",
    "Dark Mode",
  ],
  "settings2": [
    "Stile Moderno",
    "Modern Style",
  ],
  "settings3": [
    "Inglese",
    "English",
  ],
  "settings5title": [
    "Valuta Utilizzata",
    "Currency Used",
  ],
  "settings5a": [
    "\$ Dollari",
    "\$ Dollars",
  ],
  "settings5b": [
    "€ Euro",
    "€ Euros",
  ],
  "settings5c": [
    "£ Sterline",
    "£ Pounds",
  ],
  "settings4title": [
    "Lingua",
    "Language",
  ],
  "settings4a": [
    "Italiano",
    "Italian",
  ],
  "settings4b": [
    "Inglese",
    "English",
  ],
};

String getTextLanguage(String key, int lang) {
  return language[key]![lang];
}
