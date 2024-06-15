import '/backend/schema/enums/enums.dart';
import '/componets/cus_home/cus_home_widget.dart';
import '/componets/nav/nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cus_homepage_model.dart';
export 'cus_homepage_model.dart';

class CusHomepageWidget extends StatefulWidget {
  const CusHomepageWidget({super.key});

  @override
  State<CusHomepageWidget> createState() => _CusHomepageWidgetState();
}

class _CusHomepageWidgetState extends State<CusHomepageWidget> {
  late CusHomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CusHomepageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.updateCurrentLocation(context);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              wrapWithModel(
                model: _model.cusHomeModel,
                updateCallback: () => setState(() {}),
                child: CusHomeWidget(),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navModel,
                  updateCallback: () => setState(() {}),
                  child: NavWidget(
                    pageseletcted: Pages.home,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
