import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repository/article_respository_impl.dart';
import 'package:news_app/features/daily_news/domain/respository/article_respository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

// Dependencies

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRespository>(ArticleRespositoryImpl(sl()));

// UseCases

  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // Blocs

  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));


  
}
