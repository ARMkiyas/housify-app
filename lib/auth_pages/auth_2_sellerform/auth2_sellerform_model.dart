import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'auth2_sellerform_widget.dart' show Auth2SellerformWidget;
import 'package:flutter/material.dart';

class Auth2SellerformModel extends FlutterFlowModel<Auth2SellerformWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for dob widget.
  FocusNode? dobFocusNode;
  TextEditingController? dobTextController;
  String? Function(BuildContext, String?)? dobTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for id_type widget.
  IdTypes? idTypeValue;
  FormFieldController<IdTypes>? idTypeValueController;
  // State field(s) for id_number widget.
  FocusNode? idNumberFocusNode;
  TextEditingController? idNumberTextController;
  String? Function(BuildContext, String?)? idNumberTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    dobFocusNode?.dispose();
    dobTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    idNumberFocusNode?.dispose();
    idNumberTextController?.dispose();
  }
}
