import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'seller_home_widget.dart' show SellerHomeWidget;
import 'package:flutter/material.dart';

class SellerHomeModel extends FlutterFlowModel<SellerHomeWidget> {
  ///  State fields for stateful widgets in this component.

  Completer<int>? firestoreRequestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
