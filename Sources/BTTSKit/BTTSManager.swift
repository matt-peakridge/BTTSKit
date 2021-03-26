import Foundation

public enum ProbabilityType {
    case entireSeason
    case homeAwayNonSensitive
    case homeSensitive
    case awaySensitive
    case headToHeadHomeAwayNonSensitive
    case headToHeadSensitive
}

public class BTTSManager {
    
    public init() {
        
    }
    
    public func probability(type: ProbabilityType, home: String? = nil, away: String? = nil, referee: String? = nil, matches: [FootballMatchSummary]) -> Double {
        
        var filteredGames = [FootballMatchSummary]()
        switch type {
        case .entireSeason:
            filteredGames = matches
        case .homeAwayNonSensitive:
            filteredGames = matches.filter( {$0.homeTeam == home || $0.awayTeam == home || $0.homeTeam == away || $0.awayTeam == away} )
        case .homeSensitive:
            filteredGames = matches.filter( {$0.homeTeam == home} )
        case .awaySensitive:
            filteredGames = matches.filter( {$0.awayTeam == away} )
        case .headToHeadSensitive:
            filteredGames = matches.filter( {($0.homeTeam == home && $0.awayTeam == away)} )
        case .headToHeadHomeAwayNonSensitive:
            filteredGames = matches.filter( {($0.homeTeam == home || $0.homeTeam == away) && ($0.awayTeam == home || $0.awayTeam == away) } )
        }
        
        if let referee = referee {
            filteredGames = filteredGames.filter( {$0.referee == referee} )
        }
        
        let bttsGame = filteredGames.filter({$0.isFullTimeBTTS() == true} )
        let percentage = (100.0 / Double(filteredGames.count)) * Double(bttsGame.count)
        let percentageRounded = String(format: "%.1f", percentage)
        
        return Double(percentageRounded) ?? 0
    }
}
