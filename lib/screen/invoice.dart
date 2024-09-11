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

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

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
      extradiscountcon = TextEditingController();

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
      textFieldFocusNode14 = FocusNode();

  DateTime datePicked = DateTime.now();
  bool isigst = false,
      issgst = false,
      isaddcharges = false,
      isaddpercent = true,
      isextradispercent = false,
      iswithgst = false;

  List<Billproduct> billproducts = [];

  double total = 0, discount = 0, additional = 0, disitems = 0;
  double totitem = 0;

  void caluculate() {
    total = 0;
    discount = 0;
    additional = 0;
    totitem = 0;
    for (Billproduct pro in billproducts) {
      disitems += ((pro.price * pro.quantity) * (pro.dicountpercent / 100));
      total += netamountof(pro);
      totitem += pro.quantity.toInt();
    }

    discount = isextradispercent
        ? (double.tryParse(extradiscountcon.text) ?? 0) / 100 * total
        : double.tryParse(extradiscountcon.text) ?? 0;
    additional = isaddcharges
        ? (double.tryParse(additionalchargescon.text) ?? 0) / 100 * total
        : double.tryParse(additionalchargescon.text) ?? 0;

    total += additional;
    total -= discount;
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
        borderRadius: BorderRadius.circular(24.0),
      ),
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
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 0.0, 16.0, 0,
                      ),
                      child: InkWell(
                        onTap: () {
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 24.0, 0.0),
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
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
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
                                    borderRadius: BorderRadius.circular(8.0),
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 24.0, 0.0),
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
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
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
                                    borderRadius: BorderRadius.circular(8.0),
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
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
            child: Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Container(
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        //width: 800.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: CustomDropdown<Customer>.search(
                                      decoration: CustomDropdownDecoration(
                                        expandedBorder: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          width: 1,
                                        ),
                                      ),
                                      controller: namecon,
                                      hintText: 'Select Customer',
                                      items: widget.catdata,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: const BoxDecoration(),
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
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                                BorderRadius.circular(8.0),
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
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                  Expanded(
                                    flex: 2,
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
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10.0, 10.0, 6.0, 10.0),
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
                                            wspace(4),
                                            Expanded(
                                              child: Text(
                                                DateFormat("yyyy-mm-dd hh:mm")
                                                    .format(datePicked),
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.bold,
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
                                ]
                                    .divide(const SizedBox(width: 16.0))
                                    .addToStart(const SizedBox(width: 24.0))
                                    .addToEnd(const SizedBox(width: 24.0)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 24.0, 16.0),
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 8.0, 0.0, 8),
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
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                    8.0,
                                                  ),
                                                  bottomRight: Radius.circular(
                                                    0.0,
                                                  ),
                                                  topLeft: Radius.circular(
                                                    8.0,
                                                  ),
                                                  topRight: Radius.circular(
                                                    0.0,
                                                  ),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                    context,
                                                  ).secondary,
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 4.0, 0.0, 8.0),
                                              margin:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
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
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 7,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                    context,
                                                  ).secondary,
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 4.0, 0.0, 8.0),
                                              margin:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 10.0, 10.0),
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
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, .0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller: quantitycon,
                                                  focusNode:
                                                      textFieldFocusNode7,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
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
                                                              8.0),
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
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(24.0, 0.0, 0.0, 0.0),
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
                                                              12),
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
                                                              12),
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
                                                height: 40.0,
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
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
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16.0, 0.0, 0.0, 0.0),
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
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
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
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
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
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
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
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
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
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 16.0),
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
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(4.0),
                                                    bottomRight:
                                                        Radius.circular(4.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
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
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 16.0, 0.0, 8.0),
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
                                                          width: 100.0,
                                                          height: 100.0,
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
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
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
                                                                          8.0),
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
                                                                          8.0),
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
                                                                          8.0),
                                                            ),
                                                            prefixIcon: InkWell(
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
                                                            suffixIcon: InkWell(
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
                                                                size: 14.sp,
                                                              ),
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
                                                      Expanded(
                                                        flex: 5,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
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
                                                                            8.0),
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
                                                                            8.0),
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
                                                                            8.0),
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
                                                                            8.0),
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
                                                      Expanded(
                                                        flex: 3,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
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
                                                                            8.0),
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
                                                                            8.0),
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
                                                                            8.0),
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
                                                                            8.0),
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
                                                      Expanded(
                                                        flex: 5,
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    8.0,
                                                                    8.0),
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
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
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
                                                                            8.0),
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
                                                                            8.0),
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
                                                                            8.0),
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
                                                                            8.0),
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
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
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
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
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
