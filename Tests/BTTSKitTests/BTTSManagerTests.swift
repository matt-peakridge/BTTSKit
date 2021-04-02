import XCTest
@testable import BTTSKit

final class BTTSManagerTests: XCTestCase {
    
    var sut: BTTSManager!
    
    func testThisTestPasses() {
        XCTAssertTrue(true)
    }
    
    func testDivisionSeasonReturnsCorrectBTTSProbability() {
        
        sut = BTTSManager()
        let matches = BTTSManagerTests.mockSeasonGameData
        
        let actualProbability = sut.probability(type: .entireSeason, matches: matches)
        let expectedProbability: Double = 62.5
        
        XCTAssertEqual(actualProbability, expectedProbability)
    }
    
    func testSeasonWithBWhizzReferringReturnsCorrectBTTSProbability() {
        
        sut = BTTSManager()
        let matches = BTTSManagerTests.mockSeasonGameData
        
        let actualProbability = sut.probability(type: .entireSeason, referee: "B Whizz", matches: matches)
        let expectedProbability: Double = 25.0
        
        XCTAssertEqual(actualProbability, expectedProbability)
    }
    
    func testFulhamVSArsenalReturnsCorrectBTTSProbability() {
        
        sut = BTTSManager()
        let matches = BTTSManagerTests.mock5GameData
        
        let actualProbability = sut.probability(type: .homeAwayNonSensitive, home: "Fulham", away: "Arsenal", matches: matches)
        let expectedProbability: Double = 50.0
        
        XCTAssertEqual(actualProbability, expectedProbability)
    }
    
    func testFulhamVSArsenalWithBWhizzRefereeingReturnsCorrectBTTSProbability() {
        
        sut = BTTSManager()
        let matches = BTTSManagerTests.mockSeasonGameData
        
        let actualProbability = sut.probability(type: .homeAwayNonSensitive, home: "Fulham", away: "Arsenal", referee: "B Whizz", matches: matches)
        let expectedProbability: Double = 25.0
        
        XCTAssertEqual(actualProbability, expectedProbability)
    }
    
    func testFulhamWhenHomeTeamReturnsCorrectBTTSProbability() {
        
        sut = BTTSManager()
        let matches = BTTSManagerTests.mockSeasonGameData
        
        let actualProbability = sut.probability(type: .homeSensitive, home: "Fulham", away: nil, matches: matches)
        let expectedProbability: Double = 100.0
        
        XCTAssertEqual(actualProbability, expectedProbability)
    }
    
    func testArsenalWhenAwayTeamReturnsCorrectBTTSProbability() {
        
        sut = BTTSManager()
        let matches = BTTSManagerTests.mockSeasonGameData
        
        let actualProbability = sut.probability(type: .awaySensitive, home: nil, away: "Arsenal", matches: matches)
        let expectedProbability: Double = 66.7
        
        XCTAssertEqual(actualProbability, expectedProbability)
    }
    
    
    func testFulhamVSArsenalHeadToHeadHomeAwayNonSensitiveReturnsCorrectBTTSProbability() {
        
        sut = BTTSManager()
        let matches = BTTSManagerTests.mockSeasonGameData
        
        let actualProbability = sut.probability(type: .headToHeadHomeAwayNonSensitive, home: "Fulham", away: "Arsenal", matches: matches)
        let expectedProbability: Double = 50.0
        
        XCTAssertEqual(actualProbability, expectedProbability)
    }
    
    func testFulhamVSArsenalHeadToHeadHomeAwaySensitiveReturnsCorrectBTTSProbability() {
        
        sut = BTTSManager()
        let matches = BTTSManagerTests.mockSeasonGameData
        
        let actualProbability = sut.probability(type: .headToHeadSensitive, home: "Fulham", away: "Arsenal", matches: matches)
        let expectedProbability: Double = 100.0
        
        XCTAssertEqual(actualProbability, expectedProbability)
    }
    
    func testMatchBetweenTwoTeamsWhoHaveNeverBeenRefereedByHWebbShouldReturnZero() {
        // Arrange
        sut = BTTSManager()
        let matches = BTTSManagerTests.mockSeasonGameData
        
        // Act
        let actualProbability = sut.probability(type: .headToHeadSensitive, home: "Fulham", away: "Arsenal", referee: "H Webb", matches: matches)
        
        // Assert
        XCTAssertEqual(actualProbability, 0.0)
    }
    
