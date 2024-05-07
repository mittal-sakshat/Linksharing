package linksharing

class Users {
    String username
    String email
    String password
    String firstName
    String lastName
    byte[] photo
    Boolean admin
    Boolean active
    String confirmPassword
    Date dateCreated
    Date lastUpdated
//    static transients = ['confirmPassword']
    static hasMany = [resources: Resources,readingItems: ReadingItem,
                      subscriptions: Subscription,
                      topics: Topic,resourceRatings: ResourceRating]

    static constraints = {
        email(unique: true, email: true, blank: false)
        username(unique: true, blank: false)
        password(minSize: 5, blank: false)
        firstName(blank: false)
        lastName(blank: false)
        photo(nullable: true,)
        admin(nullable: true)
        active(nullable: true)

    }
    String getfullName() {
        return "${firstName} ${lastName}"
    }

}
