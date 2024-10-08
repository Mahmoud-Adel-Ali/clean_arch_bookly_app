import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/featured_bools_cubit/featured_bools_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_books_list_view_loading_indecator.dart';
import 'package:bookly/core/utils/functions/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> allBooks = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          allBooks.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          toastMessage(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationloading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(books: allBooks);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const FeaturedBooksListViewLoadingIndecator();
        }
      },
    );
  }
}
