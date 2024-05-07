package linksharing

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class ResourcesSpec extends Specification implements DomainUnitTest<Resources> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        given:
        def a = 1
        def b = 2
        ResourcesService r = Mock(ResourcesService)
        when:
        def res = r.add(a,b)
        then:
        res==3
    }
}
