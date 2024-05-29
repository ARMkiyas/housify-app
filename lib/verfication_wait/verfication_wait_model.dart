import '/flutter_flow/flutter_flow_util.dart';
import 'verfication_wait_widget.dart' show VerficationWaitWidget;
import 'package:flutter/material.dart';

class VerficationWaitModel extends FlutterFlowModel<VerficationWaitWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
