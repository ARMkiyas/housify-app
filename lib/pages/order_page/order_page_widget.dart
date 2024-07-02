import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/componets/customer_accept/customer_accept_widget.dart';
import '/componets/historycard/historycard_widget.dart';
import '/componets/nav/nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'order_page_model.dart';
export 'order_page_model.dart';

class OrderPageWidget extends StatefulWidget {
  const OrderPageWidget({super.key});

  @override
  State<OrderPageWidget> createState() => _OrderPageWidgetState();
}

class _OrderPageWidgetState extends State<OrderPageWidget>
    with TickerProviderStateMixin {
  late OrderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
              Column(
                children: [
                  Align(
                    alignment: const Alignment(0.0, 0),
                    child: TabBar(
                      isScrollable: true,
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0.0,
                              ),
                      unselectedLabelStyle: const TextStyle(),
                      indicatorColor: FlutterFlowTheme.of(context).primaryText,
                      padding: const EdgeInsets.all(4.0),
                      tabs: const [
                        Tab(
                          text: 'Ongoing',
                        ),
                        Tab(
                          text: 'Completed',
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        KeepAliveWidgetWrapper(
                          builder: (context) => Stack(
                            children: [
                              if (currentUserDocument?.role == Roles.customer)
                                AuthUserStreamWidget(
                                  builder: (context) =>
                                      FutureBuilder<List<OrdersRecord>>(
                                    future: (_model
                                                .firestoreRequestCompleter1 ??=
                                            Completer<List<OrdersRecord>>()
                                              ..complete(queryOrdersRecordOnce(
                                                queryBuilder: (ordersRecord) =>
                                                    ordersRecord
                                                        .where(
                                                          'customer',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .whereIn(
                                                            'status',
                                                            OrderStatus.values
                                                                .where((e) =>
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      () {
                                                                        if (e ==
                                                                            OrderStatus
                                                                                .waiting) {
                                                                          return true;
                                                                        } else if (e ==
                                                                            OrderStatus.accepted) {
                                                                          return true;
                                                                        } else {
                                                                          return false;
                                                                        }
                                                                      }()
                                                                          ? true
                                                                          : false,
                                                                      false,
                                                                    ))
                                                                .toList()
                                                                .map((e) => e
                                                                    .serialize())
                                                                .toList())
                                                        .orderBy('orderDate'),
                                              )))
                                        .future,
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<OrdersRecord>
                                          customerongoingListviewOrdersRecordList =
                                          snapshot.data!;
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          setState(() => _model
                                                  .firestoreRequestCompleter1 =
                                              null);
                                          await _model
                                              .waitForFirestoreRequestCompleted1();
                                        },
                                        child: ListView.separated(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            24.0,
                                            0,
                                            48.0,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              customerongoingListviewOrdersRecordList
                                                  .length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 24.0),
                                          itemBuilder: (context,
                                              customerongoingListviewIndex) {
                                            final customerongoingListviewOrdersRecord =
                                                customerongoingListviewOrdersRecordList[
                                                    customerongoingListviewIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      useSafeArea: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.75,
                                                              child:
                                                                  CustomerAcceptWidget(
                                                                data:
                                                                    customerongoingListviewOrdersRecord,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: const BoxDecoration(),
                                                    child: HistorycardWidget(
                                                      key: Key(
                                                          'Keyy0w_${customerongoingListviewIndex}_of_${customerongoingListviewOrdersRecordList.length}'),
                                                      iscompletd: false,
                                                      data:
                                                          customerongoingListviewOrdersRecord,
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  height: 24.0,
                                                  thickness: 1.0,
                                                  indent: 20.0,
                                                  endIndent: 20.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ].divide(const SizedBox(height: 16.0)),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              if (currentUserDocument?.role == Roles.seller)
                                AuthUserStreamWidget(
                                  builder: (context) =>
                                      FutureBuilder<List<OrdersRecord>>(
                                    future: (_model
                                                .firestoreRequestCompleter2 ??=
                                            Completer<List<OrdersRecord>>()
                                              ..complete(queryOrdersRecordOnce(
                                                queryBuilder: (ordersRecord) =>
                                                    ordersRecord
                                                        .where(
                                                          'seller',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .whereIn(
                                                            'status',
                                                            OrderStatus.values
                                                                .where((e) =>
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      () {
                                                                        if (e ==
                                                                            OrderStatus
                                                                                .waiting) {
                                                                          return true;
                                                                        } else if (e ==
                                                                            OrderStatus.accepted) {
                                                                          return true;
                                                                        } else {
                                                                          return false;
                                                                        }
                                                                      }()
                                                                          ? true
                                                                          : false,
                                                                      false,
                                                                    ))
                                                                .toList()
                                                                .map((e) => e
                                                                    .serialize())
                                                                .toList())
                                                        .orderBy('orderDate'),
                                              )))
                                        .future,
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<OrdersRecord>
                                          sellerongoingnlistviewOrdersRecordList =
                                          snapshot.data!;
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          setState(() => _model
                                                  .firestoreRequestCompleter2 =
                                              null);
                                          await _model
                                              .waitForFirestoreRequestCompleted2();
                                        },
                                        child: ListView.separated(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            24.0,
                                            0,
                                            48.0,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              sellerongoingnlistviewOrdersRecordList
                                                  .length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 24.0),
                                          itemBuilder: (context,
                                              sellerongoingnlistviewIndex) {
                                            final sellerongoingnlistviewOrdersRecord =
                                                sellerongoingnlistviewOrdersRecordList[
                                                    sellerongoingnlistviewIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      useSafeArea: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.75,
                                                              child:
                                                                  CustomerAcceptWidget(
                                                                data:
                                                                    sellerongoingnlistviewOrdersRecord,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: const BoxDecoration(),
                                                    child: HistorycardWidget(
                                                      key: Key(
                                                          'Key7ut_${sellerongoingnlistviewIndex}_of_${sellerongoingnlistviewOrdersRecordList.length}'),
                                                      iscompletd: false,
                                                      data:
                                                          sellerongoingnlistviewOrdersRecord,
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  height: 24.0,
                                                  thickness: 1.0,
                                                  indent: 20.0,
                                                  endIndent: 20.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ].divide(const SizedBox(height: 16.0)),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => Stack(
                            children: [
                              if (currentUserDocument?.role == Roles.customer)
                                AuthUserStreamWidget(
                                  builder: (context) =>
                                      FutureBuilder<List<OrdersRecord>>(
                                    future: queryOrdersRecordOnce(
                                      queryBuilder: (ordersRecord) =>
                                          ordersRecord
                                              .where(
                                                'customer',
                                                isEqualTo: currentUserReference,
                                              )
                                              .whereIn(
                                                  'status',
                                                  OrderStatus.values
                                                      .where((e) =>
                                                          valueOrDefault<bool>(
                                                            () {
                                                              if (e ==
                                                                  OrderStatus
                                                                      .canceled) {
                                                                return true;
                                                              } else if (e ==
                                                                  OrderStatus
                                                                      .completed) {
                                                                return true;
                                                              } else {
                                                                return false;
                                                              }
                                                            }(),
                                                            false,
                                                          ))
                                                      .toList()
                                                      .map((e) => e.serialize())
                                                      .toList())
                                              .orderBy('orderDate',
                                                  descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<OrdersRecord>
                                          customercompletedListviewOrdersRecordList =
                                          snapshot.data!;
                                      return ListView.separated(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          24.0,
                                          0,
                                          48.0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            customercompletedListviewOrdersRecordList
                                                .length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 24.0),
                                        itemBuilder: (context,
                                            customercompletedListviewIndex) {
                                          final customercompletedListviewOrdersRecord =
                                              customercompletedListviewOrdersRecordList[
                                                  customercompletedListviewIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: HistorycardWidget(
                                                  key: Key(
                                                      'Keyvem_${customercompletedListviewIndex}_of_${customercompletedListviewOrdersRecordList.length}'),
                                                  iscompletd: true,
                                                  data:
                                                      customercompletedListviewOrdersRecord,
                                                ),
                                              ),
                                              Divider(
                                                height: 24.0,
                                                thickness: 1.0,
                                                indent: 20.0,
                                                endIndent: 20.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ].divide(const SizedBox(height: 16.0)),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              if (currentUserDocument?.role == Roles.seller)
                                AuthUserStreamWidget(
                                  builder: (context) =>
                                      FutureBuilder<List<OrdersRecord>>(
                                    future: queryOrdersRecordOnce(
                                      queryBuilder: (ordersRecord) =>
                                          ordersRecord
                                              .where(
                                                'seller',
                                                isEqualTo: currentUserReference,
                                              )
                                              .whereIn(
                                                  'status',
                                                  OrderStatus.values
                                                      .where((e) =>
                                                          valueOrDefault<bool>(
                                                            () {
                                                              if (e ==
                                                                  OrderStatus
                                                                      .canceled) {
                                                                return true;
                                                              } else if (e ==
                                                                  OrderStatus
                                                                      .completed) {
                                                                return true;
                                                              } else {
                                                                return false;
                                                              }
                                                            }(),
                                                            false,
                                                          ))
                                                      .toList()
                                                      .map((e) => e.serialize())
                                                      .toList())
                                              .orderBy('orderDate',
                                                  descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<OrdersRecord>
                                          sellercompletedListviewOrdersRecordList =
                                          snapshot.data!;
                                      return ListView.separated(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          24.0,
                                          0,
                                          48.0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            sellercompletedListviewOrdersRecordList
                                                .length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 24.0),
                                        itemBuilder: (context,
                                            sellercompletedListviewIndex) {
                                          final sellercompletedListviewOrdersRecord =
                                              sellercompletedListviewOrdersRecordList[
                                                  sellercompletedListviewIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: HistorycardWidget(
                                                  key: Key(
                                                      'Keyt6x_${sellercompletedListviewIndex}_of_${sellercompletedListviewOrdersRecordList.length}'),
                                                  iscompletd: true,
                                                  data:
                                                      sellercompletedListviewOrdersRecord,
                                                ),
                                              ),
                                              Divider(
                                                height: 24.0,
                                                thickness: 1.0,
                                                indent: 20.0,
                                                endIndent: 20.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ].divide(const SizedBox(height: 16.0)),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navModel,
                  updateCallback: () => setState(() {}),
                  child: const NavWidget(
                    pageseletcted: Pages.orders,
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
