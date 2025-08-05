import 'package:freezed_annotation/freezed_annotation.dart';
part 'loan_entity.freezed.dart';

@freezed
class LoanEntity with _$LoanEntity {
  const factory LoanEntity({
     int? id,
    required int clientId,
    required String loanAmount,
     String? requestDate,
    required String tax,
    required String term
  }) = _LoanEntity;
}