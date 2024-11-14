import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taler/constant/functions.dart';
import 'package:taler/flutter_flow/flutter_flow_util.dart';
import 'package:taler/object/bill.dart';
import 'package:taler/object/billproduct.dart';
import 'package:taler/object/product.dart';
import 'package:taler/service/billHelper.dart';
import 'package:toastification/toastification.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../object/customer.dart';
import 'home.dart';

class _InvoiceState extends State<Invoice> {
  BillHelper billHelper = BillHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F4),
      body: SafeArea(
        top: true,
        child: StreamBuilder<List<Customer>>(
            stream: billHelper.getcustomers(),
            builder: (context, snapcus) {
              return StreamBuilder<List<Product>>(
                  stream: billHelper.getproducts(),
                  builder: (context, snappro) {
                    if (snappro.hasData && snapcus.hasData) {
                      return InvoiceBody(
                        catdata: snapcus.data!,
                        prodata: snappro.data!,
                      );
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: LoadingAnimationWidget.fourRotatingDots(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 40.r,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  });
            }),
      ),
    );
  }
}

class _InvoiceBodyState extends State<InvoiceBody> {
  TextEditingController referencecon = TextEditingController(),
      despatchcon = TextEditingController(),
      quantitycon = TextEditingController(),
      additionalchargescon = TextEditingController(),
      chargesdescriptioncon = TextEditingController(),
      extradiscountcon = TextEditingController(),
      extradiscountdescriptioncon = TextEditingController();

  SingleSelectController<Customer> namecon =
  SingleSelectController<Customer>(null);
  SingleSelectController<String> categorycon =
  SingleSelectController<String>(null);
  SingleSelectController<Product> productcon =
  SingleSelectController<Product>(null);

  List<TextEditingController> cond = [], cone = [], conq = [], conp = [];

  FocusNode textFieldFocusNode1 = FocusNode(),
      textFieldFocusNode2 = FocusNode(),
      textFieldFocusNode3 = FocusNode(),
      textFieldFocusNode7 = FocusNode(),
      textFieldFocusNode12 = FocusNode(),
      textFieldFocusNode13 = FocusNode(),
      textFieldFocusNode14 = FocusNode(),
      textFieldFocusNode15 = FocusNode();

  DateTime datePicked = DateTime.now();
  bool isigst = false,
      issgst = false,
      isaddpercent = false,
      isextradispercent = false,
      iswithgst = false,
      isroundof = false;

  List<Billproduct> billproducts = [];

  double total = 0, discount = 0, additional = 0, disitems = 0;
  double totitem = 0, gst=0, rounded = 0;

  void caluculate() {
    total = 0;
    discount = 0;
    additional = 0;
    totitem = 0;
    disitems = 0;
    for (Billproduct pro in billproducts) {
      disitems += ((pro.price * pro.quantity) * (pro.dicountpercent / 100));
      total += netamountof(pro);
      totitem += pro.quantity.toInt();
    }

    discount = isextradispercent
        ? (double.tryParse(extradiscountcon.text) ?? 0) / 100 * total
        : double.tryParse(extradiscountcon.text) ?? 0;
    additional = isaddpercent
        ? (double.tryParse(additionalchargescon.text) ?? 0) / 100 * total
        : double.tryParse(additionalchargescon.text) ?? 0;

    total += additional;
    total -= discount;

    gst = total * 0.05;

    rounded = total.round().toDouble();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    caluculate();
  }

