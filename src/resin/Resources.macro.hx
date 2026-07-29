package resin;

import haxe.io.Path;
import sys.io.File;
import haxe.io.Bytes;
import haxe.macro.Context;
import haxe.macro.Compiler;
import sys.FileSystem;

using StringTools;

class Resources {
  /** turns path "path/to/somewhere/hey.txt" with part "path/to/somewhere" to "hey.txt" */
  inline static function strip_part_of_path(path: String, part: String)
    return path.replace(Path.addTrailingSlash(part), "");

  /** reads every directory in the given path and flattens it into one array *WITH* the path */
  inline static function recurse_directory(path: String): Array<String> {
    var files = FileSystem.readDirectory(path);
    
    var file_paths = new Array<String>();
    
    for(file in files) {
      final full_path = Path.join([path, file]);

      if(FileSystem.isDirectory(full_path))
        for(f in recurse_directory(full_path)) 
          file_paths.push(f);
      else
        file_paths.push(full_path);
    }

    return file_paths;
  }

  /** includes resource(s) whether it's a file or directory. recursive/directory supporting equivalent of `--resource path/to/stuff.txt@stuff.txt` */
  public static function include(path: String) {
    var is_directory = FileSystem.isDirectory(path);

    var resources: Map<String, Bytes> = if(is_directory)
      [
        for(file in recurse_directory(path))
          strip_part_of_path(file, path) => File.getBytes(file)
      ];
    else
      [Path.withoutDirectory(path) => File.getBytes(path)];

    for(resource_path => resource_bytes in resources)
      Context.addResource(resource_path, resource_bytes);
  }
}