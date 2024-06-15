import '/backend/backend.dart';
import '/componets/nav/nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'category_page_widget.dart' show CategoryPageWidget;
import 'package:flutter/material.dart';

class CategoryPageModel extends FlutterFlowModel<CategoryPageWidget> {
  ///  Local state fields for this page.

  String? search;

  List<ProfessonsRecord> searchresults = [];
  void addToSearchresults(ProfessonsRecord item) => searchresults.add(item);
  void removeFromSearchresults(ProfessonsRecord item) =>
      searchresults.remove(item);
  void removeAtIndexFromSearchresults(int index) =>
      searchresults.removeAt(index);
  void insertAtIndexInSearchresults(int index, ProfessonsRecord item) =>
      searchresults.insert(index, item);
  void updateSearchresultsAtIndex(
          int index, Function(ProfessonsRecord) updateFn) =>
      searchresults[index] = updateFn(searchresults[index]);

  bool sear = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
