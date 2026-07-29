package resin;

import haxe.macro.Context;
import haxe.macro.Compiler;

class Utilities {
  public static final OUTPUT_VAR_PATTERN = ~/\$(\w+)/g;

  public static function output_interp() {
    final output = Compiler.getOutput();

    final interpolated = interpolate(output);

    Compiler.setOutput(interpolated);
  }

  public static function interpolate(content: String, ?defines: Map<String, String> = null) {
    if(defines == null)
      defines = Context.getDefines();

    return OUTPUT_VAR_PATTERN.map(content, ereg -> {
      final key = ereg.matched(1);
      final pos = Context.currentPos();

      return if(defines.exists(key)) 
        defines.get(key)
      else 
        Context.error('cannot resolve define `$key`', pos);
    });
  }
}
