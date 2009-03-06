class Game
  class << self
    def new_game
      @hero = Hero.new
      @arrows = []
      
      $app.click do |button, x, y|
        @hero.prepare_arrow
      end
      
      $app.release do |button, x, y|
        @hero.shot
      end
    end
    
    def draw
      $app.clear do
        $app.background $app.rgb(0, 128, 0)
        
        @hero.draw
        @arrows.each {|a| a.draw}
      end
    end
    
    def create_arrow
      @arrows.reject {|arrow| arrow.dead}
      @arrows << Arrow.new
    end
  end
end

class Sprite
  attr_accessor :x, :y
  
  def initialize(x = 0, y = 0)
    @x, @y = x, y
  end
end

class Hero < Sprite
  STATES = {
    :stand => ["sprites/hero_stand.png", 42],
    :armed => ["sprites/hero_armed.png", 41],
    :waiting => ["sprites/hero_without_arrow.png", 42]
  }
  
  def initialize *args
    super *args
    
    @cur_state = :stand
  end
  
  def state
    STATES[@cur_state]
  end
  
  def draw
    nothing, mouse_x, @y = *$app.mouse
    
    $app.image state[0], :left => @x, :top => @y - state[1]
  end
  
  def prepare_arrow
    @cur_state = :armed
  end
  
  def shot
    Game.create_arrow
    @cur_state = :waiting
  end
end

class Arrow < Sprite
  def initialize *args
    super *args
    
    @x = 60
    @y = $app.mouse[2] - 2
  end
  
  def dead
    @x > $app.width
  end
  
  def draw
    return if dead
    
    @x += 5
    
    $app.image "sprites/arrow.png", :left => @x, :top => @y
  end
end

Shoes.app :width => 640, :height => 480, :resizable => false do
  $app = self
  
  Game.new_game
  
  animate(60) { Game.draw }
end