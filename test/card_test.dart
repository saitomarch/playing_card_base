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

import 'package:playing_card_base/card.dart';
import 'package:playing_card_base/suit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test valid card', () {
    final suits = <Suit>[Suit.clubs, Suit.diamonds, Suit.hearts, Suit.spades];
    for (final suit in suits) {
      for (var num = 1; num <= 13; num++) {
        final card = Card(suit, num);
        expect(card.suit, suit);
        expect(card.number, num);
      }
    }
  });

  test('Test valid joker card', () {
    for (var num = 1; num <= 2; num++) {
      final card = Card(Suit.joker, num);
      expect(card.isJoker, true);
    }
  });

  test('Test invalid card', () {
    // Throws exception when number is 0 or less if non-joker
    expect(() => Card(Suit.clubs, 0), throwsArgumentError);
    // Throws exception when number is 14 or more if non-joker
    expect(() => Card(Suit.diamonds, 14), throwsArgumentError);
    // Throws exception when number is 0 or less if joker
    expect(() => Card(Suit.joker, 0), throwsArgumentError);
    // Throws exception when number is 3 or more if joker
    expect(() => Card(Suit.joker, 3), throwsArgumentError);
  });

  test('Generates successfully random card (no joker)', () {
    for (var i = 0; i < 255; i++) {
      expect(() {
        final card = Card.random(allowsJoker: false);
        print('Random card generated (no joker): (suit: ' +
            card.suit.toString() +
            '. number: ' +
            card.number.toString());
      }, isNot(throwsArgumentError));
    }
  });

  test('Generates successfully random card (joker)', () {
    for (var i = 0; i < 255; i++) {
      expect(() {
        final card = Card.random(allowsJoker: true);
        print('Random card generated (allows joker): (suit: ' +
            card.suit.toString() +
            '. number: ' +
            card.number.toString());
      }, isNot(throwsArgumentError));
    }
  });
}
