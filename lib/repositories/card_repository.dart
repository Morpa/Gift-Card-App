import '../models/card_model.dart';

abstract interface class CardRepository {
  Future<List<CardModel>> getAllCards();
  Future<CardModel> getCard(int cardId);
}
