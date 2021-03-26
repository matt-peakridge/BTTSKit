import Foundation

public protocol FootballMatchSummary {
    var id: UUID? { get }
    
    var division: String { get }
    var date: Date { get }
    var homeTeam: String { get }
    var awayTeam: String { get }
    var ftHomeGoals: Int { get }
    var ftAwayGoals: Int { get }
    var ftResult: String { get }
    var htHomeGoals: Int { get }
    var htAwayGoals: Int { get }
    var htResult: String { get }
    
    var referee: String? { get }
    var shotsHome: Int? { get }
    var shotsAway: Int? { get }
    var shotsTargetHome: Int? { get }
    var shotsTargetAway: Int? { get }
    var foulsHome: Int? { get }
    var foulsAway: Int? { get }
    var cornersHome: Int? { get }
    var cornersAway: Int? { get }
    var yellowHome: Int? { get }
    var yellowAway: Int? { get }
    var redHome: Int? { get }
    var redAway: Int? { get }
}

public extension FootballMatchSummary {
    func isFullTimeBTTS() -> Bool {
        return ftHomeGoals > 0 && ftAwayGoals > 0
    }
}
