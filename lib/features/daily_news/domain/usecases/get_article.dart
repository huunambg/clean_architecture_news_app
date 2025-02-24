import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/respository/article_respository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRespository _articleRespository;

  GetArticleUseCase(this._articleRespository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRespository.getNewsArticles();
  }
}
