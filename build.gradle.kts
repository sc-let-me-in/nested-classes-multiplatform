buildscript {
    repositories {
        google()
        jcenter()
    }
    dependencies {
        classpath(Versions.Build.KOTLIN_GRADLE_PLUGIN)
    }
}

allprojects {
    repositories {
        google()
        jcenter()
        mavenCentral()
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}
