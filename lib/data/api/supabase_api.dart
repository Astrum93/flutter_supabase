import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'supabase_api.g.dart';

@RestApi(baseUrl: 'https://kvqmqxyhahsutgygisdc.supabase.co')
abstract class SupabaseApi {
  factory SupabaseApi(Dio dio, {String? baseUrl}) {
    return _SupabaseApi(dio);
  }

  @GET('/snippets')
  Future getUser();
}
