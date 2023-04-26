// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      id: json['id'] as String?,
      tableId: json['table_id'] as int,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'table_id': instance.tableId,
      'time': instance.time.toIso8601String(),
    };
