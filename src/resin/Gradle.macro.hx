package resin;

import sys.FileSystem;
import sys.io.File;
import haxe.io.Path;
import haxe.macro.Context;
import haxe.macro.Compiler;

using StringTools;

class Gradle {
  // we might be able to inject this at the end of the file in build.gradle.
  // that should be optional i dont wanna mess with peoples configs
  static final code_task_get_dependencies = 'task __resin_save_dependencies(type: Copy) {
  from sourceSets.main.compileClasspath
  into "java_libs/"
}';

  public static var exists(get, never): Bool;
  inline static function get_exists()
    return FileSystem.exists(gradlew);

  public static var gradlew(get, never): String;
  inline static function get_gradlew()
    return Context.definedValue("resin.gradlew.path") ?? switch Sys.systemName() {
      case "Windows": "./gradlew.bat";
      case "Linux", "Mac", "BSD": "./gradlew";

      case _: "a path to gradlew must be defined for your system using -D resin.gradlew.path"; // realistically no one will get to this but still :3
    };

  public static function run(args: Array<String>) {
    var status_code = if(exists) Sys.command(gradlew, args); 
      else throw "can't find a path to gradlew! have you installed it or set a define -D resin.gradlew.path=\"path/to/gradlew\"?";

    return status_code == 0;
  }

  // custom
  public static function task_save_dependecies() {
    var success = run([
      "__resin_save_dependencies"
    ]);

    if(!success)
      throw 'command __resin_save_dependencies failed. to use this library, you *must* define a custom task for java library extern injection, else it can\'t use the required libraries.';
  }

  // this isn't quite --java-lib-extern (as i checked the compiler source code), but it's okay!
  inline public static function add_native_libs()
    Compiler.addNativeLib("java_libs/");

  public static function init() {
    task_save_dependecies(); // we should check for any changes or smth cuz rn this runs EVERYTIME you compile

    add_native_libs();
    // get_libs();
    // Compiler.addNativeLib("~/.gradle/caches/modules-2/files-2.1");
    // Compiler.flag("java-extern-lib", "libs/");
  }
}