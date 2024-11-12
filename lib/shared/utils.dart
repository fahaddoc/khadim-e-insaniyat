import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';
import 'package:intl/intl.dart';


double screenWidth(BuildContext context, {double multiplier = 1}) => MediaQuery.of(context).size.width * multiplier;

double screenHeight(BuildContext context, {double multiplier = 1}) => MediaQuery.of(context).size.height * multiplier;

double statusBarHeight(BuildContext context) => MediaQuery.of(context).padding.top;

double screenBottomPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;

bool isKeyboardOpen(BuildContext context) => MediaQuery.of(context).viewInsets.bottom > 10;

String durationToMMSS(Duration duration) {
  return '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
}

DateTime? dateFromJson(String? date) {
  // TODO: 'Present' to be removed after fixes from backend
  if (date == null || date.isEmpty || date == '1970-01-01' || date == 'Present') {
    return null;
  }

  RegExp isonRegex = RegExp(r'((\d{4})-([01]\d)-([0-3]\d)[T\s]?(?:([0-2]\d):([0-5]\d):([0-5]\d)(?:\.(\d{3}))?(Z)?)?)');
  var matches = isonRegex.firstMatch(date);

  if (matches == null) return DateTime.tryParse(date);

  String year = matches[2] ?? '0000';
  String month = matches[3] ?? '00';
  String day = matches[4] ?? '00';
  String hour = matches[5] ?? '00';
  String minute = matches[6] ?? '00';
  String second = matches[7] ?? '00';
  String milliSeconds = matches[8] ?? "000";

  return DateTime.tryParse('$year-$month-${day}T$hour:$minute:$second.${milliSeconds}Z');
}

String dateToJson(DateTime? date) {
  if (date == null) {
    return '1970-01-01';
  }
  return DateFormat('yyyy-MM-dd').format(date);
}

String phoneNumberFromJson(String? phone) {
  final extractedNumbers = RegExp(r'\d+').allMatches(phone ?? '').map((e) => e[0]);
  final number = extractedNumbers.join('');
  if (number.isEmpty) return '';
  return '+$number';
}

var webUserAgent = window.navigator.userAgent.toLowerCase();
var isSafari = webUserAgent.contains('safari') && !webUserAgent.contains('chrome');

List<String> get alphabets => 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').toList();

List<String> get months =>
    ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

List<String> get countries => [
      "Afghanistan",
      "Albania",
      "Algeria",
      "Andorra",
      "Angola",
      "Antigua and Barbuda",
      "Argentina",
      "Armenia",
      "Australia",
      "Austria",
      "Azerbaijan",
      "Bahamas",
      "Bahrain",
      "Bangladesh",
      "Barbados",
      "Belarus",
      "Belgium",
      "Belize",
      "Benin",
      "Bhutan",
      "Bolivia",
      "Bosnia and Herzegovina",
      "Botswana",
      "Brazil",
      "Brunei",
      "Bulgaria",
      "Burkina Faso",
      "Burundi",
      "Cabo Verde",
      "Cambodia",
      "Cameroon",
      "Canada",
      "Central African Republic",
      "Chad",
      "Chile",
      "China",
      "Colombia",
      "Comoros",
      "Congo",
      "Costa Rica",
      "Croatia",
      "Cuba",
      "Cyprus",
      "Czech Republic",
      "Democratic Republic of the Congo",
      "Denmark",
      "Djibouti",
      "Dominica",
      "Dominican Republic",
      "Ecuador",
      "Egypt",
      "El Salvador",
      "Equatorial Guinea",
      "Eritrea",
      "Estonia",
      "Eswatini",
      "Ethiopia",
      "Fiji",
      "Finland",
      "France",
      "Gabon",
      "Gambia",
      "Georgia",
      "Germany",
      "Ghana",
      "Greece",
      "Grenada",
      "Guatemala",
      "Guinea",
      "Guinea-Bissau",
      "Guyana",
      "Haiti",
      "Honduras",
      "Hungary",
      "Iceland",
      "India",
      "Indonesia",
      "Iran",
      "Iraq",
      "Ireland",
      "Israel",
      "Italy",
      "Jamaica",
      "Japan",
      "Jordan",
      "Kazakhstan",
      "Kenya",
      "Kiribati",
      "Kuwait",
      "Kyrgyzstan",
      "Laos",
      "Latvia",
      "Lebanon",
      "Lesotho",
      "Liberia",
      "Libya",
      "Liechtenstein",
      "Lithuania",
      "Luxembourg",
      "Madagascar",
      "Malawi",
      "Malaysia",
      "Maldives",
      "Mali",
      "Malta",
      "Marshall Islands",
      "Mauritania",
      "Mauritius",
      "Mexico",
      "Micronesia",
      "Moldova",
      "Monaco",
      "Mongolia",
      "Montenegro",
      "Morocco",
      "Mozambique",
      "Myanmar",
      "Namibia",
      "Nauru",
      "Nepal",
      "Netherlands",
      "New Zealand",
      "Nicaragua",
      "Niger",
      "Nigeria",
      "North Korea",
      "North Macedonia",
      "Norway",
      "Oman",
      "Pakistan",
      "Palau",
      "Palestine",
      "Panama",
      "Papua New Guinea",
      "Paraguay",
      "Peru",
      "Philippines",
      "Poland",
      "Portugal",
      "Qatar",
      "Romania",
      "Russia",
      "Rwanda",
      "Saint Kitts and Nevis",
      "Saint Lucia",
      "Saint Vincent and the Grenadines",
      "Samoa",
      "San Marino",
      "Sao Tome and Principe",
      "Saudi Arabia",
      "Senegal",
      "Serbia",
      "Seychelles",
      "Sierra Leone",
      "Singapore",
      "Slovakia",
      "Slovenia",
      "Solomon Islands",
      "Somalia",
      "South Africa",
      "South Korea",
      "South Sudan",
      "Spain",
      "Sri Lanka",
      "Sudan",
      "Suriname",
      "Sweden",
      "Switzerland",
      "Syria",
      "Tajikistan",
      "Tanzania",
      "Thailand",
      "Timor-Leste",
      "Togo",
      "Tonga",
      "Trinidad and Tobago",
      "Tunisia",
      "Turkey",
      "Turkmenistan",
      "Tuvalu",
      "Uganda",
      "Ukraine",
      "United Arab Emirates",
      "United Kingdom",
      "United States",
      "Uruguay",
      "Uzbekistan",
      "Vanuatu",
      "Vatican City",
      "Venezuela",
      "Vietnam",
      "Yemen",
      "Zambia",
      "Zimbabwe"
    ];
