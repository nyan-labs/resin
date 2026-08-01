package com.example;

import net.minecraft.world.food.FoodProperties.FoodProperties_Builder;
import net.fabricmc.fabric.api.creativetab.v1.FabricCreativeModeTabOutput;
import net.minecraft.world.item.CreativeModeTab;
import net.minecraft.world.item.ItemStack;
import net.fabricmc.fabric.api.creativetab.v1.CreativeModeTabEvents;
import net.minecraft.world.item.CreativeModeTabs;
import net.minecraft.core.Registry;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.core.registries.Registries;
import net.minecraft.world.item.Item;
import net.minecraft.resources.ResourceKey;

class ExampleRegistry {
	public static function create(name: String): ResourceKey<Item> {
		return ResourceKey.create(Registries.ITEM, ExampleMod.id(name));
	} 

  public static var HAXE_KEY = create("haxe");

	public static function register(item_key: ResourceKey<Item>, factory: Item_Properties->Item, settings: Item_Properties): Item {
		var item: Item = factory(settings.setId(item_key));

		Registry.register(BuiltInRegistries.ITEM, item_key, item);

		return item;
	}

  public static var HAXE = register(ExampleRegistry.HAXE_KEY, Item.new, new Item_Properties()
    .food(new FoodProperties_Builder()
      .nutrition(5)
      .build()
    )
  );
  
  public static function initialize() {
    CreativeModeTabEvents.modifyOutputEvent(CreativeModeTabs.FOOD_AND_DRINKS)
      .register(ExampleMod.id("haxe"), (tab: FabricCreativeModeTabOutput) -> 
        tab.accept(new ItemStack(ExampleRegistry.HAXE, 1), PARENT_AND_SEARCH_TABS)
      );

    ExampleMod.LOGGER.info("ExampleMod's example registry is initialized!");
  }
}