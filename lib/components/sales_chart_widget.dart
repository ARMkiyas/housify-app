import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'sales_chart_model.dart';
export 'sales_chart_model.dart';

class SalesChartWidget extends StatefulWidget {
  const SalesChartWidget({
    super.key,
    this.parameter1,
  });

  final List<OrdersRecord>? parameter1;

  @override
  State<SalesChartWidget> createState() => _SalesChartWidgetState();
}

class _SalesChartWidgetState extends State<SalesChartWidget> {
  late SalesChartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SalesChartModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 40.0),
      child: StreamBuilder<List<OrdersRecord>>(
        stream: queryOrdersRecord(
          queryBuilder: (ordersRecord) => ordersRecord.where(
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
          List<OrdersRecord> containerOrdersRecordList = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 350.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: const [
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
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Meus Ganhos',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        Text(
                          'Mensais',
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
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: SizedBox(
                        height: double.infinity,
                        child: FlutterFlowBarChart(
                          barData: [
                            FFBarChartData(
                              yData: containerOrdersRecordList
                                  .take(5)
                                  .toList()
                                  .map((d) => d.totalPrice)
                                  .toList(),
                              color: const Color(0xFFFFCD00),
                              borderWidth: 1.0,
                              borderColor: const Color(0xFFFFCD00),
                            )
                          ],
                          xLabels: containerOrdersRecordList
                              .take(5)
                              .toList()
                              .map((d) => d.orderDate)
                              .toList(),
                          barWidth: 30.0,
                          barBorderRadius: const BorderRadius.only(
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
                          axisBounds: const AxisBounds(
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
