import '/backend/backend.dart';
import '/componets/back_header/back_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'productview_page_widget.dart' show ProductviewPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductviewPageModel extends FlutterFlowModel<ProductviewPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for back_header component.
  late BackHeaderModel backHeaderModel;
  // State field(s) for tf_search widget.
  FocusNode? tfSearchFocusNode;
  TextEditingController? tfSearchTextController;
  String? Function(BuildContext, String?)? tfSearchTextControllerValidator;
  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ServiceAllRecord>?
      gridViewPagingController;
  Query? gridViewPagingQuery;
  List<StreamSubscription?> gridViewStreamSubscriptions = [];

  @override
  void initState(BuildContext context) {
    backHeaderModel = createModel(context, () => BackHeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backHeaderModel.dispose();
    tfSearchFocusNode?.dispose();
    tfSearchTextController?.dispose();

    for (var s in gridViewStreamSubscriptions) {
      s?.cancel();
    }
    gridViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, ServiceAllRecord> setGridViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController ??= _createGridViewController(query, parent);
    if (gridViewPagingQuery != query) {
      gridViewPagingQuery = query;
      gridViewPagingController?.refresh();
    }
    return gridViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ServiceAllRecord>
      _createGridViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, ServiceAllRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryServiceAllRecordPage(
          queryBuilder: (_) => gridViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions,
          controller: controller,
          pageSize: 20,
          isStream: true,
        ),
      );
  }
}
