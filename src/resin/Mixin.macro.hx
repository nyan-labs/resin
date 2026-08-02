package resin;

import haxe.macro.Expr;
import haxe.macro.Expr.Metadata;
import haxe.macro.Type.ClassType;
import haxe.macro.Type.ClassField;
import haxe.macro.Expr.Field;
import haxe.macro.Context;

typedef InjectParams = {
  final at: String;
  final method: String;
}

typedef MixinParams = {
  var targets: Array<String>;
  var value: Class<Any>;
}

// i think this should register the inject and mixin metadatas in an init macro
class Mixin {
  public static function build(): Array<Field> {
    final fields = Context.getBuildFields();

    final cls = Context.getLocalClass()?.get();
    if(cls == null)
      return fields;
    
    var mixin_metas = cls.meta.extract(":mixin");
    for(meta in mixin_metas)
      mixin(cls, meta);

    for(field in fields) {
      var index = fields.indexOf(field);

      var inject_metas = field.meta ?? [];
      for(meta in inject_metas)
        if(meta.name == ":inject")
          inject(field, meta);

      fields[index] = field;
    }

    return fields;
  }

  public static function inject(field: Field, meta: MetadataEntry) {
    if(meta.params == null)
      return;

    final params = meta.params;

    field.meta.push({
      name: ":meta",
      params: [macro org.spongepowered.asm.mixin.injection.Inject($a{params})],
      pos: meta.pos
    });
  }

  public static function mixin(cls: ClassType, meta: MetadataEntry) {
    if(meta.params == null)
      return;

    // this makes haxe not touch this class since the org.spongepowered.asm.mixin.Mixin library
    // wants a pure class, for some reason lol
    cls.meta.add(":nativeGen", [], Context.currentPos());
      
    // we turn `name = value` into {name: value}, 
    // because @:strict has different syntax from @:meta, why haxe, why?
    final params = convert_binop_to_object_decl(meta.params);
    
    // heres the ACTUAL @Mixin
    cls.meta.add(":strict", [
      macro org.spongepowered.asm.mixin.Mixin($params)
    ], Context.currentPos());
  }

  inline static function convert_binop_to_object_field(expr: Expr): ObjectField {
    var object_field = switch expr.expr {
      case EBinop(op, e1, e2):
        var name = switch e1.expr {
          case EConst(CIdent(s)): s;
          case _: throw "must be an identifier";
        }

        switch op {
          case OpAssign: null;
          case _: throw "must be an assign";
        }

        var value = e2;

        {
          field: name,
	        expr: value
        };
      case _: 
        // default value ig
        {
          field: "value",
	        expr: expr
        };
    }

    return object_field;
  }

  inline static function convert_binop_to_object_decl(exprs: Array<Expr>) {
    var fields = new Array<ObjectField>();
    for(expr in exprs) {
      var object_field = convert_binop_to_object_field(expr);

      fields.push(object_field);
    }

    return {
      expr: EObjectDecl(fields),
      pos: Context.currentPos()
    };
  }
}