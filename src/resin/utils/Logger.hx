package resin.utils;

final class Logger {
  // ill clean this up later.. sorry!
  inline static function template(text: String, what: String, ?pos:haxe.PosInfos)
    return '\x1B[38;2;160;250;0m\x1B[2m@ ${if(pos != null) pos.fileName + ":" + pos.lineNumber}\x1B[0m\n\x1B[38;2;252;160;30mresin\x1B[0m::$what $text';

  static var print = Sys.println; 

  public static function warning(content: String, ?pos:haxe.PosInfos)
    print(
      template(content, '\x1B[1;33mwarning\x1B[0m', pos)
    );

  public static function info(content: String, ?pos:haxe.PosInfos)
    print(
      template(content, '\x1B[1;36minfo\x1B[0m', pos)
    );

  public static function error(content: String, ?pos:haxe.PosInfos)
    print(
      template(content, '\\x1B[1;31merror\x1B[0m', pos)
    );
}