import '/componets/seller_form/seller_form_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth2_sellerform_widget.dart' show Auth2SellerformWidget;
import 'package:flutter/material.dart';

class Auth2SellerformModel extends FlutterFlowModel<Auth2SellerformWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for seller_form component.
  late SellerFormModel sellerFormModel;

  @override
  void initState(BuildContext context) {
    sellerFormModel = createModel(context, () => SellerFormModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sellerFormModel.dispose();
  }
}
