import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase newestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksloading());
    var result = await newestBooksUseCase.call();

    result.fold(
        (failure) => emit(NewestBooksFailure(errorMessage: failure.message)),
        (books) => emit(NewestBooksSuccess(books: books)));
  }
}
