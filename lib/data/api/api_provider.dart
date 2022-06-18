
import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutemovie/data/model/detail_model.dart';
import 'package:flutter/foundation.dart';

import '../../util/config.dart';
import '../../util/navigator.dart';
import '../model/image_model.dart';
import '../model/movie_model.dart';
import '../model/tv_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final Alice _alice = Alice(showNotification: true, navigatorKey: navigatorKey);

  ApiProvider(){
    _dio.interceptors.add(_alice.getDioInterceptor());
  }

  Future<MovieModel> fetchMovieList() async {
    try {
      Response response = await _dio.get('${Config.baseUrl}movie/popular?api_key=${Config.apiKey}');
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {print("Exception occured: $error stackTrace: $stacktrace");}
      return MovieModel.withError("Data not found / Connection issue");
    }
  }

  Future<TvModel> fetchTvList() async {
    try {
      Response response = await _dio.get('${Config.baseUrl}tv/popular?api_key=${Config.apiKey}');
      return TvModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {print("Exception occured: $error stackTrace: $stacktrace");}
      return TvModel.withError("Data not found / Connection issue");
    }
  }

  Future<ImageModel> fetchImageList(String content, int idResult) async{
    try {
      Response response = await _dio.get('${Config.baseUrl}$content/$idResult/images?api_key=${Config.apiKey}');
      return ImageModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {print("Exception occured: $error stackTrace: $stacktrace");}
      return ImageModel.withError("Data not found / Connection issue");
    }
  }

  Future<DetailModel> fetchDetail(String content, int idResult) async{
    try {
      Response response = await _dio.get('${Config.baseUrl}$content/$idResult?api_key=${Config.apiKey}');
      return DetailModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {print("Exception occured: $error stackTrace: $stacktrace");}
      return DetailModel.withError("Data not found / Connection issue");
    }
  }
}