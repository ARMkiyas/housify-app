import '/components/location_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cus_home_widget.dart' show CusHomeWidget;
import 'package:flutter/material.dart';

class CusHomeModel extends FlutterFlowModel<CusHomeWidget> {
  ///  Local state fields for this component.

  bool showplacepicker = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for LocationPicker component.
  late LocationPickerModel locationPickerModel;

  @override
  void initState(BuildContext context) {
    locationPickerModel = createModel(context, () => LocationPickerModel());
  }

  @override
  void dispose() {
    locationPickerModel.dispose();
  }
}
