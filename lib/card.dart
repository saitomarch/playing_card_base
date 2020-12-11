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

import 'dart:math';

import 'suit.dart';

/// Declares [Card] object
class Card {
  /// Constructor
  ///
  /// Throws [ArgumentError] if below one of conditions:
  ///   * [number] is not 1 to 13 if [suit] is [Suit.clubs], [Suit.diamonds],
  ///     [Suit.hearts] or [Suit.spades].
  ///   * [number] is not 1 or 2 if [suit] is [Suit.joker].
  Card(Suit suit, int number) {
    switch (suit) {
      case Suit.clubs:
      case Suit.diamonds:
      case Suit.hearts:
      case Suit.spades:
        if (number < 1 || number > 13) {
          throw ArgumentError(
              'number of card for clubs, diamonds, hearts, spades must be '
              '1(ace) to 13(King)');
        }
        break;
      case Suit.joker:
        if (number != 1 && number != 2) {
          throw ArgumentError(
              'number for card for joker must be 1(joker) or 2(extra joker)');
        }
    }
    _suit = suit;
    _number = number;
  }

  /// Returns [random] card.
  ///
  /// If you wish to [allowsJoker], it should be `true`. Otherwise `false`.
  static Card random({bool allowsJoker}) {
    final random = Random();
    List<Suit> suits;
    if (allowsJoker) {
      suits = [Suit.clubs, Suit.diamonds, Suit.hearts, Suit.spades, Suit.joker];
    } else {
      suits = [Suit.clubs, Suit.diamonds, Suit.hearts, Suit.spades];
    }
    final suit = suits[random.nextInt(suits.length)];
    int number;
    switch (suit) {
      case Suit.clubs:
      case Suit.diamonds:
      case Suit.hearts:
      case Suit.spades:
        number = random.nextInt(13) + 1;
        break;
      case Suit.joker:
        number = random.nextInt(2) + 1;
        break;
    }
    return Card(suit, number);
  }

  /// The [suit] of the card.
  Suit get suit => _suit;
  Suit _suit;

  /// The [number] of the card.
  int get number => _number;
  int _number;

  /// Whether the card is joker
  bool get isJoker => suit == Suit.joker;
}
