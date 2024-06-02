import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sportifyy/Exceptions/failures.dart';
import 'package:sportifyy/Models/Requests/create_game_event_req.dart';

import '../../Models/Entities/GameEvent.dart';
import '../../Repositories/game_repository.dart';
import '../game_service.dart';

@LazySingleton(as: GameService)
class GameServiceImpl extends GameService {
  final GameRepository gameRepository;

  GameServiceImpl(this.gameRepository);

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> registerGameEvent(
      CreateGameEventReq req) async {
    return await gameRepository.registerGameEvent(req);
  }

  @override
  Future<Either<Failure, List<GameEvent>>> getAllGameEvents() async {
    return await gameRepository.getAllGameEvents();
  }
}
