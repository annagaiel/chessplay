class Game < ActiveRecord::Base

  belongs_to :player
  has_many :pieces, dependent: :destroy

  after_create :populate_board!

  def populate_board!

    0.upto(7) do |x|
      Pawn.create( game_id: self.id, x_position: x, y_position: 1, player_id: self.white_player, color: "white", captured: false)
      Pawn.create( game_id: self.id, x_position: x, y_position: 6, player_id: self.black_player, color: "black", captured: false)
    end

    Rook.create( game_id: self.id, x_position: 7, y_position: 0, player_id: self.white_player, color: "white", captured: false)
    Rook.create( game_id: self.id, x_position: 7, y_position: 0, player_id: self.white_player, color: "white", captured: false)
    Rook.create( game_id: self.id, x_position: 0, y_position: 7, player_id: self.black_player, color: "black", captured: false)
    Rook.create( game_id: self.id, x_position: 0, y_position: 7, player_id: self.black_player, color: "black", captured: false)
    Bishop.create( game_id: self.id, x_position: 7, y_position: 2, player_id: self.white_player, color: "white", captured: false)
    Bishop.create( game_id: self.id, x_position: 7, y_position: 5, player_id: self.white_player, color: "white", captured: false)
    Bishop.create( game_id: self.id, x_position: 0, y_position: 2, player_id: self.black_player, color: "black", captured: false)
    Bishop.create( game_id: self.id, x_position: 0, y_position: 5, player_id: self.black_player, color: "black", captured: false)
    Knight.create( game_id: self.id, x_position: 7, y_position: 1, player_id: self.white_player, color: "white", captured: false)
    Knight.create( game_id: self.id, x_position: 7, y_position: 6, player_id: self.white_player, color: "white", captured: false)
    Knight.create( game_id: self.id, x_position: 0, y_position: 1, player_id: self.black_player, color: "black", captured: false)
    Knight.create( game_id: self.id, x_position: 0, y_position: 6, player_id: self.black_player, color: "black", captured: false)
    King.create( game_id: self.id, x_position: 0, y_position: 4, player_id: self.white_player, color: "white", captured: false)
    King.create( game_id: self.id, x_position: 7, y_position: 4, player_id: self.black_player, color: "black", captured: false)
    Queen.create( game_id: self.id, x_position: 0, y_position: 3, player_id: self.white_player, color: "white", captured: false)
    Queen.create( game_id: self.id, x_position: 7, y_position: 3, player_id: self.black_player, color: "black", captured: false)
  end

end
