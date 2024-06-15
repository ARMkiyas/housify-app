import '/componets/offer_card/offer_card_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'service_details_page_widget.dart' show ServiceDetailsPageWidget;
import 'package:flutter/material.dart';

class ServiceDetailsPageModel
    extends FlutterFlowModel<ServiceDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for offerCard component.
  late OfferCardModel offerCardModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for Hours_count widget.
  int? hoursCountValue;

  @override
  void initState(BuildContext context) {
    offerCardModel = createModel(context, () => OfferCardModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    offerCardModel.dispose();
  }
}
