import '/backend/schema/enums/enums.dart';
import '/components/back_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'order_view_page_widget.dart' show OrderViewPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class OrderViewPageModel extends FlutterFlowModel<OrderViewPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  final phoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;
  String? _notesTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for paymentmethod widget.
  PaymentMethod? paymentmethodValue;
  FormFieldController<PaymentMethod>? paymentmethodValueController;
  // Model for back_header component.
  late BackHeaderModel backHeaderModel;

  @override
  void initState(BuildContext context) {
    addressTextControllerValidator = _addressTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    notesTextControllerValidator = _notesTextControllerValidator;
    backHeaderModel = createModel(context, () => BackHeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    addressFocusNode?.dispose();
    addressTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();

    backHeaderModel.dispose();
  }
}
