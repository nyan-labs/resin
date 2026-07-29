package resin;

import haxe.macro.Context;
import haxe.macro.Compiler;

class Utilities {
    static final OUTPUT_VAR_PATTERN = ~/\$(\w+)/g;

    public static function output_interp() {
        final defines = Context.getDefines();
        final output = Compiler.getOutput();

        final fixed_output = OUTPUT_VAR_PATTERN.map(output, _ -> {
            final key = _.matched(1);
            final current_position = Context.currentPos();

            return defines.exists(key) ? defines.get(key) : Context.error('Cannot resolve define `${key}`', current_position);
        });

        Compiler.setOutput(fixed_output);
    }
}
