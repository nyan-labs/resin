# resin
> [!WARNING]
> this library is STILL in development, so expect possible bugs or non-existing features.

![resin logo](https://github.com/nyan-labs/resin/blob/main/icon.png?raw=true)

resin is a Minecraft modding framework for Haxe. It let's you write mods for modloaders like Fabric, Forge, NeoForge and more.

recommended minimum version of Haxe is 5.0.0, as newer Haxe produces working bytecode for newer Java runtimes.

as of right now there isn't much documentation, but a good starting point is to look at the `tests/` directory.

# instructions 
to get started with using this library, you have to install this via `haxelib git resin https://github.com/nyan-labs/resin`

you should copy the `tests/ExampleMod_fabric_26_2`, as i don't have a template yet made or a command to easily set up a mod.

run `haxe -L resin --macro Gradle.task_save_dependencies\(\)` to get the required libraries for externs. (this is important)

to test if everything worked, run `haxe build.hxml`, it should compile into a jar in `build/libs/`.

congrats! you have set up the environment to create a mod, please keep in mind this library is in development, so don't expect everything to work 100%.

# contributions
feel free to contribute! but keep in mind these:
* please do format your code
* avoid contributing with AI code, your pull requests will not be merged