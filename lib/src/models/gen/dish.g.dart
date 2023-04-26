// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      id: json['id'] as String?,
      categoryId: json['category_id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
      'price': instance.price,
      'url': instance.url,
    };
