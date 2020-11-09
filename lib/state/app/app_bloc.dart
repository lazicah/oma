import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oma/enums/page_type.dart';
import 'package:oma/state/app/app_events.dart';

class AppBloc extends Bloc<AppEvents, PageType> {
  AppBloc() : super(PageType.Transactions);

  @override
  Stream<PageType> mapEventToState(AppEvents event) async* {
    if (event is SetCurrentPage) {
      yield event.pageType;
    }
  }
}