    // MARK: - Sanity Testing
    func testRandomTests() {
        
        sut = BTTSManager()
        let matches = BTTSManagerTests.mockSeasonWith31GamesData

        XCTAssertEqual(32.3, sut.probability(type: .entireSeason, home: nil, away: nil, matches: matches))
        
        XCTAssertEqual(42.9, sut.probability(type: .homeAwayNonSensitive, home: "Man City", away: "Southampton", matches: matches))
        XCTAssertEqual(66.7, sut.probability(type: .homeSensitive, home: "Man City", away: "Southampton", matches: matches))
        XCTAssertEqual(33.3, sut.probability(type: .awaySensitive, home: "Man City", away: "Southampton", matches: matches))
        
        XCTAssertEqual(14.3, sut.probability(type: .homeAwayNonSensitive, home: "Chelsea", away: "Wolves", matches: matches))
        XCTAssertEqual(0.0, sut.probability(type: .homeSensitive, home: "Chelsea", away: "Wolves", matches: matches))
        XCTAssertEqual(0.0, sut.probability(type: .awaySensitive, home: "Wolves", away: "Chelsea", matches: matches))
    }
    

//    static var allTests = [
//        ("testExample", testExample),
//    ]
}


// MARK: - Stub Data
extension BTTSManagerTests {
    static var mock5GameData: [FootballMatchSummary] = [
        MockFootballMatchSummary(homeTeam: "Fulham", awayTeam: "Arsenal", ftHomeGoals: 2, ftAwayGoals: 1, ftResult: "H"),
        MockFootballMatchSummary(homeTeam: "Fulham", awayTeam: "Arsenal", ftHomeGoals: 1, ftAwayGoals: 2, ftResult: "A"),
        MockFootballMatchSummary(homeTeam: "Arsenal", awayTeam: "Fulham", ftHomeGoals: 1, ftAwayGoals: 0, ftResult: "H"),
        MockFootballMatchSummary(homeTeam: "Arsenal", awayTeam: "Fulham", ftHomeGoals: 3, ftAwayGoals: 0, ftResult: "H"),
        MockFootballMatchSummary(homeTeam: "Wolves", awayTeam: "Chelsea", ftHomeGoals: 1, ftAwayGoals: 1, ftResult: "D"),
    ]
    
    static var mockSeasonGameData: [FootballMatchSummary] = [
        MockFootballMatchSummary(homeTeam: "Fulham", awayTeam: "Arsenal", ftHomeGoals: 2, ftAwayGoals: 1, ftResult: "H", referee: "D Duck"),
        MockFootballMatchSummary(homeTeam: "Fulham", awayTeam: "Arsenal", ftHomeGoals: 1, ftAwayGoals: 2, ftResult: "A", referee: "M Mouse"),
        MockFootballMatchSummary(homeTeam: "Arsenal", awayTeam: "Fulham", ftHomeGoals: 1, ftAwayGoals: 0, ftResult: "H", referee: "B Whizz"),
        MockFootballMatchSummary(homeTeam: "Arsenal", awayTeam: "Fulham", ftHomeGoals: 3, ftAwayGoals: 0, ftResult: "H", referee: "B Whizz"),
        MockFootballMatchSummary(homeTeam: "Wolves", awayTeam: "Arsenal", ftHomeGoals: 0, ftAwayGoals: 0, ftResult: "D", referee: "B Whizz"),
        MockFootballMatchSummary(homeTeam: "Burnley", awayTeam: "Fulham", ftHomeGoals: 1, ftAwayGoals: 2, ftResult: "A", referee: "D Duck"),
        MockFootballMatchSummary(homeTeam: "Fulham", awayTeam: "Chelsea", ftHomeGoals: 1, ftAwayGoals: 1, ftResult: "D", referee: "B Whizz"),
        MockFootballMatchSummary(homeTeam: "Wolves", awayTeam: "Chelsea", ftHomeGoals: 3, ftAwayGoals: 1, ftResult: "H", referee: "M Mouse"),
    ]
    
