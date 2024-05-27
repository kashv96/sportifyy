import 'package:dartz/dartz.dart';
import 'package:sportifyy/Exceptions/failures.dart';
import 'package:sportifyy/Models/Requests/create_game_event_req.dart';

abstract class GameRepository {
  Future<Either<Failure, List<Map<String, dynamic>>>> registerGameEvent(
      CreateGameEventReq req);
}
