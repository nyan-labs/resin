package com.example.mixin;

import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

// issue: this isn't transformed as @Mixin(server.MinecraftServer.class), currently its @Mixin(server.MinecraftServer)
@:meta(org.spongepowered.asm.mixin.Mixin(value = net.minecraft.server.MinecraftServer))
class ExampleMixin {

	@:meta(org.spongepowered.asm.mixin.injection.Inject(at = org.spongepowered.asm.mixin.injection.At(value = "HEAD"), method = "loadLevel"))
	private function init(info: CallbackInfo): Void {
    trace("hi world");
  }
}