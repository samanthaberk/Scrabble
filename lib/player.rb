require_relative '../lib/scoring'
require_relative '../lib/tile_bag'

module Scrabble
  class Player
    attr_accessor :name

    def initialize(name)
      @name = name
      @plays = []
    end # initialize

    def plays
      return @plays
    end

    def play(word)
      if won?
        return false
      else
        @plays << word
        return Scrabble::Scoring.score(word)
      end
    end

    def won?
      if total_score >= 100
        return true
      else
        return false
      end
    end

    def total_score
      points = 0
      @plays.each do |word|
        word_score = Scrabble::Scoring.score(word)
        points += word_score
      end
      return points
    end

    def highest_scoring_word
      word_score_pair = {}
      @plays.each do |word|
      word_score_pair[word] = Scrabble::Scoring.score(word)
      end
     word_score_pair.max_by do |k,v|
       return k if v == word_score_pair.values.max
     end
    end

    def highest_word_score
      word_score_pair = {}
      @plays.each do |word|
      word_score_pair[word] = Scrabble::Scoring.score(word)
      end
     word_score_pair.max_by do |k,v|
       return v if v == word_score_pair.values.max
     end
    end

    # unclear of required output for this method. recieved error of draw_tiles
    # method undefined not sure why.
    # def tiles(num)
    #     if num <= 7 && num > 0
    #       player_tiles = Scrabble::TileBag.draw_tiles(num)
    #       return player_tiles
    #     else
    #       raise ArgumentError.new("Number of tiles must be between 0 and 7")
    #     end
    # end

  end # class player

end # module
player = Scrabble::Player.new("Sam")
# player.play("word")
# player.play("dog")
# print player.highest_word_score
player.tiles(3)
