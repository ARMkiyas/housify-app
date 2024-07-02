import '/backend/backend.dart';
import '/components/loading_lottie_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'loading_widget.dart' show LoadingWidget;
import 'package:flutter/material.dart';

class LoadingModel extends FlutterFlowModel<LoadingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Loading widget.
  List<ProfessonsRecord>? dataCategory;
  // Model for loadingLottie component.
  late LoadingLottieModel loadingLottieModel;

  @override
  void initState(BuildContext context) {
    loadingLottieModel = createModel(context, () => LoadingLottieModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    loadingLottieModel.dispose();
  }
}
