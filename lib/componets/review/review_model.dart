import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'review_widget.dart' show ReviewWidget;
import 'package:flutter/material.dart';

class ReviewModel extends FlutterFlowModel<ReviewWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for FeedBack widget.
  FocusNode? feedBackFocusNode;
  TextEditingController? feedBackTextController;
  String? Function(BuildContext, String?)? feedBackTextControllerValidator;
  String? _feedBackTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? noOfReviews;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ServiceAllRecord? service;

  @override
  void initState(BuildContext context) {
    feedBackTextControllerValidator = _feedBackTextControllerValidator;
  }

  @override
  void dispose() {
    feedBackFocusNode?.dispose();
    feedBackTextController?.dispose();
  }
}
