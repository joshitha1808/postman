// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'user.g.dart';

@Entity()
@JsonSerializable()
class User {
  @Id()
  int? id;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User({this.id});

  User copyWith({int? id}) => User(id: id ?? this.id);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User(id: $id';
  }
}
