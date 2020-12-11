/*
Copyright 2020 SAITO Tomomi

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
 */

library playing_card_base;

import 'card.dart';
import 'suit.dart';

/// Declares the [Deck] object.
class Deck {
  /// Constructor
  ///
  /// Throws a [FormatException] if one of below conditions:
  ///   * [numberOfJokers] is not 1 or 2
  ///   * [multiplier] is less than 0
  Deck({int numberOfJokers = 0, int multiplier = 1}) {
    if (numberOfJokers < 0 || numberOfJokers > 2) {
      throw const FormatException('numberOfJokers must be 0, 1 or 2');
    }
    if (multiplier < 1) {
      throw const FormatException('multiplier must be more than 1');
    }
    for (var i = 0; i < multiplier; i++) {
      const suits = <Suit>[Suit.clubs, Suit.diamonds, Suit.hearts, Suit.spades];
      final nums = List<int>.generate(13, (index) => index + 1);
      for (final suit in suits) {
        for (final num in nums) {
          _cards.add(Card(suit, num));
        }
      }
      for (var jokerIdx = 1; jokerIdx <= numberOfJokers; jokerIdx++) {
        _cards.add(Card(Suit.joker, jokerIdx));
      }
    }
  }

  /// [cards]
  List<Card> get cards => _cards;
  final List<Card> _cards = [];

  /// Number of jokers
  int get numberOfJokers {
    var retVal = 0;
    for (final card in cards) {
      if (card.suit == Suit.joker) {
        retVal++;
      }
    }
    return retVal;
  }

  /// Shuffle the deck.
  void shuffle() {
    cards.shuffle();
  }

  /// Draw a card from the deck.
  Card draw() {
    return cards.removeAt(0);
  }

  /// Is empty
  bool get isEmpty => cards.isEmpty;

  /// Is not empty
  bool get isNotEmpty => cards.isNotEmpty;
}
