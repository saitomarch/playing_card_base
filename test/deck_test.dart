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

import 'package:playing_card_base/deck.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test valid deck with no Jokers', () {
    final deck = Deck(numberOfJokers: 0, multiplier: 1);
    expect(deck.cards.length, 52);
    expect(deck.numberOfJokers, 0);
  });

  test('Test valid deck with 1 joker', () {
    final deck = Deck(numberOfJokers: 1, multiplier: 1);
    expect(deck.cards.length, 53);
    expect(deck.numberOfJokers, 1);
  });

  test('Test valid deck with 2 jokers', () {
    final deck = Deck(numberOfJokers: 2, multiplier: 1);
    expect(deck.cards.length, 54);
    expect(deck.numberOfJokers, 2);
  });

  test('Test valid deck with 2 multiplies', () {
    final deck = Deck(multiplier: 2);
    expect(deck.cards.length, 104);
    expect(deck.numberOfJokers, 0);
  });

  test('Test valid deck with 0 multiplies', () {
    final deck = Deck(multiplier: 0);
    expect(deck.cards.length, 0);
    expect(deck.cards.isEmpty, true);
    expect(deck.numberOfJokers, 0);
  });

  test('Throws exception if invalid number of jokers', () {
    expect(() => Deck(numberOfJokers: -1), throwsArgumentError);
    expect(() => Deck(numberOfJokers: 3), throwsArgumentError);
  });

  test('Throws exception if invalid multipliers', () {
    expect(() => Deck(multiplier: -1), throwsArgumentError);
  });

  test('Throws exception if will draw even emtpy', () {
    final deck = Deck(multiplier: 0);
    expect(() => deck.draw(), throwsException);
  });

  test('Test draw successfully', () {
    final deck = Deck(numberOfJokers: 0, multiplier: 1);
    expect(deck.cards.length, 52);
    final firstCard = deck.cards.first;
    final card = deck.draw();
    expect(card, firstCard);
    expect(deck.cards.length, 51);
  });

  test('Shuffle successfully', () {
    final deck = Deck();
    final firstOrder = [...deck.cards];
    deck.shuffle();
    expect(deck.cards, isNot(firstOrder));
  });

  test('isNotEmpty in initial with default value', () {
    final deck = Deck();
    expect(deck.isEmpty, false);
    expect(deck.isNotEmpty, true);
  });
}
