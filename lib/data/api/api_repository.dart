import '../model/detail_model.dart';
import '../model/image_model.dart';
import '../model/movie_model.dart';
import '../model/tv_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<MovieModel> fetchMovieList() {
    return _provider.fetchMovieList();
  }

  Future<TvModel> fetchTvList() {
    return _provider.fetchTvList();
  }

  Future<ImageModel> fetchImageList(String content, int idResult){
    return _provider.fetchImageList(content, idResult);
  }

  Future<DetailModel> fetchDetail(String content, int idResult){
    return _provider.fetchDetail(content, idResult);
  }
}
