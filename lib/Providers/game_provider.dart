import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GameProvider with ChangeNotifier {
  String _address = 'Tap to set location';
  String _apt = '';
  String _streetAddress = '';
  String _city = '';
  String? _state;
  String? _country;
  String _zipcode = '';
  List<String> _countries = ['Canada', 'US'];
  List<String> _canStates = [
    "Alberta",
    "British Columbia",
    "Manitoba",
    "New Brunswick",
    "Newfoundland and Labrador",
    "Nova Scotia",
    "Ontario",
    "Prince Edward Island",
    "Quebec",
    "Saskatchewan",
    "Northwest Territories",
    "Nunavut",
    "Yukon"
  ];

  List<String> _usStates = [
    "Alabama",
    "Alaska",
    "Arizona",
    "Arkansas",
    "California",
    "Colorado",
    "Connecticut",
    "Delaware",
    "Florida",
    "Georgia",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Michigan",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "New York",
    "North Carolina",
    "North Dakota",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming"
  ];

  String get address => _address;
  String get apt => _apt;
  String get streetAddress => _streetAddress;
  String get city => _city;
  String? get state => _state;
  String? get country => _country;
  String get zipcode => _zipcode;
  List<String> get countries => _countries;
  List<String> get usStates => _usStates;
  List<String> get canStates => _canStates;

  void setAddress() {
    print(
        'Building with address: $_apt $_streetAddress, $_city, $_state, $_country, $_zipcode');
    _address = '$_apt $_streetAddress, $_city, $_state, $_country, $_zipcode';
    notifyListeners();
  }

  void setApt(value) {
    _apt = value.toString();
    notifyListeners();
  }

  void setStreetAddress(value) {
    _streetAddress = value;
    notifyListeners();
  }

  void setCity(value) {
    _city = value;
    notifyListeners();
  }

  void setCountry(value) {
    _country = value;
    notifyListeners();
  }

  void setZipcode(value) {
    _zipcode = value;
    notifyListeners();
  }

  void setProv(value) {
    _state = value;
    notifyListeners();
  }
}
