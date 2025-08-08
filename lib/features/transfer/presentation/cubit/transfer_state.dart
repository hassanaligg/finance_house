
abstract class TransferState {}
class TransferInitial extends TransferState {}
class TransferLoading extends TransferState {}
class TransferLoaded extends TransferState {
  final int? selectedAmount;
  TransferLoaded(this.selectedAmount);
}
class TransferError extends TransferState {
  final String error;
  TransferError(this.error);
}

