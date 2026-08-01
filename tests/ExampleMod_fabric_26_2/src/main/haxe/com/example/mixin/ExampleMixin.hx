package com.example.mixin;

import java.NativeArray;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

@:strict(org.spongepowered.asm.mixin.Mixin({
  value: [net.minecraft.server.MinecraftServer]
}))
@:nativeGen
class ExampleMixin {
	@:meta(org.spongepowered.asm.mixin.injection.Inject(at = org.spongepowered.asm.mixin.injection.At(value = "HEAD"), method = "loadLevel"))
	private function init(info: CallbackInfo): Void {
    trace("Minecraft server mixin in Haxe is working!");
  }
}