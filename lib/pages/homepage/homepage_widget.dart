import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/componets/cus_home/cus_home_widget.dart';
import '/componets/nav/nav_widget.dart';
import '/componets/seller_home/seller_home_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'homepage_model.dart';
export 'homepage_model.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({super.key});

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  late HomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserDocument?.role == Roles.seller) {
        _model.isvaliduser = await action_blocks.issellervarfied(context);
      } else {
        return;
      }

      if (_model.isvaliduser == true) {
        context.pushNamed('homepage');
      } else {
        context.pushNamed('auth_2_sellerform');
      }
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Builder(
                builder: (context) {
                  if (currentUserDocument?.role == Roles.customer) {
                    return Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: wrapWithModel(
                        model: _model.cusHomeModel,
                        updateCallback: () => setState(() {}),
                        child: const CusHomeWidget(),
                      ),
                    );
                  } else {
                    return Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: wrapWithModel(
                        model: _model.sellerHomeModel,
                        updateCallback: () => setState(() {}),
                        child: const SellerHomeWidget(),
                      ),
                    );
                  }
                },
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navModel,
                  updateCallback: () => setState(() {}),
                  child: const NavWidget(
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
