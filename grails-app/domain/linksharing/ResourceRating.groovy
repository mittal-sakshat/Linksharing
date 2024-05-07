package linksharing

class ResourceRating {
    Resources resource
    Users user
    Integer score

    static belongsTo = [user:Users,resource:Resources]
    static constraints = {
    }
}