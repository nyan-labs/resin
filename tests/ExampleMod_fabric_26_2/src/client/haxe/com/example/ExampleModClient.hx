package com.example;

import net.fabricmc.api.ClientModInitializer;

import net.minecraft.resources.Identifier;

class ExampleModClient implements ClientModInitializer {
  public static final MOD_ID = "modid";  

  public function new() {}

	public function onInitializeClient() {
  }

  public static function id(path: String)
    return Identifier.fromNamespaceAndPath(MOD_ID, path);
}