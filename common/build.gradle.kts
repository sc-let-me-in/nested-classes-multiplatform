plugins {
    kotlin("multiplatform")
    kotlin("plugin.serialization") version KOTLIN_VERSION
}

kotlin {
    jvm()
    ios()

    sourceSets {
        val commonMain by getting {
            dependencies {
                implementation("org.jetbrains.kotlin:kotlin-stdlib-common")
            }
        }
    }
}

