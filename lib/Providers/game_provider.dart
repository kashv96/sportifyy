import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:sportifyy/Exceptions/failures.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sportifyy/Models/Requests/create_game_event_req.dart';
import '../Models/Entities/GameEvent.dart';
import '../Services/game_service.dart';

@lazySingleton
class GameProvider with ChangeNotifier {
  final GameService _gameService;
  String _address = 'Tap to set location';
  String _apt = '';
  String _streetAddress = '';
  String _city = '';
  String? _state;
  String? _country;
  String _zipcode = '';
  String _gameDateTime = 'Tap to add game date and time';
  String? _selectedGame;
  String? _selectedGameSpots;
  String _gameDuration = 'Tap to set event duration';
  String _entryPricePerSpot = '0';
  String _gameTitle = '';

  final List<String> _countries = ['Canada', 'US'];
  final List<String> _canStates = [
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

  final List<String> _usStates = [
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

  final List<String> _days =
      List.generate(31, (index) => (index + 1).toString());
  final List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  final List<String> _years =
      List.generate(3, (index) => (2024 + index).toString());
  final List<String> _hours =
      List.generate(12, (index) => (1 + index).toString().padLeft(2, '0'));
  final List<String> _minutes =
      List.generate(60, (index) => index.toString().padLeft(2, '0'));
  final List<String> _ampm = ['AM', 'PM'];
  final List<String> _outdoorGames = [
    'Soccer',
    'Basketball',
    'Volleyball',
    'Baseball',
    'Cricket',
    'Ultimate Frisbee',
    'Flag Football',
    'Tennis',
    'Golf',
    'Running/Cross Country',
    'Cycling',
    'Obstacle Course Racing',
    'Rugby',
    'Field Hockey',
    'Lacrosse',
    'Softball',
    'Archery',
    'Kayaking/Canoeing',
    'Hiking',
    'Rock Climbing'
  ];
  final List<String> _maxSpots =
      List.generate(100, (index) => index.toString().padLeft(1, '0'));
  List<GameEvent> _allGameEvents = [];

  GameProvider(this._gameService);

  String get address => _address;
  String get apt => _apt;
  String get streetAddress => _streetAddress;
  String get city => _city;
  String? get state => _state;
  String? get country => _country;
  String get zipcode => _zipcode;
  String get gameDateTime => _gameDateTime;
  String? get selectedGame => _selectedGame;
  String? get selectedGameSpots => _selectedGameSpots;
  String? get gameDuration => _gameDuration;
  String get entryPricePerSpot => _entryPricePerSpot;
  String get gameTitle => _gameTitle;

  List<String> get countries => _countries;
  List<String> get usStates => _usStates;
  List<String> get canStates => _canStates;
  List<String> get days => _days;
  List<String> get months => _months;
  List<String> get years => _years;
  List<String> get hours => _hours;
  List<String> get minutes => _minutes;
  List<String> get ampm => _ampm;
  List<String> get outdoorGames => _outdoorGames;
  List<String> get maxSpots => _maxSpots;
  List<GameEvent> get allGameEvents => _allGameEvents;

  void setAddress() {
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

  void setGameDateTime(String dateTime) {
    _gameDateTime = dateTime;
    notifyListeners();
  }

  void setSelectedGame(String? game) {
    _selectedGame = game;
    notifyListeners();
  }

  void setMaxSpots(String? spots) {
    _selectedGameSpots = spots;
    notifyListeners();
  }

  void setGameDuration(String duration) {
    _gameDuration = duration;
    notifyListeners();
  }

  void setEntryPricePerSpot(String price) {
    _entryPricePerSpot = price;
    notifyListeners();
  }

  void setGameTitle(String title) {
    _gameTitle = title;
    notifyListeners();
  }

  void resetGameEventPage() {
    _address = 'Tap to set location';
    _apt = '';
    _streetAddress = '';
    _city = '';
    _state = null;
    _country = null;
    _zipcode = '';
    _gameDateTime = 'Tap to add game date and time';
    _selectedGame = null;
    _selectedGameSpots = null;
    _gameDuration = 'Tap to set event duration';
    _entryPricePerSpot = '0';
    notifyListeners();
  }

  String generateGameUniqueIdentifier() {
    const characters = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final random = Random();
    // ignore: prefer_interpolation_to_compose_strings
    return 'GM-' +
        List.generate(3, (_) => characters[random.nextInt(characters.length)])
            .join() +
        '-' +
        List.generate(3, (_) => characters[random.nextInt(characters.length)])
            .join();
  }

  Future<bool> registerGameEvent() async {
    bool res = false;
    String uniqueId = generateGameUniqueIdentifier();
    CreateGameEventReq req = CreateGameEventReq(
        createdBy: '5f4cf4f5-0bf1-48f8-94c7-c0496c06ae64',
        uniqueIdentifier: uniqueId,
        gameAddress: _address,
        gameDateTime: _gameDateTime,
        gameDuration: _gameDuration,
        gameType: _selectedGame,
        maxSpots: _selectedGameSpots,
        availableSpots: _selectedGameSpots,
        entryPricePerSpot: _entryPricePerSpot);

    Either<Failure, List<Map<String, dynamic>>> response =
        await _gameService.registerGameEvent(req);
    response.fold((l) => res = false, (r) {
      res = true;
      resetGameEventPage();
    });
    return res;
  }

  Future<void> getAllGameEvents() async {
    var response = await _gameService.getAllGameEvents();
    response.fold((l) => null, (r) {
      _allGameEvents = r;
      notifyListeners();
    });
  }
}
