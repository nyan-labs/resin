package com.example.mixin;

import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;

@:meta(Mixin(MinecraftServer))
// @Mixin(MinecraftServer.class)
class ExampleMixin {
	@:meta(Inject(at = At("HEAD"), method = "loadLevel"))
	private function init(info: CallbackInfo) {
    trace("hi world");
  }
}