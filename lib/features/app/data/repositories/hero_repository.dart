import 'package:api_rest/features/app/domain/entities/hero_entity.dart';
import 'package:api_rest/features/app/domain/response/response_generic.dart';
import 'package:either_dart/either.dart';

abstract class HeroRepository {
  Future<Either<ResponseResult, ResponseGeneric<List<HeroEntity>>>>
      findAllHero();
}