    static var mockSeasonWith31GamesData: [FootballMatchSummary] = [
        MockFootballMatchSummary(homeTeam: "Chelsea", awayTeam: "Man United", ftHomeGoals: 0, ftAwayGoals: 0),
        MockFootballMatchSummary(homeTeam: "Sheffield United", awayTeam: "Liverpool", ftHomeGoals: 0, ftAwayGoals: 2),
        MockFootballMatchSummary(homeTeam: "Everton", awayTeam: "Southampton", ftHomeGoals: 1, ftAwayGoals: 0),
        MockFootballMatchSummary(homeTeam: "Man City", awayTeam: "Wolves", ftHomeGoals: 4, ftAwayGoals: 1),
        MockFootballMatchSummary(homeTeam: "Burnley", awayTeam: "Leicester", ftHomeGoals: 1, ftAwayGoals: 1),
        MockFootballMatchSummary(homeTeam: "Sheffield United", awayTeam: "Aston Villa", ftHomeGoals: 1, ftAwayGoals: 0),
        MockFootballMatchSummary(homeTeam: "Crystal Palace", awayTeam: "Man United", ftHomeGoals: 0, ftAwayGoals: 0),
        MockFootballMatchSummary(homeTeam: "Fulham", awayTeam: "Tottenham", ftHomeGoals: 0, ftAwayGoals: 1),
        MockFootballMatchSummary(homeTeam: "West Brom", awayTeam: "Everton", ftHomeGoals: 0, ftAwayGoals: 1),
        MockFootballMatchSummary(homeTeam: "Liverpool", awayTeam: "Chelsea", ftHomeGoals: 0, ftAwayGoals: 1),
        MockFootballMatchSummary(homeTeam: "Burnley", awayTeam: "Arsenal", ftHomeGoals: 1, ftAwayGoals: 1),
        MockFootballMatchSummary(homeTeam: "Sheffield United", awayTeam: "Southampton", ftHomeGoals: 0, ftAwayGoals: 2),
        MockFootballMatchSummary(homeTeam: "Aston Villa", awayTeam: "Wolves", ftHomeGoals: 0, ftAwayGoals: 0),
        MockFootballMatchSummary(homeTeam: "Brighton", awayTeam: "Leicester", ftHomeGoals: 1, ftAwayGoals: 2),
        MockFootballMatchSummary(homeTeam: "West Brom", awayTeam: "Newcastle", ftHomeGoals: 0, ftAwayGoals: 0),
        MockFootballMatchSummary(homeTeam: "Liverpool", awayTeam: "Fulham", ftHomeGoals: 0, ftAwayGoals: 1),
        MockFootballMatchSummary(homeTeam: "Man City", awayTeam: "Man United", ftHomeGoals: 0, ftAwayGoals: 2),
        MockFootballMatchSummary(homeTeam: "Tottenham", awayTeam: "Crystal Palace", ftHomeGoals: 4, ftAwayGoals: 1),
        MockFootballMatchSummary(homeTeam: "Chelsea", awayTeam: "Everton", ftHomeGoals: 2, ftAwayGoals: 0),
        MockFootballMatchSummary(homeTeam: "West Ham", awayTeam: "Leeds", ftHomeGoals: 2, ftAwayGoals: 0),
        MockFootballMatchSummary(homeTeam: "Man City", awayTeam: "Southampton", ftHomeGoals: 5, ftAwayGoals: 2),
        MockFootballMatchSummary(homeTeam: "Newcastle", awayTeam: "Aston Villa", ftHomeGoals: 1, ftAwayGoals: 1),
        MockFootballMatchSummary(homeTeam: "Leeds", awayTeam: "Chelsea", ftHomeGoals: 0, ftAwayGoals: 0),
        MockFootballMatchSummary(homeTeam: "Crystal Palace", awayTeam: "West Brom", ftHomeGoals: 1, ftAwayGoals: 0),
        MockFootballMatchSummary(homeTeam: "Everton", awayTeam: "Burnley", ftHomeGoals: 1, ftAwayGoals: 2),
        MockFootballMatchSummary(homeTeam: "Fulham", awayTeam: "Man City", ftHomeGoals: 0, ftAwayGoals: 3),
        MockFootballMatchSummary(homeTeam: "Southampton", awayTeam: "Brighton", ftHomeGoals: 1, ftAwayGoals: 2),
        MockFootballMatchSummary(homeTeam: "Leicester", awayTeam: "Sheffield United", ftHomeGoals: 5, ftAwayGoals: 0),
        MockFootballMatchSummary(homeTeam: "Arsenal", awayTeam: "Tottenham", ftHomeGoals: 2, ftAwayGoals: 1),
        MockFootballMatchSummary(homeTeam: "Man United", awayTeam: "West Ham", ftHomeGoals: 1, ftAwayGoals: 0),
        MockFootballMatchSummary(homeTeam: "Wolves", awayTeam: "Liverpool", ftHomeGoals: 0, ftAwayGoals: 1)
    ]
}

struct MockFootballMatchSummary: FootballMatchSummary {
    
    var id: UUID?
    var division: String
    var date: Date
    var homeTeam: String
    var awayTeam: String
    var ftHomeGoals: Int
    var ftAwayGoals: Int
    var ftResult: String
    var htHomeGoals: Int
    var htAwayGoals: Int
    var htResult: String
    var referee: String?
    
    // properties that aren't required at this stage .. implementing becasue protocol requires it
    var shotsHome: Int?
    var shotsAway: Int?
    var shotsTargetHome: Int?
    var shotsTargetAway: Int?
    var foulsHome: Int?
    var foulsAway: Int?
    var cornersHome: Int?
    var cornersAway: Int?
    var yellowHome: Int?
    var yellowAway: Int?
    var redHome: Int?
    var redAway: Int?
    
    init(id: UUID = UUID(), division: String = "Premiership", date: Date = Date(), homeTeam: String, awayTeam: String, ftHomeGoals: Int, ftAwayGoals: Int, ftResult: String = "?", htHomeGoals: Int = 0, htAwayGoals: Int = 0, htResult: String = "D", referee: String? = nil) {
        self.id = id
        self.division = division
        self.date = date
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.ftHomeGoals = ftHomeGoals
        self.ftAwayGoals = ftAwayGoals
        self.ftResult = ftResult
        self.htHomeGoals = htHomeGoals
        self.htAwayGoals = htAwayGoals
        self.htResult = htResult
        self.referee = referee
    }
}
