
part of 'featured_bools_cubit.dart';

abstract class FeaturedBooksState{}

class FeaturedBooksInitial extends FeaturedBooksState{}
class FeaturedBooksloading extends FeaturedBooksState{}
class FeaturedBooksFailure extends FeaturedBooksState{
  final String errorMessage;
  FeaturedBooksFailure({required this.errorMessage});
}
class FeaturedBooksSuccess extends FeaturedBooksState{
  final List<BookEntity> books;

  FeaturedBooksSuccess({required this.books});
}
