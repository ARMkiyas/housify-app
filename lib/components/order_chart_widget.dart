import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_chart_model.dart';
export 'order_chart_model.dart';

class OrderChartWidget extends StatefulWidget {
  const OrderChartWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final List<int>? parameter1;
  final List<int>? parameter2;

  @override
  State<OrderChartWidget> createState() => _OrderChartWidgetState();
}

class _OrderChartWidgetState extends State<OrderChartWidget> {
  late OrderChartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderChartModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 40.0),
      child: StreamBuilder<List<ServiceAllRecord>>(
        stream: queryServiceAllRecord(
          queryBuilder: (serviceAllRecord) => serviceAllRecord.where(
            'seller',
            isEqualTo: currentUserReference,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<ServiceAllRecord> containerServiceAllRecordList = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 350.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    1.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Orders',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Container(
                        height: double.infinity,
                        child: FlutterFlowBarChart(
                          barData: [
                            FFBarChartData(
                              yData: containerServiceAllRecordList
                                  .map((e) => e.orders.length)
                                  .toList(),
                              color: Color(0xFF0094FF),
                              borderWidth: 1.0,
                              borderColor: Color(0xFF0094FF),
                            )
                          ],
                          xLabels: containerServiceAllRecordList
                              .map((e) => e.noOfSold)
                              .toList()
                              .map((e) => e.toString())
                              .toList(),
                          barWidth: 30.0,
                          barBorderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(1040.0),
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          groupSpace: 5.0,
                          chartStylingInfo: ChartStylingInfo(
                            enableTooltip: true,
                            tooltipBackgroundColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            showGrid: true,
                            showBorder: false,
                          ),
                          axisBounds: AxisBounds(
                            minY: 100.0,
                            maxY: 5000.0,
                          ),
                          xAxisLabelInfo: AxisLabelInfo(
                            showLabels: true,
                            labelTextStyle: TextStyle(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            labelInterval: 10.0,
                          ),
                          yAxisLabelInfo: AxisLabelInfo(
                            showLabels: true,
                            labelTextStyle: TextStyle(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 8.0,
                            ),
                            labelInterval: 1000.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
