import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taler/main.dart';
import 'package:taler/object/bill.dart';
import 'package:taler/object/customer.dart';
import 'package:taler/object/paymentin.dart';
import 'package:taler/object/product.dart';
import 'package:taler/object/vendor.dart';
import 'package:taler/screen/customerpage.dart';
import 'package:taler/screen/invoice.dart';
import 'package:taler/screen/payment.dart';
import 'package:taler/screen/productpage.dart';
import 'package:taler/screen/salespage.dart';
import 'package:taler/screen/vendorpage.dart';
import 'package:taler/service/billHelper.dart';
import '../constant/functions.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../service/authHelper.dart ';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool compactView = false;
  bool mouseRegionHovered1 = false,
      mouseRegionHovered2 = false,
      mouseRegionHovered3 = false,
      mouseRegionHovered4 = false,
      mouseRegionHovered5 = false,
      mouseRegionHovered6 = false,
      mouseRegionHovered7 = false,
      mouseRegionHovered8 = false,
      mouseRegionHovered9 = false;
  BillHelper billHelper = BillHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: StreamBuilder<List<Customer>>(
          stream: billHelper.getcustomers(),
          builder: (context, snapcus) {
            return StreamBuilder<List<Product>>(
              stream: billHelper.getproducts(),
              builder: (context, snappro) {
                return StreamBuilder<List<Bill>>(
                  stream: billHelper.getbills(),
                  builder: (context, snapbil) {
                    return StreamBuilder<List<Vendor>>(
                      stream: billHelper.getvendors(),
                      builder: (context, snapven) {
                        return StreamBuilder<List<Payment>>(
                          stream: billHelper.getpayments(),
                          builder: (context, snapayi) {
                            return FutureBuilder<List<int>>(
                                future: getscreens,
                                builder: (context, snapscr) {
                                  List<AsyncSnapshot> snaps = [
                                    snapayi,
                                    snapven,
                                    snapbil,
                                    snappro,
                                    snapcus,
                                    snapscr
                                  ];
                                  bool hasdata = true;

                                  for (int i = 0; i < snaps.length; i++) {
                                    if (snaps[i].hasError) {
                                      return Errored(
                                        error: '${snaps[i].error}/home/$i',
                                      );
                                    }

                                    if (!(snaps[i].hasData)) {
                                      hasdata = false;
                                      break;
                                    }
                                  }

                                  if (hasdata) {
                                    int screen = snapscr.data![0],
                                        page = snapscr.data![1];
                                    return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: compactView == false
                                                ? 150.w
                                                : 70.w,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        compactView ==
                                                                                true
                                                                            ? 6.w
                                                                            : 0.0,
                                                                        0.0,
                                                                      ),
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .biotech_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 22.sp,
                                                              ),
                                                            ),
                                                            if (compactView ==
                                                                false)
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Taler',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            20.sp,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w800,
                                                                      ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: SingleChildScrollView(
                                                    primary: false,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        MouseRegion(
                                                          opaque: false,
                                                          cursor:
                                                              MouseCursor.defer,
                                                          onEnter:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered1 =
                                                                    true);
                                                          }),
                                                          onExit:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered1 =
                                                                    false);
                                                          }),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setscreens(
                                                                    0, page);
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                height: 30.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: mouseRegionHovered1 ==
                                                                          true
                                                                      ? (screen ==
                                                                              0
                                                                          ? const Color(
                                                                              0x00000000)
                                                                          : const Color(
                                                                              0xFFEEEEEE))
                                                                      : const Color(
                                                                          0x00000000),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (screen ==
                                                                        0)
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              0.0,
                                                                              2.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                0.5,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (screen ==
                                                                        0)
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              0.0,
                                                                              2.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                6.0,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              borderRadius: const BorderRadius.only(
                                                                                bottomLeft: Radius.circular(2.0),
                                                                                bottomRight: Radius.circular(24.0),
                                                                                topLeft: Radius.circular(2.0),
                                                                                topRight: Radius.circular(24.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            valueOrDefault<double>(
                                                                              compactView == false ? 1.0 : 0.0,
                                                                              0.0,
                                                                            ),
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .pages,
                                                                          color: screen == 0
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          size: screen == 0
                                                                              ? 14.sp
                                                                              : 12.sp,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (compactView ==
                                                                        false)
                                                                      Expanded(
                                                                        flex: 8,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Sales',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: screen == 0 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.sp,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        MouseRegion(
                                                          opaque: false,
                                                          cursor:
                                                              MouseCursor.defer,
                                                          onEnter:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered2 =
                                                                    true);
                                                          }),
                                                          onExit:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered2 =
                                                                    false);
                                                          }),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setscreens(
                                                                    1, page);
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                height: 30.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: mouseRegionHovered2 ==
                                                                          true
                                                                      ? (screen ==
                                                                              1
                                                                          ? const Color(
                                                                              0x00000000)
                                                                          : const Color(
                                                                              0xFFEEEEEE))
                                                                      : const Color(
                                                                          0x00000000),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (screen ==
                                                                        1)
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              0.0,
                                                                              2.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                0.5,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (screen ==
                                                                        1)
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              0.0,
                                                                              2.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                6.0,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              borderRadius: const BorderRadius.only(
                                                                                bottomLeft: Radius.circular(2.0),
                                                                                bottomRight: Radius.circular(24.0),
                                                                                topLeft: Radius.circular(2.0),
                                                                                topRight: Radius.circular(24.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            valueOrDefault<double>(
                                                                              compactView == false ? 1.0 : 0.0,
                                                                              0.0,
                                                                            ),
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .shopping_cart_outlined,
                                                                          color: screen == 1
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          size: screen == 1
                                                                              ? 14.sp
                                                                              : 12.sp,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (compactView ==
                                                                        false)
                                                                      Expanded(
                                                                        flex: 8,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Purchases',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: screen == 1 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.sp,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        MouseRegion(
                                                          opaque: false,
                                                          cursor:
                                                              MouseCursor.defer,
                                                          onEnter:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered3 =
                                                                    true);
                                                          }),
                                                          onExit:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered3 =
                                                                    false);
                                                          }),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setscreens(
                                                                    2, page);
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                height: 30.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: mouseRegionHovered3 ==
                                                                          true
                                                                      ? (screen ==
                                                                              2
                                                                          ? const Color(
                                                                              0x00000000)
                                                                          : const Color(
                                                                              0xFFEEEEEE))
                                                                      : const Color(
                                                                          0x00000000),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (screen ==
                                                                        2)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              0.5,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (screen ==
                                                                        2)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              6.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(2.0),
                                                                              bottomRight: Radius.circular(24.0),
                                                                              topLeft: Radius.circular(2.0),
                                                                              topRight: Radius.circular(24.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            valueOrDefault<double>(
                                                                              compactView == false ? 1.0 : 0.0,
                                                                              0.0,
                                                                            ),
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .person_outline,
                                                                          color: screen == 2
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          size: screen == 2
                                                                              ? 14.sp
                                                                              : 12.sp,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (compactView ==
                                                                        false)
                                                                      Expanded(
                                                                        flex: 8,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Customers',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: screen == 2 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.sp,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        MouseRegion(
                                                          opaque: false,
                                                          cursor:
                                                              MouseCursor.defer,
                                                          onEnter:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered4 =
                                                                    true);
                                                          }),
                                                          onExit:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered4 =
                                                                    false);
                                                          }),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setscreens(
                                                                    3, page);
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                height: 30.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: mouseRegionHovered4 ==
                                                                          true
                                                                      ? (screen ==
                                                                              3
                                                                          ? const Color(
                                                                              0x00000000)
                                                                          : const Color(
                                                                              0xFFEEEEEE))
                                                                      : const Color(
                                                                          0x00000000),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (screen ==
                                                                        3)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              0.5,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (screen ==
                                                                        3)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              6.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(2.0),
                                                                              bottomRight: Radius.circular(24.0),
                                                                              topLeft: Radius.circular(2.0),
                                                                              topRight: Radius.circular(24.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            valueOrDefault<double>(
                                                                              compactView == false ? 1.0 : 0.0,
                                                                              0.0,
                                                                            ),
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .groups_outlined,
                                                                          color: screen == 3
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          size: screen == 3
                                                                              ? 14.sp
                                                                              : 12.sp,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (compactView ==
                                                                        false)
                                                                      Expanded(
                                                                        flex: 8,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Vendors',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: screen == 3 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.sp,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        MouseRegion(
                                                          opaque: false,
                                                          cursor:
                                                              MouseCursor.defer,
                                                          onEnter:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered5 =
                                                                    true);
                                                          }),
                                                          onExit:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered5 =
                                                                    false);
                                                          }),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setscreens(
                                                                    4, page);
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                height: 30.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: mouseRegionHovered5 ==
                                                                          true
                                                                      ? (screen ==
                                                                              4
                                                                          ? const Color(
                                                                              0x00000000)
                                                                          : const Color(
                                                                              0xFFEEEEEE))
                                                                      : const Color(
                                                                          0x00000000),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (screen ==
                                                                        4)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              0.5,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (screen ==
                                                                        4)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              6.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(2.0),
                                                                              bottomRight: Radius.circular(24.0),
                                                                              topLeft: Radius.circular(2.0),
                                                                              topRight: Radius.circular(24.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            valueOrDefault<double>(
                                                                              compactView == false ? 1.0 : 0.0,
                                                                              0.0,
                                                                            ),
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .add_circle_outline_rounded,
                                                                          color: screen == 4
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          size: screen == 4
                                                                              ? 14.sp
                                                                              : 12.sp,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (compactView ==
                                                                        false)
                                                                      Expanded(
                                                                        flex: 8,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Products',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: screen == 4 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.sp,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        MouseRegion(
                                                          opaque: false,
                                                          cursor:
                                                              MouseCursor.defer,
                                                          onEnter:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered6 =
                                                                    true);
                                                          }),
                                                          onExit:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered6 =
                                                                    false);
                                                          }),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setscreens(
                                                                    5, page);
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                height: 30.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: mouseRegionHovered6 ==
                                                                          true
                                                                      ? (screen ==
                                                                              5
                                                                          ? const Color(
                                                                              0x00000000)
                                                                          : const Color(
                                                                              0xFFEEEEEE))
                                                                      : const Color(
                                                                          0x00000000),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (screen ==
                                                                        5)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              0.5,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (screen ==
                                                                        5)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              6.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(2.0),
                                                                              bottomRight: Radius.circular(24.0),
                                                                              topLeft: Radius.circular(2.0),
                                                                              topRight: Radius.circular(24.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            valueOrDefault<double>(
                                                                              compactView == false ? 1.0 : 0.0,
                                                                              0.0,
                                                                            ),
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .attach_money_rounded,
                                                                          color: screen == 5
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          size: screen == 5
                                                                              ? 14.sp
                                                                              : 12.sp,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (compactView ==
                                                                        false)
                                                                      Expanded(
                                                                        flex: 8,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Payments',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: screen == 5 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.sp,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        MouseRegion(
                                                          opaque: false,
                                                          cursor:
                                                              MouseCursor.defer,
                                                          onEnter:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered7 =
                                                                    true);
                                                          }),
                                                          onExit:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered7 =
                                                                    false);
                                                          }),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setscreens(
                                                                    6, page);
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                height: 30.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: mouseRegionHovered7 ==
                                                                          true
                                                                      ? (screen ==
                                                                              6
                                                                          ? const Color(
                                                                              0x00000000)
                                                                          : const Color(
                                                                              0xFFEEEEEE))
                                                                      : const Color(
                                                                          0x00000000),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (screen ==
                                                                        6)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              0.5,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (screen ==
                                                                        6)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              6.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(2.0),
                                                                              bottomRight: Radius.circular(24.0),
                                                                              topLeft: Radius.circular(2.0),
                                                                              topRight: Radius.circular(24.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            valueOrDefault<double>(
                                                                              compactView == false ? 1.0 : 0.0,
                                                                              0.0,
                                                                            ),
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .dashboard_outlined,
                                                                          color: screen == 6
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          size: screen == 6
                                                                              ? 14.sp
                                                                              : 12.sp,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (compactView ==
                                                                        false)
                                                                      Expanded(
                                                                        flex: 8,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Dashboard',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: screen == 6 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.sp,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        MouseRegion(
                                                          opaque: false,
                                                          cursor:
                                                              MouseCursor.defer,
                                                          onEnter:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered8 =
                                                                    true);
                                                          }),
                                                          onExit:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered8 =
                                                                    false);
                                                          }),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setscreens(
                                                                    7, page);
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                height: 30.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: mouseRegionHovered8 ==
                                                                          true
                                                                      ? (screen ==
                                                                              7
                                                                          ? const Color(
                                                                              0x00000000)
                                                                          : const Color(
                                                                              0xFFEEEEEE))
                                                                      : const Color(
                                                                          0x00000000),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (screen ==
                                                                        7)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              0.5,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (screen ==
                                                                        7)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              6.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(2.0),
                                                                              bottomRight: Radius.circular(24.0),
                                                                              topLeft: Radius.circular(2.0),
                                                                              topRight: Radius.circular(24.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            valueOrDefault<double>(
                                                                              compactView == false ? 1.0 : 0.0,
                                                                              0.0,
                                                                            ),
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .attach_money_rounded,
                                                                          color: screen == 7
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          size: screen == 7
                                                                              ? 14.sp
                                                                              : 12.sp,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (compactView ==
                                                                        false)
                                                                      Expanded(
                                                                        flex: 8,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Expenses',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: screen == 7 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.sp,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        MouseRegion(
                                                          opaque: false,
                                                          cursor:
                                                              MouseCursor.defer,
                                                          onEnter:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered9 =
                                                                    true);
                                                          }),
                                                          onExit:
                                                              ((event) async {
                                                            setState(() =>
                                                                mouseRegionHovered9 =
                                                                    false);
                                                          }),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setscreens(
                                                                    8, page);
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                height: 30.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: mouseRegionHovered9 ==
                                                                          true
                                                                      ? (screen ==
                                                                              8
                                                                          ? const Color(
                                                                              0x00000000)
                                                                          : const Color(
                                                                              0xFFEEEEEE))
                                                                      : const Color(
                                                                          0x00000000),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (screen ==
                                                                        8)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              0.5,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (screen ==
                                                                        8)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              6.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(2.0),
                                                                              bottomRight: Radius.circular(24.0),
                                                                              topLeft: Radius.circular(2.0),
                                                                              topRight: Radius.circular(24.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            valueOrDefault<double>(
                                                                              compactView == false ? 1.0 : 0.0,
                                                                              0.0,
                                                                            ),
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .settings_outlined,
                                                                          color: screen == 8
                                                                              ? FlutterFlowTheme.of(context).primaryText
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          size: screen == 8
                                                                              ? 14.sp
                                                                              : 12.sp,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (compactView ==
                                                                        false)
                                                                      Expanded(
                                                                        flex: 8,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Settings',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: screen == 8 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.sp,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          8.0, 4.0, 4.0, 0.0),
                                                  child: Container(
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        badges.Badge(
                                                          badgeContent: InkWell(
                                                            onTap: () {
                                                              AuthHelper()
                                                                  .signOut();
                                                            },
                                                            child: Icon(
                                                              Icons.logout,
                                                              size: 8.sp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1,
                                                            ),
                                                          ),
                                                          showBadge: true,
                                                          position: badges
                                                                  .BadgePosition
                                                              .bottomEnd(),
                                                          child: Container(
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              AuthHelper.myuser!
                                                                  .photoURL
                                                                  .toString(),
                                                              errorBuilder:
                                                                  (content,
                                                                      error,
                                                                      e) {
                                                                return Image.asset(
                                                                    'assests/user.png');
                                                              },
                                                              frameBuilder:
                                                                  (content,
                                                                      error,
                                                                      r,
                                                                      t) {
                                                                return Image.asset(
                                                                    'assests/user.png');
                                                              },
                                                              loadingBuilder:
                                                                  (content,
                                                                      error,
                                                                      f) {
                                                                return Image.asset(
                                                                    'assests/user.png');
                                                              },
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        if (compactView ==
                                                            false)
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Welcome Back!',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 8.sp,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_right_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              12.sp,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    AuthHelper
                                                                        .myuser!
                                                                        .displayName!,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.sp,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w800,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 32.0,
                                                            0.0, 32.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (compactView ==
                                                            false) {
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              compactView =
                                                                  true;
                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .menu_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 18.sp,
                                                            ),
                                                          );
                                                        } else {
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              compactView =
                                                                  false;
                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .filter_list_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 18.sp,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          24.0, 16, 24.0, 8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Text(
                                                              selectof(screen, {
                                                                0: 'Sales',
                                                                1: 'Purchases',
                                                                2: 'Customers',
                                                                3: 'Vendors',
                                                                4: 'Products',
                                                                5: 'Payments',
                                                                6: 'Dashboard',
                                                                7: 'Expenses',
                                                                8: 'Settings',
                                                              })!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        20.sp,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        const Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [],
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    8.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.3,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.07,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            setscreens(screen,
                                                                                1);
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation: page == 1
                                                                                ? 1.5
                                                                                : 0.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.333,
                                                                              height: MediaQuery.sizeOf(context).height * 0.5,
                                                                              decoration: BoxDecoration(
                                                                                color: page == 1 ? Colors.white : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  'View',
                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: page == 1 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: page == 1 ? 12.sp : 11.0.sp,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            if(screen==0){
                                                                              routename(context, '/invoice');
                                                                              return;
                                                                            }
                                                                            setscreens(screen,
                                                                                2);
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation: page == 2
                                                                                ? 1.5
                                                                                : 0.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.333,
                                                                              height: MediaQuery.sizeOf(context).height * 0.5,
                                                                              decoration: BoxDecoration(
                                                                                color: page == 2 ? Colors.white : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  'Create',
                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: page == 2 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: page == 2 ? 12.sp : 11.sp,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            setscreens(screen,
                                                                                3);
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation: page == 3
                                                                                ? 1.5
                                                                                : 0.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.333,
                                                                              height: MediaQuery.sizeOf(context).height * 0.5,
                                                                              decoration: BoxDecoration(
                                                                                color: page == 3 ? Colors.white : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  'Stock ',
                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: page == 3 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: page == 3 ? 12.sp : 11.sp,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                      Builder(builder: (con) {
                                                    return selectof(screen, {
                                                      0: SalesPage(
                                                        page: page,
                                                        bildata: snapbil.data!,
                                                      ),
                                                      1: const Invoice(),
                                                      2: Customerpage(
                                                        page: page,
                                                        cusdata: snapcus.data!,
                                                        billdata: snapbil.data!,
                                                        paydata: snapayi.data!,
                                                      ),
                                                      3: Vendorpage(
                                                        page: page,
                                                        vendata: snapven.data!,
                                                      ),
                                                      4: ProductPage(
                                                        page: page,
                                                        prodata: snappro.data!,
                                                      ),
                                                      5: PaymentInPage(
                                                        page: page,
                                                        bildata: snapbil.data!,
                                                        cusdata: snapcus.data!,
                                                        paydata: snapayi.data!,
                                                      ),
                                                      6: Row(
                                                        children: [
                                                          Center(
                                                            child: Text(
                                                              screen.toString(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      7: Row(
                                                        children: [
                                                          Center(
                                                            child: Text(
                                                              screen.toString(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      8: Row(
                                                        children: [
                                                          Center(
                                                            child: Text(
                                                              screen.toString(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    }) as Widget;
                                                  }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                    );
                                  }

                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: LoadingAnimationWidget
                                                .fourRotatingDots(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 40.r,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
