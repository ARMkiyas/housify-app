import '/components/housify_widget.dart';
import '/components/oderv_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'temp_model.dart';
export 'temp_model.dart';

class TempWidget extends StatefulWidget {
  const TempWidget({super.key});

  @override
  State<TempWidget> createState() => _TempWidgetState();
}

class _TempWidgetState extends State<TempWidget> {
  late TempModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TempModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primary,
            FlutterFlowTheme.of(context).tertiary
          ],
          stops: const [0.0, 1.0],
          begin: const AlignmentDirectional(0.87, -1.0),
          end: const AlignmentDirectional(-0.87, 1.0),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0.05, -0.22),
            child: Container(
              width: 363.0,
              height: 691.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: wrapWithModel(
                model: _model.odervModel,
                updateCallback: () => setState(() {}),
                child: const OdervWidget(),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: wrapWithModel(
              model: _model.housifyModel,
              updateCallback: () => setState(() {}),
              child: const HousifyWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
