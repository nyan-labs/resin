package com.example.mixin;

import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

@:native("net.minecraft.client.Minecraft")
extern class Minecraft {

}


@:strict(org.spongepowered.asm.mixin.Mixin({
  value: [Minecraft]
}))
@:nativeGen
class ExampleClientMixin {
	@:meta(org.spongepowered.asm.mixin.injection.Inject(at = org.spongepowered.asm.mixin.injection.At(value = "HEAD"), method = "run"))
	private function init(info: CallbackInfo): Void {
    trace("Minecraft client mixin in Haxe is working!");
  }
}