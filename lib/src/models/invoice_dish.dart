import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'typedef.dart';
import 'package:uuid/uuid.dart';

part 'gen/invoice_dish.g.dart';

@JsonSerializable()
class InvoiceDish extends Equatable {
  /// {macro InvoiceDish}
  InvoiceDish({
    String? id,
    required this.invoiceId,
    required this.dishId,
    required this.quantity,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;

  @JsonKey(name: 'invoice_id')
  final String invoiceId;

  @JsonKey(name: 'dish_id')
  final String dishId;

  final int quantity;

  /// Deserializes the given [JsonMap] into a [InvoiceDish].
  static InvoiceDish fromJson(JsonMap json) {
    return _$InvoiceDishFromJson(json);
  }

  /// Converts this [InvoiceDish] into a [JsonMap].
  JsonMap toJson() => _$InvoiceDishToJson(this);

  /// Returns a copy of [InvoiceDish] with given parameters
  InvoiceDish copyWith({
    String? id,
    String? invoiceId,
    String? dishId,
    int? quantity,
  }) {
    return InvoiceDish(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      dishId: dishId ?? this.dishId,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [id, invoiceId, dishId, quantity];
}
