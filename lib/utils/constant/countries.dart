class CountriesJson {
  static const countries = """[
    {"id": 3, "name": "Afghanistan", "code": "AF"},
    {"id": 15, "name": "Åland Islands", "code": "AX"},
    {"id": 6, "name": "Albania", "code": "AL"},
    {"id": 62, "name": "Algeria", "code": "DZ"},
    {"id": 11, "name": "American Samoa", "code": "AS"},
    {"id": 1, "name": "Andorra", "code": "AD"},
    {"id": 8, "name": "Angola", "code": "AO"},
    {"id": 5, "name": "Anguilla", "code": "AI"},
    {"id": 9, "name": "Antarctica", "code": "AQ"},
    {"id": 4, "name": "Antigua and Barbuda", "code": "AG"},
    {"id": 10, "name": "Argentina", "code": "AR"},
    {"id": 7, "name": "Armenia", "code": "AM"},
    {"id": 14, "name": "Aruba", "code": "AW"},
    {"id": 13, "name": "Australia", "code": "AU"},
    {"id": 12, "name": "Austria", "code": "AT"},
    {"id": 16, "name": "Azerbaijan", "code": "AZ"},
    {"id": 32, "name": "Bahamas", "code": "BS"},
    {"id": 23, "name": "Bahrain", "code": "BH"},
    {"id": 19, "name": "Bangladesh", "code": "BD"},
    {"id": 18, "name": "Barbados", "code": "BB"},
    {"id": 36, "name": "Belarus", "code": "BY"},
    {"id": 20, "name": "Belgium", "code": "BE"},
    {"id": 37, "name": "Belize", "code": "BZ"},
    {"id": 25, "name": "Benin", "code": "BJ"},
    {"id": 27, "name": "Bermuda", "code": "BM"},
    {"id": 33, "name": "Bhutan", "code": "BT"},
    {"id": 29, "name": "Bolivia", "code": "BO"},
    {"id": 30, "name": "Bonaire, Sint Eustatius and Saba", "code": "BQ"},
    {"id": 17, "name": "Bosnia and Herzegovina", "code": "BA"},
    {"id": 35, "name": "Botswana", "code": "BW"},
    {"id": 34, "name": "Bouvet Island", "code": "BV"},
    {"id": 31, "name": "Brazil", "code": "BR"},
    {"id": 106, "name": "British Indian Ocean Territory", "code": "IO"},
    {"id": 239, "name": "British Virgin Islands", "code": "VG"},
    {"id": 28, "name": "Brunei Darussalam", "code": "BN"},
    {"id": 22, "name": "Bulgaria", "code": "BG"},
    {"id": 21, "name": "Burkina Faso", "code": "BF"},
    {"id": 24, "name": "Burundi", "code": "BI"},
    {"id": 117, "name": "Cambodia", "code": "KH"},
    {"id": 47, "name": "Cameroun", "code": "CM"},
    {"id": 38, "name": "Canada", "code": "CA"},
    {"id": 52, "name": "Cape Verde", "code": "CV"},
    {"id": 124, "name": "Cayman Islands", "code": "KY"},
    {"id": 41, "name": "Central African Republic", "code": "CF"},
    {"id": 215, "name": "Tchad", "code": "TD"},
    {"id": 46, "name": "Chile", "code": "CL"},
    {"id": 48, "name": "China", "code": "CN"},
    {"id": 54, "name": "Christmas Island", "code": "CX"},
    {"id": 39, "name": "Cocos [Keeling] Islands", "code": "CC"},
    {"id": 49, "name": "Colombia", "code": "CO"},
    {"id": 119, "name": "Comoros", "code": "KM"},
    {"id": 45, "name": "Cook Islands", "code": "CK"},
    {"id": 50, "name": "Costa Rica", "code": "CR"},
    {"id": 98, "name": "Croatia", "code": "HR"},
    {"id": 51, "name": "Cuba", "code": "CU"},
    {"id": 53, "name": "Curaçao", "code": "CW"},
    {"id": 55, "name": "Cyprus", "code": "CY"},
    {"id": 56, "name": "Czech Republic", "code": "CZ"},
    {"id": 40, "name": "Democratic Republic of the Congo", "code": "CD"},
    {"id": 59, "name": "Denmark", "code": "DK"},
    {"id": 58, "name": "Djibouti", "code": "DJ"},
    {"id": 60, "name": "Dominica", "code": "DM"},
    {"id": 61, "name": "Dominican Republic", "code": "DO"},
    {"id": 221, "name": "East Timor", "code": "TL"},
    {"id": 63, "name": "Ecuador", "code": "EC"},
    {"id": 65, "name": "Egypt", "code": "EG"},
    {"id": 210, "name": "El Salvador", "code": "SV"},
    {"id": 88, "name": "Equatorial Guinea", "code": "GQ"},
    {"id": 67, "name": "Eritrea", "code": "ER"},
    {"id": 64, "name": "Estonia", "code": "EE"},
    {"id": 69, "name": "Ethiopia", "code": "ET"},
    {"id": 72, "name": "Falkland Islands", "code": "FK"},
    {"id": 74, "name": "Faroe Islands", "code": "FO"},
    {"id": 71, "name": "Fiji", "code": "FJ"},
    {"id": 70, "name": "Finland", "code": "FI"},
    {"id": 75, "name": "France", "code": "FR"},
    {"id": 80, "name": "French Guiana", "code": "GF"},
    {"id": 175, "name": "French Polynesia", "code": "PF"},
    {"id": 216, "name": "French Southern Territories", "code": "TF"},
    {"id": 76, "name": "Gabon", "code": "GA"},
    {"id": 85, "name": "Gambia", "code": "GM"},
    {"id": 79, "name": "Georgia", "code": "GE"},
    {"id": 57, "name": "Germany", "code": "DE"},
    {"id": 82, "name": "Ghana", "code": "GH"},
    {"id": 83, "name": "Gibraltar", "code": "GI"},
    {"id": 89, "name": "Greece", "code": "GR"},
    {"id": 84, "name": "Greenland", "code": "GL"},
    {"id": 78, "name": "Grenada", "code": "GD"},
    {"id": 87, "name": "Guadeloupe", "code": "GP"},
    {"id": 92, "name": "Guam", "code": "GU"},
    {"id": 91, "name": "Guatemala", "code": "GT"},
    {"id": 81, "name": "Guernsey", "code": "GG"},
    {"id": 86, "name": "Guinea", "code": "GN"},
    {"id": 93, "name": "Guinea-Bissau", "code": "GW"},
    {"id": 94, "name": "Guyana", "code": "GY"},
    {"id": 99, "name": "Haiti", "code": "HT"},
    {"id": 96, "name": "Heard Island and McDonald Islands", "code": "HM"},
    {"id": 97, "name": "Honduras", "code": "HN"},
    {"id": 95, "name": "Hong Kong", "code": "HK"},
    {"id": 100, "name": "Hungary", "code": "HU"},
    {"id": 109, "name": "Iceland", "code": "IS"},
    {"id": 105, "name": "India", "code": "IN"},
    {"id": 101, "name": "Indonesia", "code": "ID"},
    {"id": 108, "name": "Iran", "code": "IR"},
    {"id": 107, "name": "Iraq", "code": "IQ"},
    {"id": 102, "name": "Ireland", "code": "IE"},
    {"id": 104, "name": "Isle of Man", "code": "IM"},
    {"id": 103, "name": "Israel", "code": "IL"},
    {"id": 110, "name": "Italy", "code": "IT"},
    {"id": 44, "name": "Ivory Coast", "code": "CI"},
    {"id": 112, "name": "Jamaica", "code": "JM"},
    {"id": 114, "name": "Japan", "code": "JP"},
    {"id": 111, "name": "Jersey", "code": "JE"},
    {"id": 113, "name": "Jordan", "code": "JO"},
    {"id": 125, "name": "Kazakhstan", "code": "KZ"},
    {"id": 115, "name": "Kenya", "code": "KE"},
    {"id": 118, "name": "Kiribati", "code": "KI"},
    {"id": 245, "name": "Kosovo", "code": "XK"},
    {"id": 123, "name": "Kuwait", "code": "KW"},
    {"id": 116, "name": "Kyrgyzstan", "code": "KG"},
    {"id": 126, "name": "Laos", "code": "LA"},
    {"id": 135, "name": "Latvia", "code": "LV"},
    {"id": 127, "name": "Lebanon", "code": "LB"},
    {"id": 132, "name": "Lesotho", "code": "LS"},
    {"id": 131, "name": "Liberia", "code": "LR"},
    {"id": 136, "name": "Libya", "code": "LY"},
    {"id": 129, "name": "Liechtenstein", "code": "LI"},
    {"id": 133, "name": "Lithuania", "code": "LT"},
    {"id": 134, "name": "Luxembourg", "code": "LU"},
    {"id": 148, "name": "Macao", "code": "MO"},
    {"id": 142, "name": "Madagascar", "code": "MG"},
    {"id": 156, "name": "Malawi", "code": "MW"},
    {"id": 158, "name": "Malaysia", "code": "MY"},
    {"id": 155, "name": "Maldives", "code": "MV"},
    {"id": 145, "name": "Mali", "code": "ML"},
    {"id": 153, "name": "Malta", "code": "MT"},
    {"id": 143, "name": "Marshall Islands", "code": "MH"},
    {"id": 150, "name": "Martinique", "code": "MQ"},
    {"id": 151, "name": "Mauritania", "code": "MR"},
    {"id": 154, "name": "Mauritius", "code": "MU"},
    {"id": 247, "name": "Mayotte", "code": "YT"},
    {"id": 157, "name": "Mexico", "code": "MX"},
    {"id": 73, "name": "Micronesia", "code": "FM"},
    {"id": 139, "name": "Moldova", "code": "MD"},
    {"id": 138, "name": "Monaco", "code": "MC"},
    {"id": 147, "name": "Mongolia", "code": "MN"},
    {"id": 140, "name": "Montenegro", "code": "ME"},
    {"id": 152, "name": "Montserrat", "code": "MS"},
    {"id": 137, "name": "Morocco", "code": "MA"},
    {"id": 159, "name": "Mozambique", "code": "MZ"},
    {"id": 146, "name": "Myanmar [Burma]", "code": "MM"},
    {"id": 160, "name": "Namibia", "code": "NA"},
    {"id": 169, "name": "Nauru", "code": "NR"},
    {"id": 168, "name": "Nepal", "code": "NP"},
    {"id": 166, "name": "Netherlands", "code": "NL"},
    {"id": 161, "name": "New Caledonia", "code": "NC"},
    {"id": 171, "name": "New Zealand", "code": "NZ"},
    {"id": 165, "name": "Nicaragua", "code": "NI"},
    {"id": 162, "name": "Niger", "code": "NE"},
    {"id": 164, "name": "Nigeria", "code": "NG"},
    {"id": 170, "name": "Niue", "code": "NU"},
    {"id": 163, "name": "Norfolk Island", "code": "NF"},
    {"id": 121, "name": "North Korea", "code": "KP"},
    {"id": 144, "name": "North Macedonia", "code": "MK"},
    {"id": 149, "name": "Northern Mariana Islands", "code": "MP"},
    {"id": 167, "name": "Norway", "code": "NO"},
    {"id": 172, "name": "Oman", "code": "OM"},
    {"id": 178, "name": "Pakistan", "code": "PK"},
    {"id": 185, "name": "Palau", "code": "PW"},
    {"id": 183, "name": "Palestine", "code": "PS"},
    {"id": 173, "name": "Panama", "code": "PA"},
    {"id": 176, "name": "Papua New Guinea", "code": "PG"},
    {"id": 186, "name": "Paraguay", "code": "PY"},
    {"id": 174, "name": "Peru", "code": "PE"},
    {"id": 177, "name": "Philippines", "code": "PH"},
    {"id": 181, "name": "Pitcairn Islands", "code": "PN"},
    {"id": 179, "name": "Poland", "code": "PL"},
    {"id": 184, "name": "Portugal", "code": "PT"},
    {"id": 182, "name": "Puerto Rico", "code": "PR"},
    {"id": 187, "name": "Qatar", "code": "QA"},
    {"id": 42, "name": "Republic of the Congo", "code": "CG"},
    {"id": 188, "name": "Réunion", "code": "RE"},
    {"id": 189, "name": "Romania", "code": "RO"},
    {"id": 191, "name": "Russia", "code": "RU"},
    {"id": 192, "name": "Rwanda", "code": "RW"},
    {"id": 26, "name": "Saint Barthélemy", "code": "BL"},
    {"id": 199, "name": "Saint Helena", "code": "SH"},
    {"id": 120, "name": "Saint Kitts and Nevis", "code": "KN"},
    {"id": 128, "name": "Saint Lucia", "code": "LC"},
    {"id": 141, "name": "Saint Martin", "code": "MF"},
    {"id": 180, "name": "Saint Pierre and Miquelon", "code": "PM"},
    {"id": 237, "name": "Saint Vincent and the Grenadines", "code": "VC"},
    {"id": 244, "name": "Samoa", "code": "WS"},
    {"id": 204, "name": "San Marino", "code": "SM"},
    {"id": 209, "name": "São Tomé and Príncipe", "code": "ST"},
    {"id": 193, "name": "Saudi Arabia", "code": "SA"},
    {"id": 205, "name": "Senegal", "code": "SN"},
    {"id": 190, "name": "Serbia", "code": "RS"},
    {"id": 195, "name": "Seychelles", "code": "SC"},
    {"id": 203, "name": "Sierra Leone", "code": "SL"},
    {"id": 198, "name": "Singapore", "code": "SG"},
    {"id": 211, "name": "Sint Maarten", "code": "SX"},
    {"id": 202, "name": "Slovakia", "code": "SK"},
    {"id": 200, "name": "Slovenia", "code": "SI"},
    {"id": 194, "name": "Solomon Islands", "code": "SB"},
    {"id": 206, "name": "Somalia", "code": "SO"},
    {"id": 248, "name": "South Africa", "code": "ZA"},
    {
      "id": 90,
      "name": "South Georgia and the South Sandwich Islands",
      "code": "GS"
    },
    {"id": 122, "name": "South Korea", "code": "KR"},
    {"id": 208, "name": "South Sudan", "code": "SS"},
    {"id": 68, "name": "Spain", "code": "ES"},
    {"id": 130, "name": "Sri Lanka", "code": "LK"},
    {"id": 196, "name": "Sudan", "code": "SD"},
    {"id": 207, "name": "Suriname", "code": "SR"},
    {"id": 201, "name": "Svalbard and Jan Mayen", "code": "SJ"},
    {"id": 213, "name": "Swaziland", "code": "SZ"},
    {"id": 197, "name": "Sweden", "code": "SE"},
    {"id": 43, "name": "Switzerland", "code": "CH"},
    {"id": 212, "name": "Syria", "code": "SY"},
    {"id": 228, "name": "Taiwan", "code": "TW"},
    {"id": 219, "name": "Tajikistan", "code": "TJ"},
    {"id": 229, "name": "Tanzania", "code": "TZ"},
    {"id": 218, "name": "Thailand", "code": "TH"},
    {"id": 217, "name": "Togo", "code": "TG"},
    {"id": 220, "name": "Tokelau", "code": "TK"},
    {"id": 224, "name": "Tonga", "code": "TO"},
    {"id": 226, "name": "Trinidad and Tobago", "code": "TT"},
    {"id": 223, "name": "Tunisia", "code": "TN"},
    {"id": 225, "name": "Turkey", "code": "TR"},
    {"id": 222, "name": "Turkmenistan", "code": "TM"},
    {"id": 214, "name": "Turks and Caicos Islands", "code": "TC"},
    {"id": 227, "name": "Tuvalu", "code": "TV"},
    {"id": 232, "name": "U.S. Minor Outlying Islands", "code": "UM"},
    {"id": 240, "name": "U.S. Virgin Islands", "code": "VI"},
    {"id": 231, "name": "Uganda", "code": "UG"},
    {"id": 230, "name": "Ukraine", "code": "UA"},
    {"id": 2, "name": "United Arab Emirates", "code": "AE"},
    {
      "id": 77,
      "name": "United Kingdom of Great Britain and Northern Ireland",
      "code": "GB"
    },
    {"id": 233, "name": "United States", "code": "US"},
    {"id": 234, "name": "Uruguay", "code": "UY"},
    {"id": 235, "name": "Uzbekistan", "code": "UZ"},
    {"id": 242, "name": "Vanuatu", "code": "VU"},
    {"id": 236, "name": "Vatican City", "code": "VA"},
    {"id": 238, "name": "Venezuela", "code": "VE"},
    {"id": 241, "name": "Vietnam", "code": "VN"},
    {"id": 243, "name": "Wallis and Futuna", "code": "WF"},
    {"id": 66, "name": "Western Sahara", "code": "EH"},
    {"id": 246, "name": "Yemen", "code": "YE"},
    {"id": 249, "name": "Zambia", "code": "ZM"},
    {"id": 250, "name": "Zimbabwe", "code": "ZW"}
  ]""";
}
