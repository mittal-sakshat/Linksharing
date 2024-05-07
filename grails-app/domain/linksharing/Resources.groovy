package linksharing

class Resources {
    String description
    Users user
    Topic topic
    Date dateCreated
    Date lastUpdated
    String url
    byte[] filePath
    boolean deleted
    Float average

    static belongsTo = [topic:Topic,user:Users]
    static hasMany = [readingItems:ReadingItem,resourceRatings: ResourceRating]
//    static mapping = {
//        readingItems fetch: 'join'
//    }

//    static transients = ['topicName']


    static constraints = {
        average(defaultValue: 0)
        url nullable: true
        filePath nullable: true
    }
}
