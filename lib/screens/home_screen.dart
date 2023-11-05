import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../gen/colors.gen.dart';
import '../models/card_model.dart';
import '../providers/filtered_cards_provider.dart';
import '../providers/search_query_provider.dart';
import '../providers/selected_category_provider.dart';
import '../utils/card_category_extension.dart';
import '../widgets/app_text.dart';
import '../widgets/custom_chip.dart';
import '../widgets/custom_gift_card.dart';
import '../widgets/custom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: AppText.title('Gift Card'),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            _SearchBar(),
            SizedBox(height: 10),
            _CategoryFilters(),
            SizedBox(height: 10),
            _CardGrid(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(
        index: 0,
      ),
    );
  }
}

class _CardGrid extends ConsumerWidget {
  const _CardGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final cards = ref.watch(filteredCardsProvider);

    return cards.when(
      loading: () => const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
      data: (cards) => SizedBox(
        height: size.height * 0.65,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10,
          ),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Center(
              child: CustomGiftCard(
                card: cards[index],
                width: size.width * 0.425,
              ),
            );
          },
        ),
      ),
      error: (error, stackTrace) {
        return Center(
          child: AppText.medium('Failed to load cards'),
        );
      },
    );
  }
}

class _CategoryFilters extends ConsumerWidget {
  const _CategoryFilters();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    return SizedBox(
      height: 30,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          ...CardCategory.values.map(
            (category) => CustomChip(
              label: category.capitalName(),
              isSelected: selectedCategory == category,
              onTap: () {
                ref
                    .read(selectedCategoryProvider.notifier)
                    .setSelectedCategory(category);
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _SearchBar extends ConsumerWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorName.lightGrey,
          hintText: 'Search card',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: ref.read(searchQueryProvider.notifier).onChange,
      ),
    );
  }
}
