import '/flutter_flow/flutter_flow_util.dart';
import 'adminpage_widget.dart' show AdminpageWidget;
import 'package:flutter/material.dart';

class AdminpageModel extends FlutterFlowModel<AdminpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
