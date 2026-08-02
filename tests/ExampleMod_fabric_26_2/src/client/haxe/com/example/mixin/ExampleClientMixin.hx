package com.example.mixin;

import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

@:build(resin.Mixin.build())
@:mixin(targets = ["net.minecraft.client.Minecraft"], [])
class ExampleClientMixin {
	@:inject(at = org.spongepowered.asm.mixin.injection.At(value = "HEAD"), method = "run")
	private function init(info: CallbackInfo): Void {
    trace("Minecraft client mixin in Haxe is working!");
  }
}