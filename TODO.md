* [X] whole `assets` folder added with haxe `--resource` 
* [X] variable interpolation in target output filenames `-D version="0.0.0" --jvm meow-$version.jar`
* [ ] other minecraft version and/or modloader support (?)
* [x] mixin support
  * [X] easy mixin api
    * [ ] enum abstract for `at`? like: `@:inject(at = HEAD, method = "loadLevel")`
* [ ] simplified config for multiloader n multiversion (xml? toml?)
* [x] logger for logging what resin does while building
  * [x] have color abstract enums + a XyzTools class for applying (fg/bg) color to text
* [ ] cross-loader cross-version api for stuff like Registry and whatnot
* [ ] [BUG] net.minecraft.client.* does not exist for some reason 