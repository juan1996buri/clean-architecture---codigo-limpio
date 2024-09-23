import 'package:api_rest/features/app/data/repositories/hero_repository.dart';
import 'package:api_rest/features/app/domain/entities/hero_entity.dart';
import 'package:api_rest/features/app/domain/response/response_generic.dart';
import 'package:either_dart/src/either.dart';
import 'package:http/http.dart' as http;

class HeroRepositoryImpl implements HeroRepository {
  @override
  Future<Either<ResponseResult, ResponseGeneric<List<HeroEntity>>>>
      findAllHero() async {
    try {
      final response = await http.get(Uri.parse(
          "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json"));

      if (response.statusCode >= 200 && response.statusCode <= 210) {
        return Right(
          ResponseGeneric(
            responseResult: ResponseResult(
              message: "obtenido todos los heroes",
              responseStatus: ResponseStatus.success,
            ),
            data: heroEntityFromJson(response.body),
          ),
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      return Left(
        ResponseResult(
          message: e.toString(),
          responseStatus: ResponseStatus.error,
        ),
      );
    }
  }
}
