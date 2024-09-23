import 'package:api_rest/features/app/data/repositories/hero_repository.dart';
import 'package:api_rest/features/app/domain/entities/hero_entity.dart';
import 'package:api_rest/features/app/domain/response/response_generic.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider(this._heroRepository);
  ResponseResult responseResult = ResponseResult(
    message: "",
    responseStatus: ResponseStatus.init,
  );
  List<HeroEntity> heroList = [];
  final HeroRepository _heroRepository;

  Future<void> findAllHero() async {
    responseResult = ResponseResult(
      message: "loading",
      responseStatus: ResponseStatus.loading,
    );

    await Future.delayed(const Duration(seconds: 10));
    notifyListeners();
    final response = await _heroRepository.findAllHero();

    response.either(
      (error) {
        responseResult = error;
        heroList = [];
        notifyListeners();
      },
      (success) {
        responseResult = success.responseResult;
        heroList = success.data!;
        notifyListeners();
      },
    );
  }
}
