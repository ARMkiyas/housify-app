import '/components/housify_widget.dart';
import '/components/oderv_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'temp_widget.dart' show TempWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TempModel extends FlutterFlowModel<TempWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for oderv component.
  late OdervModel odervModel;
  // Model for housify component.
  late HousifyModel housifyModel;

  @override
  void initState(BuildContext context) {
    odervModel = createModel(context, () => OdervModel());
    housifyModel = createModel(context, () => HousifyModel());
  }

  @override
  void dispose() {
    odervModel.dispose();
    housifyModel.dispose();
  }
}
