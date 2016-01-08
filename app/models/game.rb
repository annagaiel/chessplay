class Game < ActiveRecord::Base

  belongs_to :player
  has_many :pieces, dependent: :destroy

  after_create :populate_board!

  def populate_board!

    0.upto(7) do |x|
      Pawn.create(x_position: x, y_position: 1, player_id: white_player_id, color: "white", captured: false)
      Pawn.create(x_position: x, y_position: 6, player_id: black_player_id, color: "black", captured: false)
    end

    Rook.create( x_position: 7, y_position: 0, player_id: white_player_id, color: "white", captured: false)
    Rook.create( x_position: 7, y_position: 0, player_id: white_player_id, color: "white", captured: false)
    Rook.create( x_position: 0, y_position: 7, player_id: black_player_id, color: "black", captured: false)
    Rook.create( x_position: 0, y_position: 7, player_id: black_player_id, color: "black", captured: false)
    Bishop.create( x_position: 7, y_position: 2, player_id: white_player_id, color: "white", captured: false)
    Bishop.create( x_position: 7, y_position: 5, player_id: white_player_id, color: "white", captured: false)
    Bishop.create( x_position: 0, y_position: 2, player_id: black_player_id, color: "black", captured: false)
    Bishop.create( x_position: 0, y_position: 5, player_id: black_player_id, color: "black", captured: false)
    Knight.create( x_position: 7, y_position: 1, player_id: white_player_id, color: "white", captured: false)
    Knight.create( x_position: 7, y_position: 6, player_id: white_player_id, color: "white", captured: false)
    Knight.create( x_position: 0, y_position: 1, player_id: black_player_id, color: "black", captured: false)
    Knight.create( x_position: 0, y_position: 6, player_id: black_player_id, color: "black", captured: false)
    King.create( x_position: 0, y_position: 4, player_id: white_player_id, color: "white", captured: false)
    King.create( x_position: 7, y_position: 4, player_id: black_player_id, color: "black", captured: false)
    Queen.create( x_position: 0, y_position: 3, player_id: white_player_id, color: "white", captured: false)
    Queen.create( x_position: 7, y_position: 3, player_id: black_player_id, color: "black", captured: false)
  end

end
