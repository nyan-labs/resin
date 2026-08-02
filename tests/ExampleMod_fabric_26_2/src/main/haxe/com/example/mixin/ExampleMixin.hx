package com.example.mixin;

import java.NativeArray;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

@:build(resin.Mixin.build())
@:mixin([net.minecraft.server.MinecraftServer])
class ExampleMixin {
  @:field(at = org.spongepowered.asm.mixin.injection.At(value = "HEAD"), method = "loadLevel")
	private function init(info: CallbackInfo): Void {
    trace("Minecraft server mixin in Haxe is working!");
  }
}