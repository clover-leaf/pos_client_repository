import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'typedef.dart';

part 'gen/category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  /// {macro Category}
  const Category({
    required this.id,
    required this.name,
  });

  final int id;

  final String name;

  /// Deserializes the given [JsonMap] into a [Category].
  static Category fromJson(JsonMap json) {
    return _$CategoryFromJson(json);
  }

  /// Converts this [Category] into a [JsonMap].
  JsonMap toJson() => _$CategoryToJson(this);

  /// Returns a copy of [Category] with given parameters
  Category copyWith({
    int? id,
    String? name,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
