import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_search_widget.dart' show LocationSearchWidget;
import 'package:flutter/material.dart';

class LocationSearchModel extends FlutterFlowModel<LocationSearchWidget> {
  ///  Local state fields for this component.

  bool displayList = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (ForwareGeoLocationEncording)] action in TextField widget.
  ApiCallResponse? geoListforward;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
