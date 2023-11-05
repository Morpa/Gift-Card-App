import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/card_repository.dart';
import '../repositories/card_repository_impl.dart';

part 'card_repository_provider.g.dart';

@riverpod
CardRepository cardRepository(CardRepositoryRef ref) => CardRepositoryImpl();
