import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'back_header_model.dart';
export 'back_header_model.dart';

class BackHeaderWidget extends StatefulWidget {
  const BackHeaderWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<BackHeaderWidget> createState() => _BackHeaderWidgetState();
}

class _BackHeaderWidgetState extends State<BackHeaderWidget> {
  late BackHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackHeaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.0,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  buttonSize: 54.0,
                  hoverColor: Colors.transparent,
                  icon: Icon(
                    Icons.chevron_left,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 40.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                Container(
                  width: 20.0,
                  height: 1.0,
                  decoration: const BoxDecoration(),
                ),
              ],
            ),
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  widget.title,
                  'title',
                ),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Container(
              width: 40.0,
              height: 40.0,
              decoration: const BoxDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
