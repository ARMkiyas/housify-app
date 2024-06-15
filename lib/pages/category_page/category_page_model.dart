import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/ceta_comp_widget.dart';
import '/componets/nav/nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'category_page_widget.dart' show CategoryPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
