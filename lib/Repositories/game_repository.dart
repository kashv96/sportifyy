import 'package:dartz/dartz.dart';
import 'package:sportifyy/Exceptions/failures.dart';
import 'package:sportifyy/Models/Requests/create_game_event_req.dart';

import '../Models/Entities/GameEvent.dart';

abstract class GameRepository {
  Future<Either<Failure, List<Map<String, dynamic>>>> registerGameEvent(
      CreateGameEventReq req);

  Future<Either<Failure, List<GameEvent>>> getAllGameEvents();
}
