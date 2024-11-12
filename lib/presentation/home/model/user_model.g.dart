// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      created_at: DateTime.parse(json['created_at'] as String),
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'created_at': instance.created_at.toIso8601String(),
      'name': instance.name,
      'age': instance.age,
      'description': instance.description,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      created_at: DateTime.parse(json['created_at'] as String),
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'created_at': instance.created_at.toIso8601String(),
      'name': instance.name,
      'age': instance.age,
      'description': instance.description,
    };
