import Foundation

public protocol FootballTeamm {
    var id: UUID? { get }
    
    var division: String { get }
    var name: String { get }
    var shortName: String { get }
    var imageName: String { get }
}
