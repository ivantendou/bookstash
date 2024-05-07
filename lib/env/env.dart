import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GEMINI_AI_API_KEY')
  static const String apiKey = _Env.apiKey;
}