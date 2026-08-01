package com.example;

import net.fabricmc.api.ModInitializer;

import net.minecraft.resources.Identifier;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

class ExampleMod implements ModInitializer {
  public static final MOD_ID = "modid";  

	public static final LOGGER: Logger = LoggerFactory.getLogger(MOD_ID);

  public function new() {}

  public function onInitialize() {
    ExampleRegistry.initialize();

		LOGGER.info("Hello Fabric world from Haxe!");
  }

  public static function id(path: String)
    return Identifier.fromNamespaceAndPath(MOD_ID, path);
}