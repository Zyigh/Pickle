import Foundation

public enum Level: Int, Codable {
    case jeunepousse, arbuste, vieuxchene
}

public enum BGColor: String, Codable {
    case green, pink, purple
}

public struct User : Codable {
    public var id: UUID?
    public var email: String?
    public var nickname: String?
    public var password: String?
    public var missions = [Mission]()
    public var level: Level
    public var elo : Elo
    
    public init(
        id: UUID?,
        email: String?,
        nickname: String?,
        password: String?,
        missions: [Mission]?,
        level: Level,
        elo : Elo
        ) {
        self.id = id
        self.email = email
        self.nickname = nickname
        self.password = password
        self.missions = missions ?? []
        self.level = level
        self.elo = elo
    }
}

public struct Mission : Codable {
    public var id: UUID?
    //    let duration: DateInterval?
    public var duration: Int?
    public var description: String?
    public var image: String?
    public var bgColor: BGColor?
    public var mainSubject: String?
    public var explanations: String?
    public var tips : [String]?
    public var elo : Elo
    public var results: String?
    
    public init(id: UUID?,
                duration: Int?,
                description: String?,
                image: String?,
                mainSubject: String?,
                explanations: String?,
                tips : [String]?,
                elo : Elo,
                results: String?,
                bgColor: BGColor?
        ) {
        self.id = id
        self.duration = duration
        self.description = description
        self.image = image
        self.mainSubject = mainSubject
        self.explanations = explanations
        self.tips  = tips
        self.elo  = elo
        self.results = results
        self.bgColor = bgColor
    }
}

public struct Elo : Codable {
    public var energy : Int
    public var waste : Int
    public var food : Int
    
    public init(
        energy: Int,
        waste: Int,
        food: Int
        ) {
        self.energy = energy
        self.waste = waste
        self.food = food
    }
}

enum eloCategory : String {
    case energy, waste, food
}

infix operator ==
extension Mission {
    public static func == (_ lhs: Mission, _ rhs: Mission) -> Bool {
        return lhs.id == rhs.id
    }
}
extension User {
    public static func == (_ lhs: User, _ rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Mission {
    public func mainSubjectToFrench() -> String? {
        var french: String? = nil
        if let subject = mainSubject,
            let cat = eloCategory(rawValue: subject) {
            switch cat {
            case .energy:
                french = "ÉNERGIE"
            case .waste:
                french = "0 DÉCHET"
            case .food:
                french = "ALIMENTATION"
            }
        }
        
        return french
    }
}

