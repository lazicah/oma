import 'package:equatable/equatable.dart';
import 'package:oma/enums/page_type.dart';

abstract class AppEvents extends Equatable {
  const AppEvents();

  @override
  List<Object> get props => [];
}

class SetCurrentPage extends AppEvents {
  final PageType pageType;

  SetCurrentPage(this.pageType);

  @override
  List<Object> get props => [pageType];

  @override
  String toString() {
    return 'Page Set to $pageType';
  }
}
