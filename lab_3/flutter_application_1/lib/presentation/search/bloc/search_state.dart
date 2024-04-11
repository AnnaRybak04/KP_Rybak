import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/search_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchState extends Equatable {
  const SearchState({
    required this.status,
    required this.pagingController,
    required this.errorMessage,
    required this.isSearchVisible,
  });

  factory SearchState.loading() {
    return SearchState(
      status: MainStatus.loading,
      pagingController: PagingController(firstPageKey: 1),
      errorMessage: '',
      isSearchVisible: false,
    );
  }

  final MainStatus status;
  final String errorMessage;
  final PagingController<int, SearchItem> pagingController;
  final bool isSearchVisible;

  @override
  List<Object> get props => [status, pagingController, errorMessage, isSearchVisible];

  SearchState copyWith({
    MainStatus? status,
    PagingController<int, SearchItem>? pagingController,
    String? errorMessage,
    bool? isSearchVisible,
  }) {
    return SearchState(
      status: status ?? this.status,
      pagingController: pagingController ?? this.pagingController,
      isSearchVisible: isSearchVisible ?? this.isSearchVisible,
      errorMessage: errorMessage ?? '',
    );
  }
}
