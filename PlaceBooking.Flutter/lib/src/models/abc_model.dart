import 'package:json_annotation/json_annotation.dart';

part 'abc_model.g.dart';
@JsonSerializable()
class Abc {
  final int id;
  final String name;

  Abc(
      { this.id,
        this.name
      });

  factory Abc.fromJson(Map<String, dynamic> json) => _$AbcFromJson(json);

  Map<String, dynamic> toJson() => _$AbcToJson(this);
}