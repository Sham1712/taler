import 'dart:core';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taler/constant/functions.dart';
import 'package:taler/flutter_flow/flutter_flow_util.dart';
import 'package:taler/main.dart';
import 'package:taler/object/bill.dart';
import 'package:taler/object/customer.dart';
import 'package:taler/object/paymentin.dart';
import 'package:taler/service/billHelper.dart';
import 'package:toastification/toastification.dart';

import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class PaymentInPage extends StatelessWidget {
  PaymentInPage(
      {super.key,
      required this.page,
      required this.bildata,
      required this.cusdata,
      required this.paydata});
  List<Bill> bildata;
  List<Customer> cusdata;
  List<Payment> paydata;
  int page;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (con) {
      if (page == 1) {
        return ViewPaymentIn(
          paydata: paydata,
          cusdata: cusdata,
        );
      } else if (page == 2) {
        return AddPaymentIn(bildata: bildata, cusdata: cusdata);
      }
      return Container();
    });
  }
}

List<String> types = ['Net Banking', 'Cheque', 'Cash', 'UPI', 'Card'];
List<Color> ticlr(context) => [
      FlutterFlowTheme.of(context).customColor4,
      FlutterFlowTheme.of(context).accent2,
      FlutterFlowTheme.of(context).customColor4,
      FlutterFlowTheme.of(context).accent2,
      FlutterFlowTheme.of(context).customColor4,
    ];
List<Color> toclr(context) => [
      FlutterFlowTheme.of(context).customColor5,
      FlutterFlowTheme.of(context).customColor1,
      FlutterFlowTheme.of(context).customColor5,
      FlutterFlowTheme.of(context).customColor1,
      FlutterFlowTheme.of(context).customColor5,
    ];

