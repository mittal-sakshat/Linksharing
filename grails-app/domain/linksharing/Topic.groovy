package linksharing

class Topic {
    String name
    Users user
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    boolean deleted

    enum Visibility{
        Public,
        Private
    }
    static transients = ['resourceCount']
    static belongsTo = [user:Users]
    static hasMany = [subscriptions:Subscription,resources:Resources]


    static constraints = {
//        name unique: true
        name blank: false
    }
}