import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/card_model.dart';
import 'card_repository_provider.dart';
import 'search_query_provider.dart';
import 'selected_category_provider.dart';

part 'filtered_cards_provider.g.dart';

@riverpod
Future<List<CardModel>> filteredCards(FilteredCardsRef ref) async {
  final cardRepository = ref.watch(cardRepositoryProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final searchQuery = ref.watch(searchQueryProvider);

  final allCards = await cardRepository.getAllCards();

  if (selectedCategory != null) {
    return allCards.where(
      (card) {
        return card.categories.any((category) => category == selectedCategory);
      },
    ).toList();
  }

  if (searchQuery.trim().isNotEmpty) {
    return allCards.where(
      (card) {
        return card.name.toLowerCase().contains(searchQuery.toLowerCase());
      },
    ).toList();
  }

  return allCards;
}
