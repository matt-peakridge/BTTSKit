import Foundation

public protocol FootballMatchSummary {
    var id: UUID? { get set }
    
    var division: String { get set }
    var date: Date { get set }
    var homeTeam: String { get set }
    var awayTeam: String { get set }
    var ftHomeGoals: Int { get set }
    var ftAwayGoals: Int { get set }
    var ftResult: String { get set }
    var htHomeGoals: Int { get set }
    var htAwayGoals: Int { get set }
    var htResult: String { get set }
    
    var referee: String? { get set }
    var shotsHome: Int? { get set }
    var shotsAway: Int? { get set }
    var shotsTargetHome: Int? { get set }
    var shotsTargetAway: Int? { get set }
    var foulsHome: Int? { get set }
    var foulsAway: Int? { get set }
    var cornersHome: Int? { get set }
    var cornersAway: Int? { get set }
    var yellowHome: Int? { get set }
    var yellowAway: Int? { get set }
    var redHome: Int? { get set }
    var redAway: Int? { get set }
}

public extension FootballMatchSummary {
    func isFullTimeBTTS() -> Bool {
        return ftHomeGoals > 0 && ftAwayGoals > 0
    }
}
