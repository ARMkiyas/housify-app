import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/logo_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'seller_form_widget.dart' show SellerFormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SellerFormModel extends FlutterFlowModel<SellerFormWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for logo component.
  late LogoModel logoModel;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for dob widget.
  FocusNode? dobFocusNode;
  TextEditingController? dobTextController;
  final dobMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dobTextControllerValidator;
  String? _dobTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked;
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

  // State field(s) for id_type widget.
  IdTypes? idTypeValue;
  FormFieldController<IdTypes>? idTypeValueController;
  // State field(s) for id_number widget.
  FocusNode? idNumberFocusNode;
  TextEditingController? idNumberTextController;
  String? Function(BuildContext, String?)? idNumberTextControllerValidator;
  String? _idNumberTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

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
  void initState(BuildContext context) {
    logoModel = createModel(context, () => LogoModel());
    nameTextControllerValidator = _nameTextControllerValidator;
    dobTextControllerValidator = _dobTextControllerValidator;
    addressTextControllerValidator = _addressTextControllerValidator;
    idNumberTextControllerValidator = _idNumberTextControllerValidator;
  }

  @override
  void dispose() {
    logoModel.dispose();
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
