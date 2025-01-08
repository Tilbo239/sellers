const brandData = """[
	{
		"id": 2,
		"brandName": "Playstation 2",
		"image": "60cc7b632267c_kisspng-playstation-2-playstation-3-playstation-portable-v-playstation4-backgraound-5b0c1481135ca5.1703722315275183370793.jpg"
	},
	{
		"id": 3,
		"brandName": "Playstation 3",
		"image": null
	},
	{
		"id": 4,
		"brandName": "Playstation 4",
		"image": null
	},
	{
		"id": 5,
		"brandName": "XBOX 360",
		"image": null
	},
	{
		"id": 6,
		"brandName": "Nintendo 3DS",
		"image": null
	},
	{
		"id": 7,
		"brandName": "Nitendo GameBoy",
		"image": null
	},
	{
		"id": 8,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 9,
		"brandName": "Canon",
		"image": null
	},
	{
		"id": 10,
		"brandName": "Nikon",
		"image": null
	},
	{
		"id": 11,
		"brandName": "Sony",
		"image": null
	},
	{
		"id": 12,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 16,
		"brandName": "Toyota Camry",
		"image": null
	},
	{
		"id": 17,
		"brandName": "Toyota Corrola",
		"image": null
	},
	{
		"id": 18,
		"brandName": "Toyota Land Cruiser",
		"image": null
	},
	{
		"id": 19,
		"brandName": "iPad 2",
		"image": null
	},
	{
		"id": 20,
		"brandName": "Honda",
		"image": null
	},
	{
		"id": 21,
		"brandName": "Kymco",
		"image": null
	},
	{
		"id": 22,
		"brandName": "Galaxy Tab",
		"image": null
	},
	{
		"id": 23,
		"brandName": "Appart. 1pièce",
		"image": null
	},
	{
		"id": 24,
		"brandName": "Appart. 2pièces",
		"image": null
	},
	{
		"id": 25,
		"brandName": "Appart. 3pièces",
		"image": null
	},
	{
		"id": 26,
		"brandName": "Appart. 4pièces",
		"image": null
	},
	{
		"id": 27,
		"brandName": "Appart. 5pièces+",
		"image": null
	},
	{
		"id": 28,
		"brandName": "Maison-Villa",
		"image": null
	},
	{
		"id": 30,
		"brandName": "Surfaces",
		"image": null
	},
	{
		"id": 31,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 32,
		"brandName": "Terrain nu",
		"image": null
	},
	{
		"id": 33,
		"brandName": "Terrain agricole",
		"image": null
	},
	{
		"id": 34,
		"brandName": "Appart. 1pièce",
		"image": null
	},
	{
		"id": 35,
		"brandName": "Appart. 2pièces",
		"image": null
	},
	{
		"id": 36,
		"brandName": "Appart. 3pièces",
		"image": null
	},
	{
		"id": 37,
		"brandName": "Appart. 4pièces",
		"image": null
	},
	{
		"id": 38,
		"brandName": "Appart. 5pièces+",
		"image": null
	},
	{
		"id": 39,
		"brandName": "Maison-Villa",
		"image": null
	},
	{
		"id": 40,
		"brandName": "Surfaces",
		"image": null
	},
	{
		"id": 41,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 42,
		"brandName": "Duplex",
		"image": null
	},
	{
		"id": 43,
		"brandName": "Appart. 1pièce",
		"image": null
	},
	{
		"id": 44,
		"brandName": "Appart. 2pièces",
		"image": null
	},
	{
		"id": 45,
		"brandName": "Appart. 3pièces",
		"image": null
	},
	{
		"id": 46,
		"brandName": "Appart. 4pièces",
		"image": null
	},
	{
		"id": 47,
		"brandName": "Appart. 5pièces+",
		"image": null
	},
	{
		"id": 48,
		"brandName": "Maison-Villa",
		"image": null
	},
	{
		"id": 49,
		"brandName": "Surfaces",
		"image": null
	},
	{
		"id": 50,
		"brandName": "Fond de Commerce",
		"image": null
	},
	{
		"id": 51,
		"brandName": "Bureau",
		"image": null
	},
	{
		"id": 52,
		"brandName": "Atelier-Garage",
		"image": null
	},
	{
		"id": 53,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 54,
		"brandName": "Appart. 1pièce",
		"image": null
	},
	{
		"id": 55,
		"brandName": "Appart. 2pièces",
		"image": null
	},
	{
		"id": 56,
		"brandName": "Appart. 3pièces",
		"image": null
	},
	{
		"id": 57,
		"brandName": "Appart. 4pièces",
		"image": null
	},
	{
		"id": 58,
		"brandName": "Duplex",
		"image": null
	},
	{
		"id": 59,
		"brandName": "Maison-Villa",
		"image": null
	},
	{
		"id": 60,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 61,
		"brandName": "Audi",
		"image": null
	},
	{
		"id": 62,
		"brandName": "Hyundai",
		"image": null
	},
	{
		"id": 63,
		"brandName": "Infiniti",
		"image": null
	},
	{
		"id": 64,
		"brandName": "Honda",
		"image": null
	},
	{
		"id": 65,
		"brandName": "Mitsubichi",
		"image": null
	},
	{
		"id": 66,
		"brandName": "KIA",
		"image": null
	},
	{
		"id": 67,
		"brandName": "Isuzu",
		"image": null
	},
	{
		"id": 68,
		"brandName": "Jaguar",
		"image": null
	},
	{
		"id": 69,
		"brandName": "Lamborghini",
		"image": null
	},
	{
		"id": 70,
		"brandName": "Ferrari",
		"image": null
	},
	{
		"id": 71,
		"brandName": "Lexus",
		"image": null
	},
	{
		"id": 72,
		"brandName": "Maserati",
		"image": null
	},
	{
		"id": 73,
		"brandName": "Maybach",
		"image": null
	},
	{
		"id": 74,
		"brandName": "Mazda",
		"image": null
	},
	{
		"id": 75,
		"brandName": "Opel",
		"image": null
	},
	{
		"id": 76,
		"brandName": "Peugeot",
		"image": null
	},
	{
		"id": 77,
		"brandName": "Porshe",
		"image": null
	},
	{
		"id": 78,
		"brandName": "Renault",
		"image": null
	},
	{
		"id": 79,
		"brandName": "Volkswagen",
		"image": null
	},
	{
		"id": 80,
		"brandName": "Autre brand",
		"image": null
	},
	{
		"id": 81,
		"brandName": "Citroen",
		"image": null
	},
	{
		"id": 82,
		"brandName": "Bugatti",
		"image": null
	},
	{
		"id": 83,
		"brandName": "Cadillac",
		"image": null
	},
	{
		"id": 84,
		"brandName": "Fiat",
		"image": null
	},
	{
		"id": 85,
		"brandName": "Ford",
		"image": null
	},
	{
		"id": 86,
		"brandName": "General Motors",
		"image": null
	},
	{
		"id": 87,
		"brandName": "Femme de ménage",
		"image": null
	},
	{
		"id": 88,
		"brandName": "Gardiennage/Agent de Sécurité",
		"image": null
	},
	{
		"id": 89,
		"brandName": "HP",
		"image": null
	},
	{
		"id": 90,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 91,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 92,
		"brandName": "Apple Macbook",
		"image": null
	},
	{
		"id": 93,
		"brandName": "Accer",
		"image": null
	},
	{
		"id": 94,
		"brandName": "Alienware",
		"image": null
	},
	{
		"id": 95,
		"brandName": "Assambleur",
		"image": null
	},
	{
		"id": 96,
		"brandName": "Asus",
		"image": null
	},
	{
		"id": 97,
		"brandName": "Dell",
		"image": null
	},
	{
		"id": 98,
		"brandName": "eMachines",
		"image": null
	},
	{
		"id": 99,
		"brandName": "Fujitsu Siemens",
		"image": null
	},
	{
		"id": 100,
		"brandName": "HP/Compaq",
		"image": null
	},
	{
		"id": 101,
		"brandName": "IBM/Lenovo",
		"image": null
	},
	{
		"id": 102,
		"brandName": "MSI",
		"image": null
	},
	{
		"id": 103,
		"brandName": "Packard Bell",
		"image": null
	},
	{
		"id": 104,
		"brandName": "Panasonic",
		"image": null
	},
	{
		"id": 105,
		"brandName": "Samsung",
		"image": null
	},
	{
		"id": 106,
		"brandName": "Sony",
		"image": null
	},
	{
		"id": 107,
		"brandName": "Toshiba",
		"image": null
	},
	{
		"id": 108,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 109,
		"brandName": "iPad 3",
		"image": null
	},
	{
		"id": 110,
		"brandName": "iPad 4",
		"image": null
	},
	{
		"id": 111,
		"brandName": "Toumaï",
		"image": null
	},
	{
		"id": 112,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 113,
		"brandName": "Archos",
		"image": null
	},
	{
		"id": 114,
		"brandName": "Amazon",
		"image": null
	},
	{
		"id": 115,
		"brandName": "BlackBerry",
		"image": null
	},
	{
		"id": 116,
		"brandName": "HTC",
		"image": null
	},
	{
		"id": 117,
		"brandName": "Motorola",
		"image": null
	},
	{
		"id": 118,
		"brandName": "Alcatel",
		"image": null
	},
	{
		"id": 119,
		"brandName": "iPhone 2",
		"image": null
	},
	{
		"id": 120,
		"brandName": "iPhone 3",
		"image": null
	},
	{
		"id": 121,
		"brandName": "iPhone 4",
		"image": null
	},
	{
		"id": 122,
		"brandName": "iPhone 5",
		"image": null
	},
	{
		"id": 123,
		"brandName": "BlackBerry",
		"image": null
	},
	{
		"id": 124,
		"brandName": "HTC",
		"image": null
	},
	{
		"id": 125,
		"brandName": "LG",
		"image": null
	},
	{
		"id": 126,
		"brandName": "Motorola",
		"image": null
	},
	{
		"id": 127,
		"brandName": "Nokia",
		"image": null
	},
	{
		"id": 128,
		"brandName": "Palm",
		"image": null
	},
	{
		"id": 129,
		"brandName": "Sagem",
		"image": null
	},
	{
		"id": 130,
		"brandName": "Samsung",
		"image": null
	},
	{
		"id": 131,
		"brandName": "Samsung Galaxy",
		"image": null
	},
	{
		"id": 132,
		"brandName": "Autre brand",
		"image": null
	},
	{
		"id": 133,
		"brandName": "Housses et Etuis",
		"image": null
	},
	{
		"id": 134,
		"brandName": "Coques et Decorations",
		"image": null
	},
	{
		"id": 135,
		"brandName": "Protections Ecran",
		"image": null
	},
	{
		"id": 136,
		"brandName": "Chargeurs",
		"image": null
	},
	{
		"id": 137,
		"brandName": "Batteries",
		"image": null
	},
	{
		"id": 138,
		"brandName": "Ecrans LCD",
		"image": null
	},
	{
		"id": 139,
		"brandName": "Cables et Cartes",
		"image": null
	},
	{
		"id": 140,
		"brandName": "GPS",
		"image": null
	},
	{
		"id": 141,
		"brandName": "Kits Mains Libres",
		"image": null
	},
	{
		"id": 142,
		"brandName": "Logiciels et Outils",
		"image": null
	},
	{
		"id": 143,
		"brandName": "Déblocage",
		"image": null
	},
	{
		"id": 144,
		"brandName": "Réparation",
		"image": null
	},
	{
		"id": 145,
		"brandName": "Fixes sans fil",
		"image": null
	},
	{
		"id": 146,
		"brandName": "Fixes filaires",
		"image": null
	},
	{
		"id": 147,
		"brandName": "Répondeurs Seuls",
		"image": null
	},
	{
		"id": 148,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 149,
		"brandName": "Fax simple",
		"image": null
	},
	{
		"id": 150,
		"brandName": "Fax multifonction",
		"image": null
	},
	{
		"id": 151,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 152,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 153,
		"brandName": "Bajaj",
		"image": null
	},
	{
		"id": 154,
		"brandName": "Bmw",
		"image": null
	},
	{
		"id": 155,
		"brandName": "Ducati",
		"image": null
	},
	{
		"id": 156,
		"brandName": "Harley Davidson",
		"image": null
	},
	{
		"id": 157,
		"brandName": "Carter",
		"image": null
	},
	{
		"id": 158,
		"brandName": "Sanlg",
		"image": null
	},
	{
		"id": 159,
		"brandName": "Suzuki",
		"image": null
	},
	{
		"id": 160,
		"brandName": "Yamaha",
		"image": null
	},
	{
		"id": 161,
		"brandName": "Autre brand",
		"image": null
	},
	{
		"id": 162,
		"brandName": "Perkins",
		"image": null
	},
	{
		"id": 163,
		"brandName": "Tiger",
		"image": null
	},
	{
		"id": 164,
		"brandName": "Yamaha",
		"image": null
	},
	{
		"id": 165,
		"brandName": "Autres",
		"image": null
	},
	{
		"id": 166,
		"brandName": "Pièces détachées",
		"image": null
	},
	{
		"id": 167,
		"brandName": "Pneus et Jantes",
		"image": null
	},
	{
		"id": 168,
		"brandName": "Accessoires et Entretiens",
		"image": null
	},
	{
		"id": 169,
		"brandName": "Autoradio/Hif/GPS",
		"image": null
	},
	{
		"id": 170,
		"brandName": "Tuning Styling",
		"image": null
	},
	{
		"id": 171,
		"brandName": "Remorques",
		"image": null
	},
	{
		"id": 172,
		"brandName": "Outillage et Dépannage",
		"image": null
	},
	{
		"id": 173,
		"brandName": "Manuels et Catalogues",
		"image": null
	},
	{
		"id": 174,
		"brandName": "Services et Réparations",
		"image": null
	},
	{
		"id": 175,
		"brandName": "Alfa Romeo",
		"image": null
	},
	{
		"id": 176,
		"brandName": "Aston Martin",
		"image": null
	},
	{
		"id": 177,
		"brandName": "Audi",
		"image": null
	},
	{
		"id": 178,
		"brandName": "Austin",
		"image": null
	},
	{
		"id": 179,
		"brandName": "Bentley",
		"image": null
	},
	{
		"id": 180,
		"brandName": "BMW",
		"image": null
	},
	{
		"id": 181,
		"brandName": "Bugatti",
		"image": null
	},
	{
		"id": 182,
		"brandName": "Cadillac",
		"image": null
	},
	{
		"id": 183,
		"brandName": "Chevrolet",
		"image": null
	},
	{
		"id": 184,
		"brandName": "Chrysler",
		"image": null
	},
	{
		"id": 185,
		"brandName": "Citroen",
		"image": null
	},
	{
		"id": 186,
		"brandName": "Dacia",
		"image": null
	},
	{
		"id": 187,
		"brandName": "Dodge",
		"image": null
	},
	{
		"id": 188,
		"brandName": "Ferrari",
		"image": null
	},
	{
		"id": 189,
		"brandName": "Fiat",
		"image": null
	},
	{
		"id": 190,
		"brandName": "Ford",
		"image": null
	},
	{
		"id": 191,
		"brandName": "General Motors",
		"image": null
	},
	{
		"id": 192,
		"brandName": "Honda",
		"image": null
	},
	{
		"id": 193,
		"brandName": "Hummer",
		"image": null
	},
	{
		"id": 194,
		"brandName": "Hyundai",
		"image": null
	},
	{
		"id": 195,
		"brandName": "Infiniti QX",
		"image": null
	},
	{
		"id": 196,
		"brandName": "Infiniti FX",
		"image": null
	},
	{
		"id": 197,
		"brandName": "Infiniti",
		"image": null
	},
	{
		"id": 198,
		"brandName": "Isuzu",
		"image": null
	},
	{
		"id": 199,
		"brandName": "Jaguar",
		"image": null
	},
	{
		"id": 200,
		"brandName": "Jeep",
		"image": null
	},
	{
		"id": 201,
		"brandName": "KIA",
		"image": null
	},
	{
		"id": 202,
		"brandName": "Land Rover",
		"image": null
	},
	{
		"id": 203,
		"brandName": "Lexus",
		"image": null
	},
	{
		"id": 204,
		"brandName": "Mazda",
		"image": null
	},
	{
		"id": 205,
		"brandName": "Mercedes",
		"image": null
	},
	{
		"id": 206,
		"brandName": "Mitsubichi",
		"image": null
	},
	{
		"id": 207,
		"brandName": "Nissan",
		"image": null
	},
	{
		"id": 208,
		"brandName": "Opel",
		"image": null
	},
	{
		"id": 209,
		"brandName": "Peugeot",
		"image": null
	},
	{
		"id": 210,
		"brandName": "Renault",
		"image": null
	},
	{
		"id": 211,
		"brandName": "Suzuki",
		"image": null
	},
	{
		"id": 212,
		"brandName": "Volkswagen",
		"image": null
	},
	{
		"id": 213,
		"brandName": "Autre brand",
		"image": null
	},
	{
		"id": 214,
		"brandName": "Range Rover",
		"image": null
	},
	{
		"id": 215,
		"brandName": "Toyota Carina",
		"image": null
	},
	{
		"id": 216,
		"brandName": "Toyota",
		"image": null
	},
	{
		"id": 217,
		"brandName": "Toyota Carina",
		"image": null
	},
	{
		"id": 218,
		"brandName": "Toshiba",
		"image": null
	},
	{
		"id": 219,
		"brandName": "Seagate",
		"image": null
	},
	{
		"id": 220,
		"brandName": "Samsung",
		"image": null
	},
	{
		"id": 221,
		"brandName": "ADATA",
		"image": null
	},
	{
		"id": 222,
		"brandName": "Microsoft Surface",
		"image": null
	},
	{
		"id": 223,
		"brandName": "iPad Air",
		"image": null
	},
	{
		"id": 224,
		"brandName": "Toyota Rav4",
		"image": null
	},
	{
		"id": 225,
		"brandName": "BMW",
		"image": null
	},
	{
		"id": 226,
		"brandName": "Apache TVS",
		"image": null
	},
	{
		"id": 227,
		"brandName": "Toyota Land Cruiser",
		"image": null
	},
	{
		"id": 228,
		"brandName": "T-Shirt",
		"image": null
	},
	{
		"id": 229,
		"brandName": "IPhone",
		"image": null
	},
	{
		"id": 230,
		"brandName": "iPad",
		"image": null
	},
	{
		"id": 231,
		"brandName": "Robe",
		"image": null
	},
	{
		"id": 232,
		"brandName": "Veste",
		"image": null
	},
	{
		"id": 233,
		"brandName": "Itel",
		"image": null
	},
	{
		"id": 234,
		"brandName": "Tableau",
		"image": null
	},
	{
		"id": 235,
		"brandName": "Acessoires",
		"image": null
	},
	{
		"id": 236,
		"brandName": "Astuces cuisine",
		"image": null
	},
	{
		"id": 237,
		"brandName": "Consommable",
		"image": null
	},
	{
		"id": 241,
		"brandName": "Nike",
		"image": "fb925c7ad616d74d17efde12482b9c52.png"
	},
	{
		"id": 242,
		"brandName": "PS",
		"image": "60cc77f8677b7_playstation.png"
	}
]""";
