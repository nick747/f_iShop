var language = {
  "promtMessage": [
    "Hai speso ",
    "You've spent ",
    "Tu as dépensé "
  ],
  "helpMessage": [
    "Clicca su un prodotto per avere più informazioni. Per salvarlo, clicca sul pulsante con la stella. Per filtrare i tuoi prodotti clicca sulla stellina in alto a destra nella schermata principale.",
    "Click on a product for more information. To save it, click on the star button. To filter your products, click on the star at the top right of the main screen.",
    "Cliquez sur un produit pour plus d'informations. Pour l'enregistrer, cliquez sur le bouton étoile. Pour filtrer vos produits, cliquez sur l'étoile en haut à droite de l'écran principal.",
  ],
  "refundMessage" : [
    "Hai rimosso ",
    "You've removed ",
    "Vous avez supprimé ", 
  ],
  "refundMessageB": [
    " dal tuo carrello",
    " from your cart.",
    " de votre chariot.",
  ],
  "purchaseMessage": [
    "Acquisto completato.",
    "Purchase Completed.",
    "Achat terminé.",
  ],
  "appBar1": [
    "Prodotti",
    "Products",
    "Produits",
  ],
  "appBar2": [
    "Carrello",
    "Cart",
    "Chariot",
  ],
  "appBar3": [
    "Impostazioni",
    "Settings",
    "Paramètres",
  ],
  "purchaseButton1": [
    "A C Q U I S T A",
    "B U Y",
    "A C H E T E R",
  ],
  "purchaseButton2": [
    "R I M U O V I",
    "R E M O V E",
    "S U P P R I M E R",
  ],
  "products" : [
    "Prodotti",
    "Products",
    "Produits"
  ],
  "favourite": [
    "Preferiti",
    "Favourites",
    "Favoris"
  ],
  "settingsTitle": [
    "Impostazioni",
    "Settings",
    "Paramètres",
  ],
  "settings1": [
    "Modalità Notte",
    "Dark Mode",
    "Mode Sombre",
  ],
  "settings2": [
    "Stile Moderno",
    "Modern Style",
    "Style Moderne"
  ],
  "settings5title": [
    "Valuta Utilizzata",
    "Currency Used",
    "Devise Utilisée",
  ],
  "settings5a": [
    "\$ Dollari",
    "\$ Dollars",
    "\$ Dollars",
  ],
  "settings5b": [
    "€ Euro",
    "€ Euros",
    "€ Euros",
  ],
  "settings5c": [
    "£ Sterline",
    "£ Pounds",
    "£ Livres Sterling"
  ],
  "settings4title": [
    "Lingua",
    "Language",
    "Langue"
  ],
  "settings4a": [
    "Italiano",
    "Italian",
    "Italien",
  ],
  "settings4b": [
    "Inglese",
    "English",
    "Englais"
  ],
  "settings4c": [
    "Francese",
    "French",
    "Français"
  ],
};

String getTextLanguage(String key, int lang) {
  return language[key]![lang];
}
