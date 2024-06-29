import '/flutter_flow/flutter_flow_util.dart';
import 'adminage_widget.dart' show AdminageWidget;
import 'package:flutter/material.dart';

class AdminageModel extends FlutterFlowModel<AdminageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