  @override
  Widget build(BuildContext context) {
    List<String> catlist = [];
    List<Product> prolist = [];
    for (var pro in widget.prodata) {
      catlist.add(pro.categname);
      if (categorycon.value == pro.categname || !categorycon.hasValue) {
        prolist.add(pro);
      }
    }

    caluculate();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F6F7),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(1.0, 0.0),
                  child: Container(
                    decoration: const BoxDecoration(),
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsetsDirectional.fromSTEB(
                              12.w, 0.0, 12.w, 0,
                            ),
                            child: InkWell(
                              onTap: () {
                                setscreens(0, 1);
                                route(context, const Home());
                              },
                              child: Icon(
                                Icons.clear,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.sp,
                              ),
                            ),
                          ),
                          Text(
                            'New Invoice',
                            style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                              fontFamily: 'Outfit',
                              fontSize: 22.sp,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.w, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () {},
                                        text: 'Save & Print',
                                        icon: Icon(
                                          Icons.print_rounded,
                                          size: 14.sp,
                                        ),
                                        options: FFButtonOptions(
                                          height: 26.h,
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.w, 0.0, 10.w, 0.0),
                                          iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                          color: Colors.white,
                                          textStyle: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 10.sp,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          elevation: 1.5,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(5.r),
                                          hoverColor:
                                          FlutterFlowTheme.of(context).primary,
                                          hoverBorderSide: BorderSide(
                                            color:
                                            FlutterFlowTheme.of(context).primary,
                                            width: 1.0,
                                          ),
                                          hoverTextColor: Colors.white,
                                          hoverElevation: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0,16.w, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          BillHelper().addbill(
                                            Bill(
                                              customerid: namecon.value!.id!,
                                              reference: referencecon.text,
                                              despatchthrough: despatchcon.text,
                                              total: total,
                                              date: datePicked,
                                              iswithgst: iswithgst,
                                              additionalcharges: double.tryParse(
                                                  additionalchargescon.text) ??
                                                  0,
                                              chargesdecription:
                                              chargesdescriptioncon.text,
                                              extradiscount: double.tryParse(
                                                  extradiscountcon.text) ??
                                                  0,
                                              products: billproducts,
                                            ),
                                          );
                                        },
                                        text: 'Save',
                                        icon: Icon(
                                          Icons.arrow_forward_rounded,
                                          size: 11.sp,
                                        ),
                                        options: FFButtonOptions(
                                          height: 26.h,
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12.w, 0.0, 12.w, 0.0),
                                          iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context).primary,
                                          textStyle: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            fontSize: 10.sp,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          elevation: 1.5,
                                          borderSide: BorderSide(
                                            color:
                                            FlutterFlowTheme.of(context).primary,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.circular(5.r),
                                          hoverColor:
                                          FlutterFlowTheme.of(context).primary,
                                          hoverBorderSide: BorderSide(
                                            color:
                                            FlutterFlowTheme.of(context).primary,
                                            width: 1.0,
                                          ),
                                          hoverTextColor: Colors.white,
                                          hoverElevation: 2.0,
                                        ),
                                      ),
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
                ),
                Align(
                  alignment: const AlignmentDirectional(1.0, 0.0),
                  child: Container(
                    decoration: const BoxDecoration(),
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    18.w, 0.0, 0.0, 4.h),
                                child: Text(
                                  'Invoice Details',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.sp,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 18.w, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.w, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Invoice No: ',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            fontSize: 12.sp,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.w, 0.0, 0.0, 0.0),
                                        child: SelectableText(
                                          'INV - 230/23-24 ',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.sp,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w900,
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
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 8.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Expanded(
                                flex: 3,
                                child: Container(
                                  height: 25.h,
                                  child: CustomDropdown<Customer>.search(
                                    decoration: CustomDropdownDecoration(
                                      expandedBorder: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 1,
                                      ),
                                    ),
                                    headerBuilder: (con,cus, oo){
                                      return Text(cus.name);
                                    },
                                    closedHeaderPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                    controller: namecon,
                                    hintText: 'Select Customer',
                                    items: widget.catdata,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 28.h,
                                decoration: const BoxDecoration(),
                                margin: EdgeInsets.only(top: 10.h),
                                child: TextFormField(
                                  controller: referencecon,
                                  focusNode: textFieldFocusNode2,
                                  autofocus: true,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Reference By',
                                    labelStyle: FlutterFlowTheme.of(
                                        context)
                                        .labelMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      color:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 9.sp,
                                      letterSpacing: 0.0,
                                    ),
                                    hintStyle:
                                    FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      fontSize: 8.sp,
                                      letterSpacing: 0.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(5.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(5.r),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context)
                                            .error,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(5.r),
                                    ),
                                    focusedErrorBorder:
                                    OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context)
                                            .error,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(5.r),
                                    ),
                                    filled: true,
                                    fillColor:
                                    FlutterFlowTheme.of(context)
                                        .accent1,
                                    suffixIcon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 14.sp,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.0,
                                  ),
                                  cursorColor:
                                  FlutterFlowTheme.of(context)
                                      .primaryText,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 28.h,
                                margin: EdgeInsets.only(top: 10.h),
                                child: TextFormField(
                                  controller: despatchcon,
                                  focusNode: textFieldFocusNode3,
                                  autofocus: true,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Despatch Through',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      color:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 9.sp,
                                      letterSpacing: 0.0,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      fontSize: 9.sp,
                                      letterSpacing: 0.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(5.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(5.r),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .error,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(5.r),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .error,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(5.r),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .accent1,
                                    suffixIcon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 14.sp,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.0,
                                  ),
                                  cursorColor: FlutterFlowTheme.of(context)
                                      .primaryText,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 28.h,
                                margin: EdgeInsets.only(top: 10.h),
                                child: InkWell(
                                  onTap: () async {
                                    final datePickedDate =
                                    await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                    );

                                    TimeOfDay? datePickedTime;
                                    if (datePickedDate != null) {
                                      datePickedTime = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            getCurrentTimestamp),
                                      );
                                    }

                                    if (datePickedDate != null &&
                                        datePickedTime != null) {
                                      safeSetState(() {
                                        datePicked = DateTime(
                                          datePickedDate.year,
                                          datePickedDate.month,
                                          datePickedDate.day,
                                          datePickedTime!.hour,
                                          datePickedTime.minute,
                                        );
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .accent1,
                                      borderRadius:
                                      BorderRadius.circular(5.r),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    padding: EdgeInsetsDirectional
                                        .fromSTEB(6.w, 6.h, 6.w, 6.h),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.calendar_month_rounded,
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 16.sp,
                                        ),
                                        wspace(4.w),
                                        Expanded(
                                          child: Text(
                                            DateFormat("dd-mm-yyyy hh:mm")
                                                .format(datePicked),
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: FlutterFlowTheme.of(
                                                  context)
                                                  .primaryText,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(width: 12.w))
                              .addToStart(SizedBox(width: 16.w))
                              .addToEnd(SizedBox(width: 16.w)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          margin:  EdgeInsetsDirectional.fromSTEB(
                              14.w, 4.h, 16.w, 10.h),
                          padding:  EdgeInsetsDirectional.fromSTEB(
                              12.w, 0.0, 12.w, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment:
                                const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding:  EdgeInsetsDirectional
                                      .fromSTEB(0.0, 8.h, 0.0, 0.0),
                                  child: Text(
                                    'Product Details',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                      fontFamily: 'Inter',
                                      fontSize: 14.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.h, 0.0, 4.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        height: 35.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.only(
                                            bottomLeft: Radius.circular(
                                              5.r,
                                            ),
                                            bottomRight: const Radius.circular(
                                              0.0,
                                            ),
                                            topLeft: Radius.circular(
                                              5.r,
                                            ),
                                            topRight: const Radius.circular(
                                              0.0,
                                            ),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(
                                              context,
                                            ).secondary,
                                          ),
                                        ),
                                        margin:
                                        EdgeInsetsDirectional
                                            .fromSTEB(
                                            0.0, 0.0, 0.0, 6.h),
                                        child:
                                        CustomDropdown<String>.search(
                                          decoration: CustomDropdownDecoration(
                                              expandedBorder: Border.all(
                                                  color:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .secondary,
                                                  width: 1)),
                                          controller: categorycon,
                                          hintText: 'Select Category',
                                          items: catlist,
                                          onChanged: (value) {
                                            setState(() {
                                              productcon.clear();
                                            });
                                          },
                                          headerBuilder: (con,cus, oo){
                                            return Text(cus);
                                          },
                                          closedHeaderPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                        height: 35.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.only(
                                            bottomLeft:
                                            const Radius.circular(0.0),
                                            bottomRight:
                                            Radius.circular(5.r),
                                            topLeft: const Radius.circular(0.0),
                                            topRight:
                                            Radius.circular(5.r),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(
                                              context,
                                            ).secondary,
                                          ),
                                        ),
                                        padding:
                                        EdgeInsetsDirectional
                                            .fromSTEB(
                                            0.0, 0.h, 0.0, 0.h),
                                        margin:
                                        EdgeInsetsDirectional
                                            .fromSTEB(
                                            0.0, 0.0, 6.w, 6.h),
                                        child: CustomDropdown<
                                            Product>.search(
                                          decoration:
                                          CustomDropdownDecoration(
                                            expandedBorder: Border.all(
                                              color: FlutterFlowTheme.of(
                                                context,
                                              ).secondary,
                                              width: 1,
                                            ),
                                          ),
                                          controller: productcon,
                                          hintText: 'Select Product',
                                          items: prolist,
                                          onChanged: (value) {
                                            setState((){});
                                          },
                                          headerBuilder: (con,cus, oo){
                                            return Text(cus.name);
                                          },
                                          closedHeaderPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        height: 30.h,
                                        child: TextFormField(
                                          controller: quantitycon,
                                          focusNode:
                                          textFieldFocusNode7,
                                          autofocus: true,
                                          obscureText: false,
                                          cursorHeight: 14.h,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 7.w),
                                            labelText: 'Quantity',
                                            labelStyle: FlutterFlowTheme
                                                .of(context)
                                                .labelMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              color: FlutterFlowTheme
                                                  .of(context)
                                                  .secondaryText,
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                            ),
                                            hintStyle: FlutterFlowTheme
                                                .of(context)
                                                .labelMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 10.sp,
                                              letterSpacing: 0.0,
                                            ),
                                            enabledBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5.r),
                                            ),
                                            focusedBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                FlutterFlowTheme.of(
                                                    context)
                                                    .secondaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5.r),
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
                                                  5.r),
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
                                                  5.r),
                                            ),
                                            filled: true,
                                            fillColor:
                                            FlutterFlowTheme.of(
                                                context)
                                                .accent1,
                                            suffixIcon: Icon(
                                              Icons.numbers_rounded,
                                              color:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .secondaryText,
                                              size: 14.sp,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(
                                              context)
                                              .bodyMedium
                                              .override(
                                            fontSize: 10.sp,
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                          cursorColor:
                                          FlutterFlowTheme.of(
                                              context)
                                              .primaryText,
                                          onChanged: (val) {
                                            if (int.tryParse(quantitycon
                                                .text) ==
                                                null &&
                                                quantitycon
                                                    .text.isNotEmpty) {
                                              quantitycon.text =
                                                  quantitycon
                                                      .text
                                                      .substring(
                                                      0,
                                                      quantitycon
                                                          .text
                                                          .length -
                                                          1);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsetsDirectional
                                          .fromSTEB(16.w, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          if (quantitycon.text.isEmpty ||
                                              !(productcon.hasValue)) {
                                            if (quantitycon
                                                .text.isEmpty) {
                                              toastification.show(
                                                context: context,
                                                type: ToastificationType
                                                    .error,
                                                style: ToastificationStyle
                                                    .flat,
                                                title: Text(
                                                  'Fill the quantity',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme
                                                        .of(context)
                                                        .primary,
                                                  ),
                                                ),
                                                alignment:
                                                Alignment.bottomRight,
                                                icon: const Icon(
                                                    Icons.check),
                                                primaryColor: Colors.red,
                                                backgroundColor:
                                                Colors.white,
                                                foregroundColor:
                                                Colors.black,
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 12,
                                                    vertical: 16),
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 12,
                                                    vertical: 8),
                                                borderRadius:
                                                BorderRadius.circular(
                                                    7.r),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color:
                                                    Color(0x07000000),
                                                    blurRadius: 16,
                                                    offset: Offset(0, 16),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                                showProgressBar: true,
                                                closeButtonShowType:
                                                CloseButtonShowType
                                                    .onHover,
                                                closeOnClick: false,
                                                applyBlurEffect: true,
                                              );
                                            }

                                            if (!(productcon.hasValue)) {
                                              toastification.show(
                                                context: context,
                                                type: ToastificationType
                                                    .error,
                                                style: ToastificationStyle
                                                    .flat,
                                                title: Text(
                                                  'Select the product',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme
                                                        .of(context)
                                                        .primary,
                                                  ),
                                                ),
                                                alignment:
                                                Alignment.bottomRight,
                                                icon: const Icon(
                                                    Icons.check),
                                                primaryColor: Colors.red,
                                                backgroundColor:
                                                Colors.white,
                                                foregroundColor:
                                                Colors.black,
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 12,
                                                    vertical: 16),
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 12,
                                                    vertical: 8),
                                                borderRadius:
                                                BorderRadius.circular(
                                                    7.r),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color:
                                                    Color(0x07000000),
                                                    blurRadius: 16,
                                                    offset: Offset(0, 16),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                                showProgressBar: true,
                                                closeButtonShowType:
                                                CloseButtonShowType
                                                    .onHover,
                                                closeOnClick: false,
                                                applyBlurEffect: true,
                                              );
                                            }
                                          } else {
                                            billproducts.add(
                                              Billproduct(
                                                category: productcon
                                                    .value!.categname,
                                                productid:
                                                productcon.value!.id!,
                                                quantity: double.parse(
                                                  quantitycon.text,
                                                ),
                                                price: productcon
                                                    .value!.wholeprice
                                                    .toDouble(),
                                                dicountpercent: 0,
                                                extranotes: '',
                                              ),
                                            );

                                            conq.add(
                                                TextEditingController(
                                                    text: quantitycon
                                                        .text));
                                            conp.add(
                                                TextEditingController(
                                                    text: productcon
                                                        .value!.wholeprice
                                                        .toString()));
                                            cond.add(
                                                TextEditingController(
                                                    text: '0'));
                                            cone.add(
                                                TextEditingController());
                                            categorycon.clear();
                                            productcon.clear();
                                            quantitycon.clear();
                                            setState(() {});
                                          }
                                        },
                                        text: 'Add to Bill',

                                        icon: Icon(
                                          Icons.add_rounded,
                                          size: 14.sp,
                                        ),
                                        options: FFButtonOptions(
                                          height: 28.h,
                                          padding:
                                          EdgeInsetsDirectional
                                              .fromSTEB(
                                              10.w, 0.0, 10.w, 0.0),
                                          iconPadding:
                                          const EdgeInsetsDirectional
                                              .fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                            fontFamily: 'Inter',
                                            fontSize: 10.sp,
                                            color: FlutterFlowTheme
                                                .of(context)
                                                .accent1,
                                            letterSpacing: 0.0,
                                          ),
                                          elevation: 1.5,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(
                                                context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(5.r),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 26.h,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius:  BorderRadius.only(
                                      bottomLeft: const Radius.circular(0.0),
                                      bottomRight: const Radius.circular(0.0),
                                      topLeft: Radius.circular(5.r),
                                      topRight: Radius.circular(5.r),
                                    ),
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsetsDirectional
                                        .fromSTEB(12.w, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Move',
                                            style: FlutterFlowTheme.of(
                                                context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              color:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .primaryText,
                                              fontSize: 9.5.sp,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                              FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 12,
                                          child: Text(
                                            'Name',
                                            style: FlutterFlowTheme.of(
                                                context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              color:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .primaryText,
                                              letterSpacing: 0.0,
                                              fontSize: 9.5.sp,
                                              fontWeight:
                                              FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional
                                                .fromSTEB(
                                                1.w, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Quantity',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .primaryText,
                                                fontSize: 9.5.sp,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional
                                                .fromSTEB(
                                                1.w, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Unit Price',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .primaryText,
                                                fontSize: 9.5.sp,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional
                                                .fromSTEB(
                                                1.w, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Discount%',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .primaryText,
                                                fontSize: 9.5.sp,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional
                                                .fromSTEB(
                                                4.w, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Net Amount',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .primaryText,
                                                fontSize: 9.5.sp,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Padding(
                                            padding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(
                                                8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Extra Notes',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .primaryText,
                                                fontSize: 9.5.sp,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Delete',
                                            style: FlutterFlowTheme.of(
                                                context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              color:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .primaryText,
                                              fontSize: 9.5.sp,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                              FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:  EdgeInsetsDirectional
                                      .fromSTEB(0.0, 0.0, 0.0, 12.h),
                                  child: SingleChildScrollView(
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics:
                                      const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: billproducts.length,
                                      itemBuilder: (con, index) {
                                        Billproduct billpro =
                                        billproducts[index];

                                        Product? pro;
                                        for (var prod in widget.prodata) {
                                          if (prod.id ==
                                              billpro.productid) {
                                            pro = prod;
                                          }
                                        }

                                        TextEditingController
                                        discountcon = cond[index],
                                            extrainfocon = cone[index],
                                            quacon = conq[index],
                                            pricecon = conp[index];

                                        return Container(
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(
                                                context)
                                                .accent1,
                                            borderRadius:
                                            BorderRadius.only(
                                              bottomLeft:
                                              Radius.circular(2.r),
                                              bottomRight:
                                              Radius.circular(2.r),
                                              topLeft:
                                              const Radius.circular(0.0),
                                              topRight:
                                              const Radius.circular(0.0),
                                            ),
                                            border: Border.all(
                                              color: FlutterFlowTheme.of(
                                                  context)
                                                  .alternate,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional
                                                .fromSTEB(
                                                0.0, 2.h, 0.0, 2.h),
                                            child: Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .center,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration:
                                                    BoxDecoration(
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .accent1,

                                                    ),
                                                    child: Icon(
                                                      Icons.toc_rounded,
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .secondaryText,
                                                      size: 16.sp,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 12,
                                                  child: Text(
                                                    pro!.name,
                                                    style: FlutterFlowTheme
                                                        .of(context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily:
                                                      'Inter',
                                                      fontSize: 11.sp,
                                                      letterSpacing:
                                                      0.0,
                                                      fontWeight:
                                                      FontWeight
                                                          .w600,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    height: 30.h,
                                                    padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme.of(context)
                                                          .accent1,
                                                      borderRadius:
                                                      BorderRadius.circular(5.r),
                                                      border: Border.all(
                                                        color: FlutterFlowTheme.of(context)
                                                            .alternate,
                                                        width: 0.0,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              billpro
                                                                  .quantity--;
                                                              quacon.text = billpro
                                                                  .quantity
                                                                  .toString();
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .remove_rounded,
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .tertiary,
                                                            size: 14.sp,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: quacon,
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle:
                                                              FlutterFlowTheme.of(
                                                                  context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .primaryText,
                                                                fontSize:
                                                                10.sp,
                                                                letterSpacing:
                                                                0.0,
                                                              ),
                                                              hintText: 'Qty',
                                                              hintStyle:
                                                              FlutterFlowTheme.of(
                                                                  context)
                                                                  .labelMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
                                                                fontSize:
                                                                9.sp,
                                                                letterSpacing:
                                                                0.0,
                                                              ),

                                                              enabledBorder:
                                                              OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .info,
                                                                  width: 0,
                                                                ),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    5.r),
                                                              ),
                                                              focusedBorder:
                                                              OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .secondaryText,
                                                                  width: 0,
                                                                ),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    5.r),
                                                              ),
                                                              errorBorder:
                                                              OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .error,
                                                                  width: 0,
                                                                ),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    5.r),
                                                              ),
                                                              focusedErrorBorder:
                                                              OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .error,
                                                                  width: 0,
                                                                ),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    5.r),
                                                              ),
                                                            ),

                                                            onChanged: (val) {
                                                              if (double.tryParse(
                                                                  quacon
                                                                      .text) ==
                                                                  null &&
                                                                  quacon.text
                                                                      .isNotEmpty) {
                                                                quacon.text = quacon
                                                                    .text
                                                                    .substring(
                                                                    0,
                                                                    quacon.text
                                                                        .length -
                                                                        1);
                                                              }
                                                              setState(() {
                                                                billpro.quantity =
                                                                    double.tryParse(
                                                                        quacon
                                                                            .text) ??
                                                                        0;
                                                              });
                                                            },
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize: 9.sp,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                              letterSpacing:
                                                              0.0,
                                                            ),
                                                            cursorColor:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              billpro
                                                                  .quantity++;
                                                              quacon.text = billpro
                                                                  .quantity
                                                                  .toString();
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .add_rounded,
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .tertiary,
                                                            size: 10.sp,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Container(
                                                    height: 30.h,
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          6.w,
                                                          0.0,
                                                          6.w,
                                                          0.0),
                                                      child: TextFormField(
                                                        controller:
                                                        pricecon,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        onChanged: (val) {
                                                          if (double.tryParse(
                                                              pricecon
                                                                  .text) ==
                                                              null &&
                                                              pricecon.text
                                                                  .isNotEmpty) {
                                                            pricecon.text = pricecon
                                                                .text
                                                                .substring(
                                                                0,
                                                                pricecon.text.length -
                                                                    1);
                                                          }
                                                          setState(() {
                                                            billpro.price =
                                                                double.tryParse(
                                                                    pricecon.text) ??
                                                                    0;
                                                          });
                                                        },
                                                        decoration:
                                                        InputDecoration(
                                                          labelStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            color: FlutterFlowTheme.of(context)
                                                                .secondaryText,
                                                            fontSize:
                                                            9.sp,
                                                            letterSpacing:
                                                            0.0,
                                                          ),
                                                          hintText: '₹',
                                                          hintStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .labelMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            fontSize:
                                                            9.sp,
                                                            letterSpacing:
                                                            0.0,
                                                          ),
                                                          enabledBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                          focusedBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                          errorBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                          focusedErrorBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          fontSize:
                                                          9.sp,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    height: 30.h,
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          6.w,
                                                          0.0,
                                                          6.w,
                                                          0.0),
                                                      child: TextFormField(
                                                        controller:
                                                        discountcon,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        onChanged: (val) {
                                                          if (double.tryParse(
                                                              discountcon
                                                                  .text) ==
                                                              null &&
                                                              discountcon
                                                                  .text
                                                                  .isNotEmpty) {
                                                            discountcon
                                                                .text =
                                                                discountcon
                                                                    .text
                                                                    .substring(
                                                                  0,
                                                                  discountcon
                                                                      .text
                                                                      .length -
                                                                      1,
                                                                );
                                                          }
                                                          setState(() {
                                                            billpro.dicountpercent =
                                                                double.tryParse(
                                                                    discountcon.text) ??
                                                                    0;
                                                          });
                                                        },
                                                        decoration:
                                                        InputDecoration(
                                                          labelStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            color: FlutterFlowTheme.of(context)
                                                                .secondaryText,
                                                            fontSize:
                                                            9.sp,
                                                            letterSpacing:
                                                            0.0,
                                                          ),
                                                          hintText: '%',
                                                          hintStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .labelMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            fontSize:
                                                            9.sp,
                                                            letterSpacing:
                                                            0.0,
                                                          ),
                                                          enabledBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                          focusedBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                          errorBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                          focusedErrorBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          fontSize:
                                                          9.sp,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Align(
                                                    alignment:
                                                    const AlignmentDirectional(
                                                        -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          8.w,
                                                          0.0,
                                                          4.w,
                                                          4.h),
                                                      child: Text(
                                                        netamountof(
                                                            billpro)
                                                            .toString(),
                                                        textAlign:
                                                        TextAlign
                                                            .start,
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                          fontSize:
                                                          10.sp,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    height: 30.h,
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          6.w,
                                                          0.0,
                                                          6.w,
                                                          0.0),
                                                      child: TextFormField(
                                                        controller:
                                                        extrainfocon,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            billpro.extranotes =
                                                                val;
                                                          });
                                                        },
                                                        decoration:
                                                        InputDecoration(
                                                          labelStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            color: FlutterFlowTheme.of(context)
                                                                .secondaryText,
                                                            fontSize:
                                                            9.sp,
                                                            letterSpacing:
                                                            0.0,
                                                          ),
                                                          hintText: 'Notes',
                                                          hintStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .labelMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            fontSize:
                                                            9.sp,
                                                            color: FlutterFlowTheme.of(context)
                                                                .secondaryText,
                                                            letterSpacing:
                                                            0.0,
                                                          ),
                                                          enabledBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                          focusedBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .secondaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                          errorBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                          focusedErrorBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.r),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          fontSize:
                                                          9.sp,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        cursorColor:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .primaryText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0,
                                                        0.0,
                                                        6.w,
                                                        0.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        billproducts
                                                            .removeAt(
                                                            index);
                                                        cond.removeAt(
                                                            index);
                                                        conq.removeAt(
                                                            index);
                                                        cone.removeAt(
                                                            index);
                                                        conp.removeAt(
                                                            index);
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        decoration:
                                                        BoxDecoration(
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .accent1,
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .delete_outline_rounded,
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .tertiary,
                                                          size: 16.sp,
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
                                  ),
                                ),
                              ),
                            ],
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
            child:  Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.h, 16.w, 10.h),
              child: Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding:  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(14.w, 4.h, 12.w, 7.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Additional Charges',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 10.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsetsDirectional.fromSTEB(
                                          1.w, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 11.sp,
                                        height: 11.sp,
                                        decoration: const BoxDecoration(
                                          color: Color(0x8757636C),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.question_mark_rounded,
                                            color: FlutterFlowTheme.of(context).accent1,
                                            size: 7.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsetsDirectional.fromSTEB(
                                          1.w, 0.0, 2.w, 0.0),
                                      child: Text(
                                        iswithgst == false
                                            ? 'W/O GST'
                                            : 'With GST',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 7.sp,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 24.w,
                                      height: 12.h,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).alternate,
                                        borderRadius: BorderRadius.circular(16.r),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          if (iswithgst == false) {
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:  EdgeInsets.all(2.r),
                                                    child: InkWell(
                                                      splashColor: Colors.transparent,
                                                      focusColor: Colors.transparent,
                                                      hoverColor: Colors.transparent,
                                                      highlightColor:
                                                      Colors.transparent,
                                                      onTap: () async {
                                                        iswithgst = true;
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .accent1,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                            )
                                                          ],
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                              ],
                                            );
                                          } else {
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                const Spacer(),
                                                Expanded(
                                                  child: Padding(
                                                    padding:  EdgeInsets.all(2.r),
                                                    child: InkWell(
                                                      splashColor: Colors.transparent,
                                                      focusColor: Colors.transparent,
                                                      hoverColor: Colors.transparent,
                                                      highlightColor:
                                                      Colors.transparent,
                                                      onTap: () async {
                                                        iswithgst = false;
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                            )
                                                          ],
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 12.w,
                                      height: 20.h,
                                      decoration: const BoxDecoration(),
                                      child: TextFormField(
                                        controller: additionalchargescon,
                                        focusNode: textFieldFocusNode12,
                                        autofocus: true,
                                        obscureText: false,
                                        onChanged: (text){
                                          setState((){});
                                        },
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 7.w),
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:  BorderRadius.only(
                                              bottomLeft: Radius.circular(5.r),
                                              bottomRight: const Radius.circular(0.0),
                                              topLeft: Radius.circular(5.r),
                                              topRight: const Radius.circular(0.0),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:  BorderRadius.only(
                                              bottomLeft: Radius.circular(5.r),
                                              bottomRight: const Radius.circular(0.0),
                                              topLeft: Radius.circular(5.r),
                                              topRight: const Radius.circular(0.0),
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 1.0,
                                            ),
                                            borderRadius:  BorderRadius.only(
                                              bottomLeft: Radius.circular(5.r),
                                              bottomRight: const Radius.circular(0.0),
                                              topLeft: Radius.circular(5.r),
                                              topRight: const Radius.circular(0.0),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 1.0,
                                            ),
                                            borderRadius:  BorderRadius.only(
                                              bottomLeft: Radius.circular(5.r),
                                              bottomRight: const Radius.circular(0.0),
                                              topLeft: Radius.circular(5.r),
                                              topRight: const Radius.circular(0.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                        cursorHeight: 12.h,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                        cursorColor:
                                        FlutterFlowTheme.of(context).secondaryText,

                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0, 0.0),
                                      child: Container(
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).accent1,
                                          borderRadius:  BorderRadius.only(
                                            bottomLeft: const Radius.circular(0.0),
                                            bottomRight: Radius.circular(5.r),
                                            topLeft: const Radius.circular(0.0),
                                            topRight: Radius.circular(5.r),
                                          ),
                                          border: Border.all(
                                            color:
                                            FlutterFlowTheme.of(context).alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                  const AlignmentDirectional(0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor: Colors.transparent,
                                                    focusColor: Colors.transparent,
                                                    hoverColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () async {
                                                      isaddpercent = true;
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      '%',
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: 'Inter',
                                                        color: isaddpercent
                                                            ? FlutterFlowTheme.of(
                                                            context)
                                                            .tertiary
                                                            : FlutterFlowTheme.of(
                                                            context)
                                                            .secondaryText,
                                                        fontSize:
                                                        isaddpercent
                                                            ? 11.sp
                                                            : 9.sp,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 100.0,
                                              child: VerticalDivider(
                                                width: 2.0,
                                                thickness: 1.0,
                                                indent: 5.0,
                                                endIndent: 5.0,
                                                color: FlutterFlowTheme.of(context)
                                                    .alternate,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                  const AlignmentDirectional(0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor: Colors.transparent,
                                                    focusColor: Colors.transparent,
                                                    hoverColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () async {
                                                      isaddpercent = false;
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      '₹',
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: 'Inter',
                                                        color: isaddpercent ==
                                                            false
                                                            ? FlutterFlowTheme.of(
                                                            context)
                                                            .tertiary
                                                            : FlutterFlowTheme.of(
                                                            context)
                                                            .secondaryText,
                                                        fontSize:
                                                        isaddpercent ==
                                                            false
                                                            ? 11.sp
                                                            : 9.sp,
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
                                    ),
                                  ),
                                ].addToEnd(const SizedBox(width: 64.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.h, 0.0, 4.h),
                                    child: Text(
                                      'Charges Description',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 10.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding:  EdgeInsetsDirectional.fromSTEB(
                                          1.w, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 11.w,
                                        height: 11.h,
                                        decoration: const BoxDecoration(
                                          color: Color(0x8757636C),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.question_mark_rounded,
                                            color: FlutterFlowTheme.of(context).accent1,
                                            size: 7.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 116.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: TextFormField(
                                  controller: chargesdescriptioncon,
                                  focusNode: textFieldFocusNode13,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 7.w),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context).secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context).accent1,
                                  ),
                                  style:
                                  FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                                  cursorHeight: 12.h,
                                  cursorColor: FlutterFlowTheme.of(context).secondaryText,
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Extra Discount',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 10.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsetsDirectional.fromSTEB(
                                          1.w, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 11.w,
                                        height: 11.h,
                                        decoration: const BoxDecoration(
                                          color: Color(0x8757636C),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.question_mark_rounded,
                                            color: FlutterFlowTheme.of(context).accent1,
                                            size: 7.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 11.w,
                                      height: 20.h,
                                      decoration: const BoxDecoration(),
                                      child: TextFormField(
                                        controller: extradiscountcon,
                                        focusNode: textFieldFocusNode14,
                                        autofocus: true,
                                        obscureText: false,
                                        onChanged: (text){
                                          setState((){});
                                        },
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 7.w),
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context)
                                                  .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:  BorderRadius.only(
                                              bottomLeft: Radius.circular(5.r),
                                              bottomRight: const Radius.circular(0.0),
                                              topLeft: Radius.circular(5.r),
                                              topRight: const Radius.circular(0.0),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context).primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:  BorderRadius.only(
                                              bottomLeft: Radius.circular(5.r),
                                              bottomRight: const Radius.circular(0.0),
                                              topLeft: Radius.circular(5.r),
                                              topRight: const Radius.circular(0.0),
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 1.0,
                                            ),
                                            borderRadius:  BorderRadius.only(
                                              bottomLeft: Radius.circular(5.r),
                                              bottomRight: const Radius.circular(0.0),
                                              topLeft: Radius.circular(5.r),
                                              topRight: const Radius.circular(0.0),
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).error,
                                              width: 1.0,
                                            ),
                                            borderRadius:  BorderRadius.only(
                                              bottomLeft: Radius.circular(5.r),
                                              bottomRight: const Radius.circular(0.0),
                                              topLeft: Radius.circular(5.r),
                                              topRight: const Radius.circular(0.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                        cursorHeight: 12.h,
                                        keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                        cursorColor:
                                        FlutterFlowTheme.of(context).secondaryText,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0, 0.0),
                                      child: Container(
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).accent1,
                                          borderRadius:  BorderRadius.only(
                                            bottomLeft: const Radius.circular(0.0),
                                            bottomRight: Radius.circular(5.r),
                                            topLeft: const Radius.circular(0.0),
                                            topRight: Radius.circular(5.r),
                                          ),
                                          border: Border.all(
                                            color:
                                            FlutterFlowTheme.of(context).alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                  const AlignmentDirectional(0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor: Colors.transparent,
                                                    focusColor: Colors.transparent,
                                                    hoverColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () async {
                                                      isextradispercent = true;
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      '%',
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: 'Inter',
                                                        color: isextradispercent
                                                            ? FlutterFlowTheme.of(
                                                            context)
                                                            .tertiary
                                                            : FlutterFlowTheme.of(
                                                            context)
                                                            .secondaryText,
                                                        fontSize:
                                                        isextradispercent
                                                            ? 11.sp
                                                            : 9.sp,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 100.0,
                                              child: VerticalDivider(
                                                width: 2.0,
                                                thickness: 1.0,
                                                indent: 5.0,
                                                endIndent: 5.0,
                                                color: FlutterFlowTheme.of(context)
                                                    .alternate,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                  const AlignmentDirectional(0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor: Colors.transparent,
                                                    focusColor: Colors.transparent,
                                                    hoverColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () async {
                                                      isextradispercent = false;
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      '₹',
                                                      style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: 'Inter',
                                                        color: isextradispercent ==
                                                            false
                                                            ? FlutterFlowTheme
                                                            .of(context)
                                                            .tertiary
                                                            : FlutterFlowTheme
                                                            .of(context)
                                                            .secondaryText,
                                                        fontSize:
                                                        isextradispercent ==
                                                            false
                                                            ? 11.sp
                                                            : 9.sp,
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
                                    ),
                                  ),
                                ].addToEnd(const SizedBox(width: 64.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.h, 0.0, 4.h),
                                    child: Text(
                                      'Extra Discount Description',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 10.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding:  EdgeInsetsDirectional.fromSTEB(
                                          1.w, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 11.w,
                                        height: 11.h,
                                        decoration: const BoxDecoration(
                                          color: Color(0x8757636C),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.question_mark_rounded,
                                            color: FlutterFlowTheme.of(context).accent1,
                                            size: 7.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 116.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: TextFormField(
                                  controller: extradiscountdescriptioncon,
                                  focusNode: textFieldFocusNode15,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 7.w),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context).secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context).accent1,
                                  ),
                                  style:
                                  FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                                  cursorHeight: 12.h,
                                  cursorColor: FlutterFlowTheme.of(context).secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(12.w, 4.h, 12.w, 7.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.h),
                                child: Text(
                                  'Qty & Discount Details',
                                  style:
                                  FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 10.sp,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Items ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      fontSize: 9.sp,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  Text(
                                    billproducts.length.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      fontSize: 9.sp,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 4.h, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Qty',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 9.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: totitem == 0 ? FontWeight.w400 : FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        formatNumber(
                                          totitem,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.periodDecimal,
                                        ),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 9.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: totitem == 0 ? FontWeight.w400 :  FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 4.h, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Extra Discount',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 9.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: discount == 0 ? FontWeight.w400 :FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '₹${discount.toStringAsFixed(2)}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 9.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: discount == 0 ? FontWeight.w400 :FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 4.h, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Discount',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 9.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: discount == 0 ? FontWeight.w400 :  FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      formatNumber(
                                        double.parse(((discount) + (disitems)).toStringAsFixed(2)),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.periodDecimal,
                                        currency: '₹',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 9.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: discount == 0 ? FontWeight.w400 :  FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(12.w, 4.h, 12.w, 7.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding:  EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.h),
                                  child: Text(
                                    'Tax Details',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      fontSize: 10.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 2.h, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Additional Charges',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 9.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: additional == 0 ? FontWeight.w400 : FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      formatNumber(
                                        double.parse(additional.toStringAsFixed(2)),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.periodDecimal,
                                        currency: '₹',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 9.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: additional == 0 ? FontWeight.w400 : FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 4.h, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (issgst) {
                                          return Text(
                                            'SGST',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            'SGST',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (issgst) {
                                          return Text(
                                            '₹0',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            formatNumber(
                                              gst / 2,
                                              formatType: FormatType.decimal,
                                              decimalType: DecimalType.periodDecimal,
                                              currency: '₹',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 4.h, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (issgst) {
                                          return Text(
                                            'CGST',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            'CGST',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (issgst) {
                                          return Text(
                                            '₹0',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            formatNumber(
                                              gst / 2,
                                              formatType: FormatType.decimal,
                                              decimalType: DecimalType.periodDecimal,
                                              currency: '₹',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 4.h, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (issgst) {
                                          return Text(
                                            'IGST',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            'IGST',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (issgst) {
                                          return Text(
                                            formatNumber(
                                              gst,
                                              formatType: FormatType.decimal,
                                              decimalType: DecimalType.periodDecimal,
                                              currency: '₹',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            '₹0',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(12.w, 4.h, 12.w, 4.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Taxable Amount',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      fontSize: 10.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    formatNumber(
                                      total,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                      currency: '₹',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      fontSize: 10.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0,4.h, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Tax',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 10.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      formatNumber(
                                        gst,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.periodDecimal,
                                        currency: '₹',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 10.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 4.h, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 2.w, 0.0),
                                          child: Text(
                                            'Round Off',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 9.sp,
                                              letterSpacing: 0.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 24.w,
                                          height: 12.h,
                                          decoration: BoxDecoration(
                                            color:
                                            FlutterFlowTheme.of(context).alternate,
                                            borderRadius: BorderRadius.circular(16.r),
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              if (isroundof == false) {
                                                return Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:  EdgeInsets.all(2.r),
                                                        child: InkWell(
                                                          splashColor:
                                                          Colors.transparent,
                                                          focusColor:
                                                          Colors.transparent,
                                                          hoverColor:
                                                          Colors.transparent,
                                                          highlightColor:
                                                          Colors.transparent,
                                                          onTap: () async {
                                                            isroundof = true;
                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: double.infinity,
                                                            height: double.infinity,
                                                            decoration: BoxDecoration(
                                                              color:
                                                              FlutterFlowTheme.of(
                                                                  context)
                                                                  .accent1,
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  blurRadius: 4.0,
                                                                  color:
                                                                  Color(0x33000000),
                                                                  offset: Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                              shape: BoxShape.circle,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                  ],
                                                );
                                              } else {
                                                return Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    const Spacer(),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:  EdgeInsets.all(2.r),
                                                        child: InkWell(
                                                          splashColor:
                                                          Colors.transparent,
                                                          focusColor:
                                                          Colors.transparent,
                                                          hoverColor:
                                                          Colors.transparent,
                                                          highlightColor:
                                                          Colors.transparent,
                                                          onTap: () async {
                                                            isroundof = false;
                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: double.infinity,
                                                            height: double.infinity,
                                                            decoration: BoxDecoration(
                                                              color:
                                                              FlutterFlowTheme.of(
                                                                  context)
                                                                  .primaryText,
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  blurRadius: 4.0,
                                                                  color:
                                                                  Color(0x33000000),
                                                                  offset: Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                              shape: BoxShape.circle,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '.${total.toString().split('.').last}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 9.sp,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0.0, 4.w, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Amount',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        fontSize: 11.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SelectableText(
                                      formatNumber(
                                        isroundof ? total.toInt() : total,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.periodDecimal,
                                        currency: '₹',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context).tertiary,
                                        fontSize: 12.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide( SizedBox(height: 6.h)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvoiceBody extends StatefulWidget {
  InvoiceBody({super.key, required this.catdata, required this.prodata});

  List<Customer> catdata;
  List<Product> prodata;

  @override
  State<InvoiceBody> createState() => _InvoiceBodyState();
}

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}
