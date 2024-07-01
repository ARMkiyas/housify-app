import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_picker_widget.dart' show LocationPickerWidget;
import 'package:flutter/material.dart';

class LocationPickerModel extends FlutterFlowModel<LocationPickerWidget> {
  ///  Local state fields for this component.

  bool listPlaces = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for location_picker_field widget.
  FocusNode? locationPickerFieldFocusNode;
  TextEditingController? locationPickerFieldTextController;
  String? Function(BuildContext, String?)?
      locationPickerFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (ForwareGeoLocationEncording)] action in location_picker_field widget.
  ApiCallResponse? geoListforward;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    locationPickerFieldFocusNode?.dispose();
    locationPickerFieldTextController?.dispose();
  }
}
