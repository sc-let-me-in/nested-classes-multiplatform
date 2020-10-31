package foo.bar.test.common

import kotlinx.serialization.Serializable

object Fizz {
    data class Hello(
        val myName: String
    )
}

data class Hey(
    val myName: String
)
