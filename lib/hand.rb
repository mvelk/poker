require_relative 'deck'
require_relative 'hand_type'

class Hand
  include HandType
  attr_reader :cards

  def initialize(deck)
    @deck = deck
    @cards = []
  end

  def add_card
    raise "Hand already has 5 cards" if @cards.length >= 5
    @cards << @deck.deal_card!
  end

  def cards=(cards)
    @cards = cards
  end

  def swap_cards!(indices)
    raise ArgumentError.new { "Too many indices" } if indices.length > 3
    new_hand = []
    @cards.each_with_index do |card, index|
      if indices.include?(index)
        new_hand << @deck.deal_card!
      else
        new_hand << card
      end
    end
    @cards = new_hand
  end

end
