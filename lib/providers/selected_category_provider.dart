import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/card_model.dart';

part 'selected_category_provider.g.dart';

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  CardCategory? build() {
    return null;
  }

  void setSelectedCategory(CardCategory? category) async {
    if (state == category) {
      state = null;
    } else {
      state = category;
    }
  }
}
