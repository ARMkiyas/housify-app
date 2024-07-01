import '/backend/backend.dart';
import '/componets/back_header/back_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'productview_page_widget.dart' show ProductviewPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductviewPageModel extends FlutterFlowModel<ProductviewPageWidget> {
  ///  Local state fields for this page.

  String? searchvalues;

  List<ServiceAllRecord> searchData = [];
  void addToSearchData(ServiceAllRecord item) => searchData.add(item);
  void removeFromSearchData(ServiceAllRecord item) => searchData.remove(item);
  void removeAtIndexFromSearchData(int index) => searchData.removeAt(index);
  void insertAtIndexInSearchData(int index, ServiceAllRecord item) =>
      searchData.insert(index, item);
  void updateSearchDataAtIndex(
          int index, Function(ServiceAllRecord) updateFn) =>
      searchData[index] = updateFn(searchData[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for back_header component.
  late BackHeaderModel backHeaderModel;
  // State field(s) for tf_search widget.
  FocusNode? tfSearchFocusNode;
  TextEditingController? tfSearchTextController;
  String? Function(BuildContext, String?)? tfSearchTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in tf_search widget.
  List<ServiceAllRecord>? dataall;
  List<ServiceAllRecord> simpleSearchResults = [];
  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ServiceAllRecord>?
      gridViewPagingController1;
  Query? gridViewPagingQuery1;
  List<StreamSubscription?> gridViewStreamSubscriptions1 = [];

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

    for (var s in gridViewStreamSubscriptions1) {
      s?.cancel();
    }
    gridViewPagingController1?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, ServiceAllRecord> setGridViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController1 ??= _createGridViewController1(query, parent);
    if (gridViewPagingQuery1 != query) {
      gridViewPagingQuery1 = query;
      gridViewPagingController1?.refresh();
    }
    return gridViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, ServiceAllRecord>
      _createGridViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, ServiceAllRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryServiceAllRecordPage(
          queryBuilder: (_) => gridViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions1,
          controller: controller,
          pageSize: 20,
          isStream: true,
        ),
      );
  }
}
