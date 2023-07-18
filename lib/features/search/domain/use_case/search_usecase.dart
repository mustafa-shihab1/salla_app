import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/core/use_case/base_use_case.dart';
import 'package:home_service_application/features/search/data/request/search_request.dart';
import 'package:home_service_application/features/search/domain/model/search_model.dart';
import 'package:home_service_application/features/search/domain/repository/search_repository.dart';

class SearchUseCaseInput {
  String? text;

  SearchUseCaseInput({
    required this.text,
  });
}
class SearchUseCase implements BaseUseCase<SearchUseCaseInput, Search> {
  final SearchRepository _searchRepository;

  SearchUseCase(this._searchRepository);

  @override
  Future<Either<Failure, Search>> execute(SearchUseCaseInput input) async {
    return await _searchRepository.search(
      SearchRequest(
        text: input.text,
      ),
    );
  }
}