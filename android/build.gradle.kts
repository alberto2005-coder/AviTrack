allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    val proj = this
    if (proj.name != "app") {
        proj.plugins.whenPluginAdded {
            if (this is com.android.build.gradle.api.AndroidBasePlugin || this.toString().contains("com.android.build.gradle.LibraryPlugin")) {
                val android = proj.extensions.findByName("android") as? com.android.build.gradle.BaseExtension
                if (android != null && android.namespace == null) {
                    android.namespace = "com.avitrack." + proj.name.replace("-", "_")
                }
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
