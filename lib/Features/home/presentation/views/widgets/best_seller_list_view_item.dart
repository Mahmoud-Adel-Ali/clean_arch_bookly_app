import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: CachedNetworkImage(
                imageUrl: book.image ?? '',
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    book.authorName ?? 'no auther',
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        '${book.price} €',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(rate: book.rate ?? 0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
