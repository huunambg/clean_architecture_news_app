import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:news_app/features/daily_news/domain/respository/article_respository.dart';

class ArticleRespositoryImpl implements ArticleRespository {
  final NewsApiService _newsApiService;

  ArticleRespositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newApiKey, country: countryQuery, category: category);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
       return DataFailed(
        DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
