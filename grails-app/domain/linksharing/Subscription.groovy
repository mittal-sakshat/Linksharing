package linksharing

class Subscription {
    Topic topic
    Users user
    Seriousness seriousness
    static belongsTo = [topic:Topic,user: Users]
    Date dateCreated
    static constraints = {
    }
    enum Seriousness{
        Serious,
        Very_Serious,
        Casual
    }
}
