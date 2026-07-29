package resin.utils;

final class Logger {
  // add posinfo
  inline static function template(text: String, what: String)
    return '\x1B[38;2;252;160;30mresin\x1B[0m::$what $text';

  static var print = Sys.println; 

  public static function warning(content: String)
    print(
      template(content, '\x1B[1;33mwarning\x1B[0m')
    );

  public static function info(content: String)
    print(
      template(content, '\x1B[1;36minfo\x1B[0m')
    );

  public static function error(content: String)
    print(
      template(content, '\\x1B[1;31merror\x1B[0m')
    );
}