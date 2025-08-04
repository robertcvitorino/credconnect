import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_entity.freezed.dart';


@freezed
class ClientEntity with _$ClientEntity {
  const factory ClientEntity({
     int? id,
    required String name,
    String? gender,
    String? birthDate,
    String? address,
    required String nid,
  }) = _ClientEntity;
}