class _AddPaymentInState extends State<AddPaymentIn>
    with TickerProviderStateMixin {
  TextEditingController amountreceivedcon = TextEditingController(),
      amountadjustmentcon = TextEditingController(),
      notescon = TextEditingController();

  FocusNode textFieldFocusNode1 = FocusNode(),
      textFieldFocusNode2 = FocusNode(),
      textFieldFocusNode3 = FocusNode(),
      textFieldFocusNode4 = FocusNode(),
      textFieldFocusNode5 = FocusNode(),
      textFieldFocusNode6 = FocusNode();

  bool isname = false, isbillno = false, isamount = false;
  int type = 0;
  DateTime datePicked = DateTime.now();

  final animationsMap = <String, AnimationInfo>{};

  SingleSelectController<Customer> namecon =
      SingleSelectController<Customer>(null);
  SingleSelectController<Bill> billno = SingleSelectController<Bill>(null);
  SingleSelectController<String> bankcon = SingleSelectController<String>(null);

  @override
  void initState() {
    super.initState();

    animationsMap.addAll({
      'textFieldOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effects: [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            hz: 5,
            offset: const Offset(5.0, 0.0),
            rotation: 0,
          ),
        ],
      ),
      'textFieldOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effects: [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            hz: 5,
            offset: const Offset(5.0, 0.0),
            rotation: 0,
          ),
        ],
      ),
      'textFieldOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effects: [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            hz: 5,
            offset: const Offset(5.0, 0.0),
            rotation: 0,
          ),
        ],
      ),
      'dropDownOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effects: [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            hz: 5,
            offset: const Offset(5.0, 0.0),
            rotation: 0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Bill> billist = [];
    for (var cus in widget.bildata) {
      if (!namecon.hasValue || namecon.value!.name == cus.id) {
        billist.add(cus);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    16.0, 16.0, 16.0, 16.0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Pay In- Payment ID',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 18.sp,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 16.0),
                                    child: Text(
                                      'Note: A payment-in is processed for every bill.',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 10.sp,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (!(isname && isbillno && isamount)) {
                                    if (isname == false) {
                                      if (animationsMap[
                                              'textFieldOnActionTriggerAnimation1'] !=
                                          null) {
                                        await animationsMap[
                                                'textFieldOnActionTriggerAnimation1']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    }
                                    if (isbillno == false) {
                                      if (animationsMap[
                                              'textFieldOnActionTriggerAnimation2'] !=
                                          null) {
                                        await animationsMap[
                                                'textFieldOnActionTriggerAnimation2']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    }
                                    if (isamount == false) {
                                      if (animationsMap[
                                              'textFieldOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'textFieldOnActionTriggerAnimation3']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    }
                                  } else {
                                    BillHelper().addpayment(
                                      Payment(
                                          invoiceid: billno.value!.id!,
                                          customerid: namecon.value!.id!,
                                          amount: double.parse(
                                              amountreceivedcon.text),
                                          date: datePicked,
                                          mode: types[type],
                                          bank: bankcon.value ?? '',
                                          billadjamount: double.tryParse(
                                                  amountadjustmentcon.text) ??
                                              0,
                                          notes: notescon.text,
                                          isin: true),
                                    );
                                    toastification.show(
                                      context: context,
                                      type: ToastificationType.success,
                                      style: ToastificationStyle.flat,
                                      autoCloseDuration:
                                          const Duration(seconds: 5),
                                      title: Text(
                                        'Payment Received',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                      description: Text(
                                        'To view this payment go to view payment',
                                        style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary),
                                      ),
                                      alignment: Alignment.bottomRight,
                                      animationDuration:
                                          const Duration(milliseconds: 300),
                                      icon: const Icon(Icons.check),
                                      showIcon: true,
                                      primaryColor: Colors.green,
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 16),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x07000000),
                                          blurRadius: 16,
                                          offset: Offset(0, 16),
                                          spreadRadius: 0,
                                        )
                                      ],
                                      showProgressBar: true,
                                      closeButtonShowType:
                                          CloseButtonShowType.onHover,
                                      closeOnClick: false,
                                      pauseOnHover: true,
                                      dragToClose: true,
                                      applyBlurEffect: true,
                                    );
                                    billno.clear();
                                    namecon.clear();
                                    amountadjustmentcon.clear();
                                    amountreceivedcon.clear();
                                    datePicked = DateTime.now();
                                    bankcon.clear();
                                    notescon.clear();
                                    type = 0;
                                    setState(() {});
                                  }
                                },
                                text: 'Add Payment',
                                options: FFButtonOptions(
                                  height: 44.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 1.5,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  hoverColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  hoverBorderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  hoverTextColor: Colors.white,
                                  hoverElevation: 2.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Text(
                                'Customer Name*',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Payment Bill No.*',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Payment Date',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 24.0)),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(
                                    context,
                                  ).secondary,
                                ),
                              ),
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 8.0),
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 10.0),
                              child: CustomDropdown<Customer>.search(
                                decoration: CustomDropdownDecoration(
                                  expandedBorder: Border.all(
                                    color: FlutterFlowTheme.of(
                                      context,
                                    ).secondary,
                                    width: 1,
                                  ),
                                ),
                                controller: namecon,
                                hintText: 'Select Customer',
                                items: widget.cusdata,
                                onChanged: (value) {
                                  setState(() {
                                    billno.clear();
                                    isname = value != null;
                                  });
                                },
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'textFieldOnActionTriggerAnimation1']!,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(
                                    context,
                                  ).secondary,
                                ),
                              ),
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 8.0),
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 10.0),
                              child: CustomDropdown<Bill>.search(
                                decoration: CustomDropdownDecoration(
                                  expandedBorder: Border.all(
                                    color: FlutterFlowTheme.of(
                                      context,
                                    ).secondary,
                                    width: 1,
                                  ),
                                ),
                                controller: billno,
                                hintText: 'Select Bill no',
                                items: widget.bildata,
                                onChanged: (value) {
                                  isbillno = value != null;
                                },
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'textFieldOnActionTriggerAnimation2']!,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 6.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        DateFormat("yyyy-mm-dd hh:mm")
                                            .format(datePicked),
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                          color: FlutterFlowTheme.of(
                                            context,
                                          ).secondaryText,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final datePickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2050),
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
                                      child: Icon(
                                        Icons.calendar_month_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 24.0)),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Recevied Amount*',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Payment Mode*',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [],
                              ),
                            ),
                          ].divide(const SizedBox(width: 24.0)),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: amountreceivedcon,
                              focusNode: textFieldFocusNode4,
                              autofocus: true,
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              onChanged: (val) {
                                isamount = val.isNotEmpty;
                                if (double.tryParse(amountreceivedcon.text) ==
                                        null &&
                                    amountreceivedcon.text.isNotEmpty) {
                                  amountreceivedcon.text =
                                      amountreceivedcon.text.substring(
                                          0, amountreceivedcon.text.length - 1);
                                }
                              },
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Eg. 10000',
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
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'textFieldOnActionTriggerAnimation3']!,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              height: 48.0,
                              decoration: const BoxDecoration(),
                              child: // Generated code for this Row Widget...
                                  Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(types.length, (index) {
                                    final modeItem = types[index];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        type = index;
                                        setState(() {});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: index == type
                                              ? FlutterFlowTheme.of(context)
                                                  .success
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: index == type
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12.0, 0.0, 12.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (index == type)
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .checkCircle,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 14.0,
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
                                                          0.0, 4.0, 0.0, 4.0),
                                                  child: Text(
                                                    modeItem,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: index == type
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                          fontSize:
                                                              index == type
                                                                  ? 13.0
                                                                  : 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).divide(const SizedBox(width: 16.0)),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            ),
                          ),
                        ].divide(const SizedBox(width: 24.0)),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Bank',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Amount of Bill Adjustment',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Notes',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 24.0)),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  )),
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                              ),
                              child: DropdownButton(
                                borderRadius: BorderRadius.circular(8),
                                underline: const SizedBox(),
                                //value: '',

                                hint: const Text('Select Bank'),
                                items: ['1', '2', '3'].map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Wrap(
                                      children: [
                                        Text(
                                          items,
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'dropDownOnActionTriggerAnimation']!,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: amountadjustmentcon,
                              focusNode: textFieldFocusNode5,
                              autofocus: true,
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText:
                                    'Any discounts or adjustments to close the bill',
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
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: notescon,
                              focusNode: textFieldFocusNode6,
                              autofocus: true,
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Any notes to refer',
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
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 24.0)),
                      ),
                    ],
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

