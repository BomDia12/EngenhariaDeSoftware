class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    raise NoSuchStrategyError unless game[0][1].match(/[rps]/i) and game[1][1].match(/[rps]/i)

    if game[0][1].downcase == 'r'
        return game[1] if game[1][1].downcase == 'p'

        return game[0]
    end
    
    if game[0][1].downcase == 'p'
        return game[1] if game[1][1].downcase == 's'

        return game[0]
    end

    return game [1] if game[1][1].downcase == 'r'

    game[0]
end

p rps_game_winner [ [ "Kristen", "P" ], [ "Pam", "s" ] ] # => returns the list ["Pam", "S"] wins since S>P

def rps_tournament_winner(tournament)
    if tournament[0][0].is_a? String
        return rps_game_winner tournament
    end

    rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
end

p rps_tournament_winner(
    [
        [
         [ ["Kristen", "P"], ["Dave", "S"] ],
         [ ["Richard", "R"], ["Michael", "S"] ],
        ],
        [
         [ ["Allen", "S"], ["Omer", "P"] ],
         [ ["David E.", "R"], ["Richard X.", "P"] ]
        ]
    ]
)
