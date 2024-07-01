import '/backend/backend.dart';
import '/components/loading_lottie_widget.dart';
import '/componets/back_header/back_header_widget.dart';
import '/componets/productitem/productitem_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'productview_page_model.dart';
export 'productview_page_model.dart';

class ProductviewPageWidget extends StatefulWidget {
  const ProductviewPageWidget({
    super.key,
    this.ceta,
    this.search,
    bool? isSearch,
  }) : isSearch = isSearch ?? false;

  final ProfessonsRecord? ceta;
  final String? search;
  final bool isSearch;

  @override
  State<ProductviewPageWidget> createState() => _ProductviewPageWidgetState();
}

class _ProductviewPageWidgetState extends State<ProductviewPageWidget> {
  late ProductviewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductviewPageModel());

    _model.tfSearchTextController ??= TextEditingController();
    _model.tfSearchFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    wrapWithModel(
                      model: _model.backHeaderModel,
                      updateCallback: () => setState(() {}),
                      child: const BackHeaderWidget(
                        title: 'services',
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 5.0, 20.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).pageviewdot,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Form(
                                              key: _model.formKey,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              child: SizedBox(
                                                width: 100.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .tfSearchTextController,
                                                  focusNode:
                                                      _model.tfSearchFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.tfSearchTextController',
                                                    const Duration(milliseconds: 200),
                                                    () async {
                                                      _model.searchvalues = _model
                                                          .tfSearchTextController
                                                          .text;
                                                      setState(() {});
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  500));
                                                      _model.dataall =
                                                          await queryServiceAllRecordOnce(
                                                        queryBuilder:
                                                            (serviceAllRecord) =>
                                                                serviceAllRecord
                                                                    .where(
                                                                      'serviceLocation',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .DeviceCurrentLoctationAddress,
                                                                    )
                                                                    .where(
                                                                      'category',
                                                                      isEqualTo: widget
                                                                              .ceta?.reference,
                                                                    ),
                                                      );
                                                      safeSetState(() {
                                                        _model.simpleSearchResults =
                                                            TextSearch(
                                                          _model.dataall!
                                                              .map(
                                                                (record) =>
                                                                    TextSearchItem
                                                                        .fromTerms(
                                                                            record,
                                                                            [
                                                                      record
                                                                          .title
                                                                    ]),
                                                              )
                                                              .toList(),
                                                        )
                                                                .search(_model
                                                                    .tfSearchTextController
                                                                    .text)
                                                                .map((r) =>
                                                                    r.object)
                                                                .toList();
                                                      });
                                                      _model.searchData = _model
                                                          .simpleSearchResults
                                                          .toList()
                                                          .cast<
                                                              ServiceAllRecord>();
                                                      setState(() {});

                                                      setState(() {});
                                                    },
                                                  ),
                                                  autofocus: true,
                                                  textInputAction:
                                                      TextInputAction.search,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText: 'Search',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                8.0, 0.0),
                                                    prefixIcon: Icon(
                                                      Icons.search_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .tfSearchTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
                                      ),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: const BoxDecoration(),
                                      child: Icon(
                                        Icons.manage_search_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Visibility(
                                      visible: _model.searchvalues != null &&
                                          _model.searchvalues != '',
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 0.0, 5.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.tfSearchTextController
                                                  ?.clear();
                                            });
                                          },
                                          child: Text(
                                            'Clear',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (valueOrDefault<bool>(
                      () {
                        if (_model.searchvalues != null &&
                            _model.searchvalues != '') {
                          return false;
                        } else if (widget.isSearch) {
                          return false;
                        } else {
                          return true;
                        }
                      }(),
                      false,
                    ))
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 30.0, 20.0, 0.0),
                          child: PagedGridView<DocumentSnapshot<Object?>?,
                              ServiceAllRecord>(
                            pagingController: _model.setGridViewController1(
                              ServiceAllRecord.collection
                                  .where(
                                    'category',
                                    isEqualTo: widget.ceta?.reference,
                                  )
                                  .where(
                                    'serviceLocation',
                                    isEqualTo: FFAppState()
                                        .DeviceCurrentLoctationAddress,
                                  ),
                            ),
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 1.0,
                              childAspectRatio: 0.55,
                            ),
                            scrollDirection: Axis.vertical,
                            builderDelegate:
                                PagedChildBuilderDelegate<ServiceAllRecord>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => const Center(
                                child: LoadingLottieWidget(),
                              ),
                              // Customize what your widget looks like when it's loading another page.
                              newPageProgressIndicatorBuilder: (_) => const Center(
                                child: LoadingLottieWidget(),
                              ),

                              itemBuilder: (context, _, gridViewIndex) {
                                final gridViewServiceAllRecord = _model
                                    .gridViewPagingController1!
                                    .itemList![gridViewIndex];
                                return Hero(
                                  tag: 'productListView',
                                  transitionOnUserGestures: true,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: ProductitemWidget(
                                      key: Key(
                                          'Keyneb_${gridViewIndex}_of_${_model.gridViewPagingController1!.itemList!.length}'),
                                      pupuler: false,
                                      servicedoc: gridViewServiceAllRecord,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    if (_model.searchvalues != null &&
                        _model.searchvalues != '')
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 30.0, 20.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final searchdata =
                                  _model.searchData.toList().take(10).toList();
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 1.0,
                                  childAspectRatio: 0.55,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: searchdata.length,
                                itemBuilder: (context, searchdataIndex) {
                                  final searchdataItem =
                                      searchdata[searchdataIndex];
                                  return Hero(
                                    tag: 'productListView',
                                    transitionOnUserGestures: true,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ProductitemWidget(
                                        key: Key(
                                            'Keyrhc_${searchdataIndex}_of_${searchdata.length}'),
                                        pupuler: false,
                                        servicedoc: searchdataItem,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
