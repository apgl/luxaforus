import SwiftyJSON

struct SlackStatus {
    /// Status text.
    let status: String
    
    /// Emoji string value.
    let emoji: String
    
    /// Status expiration time in epoch.
    let expiration: Int
    
    var jsonValue: JSON {
        return JSON(dictionaryLiteral: ("status_text", status), ("status_emoji", emoji), ("status_expiration", expiration))
    }
    
    init(withProfileResponse json: JSON) {
        status      = json["profile"]["status_text"].stringValue
        emoji       = json["profile"]["status_emoji"].stringValue
        expiration  = json["profile"]["status_expiration"].intValue
    }
    
    init(status statusText: String, emoji emojiString: String, expiration expirationTime: Int = 0) {
        status      = statusText
        emoji       = emojiString
        expiration  = expirationTime
    }
}

extension SlackStatus {
    static let pomodoro: SlackStatus = .init(status: "Focusing", emoji: ":tomato:")
    static let none: SlackStatus = .init(status: "", emoji: "")
}
