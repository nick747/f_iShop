var data = [
  {
    'name': "iPhone 14 Pro Max",
    'description': [
      "L'iPhone 14 Pro Max è uno dei modelli di fascia alta della linea iPhone 2022. Ha un display XDR da 6,7 pollici, fotocamera principale tripla, processore A16 Bionic, 5G, Face ID, ricarica wireless, ultimo sistema operativo iOS ed è resistente all'acqua.",
      'The iPhone 14 Pro Max is one of the high-end models in the 2022 iPhone lineup. It has a 6.7-inch XDR display, triple primary camera, A16 Bionic processor, 5G, Face ID, wireless charging, the latest iOS operating system, and is waterproof.'
    ],
    'price': [1099, 1489, 1199],
    'imageUrl': 'assets/images/i14pm.png',
    'imageUrlDt': 'assets/images/i14pm_dt.png',
    'starred': false,
    'bought': false
  },
];

var description = {
  0: [
    "L'iPhone 14 Pro Max è uno dei modelli di fascia alta della linea iPhone 2022. Ha un display XDR da 6,7 pollici, fotocamera principale tripla, processore A16 Bionic, 5G, Face ID, ricarica wireless, ultimo sistema operativo iOS ed è resistente all'acqua.",
    "L'iPhone 14 Pro è uno dei modelli di fascia alta della linea iPhone 2022. Ha un display XDR da 6,1 pollici, fotocamera principale tripla, processore A16 Bionic, 5G, Face ID, ricarica wireless, ultimo sistema operativo iOS ed è resistente all'acqua.",
    "L'iPhone 14 Plus il modello plus della linea di iPhone 2022.Ha un display XDR da 6,7 pollici, fotocamera principale doppia, processore A15 Bionic, 5G, Face ID, ricarica wireless, ultimo sistema operativo iOS ed è resistente all'acqua.",
    "L'iPhone 14 il modello base della linea di iPhone 2022.Ha un display XDR da 6,1 pollici, fotocamera principale doppia, processore A15 Bionic, 5G, Face ID, ricarica wireless, ultimo sistema operativo iOS ed è resistente all'acqua.",
    "L'iPhone 13 Mini è il modello mini della linea di iPhone 2021. Ha un display XDR da 5,4 pollici, fotocamera principale doppia, processore A15 Bionic, 5G, Face ID, ricarica wireless, ultimo sistema operativo iOS ed è resistente all'acqua.",
    "L'iPhone 13 è il modello base della linea di iPhone 2021. Ha un display XDR da 6,1 pollici, fotocamera principale doppia, processore A15 Bionic, 5G, Face ID, ricarica wireless, ultimo sistema operativo iOS ed è resistente all'acqua.",
    "L'iPhone 12 è il modello base della linea di iPhone 2020. Ha un display OLED da 6,1 pollici, fotocamera principale doppia, processore A14 Bionic, 5G, Face ID, ricarica wireless, ultimo sistema operativo iOS ed è resistente all'acqua.",
    "L'iPhone SE (seconda generazione) è uno smartphone più economico di Apple con caratteristiche simili a quelle dei modelli di fascia alta. Include un display da 4,7 pollici, fotocamera principale da 12MP, processore A15 Bionic, Touch ID, ricarica wireless e il sistema operativo iOS 16. È stato presentato il 15 aprile 2020 e messo in vendita a partire dallo stesso giorno.",
  ],
  1: [
    "The iPhone 14 Pro Max is one of the high-end models in the 2022 iPhone lineup. It has a 6.7-inch XDR display, triple primary camera, A16 Bionic processor, 5G, Face ID, wireless charging, the latest iOS operating system, and is waterproof.",
    "The iPhone 14 Pro is one of the high-end models in the 2022 iPhone lineup. It has a 6.1-inch XDR display, triple primary camera, A16 Bionic processor, 5G, Face ID, wireless charging, the latest iOS operating system, and is waterproof.",
    "The iPhone 14 Plus is the plus model in the 2022 iPhone lineup. It has a 6.7-inch XDR display, dual primary cameras, A15 Bionic processor, 5G, Face ID, wireless charging, the latest iOS operating system, and is water resistant .",
    "The iPhone 14 is the base model of the 2022 iPhone lineup. It has a 6.1-inch XDR display, dual primary cameras, A15 Bionic processor, 5G, Face ID, wireless charging, the latest iOS operating system, and is water resistant.",
    "The iPhone 13 Mini is the mini model in the 2021 iPhone lineup. It has a 5.4-inch XDR display, dual primary cameras, A15 Bionic processor, 5G, Face ID, wireless charging, the latest iOS operating system, and is water resistant. waterfall.",
    "The iPhone 13 is the base model in the 2021 iPhone lineup. It has a 6.1-inch XDR display, dual primary camera, A15 Bionic processor, 5G, Face ID, wireless charging, latest iOS operating system, and is water resistant .",
    "The iPhone 12 is the base model in the 2020 iPhone lineup. It has a 6.1-inch OLED display, dual primary camera, A14 Bionic processor, 5G, Face ID, wireless charging, latest iOS operating system, and is water resistant .",
    "The iPhone SE (2nd generation) is a more affordable smartphone from Apple with features similar to the high-end models. It includes a 4.7-inch display, 12MP main camera, A15 Bionic processor, Touch ID, wireless charging and the iOS 16 operating system. It was unveiled on April 15, 2020 and went on sale from the same day.",
  ],
};

var price = {
  0: [
    1099,
    999,
    899,
    799,
    599,
    699,
    599,
    429,
  ],
  1: [
    1489,
    1339,
    1179,
    1029,
    839,
    939,
    839,
    559,
  ],
  2: [
    1199,
    1099,
    949,
    849,
    649,
    749,
    649,
    449,
  ],
};

class Product {
  final String name;
  final List<String> description;
  final List<double> price;
  final String imageUrl;
  final String imageUrlDt;
  bool starred;
  bool bought;

  Product(
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.imageUrlDt,
    this.starred,
    this.bought,
  );

  String getDescription(int language) {
    return description[language];
  }

  double getPrice(int currency) {
    return price[currency];
  }
}

List<Product> productList = [];

List<Product> populateList() {
  List<Product> list = [];
  for (Map<String, dynamic> item in data) {
    var newItem = Product(
        item['name'],
        item['description'],
        item['price'],
        item['imageUrl'],
        item['imageUrlDt'],
        item['starred'] as bool,
        item['bought'] as bool);
    list.add(newItem);
  }
  return list;
}

double sumPricesList(List<Product> productList, int currency) {
  double total = 0;
  for (Product product in productList) {
    total += product.price[currency];
  }

  return total;
}
