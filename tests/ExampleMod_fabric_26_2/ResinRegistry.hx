package net.nyanlabs.resin;

import net.minecraft.core.Registry;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.core.registries.Registries;
import net.minecraft.world.item.Item;
import net.minecraft.resources.ResourceKey;

class ResinRegistry {
	public static function create(name: String): ResourceKey<Item> {
		// Create the item key.
		return ResourceKey.create(Registries.ITEM, Resin.id(name));
	} 

  public static var KITTY_KEY = create("kitty");

	public static function register(itemKey: ResourceKey<Item>, itemFactory: Item_Properties->Item, settings: Item_Properties) {
		// Create the item instance.
    trace(itemKey);
		// var item: Item = itemFactory(settings.setId(itemKey));


    // Caused by: java.lang.IncompatibleClassChangeError: 
    //            Method 'java.lang.Object net.minecraft.core.Registry.register(net.minecraft.core.Registry, net.minecraft.resources.ResourceKey, java.lang.Object)' 
    //            must be InterfaceMethodref constant
    // this happens with fabric-api,
    // removing it gives: 
    // This registry can't create intrusive holders
    // and i think the problem is cause of "Registry.register(BuiltInRegistries.ITEM" becoming "Registry.register((Registry)BuiltInRegistries.ITEM", which i think is a java cast??

		// Register the item.
		Registry.register(BuiltInRegistries.ITEM, itemKey, new Item(new Item_Properties().setId(itemKey)));

		// return item;
	}

  
  public static function initialize() {
    register(ResinRegistry.KITTY_KEY, Item.new, new Item_Properties());
    trace("initialized registry for resin");
  }
}