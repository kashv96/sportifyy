import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sportifyy/Exceptions/failures.dart';
import 'package:sportifyy/Models/Requests/create_game_event_req.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../game_repository.dart';

@LazySingleton(as: GameRepository)
class GameRepositoryImpl implements GameRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> registerGameEvent(
      CreateGameEventReq req) async {
    try {
      final eventData = req.toJson();
      List<Map<String, dynamic>> data =
          await supabase.from('game_events').upsert(eventData).select();
      print(data);
      return Right(data);
    } on PostgrestException catch (error) {
      print(error);
      if (error.message.contains('duplicate key value violates')) {
        if (error.message.contains('unique_identifier')) {
          return Left(Failure('Unique Identifier already in use'));
        }
      }
      return Left(Failure('Failed to create game event: ${error.message}'));
    } catch (e) {
      return Left(Failure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}
