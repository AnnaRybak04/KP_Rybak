import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TVState extends Equatable {
  const TVState({
    required this.status,
    required this.errorMessage,
    required this.tvShowsPagingController,
  });

  factory TVState.loading() {
    return TVState(
      status: MainStatus.loading,
      errorMessage: '',
      tvShowsPagingController: PagingController(firstPageKey: 1),
    );
  }

  final MainStatus status;
  final String errorMessage;
  final PagingController<int, TVShowItem> tvShowsPagingController;

  @override
  List<Object> get props => [status, errorMessage, tvShowsPagingController];

  TVState copyWith({
    MainStatus? status,
    String? errorMessage,
    PagingController<int, TVShowItem>? tvShowsPagingController,
  }) {
    return TVState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? '',
      tvShowsPagingController: tvShowsPagingController ?? this.tvShowsPagingController,
    );
  }
}
