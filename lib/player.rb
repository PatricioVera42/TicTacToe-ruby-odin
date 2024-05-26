# frozen_string_literal: true

class Player
  attr_accessor :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def to_s
    name
  end
end
