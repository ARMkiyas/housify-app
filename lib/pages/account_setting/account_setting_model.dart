import '/componets/nav/nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'account_setting_widget.dart' show AccountSettingWidget;
import 'package:flutter/material.dart';

class AccountSettingModel extends FlutterFlowModel<AccountSettingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for nav component.
  late NavModel navModel;

  @override
  void initState(BuildContext context) {
    navModel = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navModel.dispose();
  }
}
