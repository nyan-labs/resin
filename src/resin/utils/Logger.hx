package resin.utils;

import haxe.PosInfos;
import plasma.Renderer;

final class Logger {
  inline static function template(text: String, what: String, ?pos: PosInfos) {
    final pos = pos != null ? pos.fileName + ":" + pos.lineNumber : "";
    final position = Renderer.render('@ $pos', [Dim, FgRgb(160, 250, 0)]);
    final resin_tag = Renderer.render("resin", [FgRgb(252, 160, 30)]);
    return '$position\n$resin_tag::$what $text';
  }

  static var print = Sys.println;

  public static function warning(content: String, ?pos: PosInfos)
    print(template(content, Renderer.render("warning", [Bold, FgBasic(3)]), pos));

  public static function info(content: String, ?pos: PosInfos)
    print(template(content, Renderer.render("info", [Bold, FgBasic(6)]), pos));

  public static function error(content: String, ?pos: PosInfos)
    print(template(content, Renderer.render("error", [Bold, FgBasic(1)]), pos));
}
