import '/backend/schema/enums/enums.dart';
import '/componets/nav/nav_widget.dart';
import '/componets/seller_home/seller_home_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'seller_home_page_widget.dart' show SellerHomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SellerHomePageModel extends FlutterFlowModel<SellerHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for seller_home component.
  late SellerHomeModel sellerHomeModel;
  // Model for nav component.
  late NavModel navModel;

  @override
  void initState(BuildContext context) {
    sellerHomeModel = createModel(context, () => SellerHomeModel());
    navModel = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sellerHomeModel.dispose();
    navModel.dispose();
  }
}
