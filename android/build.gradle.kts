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
    proj.plugins.whenPluginAdded {
        if (this is com.android.build.gradle.api.AndroidBasePlugin || this.toString().contains("com.android.build.gradle.LibraryPlugin")) {
            val android = proj.extensions.findByName("android") as? com.android.build.gradle.BaseExtension
            if (android != null && android.namespace == null) {
                // For isar_flutter_libs specifically, we use its package name
                if (proj.name == "isar_flutter_libs") {
                    android.namespace = "dev.isar.isar_flutter_libs"
                } else {
                    android.namespace = "com.avitrack." + proj.name.replace("-", "_")
                }
            }
        }
    }
}

subprojects {
    afterEvaluate {
        if (project.extensions.findByName("android") != null) {
            project.extensions.configure<com.android.build.gradle.BaseExtension> {
                compileSdkVersion(34)
                defaultConfig {
                    targetSdkVersion(34)
                }
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
