import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'typedef.dart';
import 'package:uuid/uuid.dart';

part 'gen/invoice.g.dart';

@JsonSerializable()
class Invoice extends Equatable {
  /// {macro Invoice}
  Invoice({
    String? id,
    required this.tableId,
    required this.tableRfid,
    required this.time,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;

  @JsonKey(name: 'table_id')
  final int tableId;

  @JsonKey(name: 'table_rfid')
  final String tableRfid;

  final DateTime time;

  /// Deserializes the given [JsonMap] into a [Invoice].
  static Invoice fromJson(JsonMap json) {
    return _$InvoiceFromJson(json);
  }

  /// Converts this [Invoice] into a [JsonMap].
  JsonMap toJson() => _$InvoiceToJson(this);

  /// Returns a copy of [Invoice] with given parameters
  Invoice copyWith({
    String? id,
    int? tableId,
    String? tableRfid,
    DateTime? time,
  }) {
    return Invoice(
      id: id ?? this.id,
      tableId: tableId ?? this.tableId,
      tableRfid: tableRfid ?? this.tableRfid,
      time: time ?? this.time,
    );
  }

  @override
  List<Object?> get props => [id, tableId, tableRfid, time];
}
