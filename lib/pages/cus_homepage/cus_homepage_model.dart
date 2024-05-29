import '/flutter_flow/flutter_flow_util.dart';
import 'cus_homepage_widget.dart' show CusHomepageWidget;
import 'package:flutter/material.dart';

class CusHomepageModel extends FlutterFlowModel<CusHomepageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
