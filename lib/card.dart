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

import 'suit.dart';

/// Declares [Card] object
class Card {
  /// Constructor
  ///
  /// For the [suit] of the card, it must be clubs, diamonds, hearts, spades
  /// or joker.
  ///
  /// For the [number] of the card, it must be 1 to 13 for non-joker,
  /// must be 1 or 2 for joker.
  Card(Suit suit, int number) {
    switch (suit) {
      case Suit.clubs:
      case Suit.diamonds:
      case Suit.hearts:
      case Suit.spades:
        if (number < 1 || number > 13) {
          throw const FormatException(
              'number of card for clubs, diamonds, hearts, spades must be '
              '1(ace) to 13(King)');
        }
        break;
      case Suit.joker:
        if (number != 1 && number != 2) {
          throw const FormatException(
              'number for card for joker must be 1(joker) or 2(extra joker)');
        }
    }
    _suit = suit;
    _number = number;
  }

  Suit get suit => _suit;

  /// The [suit] of the card.
  Suit _suit;

  int _number;

  /// The [number] of the card.
  int get number => _number;

  /// Whether the card is joker
  bool get isJoker => suit == Suit.joker;
}
