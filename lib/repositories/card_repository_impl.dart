import './card_repository.dart';
import '../models/card_model.dart';

final class CardRepositoryImpl implements CardRepository {
  @override
  Future<List<CardModel>> getAllCards() async {
    return Future.delayed(const Duration(milliseconds: 300), () {
      return CardModel.sampleCards;
    });
  }

  @override
  Future<CardModel> getCard(int cardId) async {
    return Future.delayed(const Duration(milliseconds: 300), () {
      return CardModel.sampleCards.where((card) => card.id == cardId).first;
    });
  }
}
