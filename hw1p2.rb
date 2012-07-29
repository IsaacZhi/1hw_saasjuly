class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError if nil == game
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError if (nil == game[0] || nil == game[1])
  raise NoSuchStrategyError unless (game[0].length == 2 && game[1].length == 2)
  raise NoSuchStrategyError unless game[0][1] =~ /^[RPS]$/i
  raise NoSuchStrategyError unless game[1][1] =~ /^[RPS]$/i
  secondWin = [ "SR", "PS", "RP" ]
  play = game[0][1] + game[1][1]
  if secondWin.include?(play.upcase) then
    game[1]
  else
    game[0]
  end
end

def rps_tournament_winner(tournament)
  if tournament[0].class == Array && tournament[0][0].class == String then
    first = tournament[0]
    second = tournament[1]
  else
    first = rps_tournament_winner(tournament[0])
    second = rps_tournament_winner(tournament[1])
  end
    rps_game_winner([first, second])
end

test = [ ["Armando", "P"], ["Dave", "S"]]
result = ["Dave", "S"]
p result == rps_game_winner(test)
#test = nil
#test = []
#test = [ ["Dave", "S"] ]
#test = [["Armando", "P"], ["Dave", "S"], ["TEST", "3"]]
#test = [nil, ["Dave", "S"]]
#test = [["Armando", "A"], ["Dave", "S"]]
test = [ ["Armando", "S"], ["Dave", "R"]]
result = ["Dave", "R"]
p result == rps_game_winner(test)
test = [ ["Armando", "R"], ["Dave", "P"]]
result = ["Dave", "P"]
p result == rps_game_winner(test)
test = [ ["Armando", "P"], ["Dave", "S"]]
result = ["Dave", "S"]
p result == rps_game_winner(test)
 test = [ ["Armando", "P"], ["Dave", "P"]]
 result = ["Armando", "P"]
p result == rps_game_winner(test)
 test = [ ["Armando", "P"], ["Dave", "R"]]
 result = ["Armando", "P"]
p result == rps_game_winner(test)
 test = [ ["Armando", "S"], ["Dave", "P"]]
 result = ["Armando", "S"]
p result == rps_game_winner(test)
test = [
  [
    [ ["Armando", "P"], ["Dae", "S"] ],
    [ ["Richard", "R"], ["Michael", "S"] ],
  ],
  [
    [ ["Allen", "S"], ["Omer", "P"] ],
    [ ["David E.", "R"], ["Richard X.", "P"] ]
  ]
]
result = ["Richard", "R"]
p result == rps_tournament_winner(test)
