import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taler/flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../object/bill.dart';

class SalesPage extends StatelessWidget {
  SalesPage({super.key, required this.page, required this.bildata});
  List<Bill> bildata;
  int page;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (con) {
      if (page == 1) {
        return ViewSales(bildata: bildata,);
      } else if (page == 2) {
        return Builder(
            builder: (context) {
              //route(context, const Invoice());
              return Container();
            }
        );
      }
      return Container();
    });
  }
}

class _ViewSalesState extends State<ViewSales> {

  TextEditingController searchcon = TextEditingController();
  FocusNode textFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    List<Bill> data = widget.bildata;
    List<Bill> bills = [];
    bills = data.where((bill) {
      return true;
    }).toList();
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.w, 8.h, 8.h, 8.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        alignment: const AlignmentDirectional(-1.0, -1.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.h, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your Sales',
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 16.sp,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.w, 0.0),
                        child: Container(
                          width: 240.w,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.w, 0.0, 4.w, 0.0),
                            child: TextFormField(
                              controller: searchcon,
                              focusNode: textFieldFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                                hintText: 'Search',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                    FlutterFlowTheme.of(context).alternate,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                    FlutterFlowTheme.of(context).alternate,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                suffixIcon: Icon(
                                  Icons.search_rounded,
                                  color:
                                  FlutterFlowTheme.of(context).primaryText,
                                  size: 14.sp,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                              cursorColor:
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(2.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () {
                      },
                      text: 'Sort By',
                      icon: Icon(
                        Icons.filter_list_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 14.sp,
                      ),
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            8.w, 0.0, 8.w, 0.0),
                        iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.w, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ]
                    .addToStart(const SizedBox(width: 16.0))
                    .addToEnd(const SizedBox(width: 16.0)),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.w, 8.h, 8.w, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Date',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 11.sp,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Invoice No.',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 11.sp,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.w, 0.0, 0.0, 0.0),
                          child: Text(
                            'Name',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inter',
                              color:
                              FlutterFlowTheme.of(context).primaryText,
                              fontSize: 11.sp,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Bill Amount',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 11.sp,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Status',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 11.sp,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Actions',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 11.sp,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ].addToStart(const SizedBox(width: 16.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.w, 0.0, 8.w, 0.0),
              child: Builder(
                builder: (context) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: bills.length,
                    itemBuilder: (context, index) {
                      Bill bill = bills[index];
                      return SalesList(bill: bill);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SalesListState extends State<SalesList> {

  late Bill bill;
  bool mouseRegionHovered1 = false, mouseRegionHovered2 = false, mouseRegionHovered3 = false;

  @override
  Widget build(BuildContext context) {
    bill = widget.bill;
    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer,
      onEnter: ((event) async {
        setState(() => mouseRegionHovered1 = true);
      }),
      onExit: ((event) async {
        setState(() => mouseRegionHovered1 = false);
      }),
      child: Container(
        width: double.infinity,
        height: 28.h,
        decoration: BoxDecoration(
          color: mouseRegionHovered1
              ? FlutterFlowTheme.of(context).secondaryBackground
              : FlutterFlowTheme.of(context).accent1,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                bill.date.toString(),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 8.sp,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                bill.id!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 8.sp,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.w, 8.h, 8.w, 8.h),
                child: Text(
                  bill.customerid,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 11.sp,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                bill.total.toString(),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto Mono',
                  color: FlutterFlowTheme.of(context).tertiary,
                  fontSize: 12.sp,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 8.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: () {
                          if (bill.total == 432.0) {
                            return FlutterFlowTheme.of(context).tertiary;
                          } else if (bill.total > 23.0) {
                            return FlutterFlowTheme.of(context).accent4;
                          } else {
                            return FlutterFlowTheme.of(context).accent3;
                          }
                        }(),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        4.w, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                                () {
                              if (bill.total == 432.0) {
                                return 'Unpaid';
                              } else if (bill.total > 23.0) {
                                return 'Active';
                              } else {
                                return 'Paid';
                              }
                            }(),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inter',
                              color:
                              FlutterFlowTheme.of(context).primaryText,
                              fontSize: 9.sp,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (bill.total == 43.0 ? false : true)
                          Align(
                            alignment: const AlignmentDirectional(-0.4, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.w, 0.5.h, 0, 0),
                              child: Text(
                                '₹32000',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 6.sp,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer,
                          onEnter: ((event) async {
                            setState(() => mouseRegionHovered2 = true);
                          }),
                          onExit: ((event) async {
                            setState(() => mouseRegionHovered2 = false);
                          }),
                          child: Builder(
                            builder: (context) {
                              if (mouseRegionHovered1) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.h, 4.w, 4.h),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation:
                                    mouseRegionHovered2 ? 1.0 : 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: mouseRegionHovered2
                                            ? FlutterFlowTheme.of(context)
                                            .primary
                                            : FlutterFlowTheme.of(context)
                                            .secondary,
                                        borderRadius:
                                        BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: mouseRegionHovered2
                                              ? FlutterFlowTheme.of(context)
                                              .primary
                                              : FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                4.w, 0.0, 4.w, 0.0),
                                            child: Icon(
                                              Icons.remove_red_eye_rounded,
                                              color: mouseRegionHovered2
                                                  ? FlutterFlowTheme.of(context)
                                                  .accent1
                                                  : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                              size: 12.sp,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 4.w, 0.0),
                                            child: Text(
                                              'View',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                color: mouseRegionHovered2
                                                    ? FlutterFlowTheme.of(
                                                    context)
                                                    .accent1
                                                    : FlutterFlowTheme.of(
                                                    context)
                                                    .primaryText,
                                                fontSize: 8.sp,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.h, 4.w, 4.h),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer,
                        onEnter: ((event) async {
                          setState(() => mouseRegionHovered3 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => mouseRegionHovered3 = false);
                        }),
                        child: Builder(
                          builder: (context) {
                            if (mouseRegionHovered1) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.h, 4.w, 4.h),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation:
                                  mouseRegionHovered3 ? 1.0 : 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: mouseRegionHovered3
                                          ? FlutterFlowTheme.of(context)
                                          .primary
                                          : FlutterFlowTheme.of(context)
                                          .secondary,
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: mouseRegionHovered3
                                            ? FlutterFlowTheme.of(context)
                                            .primary
                                            : FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                          const AlignmentDirectional(0.0, -0.1),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                4.w, 0.0, 4.w, 0.0),
                                            child: Text(
                                              '₹',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                color: mouseRegionHovered3
                                                    ? FlutterFlowTheme.of(
                                                    context)
                                                    .accent1
                                                    : FlutterFlowTheme.of(
                                                    context)
                                                    .primaryText,
                                                fontSize: 11.sp,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 4.w, 0.0),
                                          child: Text(
                                            'Pay In',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              color: mouseRegionHovered3
                                                  ? FlutterFlowTheme.of(
                                                  context)
                                                  .accent1
                                                  : FlutterFlowTheme.of(
                                                  context)
                                                  .primaryText,
                                              fontSize: 8.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.h, 4.w, 4.h),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: const AlignmentDirectional(-0.8, 0.0),
                        child: Icon(
                          Icons.keyboard_control_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ].addToStart(const SizedBox(width: 24.0)),
                ),
              ),
            ),
          ].addToStart(const SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}

class ViewSales extends StatefulWidget {
  ViewSales({super.key, required this.bildata});
  List<Bill> bildata;

  @override
  State<ViewSales> createState() => _ViewSalesState();
}

class SalesList extends StatefulWidget {
  SalesList({super.key, required this.bill});
  Bill bill;

  @override
  State<SalesList> createState() => _SalesListState();
}
