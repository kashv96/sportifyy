import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sportifyy/injection.config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  $initGetIt(getIt);
  getIt.registerLazySingleton<SupabaseClient>(() => SupabaseClient(
      'https://dluqsheaszradbvoinev.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRsdXFzaGVhc3pyYWRidm9pbmV2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDMzODcxNTgsImV4cCI6MjAxODk2MzE1OH0.ApCNj6wbwc0WqlSa0cEe8hCHdjn_rm8NwyJV_GIcVQI'));
}
