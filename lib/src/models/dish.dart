import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'typedef.dart';
import 'package:uuid/uuid.dart';

part 'gen/dish.g.dart';

@JsonSerializable()
class Dish extends Equatable {
  /// {macro Dish}
  Dish({
    String? id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.url,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;

  @JsonKey(name: 'category_id')
  final int categoryId;

  final String name;

  final double price;

  final String url;

  /// Deserializes the given [JsonMap] into a [Dish].
  static Dish fromJson(JsonMap json) {
    return _$DishFromJson(json);
  }

  /// Converts this [Dish] into a [JsonMap].
  JsonMap toJson() => _$DishToJson(this);

  /// Returns a copy of [Dish] with given parameters
  Dish copyWith({
    String? id,
    int? categoryId,
    String? name,
    double? price,
    String? url,
  }) {
    return Dish(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      price: price ?? this.price,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [id, categoryId, name, price, url];
}
