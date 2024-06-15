import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'productitem_model.dart';
export 'productitem_model.dart';

class ProductitemWidget extends StatefulWidget {
  const ProductitemWidget({
    super.key,
    this.servicedoc,
    bool? pupuler,
  }) : this.pupuler = pupuler ?? false;

  final ServiceAllRecord? servicedoc;
  final bool pupuler;

  @override
  State<ProductitemWidget> createState() => _ProductitemWidgetState();
}

class _ProductitemWidgetState extends State<ProductitemWidget> {
  late ProductitemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductitemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'Service_details_page',
          queryParameters: {
            'sericeDoc': serializeParam(
              widget.servicedoc,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'sericeDoc': widget.servicedoc,
          },
        );
      },
      child: Container(
        width: 165.0,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 182.0,
              height: 182.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryText,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 500),
                      fadeOutDuration: Duration(milliseconds: 500),
                      imageUrl:
                          'https://th.bing.com/th/id/OIP.uSpy4CzuMiX5D_r9wRacJQHaE8?rs=1&pid=ImgDetMain',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (widget.pupuler)
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 12.0, 0.0),
                        child: Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).error,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.whatshot_outlined,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget.servicedoc?.title,
                          'Mr.perera',
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.star,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 16.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.servicedoc?.overallRating?.toString(),
                          '0.0',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      child: VerticalDivider(
                        width: 3.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).pageviewdot,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          formatNumber(
                            widget.servicedoc?.noOfSold,
                            formatType: FormatType.custom,
                            format: '### Sold ',
                            locale: '',
                          ),
                          ' 0 Sold',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          formatNumber(
                            widget.servicedoc?.price,
                            formatType: FormatType.custom,
                            currency: 'Rs.',
                            format: '####/hr',
                            locale: '',
                          ),
                          '100',
                        ),
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
