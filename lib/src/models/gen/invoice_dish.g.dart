// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../invoice_dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceDish _$InvoiceDishFromJson(Map<String, dynamic> json) => InvoiceDish(
      id: json['id'] as String?,
      invoiceId: json['invoice_id'] as String,
      dishId: json['dish_id'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$InvoiceDishToJson(InvoiceDish instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice_id': instance.invoiceId,
      'dish_id': instance.dishId,
      'quantity': instance.quantity,
    };