class _ViewPaymentInState extends State<ViewPaymentIn> {
  TextEditingController textController = TextEditingController();
  FocusNode textFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    List<Payment> data = widget.paydata;
    List<Payment> payments = [];
    payments = data.where((pro) {
      return true;
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Payment In',
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 8.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.3,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: textController,
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
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(2.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () {},
                      text: 'Sort By',
                      icon: Icon(
                        Icons.filter_list_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 4.0, 0.0),
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
                  Align(
                    alignment: const AlignmentDirectional(2.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () {},
                        text: 'Pay In',
                        icon: Icon(
                          Icons.add_box,
                          color: FlutterFlowTheme.of(context).accent1,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 4.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          hoverColor: FlutterFlowTheme.of(context).primary,
                          hoverBorderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.5,
                          ),
                          hoverTextColor: FlutterFlowTheme.of(context).accent1,
                          hoverElevation: 2.0,
                        ),
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
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.99,
                  height: MediaQuery.sizeOf(context).height * 0.06,
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
                                fontFamily: 'Inter',
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
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 11.sp,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Customer',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 11.sp,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Amount',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 12.sp,
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
                            'Mode',
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
                    ]
                        .addToStart(const SizedBox(width: 16.0))
                        .divide(wspace(10.w)),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: payments.length,
                itemBuilder: (context, index) {
                  Payment paymentin = payments[index];
                  return PaymentInList(
                    paymentin: paymentin,
                    cusdata: widget.cusdata,
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

class _PaymentInListState extends State<PaymentInList> {
  bool mouseRegionHovered1 = false, mouseRegionHovered2 = false;
  late Payment paymentin;
  String name = '';

  @override
  Widget build(BuildContext context) {
    paymentin = widget.paymentin;

    widget.cusdata.forEach((cus) {
      if (cus.id == paymentin.customerid) {
        name = cus.name;
      }
    });

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
        height: MediaQuery.sizeOf(context).height * 0.06,
        decoration: BoxDecoration(
          color: mouseRegionHovered1
              ? FlutterFlowTheme.of(context).secondary
              : FlutterFlowTheme.of(context).accent1,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                DateFormat('dd-MM-yyyy').format(paymentin.date),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 11.sp,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                paymentin.invoiceid,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 11.sp,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                name,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 11.sp,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                '₹${paymentin.amount.toString()}',
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 12.0, 0.0, 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 0.2,
                        ),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Text(
                            paymentin.mode.toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 8.sp,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MouseRegion(
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
                          if (mouseRegionHovered2) {
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation:
                                          mouseRegionHovered2 ? 1.0 : 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Container(
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
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      8.0, 0.0, 8.0, 0.0),
                                              child: Icon(
                                                Icons.remove_red_eye_rounded,
                                                color: mouseRegionHovered2
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .accent1
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                size: 16.0,
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      -1.0, 0.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  'View',
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                            fontWeight:
                                                                FontWeight.bold,
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
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          12.0, 0.0, 8.0, 0.0),
                      child: Icon(
                        Icons.keyboard_control_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 28.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ].addToStart(const SizedBox(width: 16.0)).divide(wspace(10.w)),
        ),
      ),
    );
  }
}

class _EditPaymentInState extends State<EditPaymentIn>
    with TickerProviderStateMixin {
  TextEditingController namecon = TextEditingController(),
      billnocon = TextEditingController(),
      datecon = TextEditingController(),
      amountreceivedcon = TextEditingController(),
      amountadjustmentcon = TextEditingController(),
      notescon = TextEditingController();

  FocusNode textFieldFocusNode1 = FocusNode(),
      textFieldFocusNode2 = FocusNode(),
      textFieldFocusNode3 = FocusNode(),
      textFieldFocusNode4 = FocusNode(),
      textFieldFocusNode5 = FocusNode(),
      textFieldFocusNode6 = FocusNode();

  bool isname = false, isbillno = false, isamount = false;
  int type = 1;
  DateTime datePicked = DateTime.now();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();

    animationsMap.addAll({
      'textFieldOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effects: [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            hz: 5,
            offset: const Offset(5.0, 0.0),
            rotation: 0,
          ),
        ],
      ),
      'textFieldOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effects: [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            hz: 5,
            offset: const Offset(5.0, 0.0),
            rotation: 0,
          ),
        ],
      ),
      'textFieldOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effects: [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            hz: 5,
            offset: const Offset(5.0, 0.0),
            rotation: 0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent1,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Edit Pay In- Payment ID',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 18.sp,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 16.0),
                                child: Text(
                                  'Note: A payment-in is processed for every bill.',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 10.sp,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FFButtonWidget(
                              onPressed: () {},
                              text: 'Delete',
                              options: FFButtonOptions(
                                height: 44.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).accent1,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                elevation: 1.5,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                hoverColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                hoverBorderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  width: 1.0,
                                ),
                                hoverTextColor: Colors.white,
                                hoverElevation: 2.0,
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (!(isname && isbillno && isamount)) {
                                    if (isname == false) {
                                      if (animationsMap[
                                              'textFieldOnActionTriggerAnimation1'] !=
                                          null) {
                                        await animationsMap[
                                                'textFieldOnActionTriggerAnimation1']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    }
                                    if (isbillno == false) {
                                      if (animationsMap[
                                              'textFieldOnActionTriggerAnimation2'] !=
                                          null) {
                                        await animationsMap[
                                                'textFieldOnActionTriggerAnimation2']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    }
                                    if (isamount == false) {
                                      if (animationsMap[
                                              'textFieldOnActionTriggerAnimation3'] !=
                                          null) {
                                        await animationsMap[
                                                'textFieldOnActionTriggerAnimation3']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    }
                                  }
                                },
                                text: 'Update',
                                options: FFButtonOptions(
                                  height: 44.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 1.5,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  hoverColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  hoverBorderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  hoverTextColor: Colors.white,
                                  hoverElevation: 2.0,
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 24.0)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Customer Name*',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.sp,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Payment Bill No.*',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.sp,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Payment Date',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.sp,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 24.0)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 5,
                        child: TextFormField(
                          controller: namecon,
                          focusNode: textFieldFocusNode1,
                          autofocus: true,
                          textCapitalization: TextCapitalization.characters,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          onChanged: (val) {
                            isname = val.isNotEmpty;
                          },
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Name',
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                            prefixIcon: Icon(
                              Icons.people_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                        ).animateOnActionTrigger(
                          animationsMap['textFieldOnActionTriggerAnimation1']!,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: billnocon,
                          focusNode: textFieldFocusNode2,
                          autofocus: true,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          onChanged: (val) {
                            isname = val.isNotEmpty;
                          },
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Select Bill',
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                        ).animateOnActionTrigger(
                          animationsMap['textFieldOnActionTriggerAnimation2']!,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 6.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: datecon,
                                    focusNode: textFieldFocusNode3,
                                    autofocus: true,
                                    readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Date',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 8.sp,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 0.0, 4.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final datePickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
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
                                  child: Icon(
                                    Icons.calendar_month_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 24.0)),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 16.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Recevied Amount*',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.sp,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Payment Mode*',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.sp,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [],
                          ),
                        ),
                      ].divide(const SizedBox(width: 24.0)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: amountreceivedcon,
                          focusNode: textFieldFocusNode4,
                          autofocus: true,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          onChanged: (val) {
                            isname = val.isNotEmpty;
                          },
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Eg. 10000',
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                        ).animateOnActionTrigger(
                          animationsMap['textFieldOnActionTriggerAnimation3']!,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      type = 1;
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: type == 1
                                            ? FlutterFlowTheme.of(context)
                                                .success
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: type == 1
                                              ? FlutterFlowTheme.of(context)
                                                  .accent3
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          width: 0.2,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (type == 1)
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 8.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.circleCheck,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 14.0,
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
                                                      0.0, 4.0, 0.0, 4.0),
                                              child: Text(
                                                'Net Banking',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: type == 1
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 8.sp,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      type = 2;
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: type == 2
                                            ? FlutterFlowTheme.of(context)
                                                .success
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: type == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .accent3
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          width: 0.2,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (type == 2)
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 8.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.circleCheck,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 14.0,
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
                                                      0.0, 4.0, 0.0, 4.0),
                                              child: Text(
                                                'UPI',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: type == 2
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 8.sp,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      type = 3;
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: type == 3
                                            ? FlutterFlowTheme.of(context)
                                                .success
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: type == 3
                                              ? FlutterFlowTheme.of(context)
                                                  .accent3
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          width: 0.2,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (type == 3)
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 8.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.circleCheck,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 14.0,
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
                                                      0.0, 4.0, 0.0, 4.0),
                                              child: Text(
                                                'Cheque',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: type == 3
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 8.sp,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      type = 4;
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: type == 4
                                            ? FlutterFlowTheme.of(context)
                                                .success
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: type == 4
                                              ? FlutterFlowTheme.of(context)
                                                  .accent3
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          width: 0.2,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (type == 4)
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 8.0, 0.0),
                                              child: FaIcon(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                FontAwesomeIcons.circleCheck,
                                                size: 14.0,
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
                                                      0.0, 4.0, 0.0, 4.0),
                                              child: Text(
                                                'Cash',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: type == 4
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 8.sp,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      type = 5;
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: type == 5
                                            ? FlutterFlowTheme.of(context)
                                                .success
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: type == 5
                                              ? FlutterFlowTheme.of(context)
                                                  .accent3
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          width: 0.2,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (type == 5)
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 8.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.circleCheck,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 14.0,
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
                                                      0.0, 4.0, 0.0, 4.0),
                                              child: Text(
                                                'Card',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: type == 5
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 8.sp,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        ),
                      ),
                    ].divide(const SizedBox(width: 24.0)),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 16.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Bank',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.sp,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Amount of Bill Adjustment',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.sp,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Notes',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.sp,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 24.0)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: amountadjustmentcon,
                          focusNode: textFieldFocusNode5,
                          autofocus: true,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintText:
                                'Any discounts or adjustments to close the bill',
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
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: notescon,
                          focusNode: textFieldFocusNode6,
                          autofocus: true,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Any notes to refer',
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
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 24.0)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewPaymentIn extends StatefulWidget {
  ViewPaymentIn({super.key, required this.paydata, required this.cusdata});
  List<Customer> cusdata;
  List<Payment> paydata;

  @override
  State<ViewPaymentIn> createState() => _ViewPaymentInState();
}

class PaymentInList extends StatefulWidget {
  PaymentInList({super.key, required this.paymentin, required this.cusdata});
  List<Customer> cusdata;
  Payment paymentin;

  @override
  State<PaymentInList> createState() => _PaymentInListState();
}

class EditPaymentIn extends StatefulWidget {
  const EditPaymentIn({super.key});

  @override
  State<EditPaymentIn> createState() => _EditPaymentInState();
}

class AddPaymentIn extends StatefulWidget {
  AddPaymentIn({super.key, required this.bildata, required this.cusdata});
  List<Bill> bildata;
  List<Customer> cusdata;

  @override
  State<AddPaymentIn> createState() => _AddPaymentInState();
}
