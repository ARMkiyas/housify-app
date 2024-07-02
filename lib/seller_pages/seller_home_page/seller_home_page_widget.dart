import '/backend/schema/enums/enums.dart';
import '/componets/nav/nav_widget.dart';
import '/componets/seller_home/seller_home_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'seller_home_page_model.dart';
export 'seller_home_page_model.dart';

class SellerHomePageWidget extends StatefulWidget {
  const SellerHomePageWidget({super.key});

  @override
  State<SellerHomePageWidget> createState() => _SellerHomePageWidgetState();
}

class _SellerHomePageWidgetState extends State<SellerHomePageWidget> {
  late SellerHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SellerHomePageModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 1.0),
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: wrapWithModel(
                    model: _model.sellerHomeModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: const SellerHomeWidget(),
                  ),
                ),
                wrapWithModel(
                  model: _model.navModel,
                  updateCallback: () => setState(() {}),
                  child: const NavWidget(
                    pageseletcted: Pages.home,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
