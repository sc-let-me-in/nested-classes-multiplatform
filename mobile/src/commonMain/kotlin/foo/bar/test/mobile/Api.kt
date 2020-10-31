package foo.bar.test.mobile

import foo.bar.test.common.Fizz
import foo.bar.test.common.Hey

class Api() {
    // can't access from swift
    fun nestedArgFromOtherModule(hello: Fizz.Hello) {
        println("Hello: ${hello.myName}")
    }

    // can access
    fun argFromOtherModule(hey: Hey) {
        println("Hey: ${hey.myName}")
    }

    // can access
    fun nestedArgFromThisModule(nest: Nest.Nested) {
        println("Hello nester: ${nest.name}")
    }

    // can access
    fun noArgFunction() {
        println("bye")
    }
}

object Nest {
    data class Nested(
        val name: String
    )
}
