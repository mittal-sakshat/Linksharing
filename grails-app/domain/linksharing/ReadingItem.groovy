package linksharing

class ReadingItem {
    Resources resource
    Users user
    Boolean isRead

    static belongsTo = [user:Users,resource:Resources]

    static constraints = {
    }
}