package resin.utils;

import sys.io.File;
import resin.utils.impl.ProjectConfigStructure;

// this is a stub, meaning theres literally nothing here
// i intend to write a toml project configuration thingy for this, or possibly xml 
@:publicFields
class Project {
  static var config: ProjectConfigStructure;

  static function from_file(path: String) {
    final content = File.getContent(path);
    
    from_string(content);
  }

  static function from_string(content: String) {
  }
}