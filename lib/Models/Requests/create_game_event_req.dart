class CreateGameEventReq {
  final String? createdBy;
  final String? uniqueIdentifier;
  final String? gameAddress;
  final String? gameCoordinates;
  final String? gameDateTime;
  final String? gameDuration;
  final String? gameType;
  final String? maxSpots;
  final String? availableSpots;
  final String? entryPricePerSpot;

  CreateGameEventReq({
    this.createdBy,
    this.uniqueIdentifier,
    this.gameAddress,
    this.gameCoordinates,
    this.gameDateTime,
    this.gameDuration,
    this.gameType,
    this.maxSpots,
    this.availableSpots,
    this.entryPricePerSpot,
  });

  factory CreateGameEventReq.fromJson(Map<String, dynamic> json) {
    return CreateGameEventReq(
      createdBy: json['created_user_id'],
      uniqueIdentifier: json['unique_identifier'],
      gameAddress: json['game_address'],
      gameCoordinates: json['game_coordinates'],
      gameDateTime: json['game_date_time'],
      gameDuration: json['game_duration'],
      gameType: json['game_type'],
      maxSpots: json['max_spots'],
      availableSpots: json['available_spots'],
      entryPricePerSpot: json['entry_price_per_spot'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created_user_id': createdBy,
      'unique_identifier': uniqueIdentifier,
      'game_address': gameAddress,
      'game_coordinates': gameCoordinates,
      'game_date_time': gameDateTime,
      'game_duration': gameDuration,
      'game_type': gameType,
      'max_spots': maxSpots,
      'available_spots': availableSpots,
      'entry_price_per_spot': entryPricePerSpot,
    };
  }
}
