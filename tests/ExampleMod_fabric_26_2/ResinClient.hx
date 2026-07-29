package net.nyanlabs.resin;

import net.fabricmc.api.ClientModInitializer;

class ResinClient implements ClientModInitializer {
  public function new() {
    
  }

  public function onInitializeClient() {
    trace("hi client");
  }
}