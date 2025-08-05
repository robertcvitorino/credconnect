// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoanEntity {
  int? get id => throw _privateConstructorUsedError;
  int get clientId => throw _privateConstructorUsedError;
  String get loanAmount => throw _privateConstructorUsedError;
  String? get requestDate => throw _privateConstructorUsedError;
  String get tax => throw _privateConstructorUsedError;
  String get term => throw _privateConstructorUsedError;

  /// Create a copy of LoanEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoanEntityCopyWith<LoanEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanEntityCopyWith<$Res> {
  factory $LoanEntityCopyWith(
          LoanEntity value, $Res Function(LoanEntity) then) =
      _$LoanEntityCopyWithImpl<$Res, LoanEntity>;
  @useResult
  $Res call(
      {int? id,
      int clientId,
      String loanAmount,
      String? requestDate,
      String tax,
      String term});
}

/// @nodoc
class _$LoanEntityCopyWithImpl<$Res, $Val extends LoanEntity>
    implements $LoanEntityCopyWith<$Res> {
  _$LoanEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoanEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clientId = null,
    Object? loanAmount = null,
    Object? requestDate = freezed,
    Object? tax = null,
    Object? term = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      loanAmount: null == loanAmount
          ? _value.loanAmount
          : loanAmount // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: freezed == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String?,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as String,
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoanEntityImplCopyWith<$Res>
    implements $LoanEntityCopyWith<$Res> {
  factory _$$LoanEntityImplCopyWith(
          _$LoanEntityImpl value, $Res Function(_$LoanEntityImpl) then) =
      __$$LoanEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int clientId,
      String loanAmount,
      String? requestDate,
      String tax,
      String term});
}

/// @nodoc
class __$$LoanEntityImplCopyWithImpl<$Res>
    extends _$LoanEntityCopyWithImpl<$Res, _$LoanEntityImpl>
    implements _$$LoanEntityImplCopyWith<$Res> {
  __$$LoanEntityImplCopyWithImpl(
      _$LoanEntityImpl _value, $Res Function(_$LoanEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoanEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clientId = null,
    Object? loanAmount = null,
    Object? requestDate = freezed,
    Object? tax = null,
    Object? term = null,
  }) {
    return _then(_$LoanEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      loanAmount: null == loanAmount
          ? _value.loanAmount
          : loanAmount // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: freezed == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String?,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as String,
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoanEntityImpl implements _LoanEntity {
  const _$LoanEntityImpl(
      {this.id,
      required this.clientId,
      required this.loanAmount,
      this.requestDate,
      required this.tax,
      required this.term});

  @override
  final int? id;
  @override
  final int clientId;
  @override
  final String loanAmount;
  @override
  final String? requestDate;
  @override
  final String tax;
  @override
  final String term;

  @override
  String toString() {
    return 'LoanEntity(id: $id, clientId: $clientId, loanAmount: $loanAmount, requestDate: $requestDate, tax: $tax, term: $term)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.loanAmount, loanAmount) ||
                other.loanAmount == loanAmount) &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.term, term) || other.term == term));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, clientId, loanAmount, requestDate, tax, term);

  /// Create a copy of LoanEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanEntityImplCopyWith<_$LoanEntityImpl> get copyWith =>
      __$$LoanEntityImplCopyWithImpl<_$LoanEntityImpl>(this, _$identity);
}

abstract class _LoanEntity implements LoanEntity {
  const factory _LoanEntity(
      {final int? id,
      required final int clientId,
      required final String loanAmount,
      final String? requestDate,
      required final String tax,
      required final String term}) = _$LoanEntityImpl;

  @override
  int? get id;
  @override
  int get clientId;
  @override
  String get loanAmount;
  @override
  String? get requestDate;
  @override
  String get tax;
  @override
  String get term;

  /// Create a copy of LoanEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoanEntityImplCopyWith<_$LoanEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
