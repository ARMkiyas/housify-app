import '/backend/schema/enums/enums.dart';
import '/componets/cus_home/cus_home_widget.dart';
import '/componets/nav/nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'cus_homepage_widget.dart' show CusHomepageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CusHomepageModel extends FlutterFlowModel<CusHomepageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cus_home component.
  late CusHomeModel cusHomeModel;
  // Model for nav component.
  late NavModel navModel;

  @override
  void initState(BuildContext context) {
    cusHomeModel = createModel(context, () => CusHomeModel());
    navModel = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cusHomeModel.dispose();
    navModel.dispose();
  }
}
