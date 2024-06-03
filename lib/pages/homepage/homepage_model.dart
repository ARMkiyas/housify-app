import '/componets/cus_home/cus_home_widget.dart';
import '/componets/nav/nav_widget.dart';
import '/componets/seller_home/seller_home_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_widget.dart' show HomepageWidget;
import 'package:flutter/material.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - issellervarfied] action in homepage widget.
  bool? isvaliduser;
  // Model for cus_home component.
  late CusHomeModel cusHomeModel;
  // Model for seller_home component.
  late SellerHomeModel sellerHomeModel;
  // Model for nav component.
  late NavModel navModel;

  @override
  void initState(BuildContext context) {
    cusHomeModel = createModel(context, () => CusHomeModel());
    sellerHomeModel = createModel(context, () => SellerHomeModel());
    navModel = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cusHomeModel.dispose();
    sellerHomeModel.dispose();
    navModel.dispose();
  }
}
