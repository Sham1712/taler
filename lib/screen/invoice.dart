import 'package:flutter/material.dart';
import 'package:taler/flutter_flow/flutter_flow_util.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {

  TextEditingController textController1 = TextEditingController(),
      textController2 = TextEditingController(),
      textController3 = TextEditingController(),
      textController4 = TextEditingController(),
      textController5 = TextEditingController(),
      textController6 = TextEditingController(),
      textController7 = TextEditingController(),
      textController8 = TextEditingController(),
      textController9 = TextEditingController(),
      textController10 = TextEditingController(),
      textController11 = TextEditingController(),
      textController12 = TextEditingController(),
      textController13 = TextEditingController(),
      textController14 = TextEditingController();

  FocusNode textFieldFocusNode1 = FocusNode(),
      textFieldFocusNode2 = FocusNode(),
      textFieldFocusNode3 = FocusNode(),
      textFieldFocusNode4 = FocusNode(),
      textFieldFocusNode5 = FocusNode(),
      textFieldFocusNode6 = FocusNode(),
      textFieldFocusNode7 = FocusNode(),
      textFieldFocusNode8 = FocusNode(),
      textFieldFocusNode9 = FocusNode(),
      textFieldFocusNode10 = FocusNode(),
      textFieldFocusNode11 = FocusNode(),
      textFieldFocusNode12 = FocusNode(),
      textFieldFocusNode13 = FocusNode(),
      textFieldFocusNode14 = FocusNode();

  DateTime datePicked = DateTime.now();
  bool isigst = false, issgst = false, isaddcharges = false, isaddpercent = true, isextradispercent = false, iswithgst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F4),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 4.0),
                                child: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText,
                                  size: 25.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  'New Invoice',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment:
                                        const AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 24.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () {

                                            },
                                            text: 'Save & Print',
                                            icon: const Icon(
                                              Icons.print_rounded,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                              iconPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                              color: Colors.white,
                                              textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                fontFamily: 'Inter',
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w600,
                                              ),
                                              elevation: 1.5,
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                              hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              hoverBorderSide: BorderSide(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .primary,
                                                width: 1.0,
                                              ),
                                              hoverTextColor: Colors.white,
                                              hoverElevation: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                        const AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 24.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () {
                                            },
                                            text: 'Save',
                                            icon: const Icon(
                                              Icons.arrow_forward_rounded,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
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
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w600,
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
                                              hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              hoverBorderSide: BorderSide(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .primary,
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                        fontSize: 24.0,
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
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Invoice No: ',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'INV - 230/23-24 ',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .primaryText,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.w800,
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                      width: double.infinity,
                                      height: 44.0,
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller: textController1,
                                          focusNode:
                                          textFieldFocusNode1,
                                          autofocus: true,
                                          textCapitalization:
                                          TextCapitalization.characters,
                                          textInputAction:
                                          TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Select Customer',
                                            labelStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                            hintStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .secondaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(
                                                    context)
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
                                              Icons
                                                  .keyboard_arrow_down_rounded,
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                          ),
                                          cursorColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      width: double.infinity,
                                      height: 44.0,
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller: textController2,
                                          focusNode:
                                          textFieldFocusNode2,
                                          autofocus: true,
                                          textInputAction:
                                          TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Reference By',
                                            labelStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                            hintStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .secondaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme.of(
                                                    context)
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
                                              Icons
                                                  .keyboard_arrow_down_rounded,
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                          ),
                                          cursorColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Align(
                                      alignment:
                                      const AlignmentDirectional(-1.0, -1.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 4.0, 0.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                            textController3,
                                            focusNode:
                                            textFieldFocusNode3,
                                            autofocus: true,
                                            textInputAction:
                                            TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Despatch Through',
                                              labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                              ),
                                              hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                              ),
                                              enabledBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
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
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
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
                                                  color: FlutterFlowTheme.of(
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
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                              suffixIcon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .secondaryText,
                                              ),
                                            ),
                                            style:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Inter',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                            cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              6.0, 0.0, 6.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller:
                                                  textController4,
                                                  focusNode: textFieldFocusNode4,
                                                  autofocus: true,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Invoice Date',
                                                    labelStyle:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily:
                                                      'Inter',
                                                      fontSize: 13.0,
                                                      letterSpacing:
                                                      0.0,
                                                    ),
                                                    hintStyle:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily:
                                                      'Inter',
                                                      fontSize: 13.0,
                                                      letterSpacing:
                                                      0.0,
                                                    ),
                                                    enabledBorder:
                                                    InputBorder.none,
                                                    focusedBorder:
                                                    InputBorder.none,
                                                    errorBorder:
                                                    InputBorder.none,
                                                    focusedErrorBorder:
                                                    InputBorder.none,
                                                    filled: true,
                                                    fillColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .accent1,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                              ),
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
                                                  /*final _datePickedDate =
                                                  /*await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                    getCurrentTimestamp,
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050),
                                                    builder:
                                                        (context, child) {
                                                      return ;
                                                    },
                                                  );*/

                                                  TimeOfDay? _datePickedTime;
                                                  if (_datePickedDate !=
                                                      null) {
                                                    _datePickedTime =
                                                    await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay
                                                          .fromDateTime(
                                                          getCurrentTimestamp),
                                                      builder:
                                                          (context, child) {
                                                        return wrapInMaterialTimePickerTheme(
                                                          context,
                                                          child!,
                                                          headerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .primary,
                                                          headerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .info,
                                                          headerTextStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .headlineLarge
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            fontSize:
                                                            32.0,
                                                            letterSpacing:
                                                            0.0,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                          ),
                                                          pickerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .secondaryBackground,
                                                          pickerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                          selectedDateTimeBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .primary,
                                                          selectedDateTimeForegroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .info,
                                                          actionButtonForegroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                          iconSize: 24.0,
                                                        );
                                                      },
                                                    );
                                                  }

                                                  if (_datePickedDate !=
                                                      null &&
                                                      _datePickedTime !=
                                                          null) {
                                                    safeSetState(() {
                                                      datePicked =
                                                          DateTime(
                                                            _datePickedDate.year,
                                                            _datePickedDate.month,
                                                            _datePickedDate.day,
                                                            _datePickedTime!.hour,
                                                            _datePickedTime
                                                                .minute,
                                                          );
                                                    });
                                                  }*/
                                                },
                                                child: Icon(
                                                  Icons
                                                      .calendar_month_rounded,
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 24.0, 16.0),
                                child: Container(
                                  width:
                                  MediaQuery.sizeOf(context).width * 0.75,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                0.0, 16.0, 0.0, 0.0),
                                            child: Text(
                                              'Product Details',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 8.0, 0.0, 16.0),
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
                                                  height: 44.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0,
                                                        4.0,
                                                        0.0,
                                                        0.0),
                                                    child: TextFormField(
                                                      controller: textController5,
                                                      focusNode: textFieldFocusNode5,
                                                      autofocus: true,
                                                      textCapitalization:
                                                      TextCapitalization
                                                          .characters,
                                                      obscureText: false,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText:
                                                        'Choose Category',
                                                        labelStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          fontSize:
                                                          13.0,
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        hintStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          fontSize:
                                                          13.0,
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                8.0),
                                                            bottomRight:
                                                            Radius
                                                                .circular(
                                                                0.0),
                                                            topLeft: Radius
                                                                .circular(
                                                                8.0),
                                                            topRight: Radius
                                                                .circular(
                                                                0.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                8.0),
                                                            bottomRight:
                                                            Radius
                                                                .circular(
                                                                0.0),
                                                            topLeft: Radius
                                                                .circular(
                                                                8.0),
                                                            topRight: Radius
                                                                .circular(
                                                                0.0),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                8.0),
                                                            bottomRight:
                                                            Radius
                                                                .circular(
                                                                0.0),
                                                            topLeft: Radius
                                                                .circular(
                                                                8.0),
                                                            topRight: Radius
                                                                .circular(
                                                                0.0),
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                8.0),
                                                            bottomRight:
                                                            Radius
                                                                .circular(
                                                                0.0),
                                                            topLeft: Radius
                                                                .circular(
                                                                8.0),
                                                            topRight: Radius
                                                                .circular(
                                                                0.0),
                                                          ),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .accent1,
                                                        suffixIcon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryText,
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        fontSize: 13.0,
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
                                                flex: 7,
                                                child: Container(
                                                  height: 44.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0,
                                                        4.0,
                                                        24.0,
                                                        0.0),
                                                    child: TextFormField(
                                                      controller: textController6,
                                                      focusNode: textFieldFocusNode6,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText:
                                                        'Choose Product',
                                                        labelStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          fontSize:
                                                          13.0,
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        hintStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                0.0),
                                                            bottomRight:
                                                            Radius
                                                                .circular(
                                                                8.0),
                                                            topLeft: Radius
                                                                .circular(
                                                                0.0),
                                                            topRight: Radius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                0.0),
                                                            bottomRight:
                                                            Radius
                                                                .circular(
                                                                8.0),
                                                            topLeft: Radius
                                                                .circular(
                                                                0.0),
                                                            topRight: Radius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                0.0),
                                                            bottomRight:
                                                            Radius
                                                                .circular(
                                                                8.0),
                                                            topLeft: Radius
                                                                .circular(
                                                                0.0),
                                                            topRight: Radius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                0.0),
                                                            bottomRight:
                                                            Radius
                                                                .circular(
                                                                8.0),
                                                            topLeft: Radius
                                                                .circular(
                                                                0.0),
                                                            topRight: Radius
                                                                .circular(
                                                                8.0),
                                                          ),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .accent1,
                                                        suffixIcon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryText,
                                                        ),
                                                      ),
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
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
                                                child: Container(
                                                  height: 44.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0,
                                                        4.0,
                                                        0.0,
                                                        0.0),
                                                    child: TextFormField(
                                                      controller: textController7,
                                                      focusNode: textFieldFocusNode7,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText: 'Quantity',
                                                        labelStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          fontSize:
                                                          13.0,
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        hintStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .labelMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          fontSize:
                                                          13.0,
                                                          letterSpacing:
                                                          0.0,
                                                        ),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: FlutterFlowTheme
                                                                .of(context)
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
                                                            color: FlutterFlowTheme
                                                                .of(context)
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
                                                            color: FlutterFlowTheme
                                                                .of(context)
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
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .accent1,
                                                        suffixIcon: Icon(
                                                          Icons
                                                              .numbers_rounded,
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
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
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    24.0, 0.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () {
                                                  },
                                                  text: 'Add to Bill',
                                                  icon: const Icon(
                                                    Icons.add_rounded,
                                                    size: 24.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16.0,
                                                        0.0,
                                                        16.0,
                                                        0.0),
                                                    iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0,
                                                        0.0,
                                                        0.0,
                                                        0.0),
                                                    color:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primary,
                                                    textStyle:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .titleSmall
                                                        .override(
                                                      fontFamily:
                                                      'Inter',
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .accent1,
                                                      letterSpacing:
                                                      0.0,
                                                    ),
                                                    elevation: 1.5,
                                                    borderSide: BorderSide(
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
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
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                Radius.circular(0.0),
                                                bottomRight:
                                                Radius.circular(0.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight:
                                                Radius.circular(8.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize:
                                                MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'Move',
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        color: FlutterFlowTheme.of(
                                                            context)
                                                            .primaryText,
                                                        letterSpacing:
                                                        0.0,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 12,
                                                    child: Text(
                                                      'Name',
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        color: FlutterFlowTheme.of(
                                                            context)
                                                            .primaryText,
                                                        letterSpacing:
                                                        0.0,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          4.0,
                                                          0.0,
                                                          0.0,
                                                          0.0),
                                                      child: Text(
                                                        'Quantity',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
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
                                                          4.0,
                                                          0.0,
                                                          0.0,
                                                          0.0),
                                                      child: Text(
                                                        'Unit Price',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
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
                                                          4.0,
                                                          0.0,
                                                          0.0,
                                                          0.0),
                                                      child: Text(
                                                        'Discount%',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
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
                                                          8.0,
                                                          0.0,
                                                          0.0,
                                                          0.0),
                                                      child: Text(
                                                        'Net Amount',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
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
                                                          0.0,
                                                          0.0),
                                                      child: Text(
                                                        'Extra Notes',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'Delete',
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        color: FlutterFlowTheme.of(
                                                            context)
                                                            .primaryText,
                                                        letterSpacing:
                                                        0.0,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 16.0),
                                          child: ListView(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                height: 60.0,
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
                                                    color:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .alternate,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 16.0,
                                                      0.0, 8.0),
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
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 12,
                                                        child: Text(
                                                          'Hello World',
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            fontSize:
                                                            16.0,
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
                                                          controller: textController8,
                                                          focusNode: textFieldFocusNode8,
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
                                                              color: FlutterFlowTheme.of(context)
                                                                  .secondaryText,
                                                              fontSize:
                                                              13.0,
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
                                                              color: FlutterFlowTheme.of(context)
                                                                  .secondaryText,
                                                              fontSize:
                                                              13.0,
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
                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .remove_rounded,
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .tertiary,
                                                              size: 20.0,
                                                            ),
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .add_rounded,
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .tertiary,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            fontSize:
                                                            13.0,
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
                                                          child:
                                                          TextFormField(
                                                            controller: textController9,
                                                            focusNode: textFieldFocusNode9,
                                                            autofocus: true,
                                                            obscureText:
                                                            false,
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle: FlutterFlowTheme.of(
                                                                  context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
                                                                fontSize:
                                                                13.0,
                                                                letterSpacing:
                                                                0.0,
                                                              ),
                                                              hintText: '₹',
                                                              hintStyle: FlutterFlowTheme.of(
                                                                  context)
                                                                  .labelMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Inter',
                                                                fontSize:
                                                                13.0,
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
                                                              13.0,
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
                                                          child:
                                                          TextFormField(
                                                            controller: textController10,
                                                            focusNode: textFieldFocusNode10,
                                                            autofocus: true,
                                                            obscureText:
                                                            false,
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle: FlutterFlowTheme.of(
                                                                  context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
                                                                fontSize:
                                                                13.0,
                                                                letterSpacing:
                                                                0.0,
                                                              ),
                                                              hintText: '%',
                                                              hintStyle: FlutterFlowTheme.of(
                                                                  context)
                                                                  .labelMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Inter',
                                                                fontSize:
                                                                13.0,
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
                                                              13.0,
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
                                                              '675',
                                                              textAlign:
                                                              TextAlign
                                                                  .start,
                                                              style: FlutterFlowTheme.of(
                                                                  context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .primaryText,
                                                                fontSize:
                                                                16.0,
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
                                                          child:
                                                          TextFormField(
                                                            controller: textController11,
                                                            focusNode: textFieldFocusNode11,
                                                            autofocus: true,
                                                            obscureText:
                                                            false,
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle: FlutterFlowTheme.of(
                                                                  context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
                                                                fontSize:
                                                                13.0,
                                                                letterSpacing:
                                                                0.0,
                                                              ),
                                                              hintText:
                                                              'Additional info',
                                                              hintStyle: FlutterFlowTheme.of(
                                                                  context)
                                                                  .labelMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Inter',
                                                                fontSize:
                                                                13.0,
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
                                                              13.0,
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
                                                          child: Container(
                                                            width: 92.0,
                                                            height: 131.0,
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
                                                              size: 24.0,
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
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width:
                                              MediaQuery.sizeOf(context)
                                                  .width *
                                                  0.22,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .accent1,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(16.0, 12.0,
                                                    16.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          0.0,
                                                          0.0,
                                                          4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            'Additional Charges',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              16.0,
                                                              letterSpacing:
                                                              0.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                2.0,
                                                                0.0,
                                                                0.0,
                                                                0.0),
                                                            child: Container(
                                                              width: 16.0,
                                                              height: 16.0,
                                                              decoration:
                                                              const BoxDecoration(
                                                                color: Color(
                                                                    0x8757636C),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                const AlignmentDirectional(
                                                                    0.0,
                                                                    0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .question_mark_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .accent1,
                                                                  size: 10.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          0.0,
                                                          0.0,
                                                          4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                4.0,
                                                                0.0,
                                                                4.0,
                                                                0.0),
                                                            child: Text(
                                                              iswithgst ==
                                                                  false
                                                                  ? 'W/O GST'
                                                                  : 'With GST',
                                                              style: FlutterFlowTheme.of(
                                                                  context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
                                                                fontSize:
                                                                10.0,
                                                                letterSpacing:
                                                                0.0,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 50.0,
                                                            height: 24.0,
                                                            decoration:
                                                            BoxDecoration(
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .alternate,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  24.0),
                                                            ),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                if (iswithgst ==
                                                                    false) {
                                                                  return Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                        Padding(
                                                                          padding:
                                                                          const EdgeInsets.all(4.0),
                                                                          child:
                                                                          InkWell(
                                                                            splashColor: Colors.transparent,
                                                                            focusColor: Colors.transparent,
                                                                            hoverColor: Colors.transparent,
                                                                            highlightColor: Colors.transparent,
                                                                            onTap: () async {
                                                                              iswithgst = true;
                                                                              setState(() {});
                                                                            },
                                                                            child: Container(
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).accent1,
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
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    children: [
                                                                      const Spacer(),
                                                                      Expanded(
                                                                        child:
                                                                        Padding(
                                                                          padding:
                                                                          const EdgeInsets.all(4.0),
                                                                          child:
                                                                          InkWell(
                                                                            splashColor: Colors.transparent,
                                                                            focusColor: Colors.transparent,
                                                                            hoverColor: Colors.transparent,
                                                                            highlightColor: Colors.transparent,
                                                                            onTap: () async {
                                                                              iswithgst = false;
                                                                              setState(() {});
                                                                            },
                                                                            child: Container(
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
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
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            width: 12.0,
                                                            height: 32.0,
                                                            decoration:
                                                            const BoxDecoration(),
                                                            child:
                                                            TextFormField(
                                                              controller: textController12,
                                                              focusNode: textFieldFocusNode12,
                                                              autofocus: true,
                                                              obscureText:
                                                              false,
                                                              decoration:
                                                              InputDecoration(
                                                                labelStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                    .labelMedium
                                                                    .override(
                                                                  fontFamily:
                                                                  'Inter',
                                                                  letterSpacing:
                                                                  0.0,
                                                                ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                    .labelMedium
                                                                    .override(
                                                                  fontFamily:
                                                                  'Inter',
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
                                                                    width:
                                                                    1.0,
                                                                  ),
                                                                  borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        8.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        8.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                OutlineInputBorder(
                                                                  borderSide:
                                                                  BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryText,
                                                                    width:
                                                                    1.0,
                                                                  ),
                                                                  borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        8.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        8.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                OutlineInputBorder(
                                                                  borderSide:
                                                                  BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .error,
                                                                    width:
                                                                    1.0,
                                                                  ),
                                                                  borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        8.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        8.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                OutlineInputBorder(
                                                                  borderSide:
                                                                  BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .error,
                                                                    width:
                                                                    1.0,
                                                                  ),
                                                                  borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        8.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        8.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                  ),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                    context)
                                                                    .accent1,
                                                              ),
                                                              style: FlutterFlowTheme.of(
                                                                  context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Inter',
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
                                                                16.0,
                                                                0.0),
                                                            child: Container(
                                                              height: 32.0,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .accent1,
                                                                borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      0.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      8.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      8.0),
                                                                ),
                                                                border: Border
                                                                    .all(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .alternate,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                      double.infinity,
                                                                      decoration:
                                                                      const BoxDecoration(),
                                                                      child:
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
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
                                                                            isaddpercent = true;
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                          Text(
                                                                            '%',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              fontFamily: 'Inter',
                                                                              color: isaddpercent ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: isaddpercent ? 16.0 : 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                    100.0,
                                                                    child:
                                                                    VerticalDivider(
                                                                      width:
                                                                      2.0,
                                                                      thickness:
                                                                      1.0,
                                                                      indent:
                                                                      5.0,
                                                                      endIndent:
                                                                      5.0,
                                                                      color: FlutterFlowTheme.of(context)
                                                                          .alternate,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                      double.infinity,
                                                                      decoration:
                                                                      const BoxDecoration(),
                                                                      child:
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
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
                                                                            isaddpercent = false;
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                          Text(
                                                                            '₹',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              fontFamily: 'Inter',
                                                                              color: isaddpercent == false ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: isaddpercent == false ? 16.0 : 14.0,
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
                                                      ].addToEnd(const SizedBox(
                                                          width: 64.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0.0,
                                                              8.0,
                                                              0.0,
                                                              8.0),
                                                          child: Text(
                                                            'Charges Description',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              16.0,
                                                              letterSpacing:
                                                              0.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                            ),
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
                                                                2.0,
                                                                0.0,
                                                                0.0,
                                                                0.0),
                                                            child: Container(
                                                              width: 16.0,
                                                              height: 16.0,
                                                              decoration:
                                                              const BoxDecoration(
                                                                color: Color(
                                                                    0x8757636C),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                const AlignmentDirectional(
                                                                    0.0,
                                                                    0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .question_mark_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .accent1,
                                                                  size: 10.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 32.0,
                                                            height: 32.0,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  8.0),
                                                            ),
                                                            child: SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                              TextFormField(
                                                                controller: textController13,
                                                                focusNode: textFieldFocusNode13,
                                                                autofocus:
                                                                true,
                                                                obscureText:
                                                                false,
                                                                decoration:
                                                                InputDecoration(
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                      context)
                                                                      .labelMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    letterSpacing:
                                                                    0.0,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                      context)
                                                                      .labelMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    letterSpacing:
                                                                    0.0,
                                                                  ),
                                                                  enabledBorder:
                                                                  OutlineInputBorder(
                                                                    borderSide:
                                                                    BorderSide(
                                                                      color: FlutterFlowTheme.of(context)
                                                                          .alternate,
                                                                      width:
                                                                      1.0,
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                  OutlineInputBorder(
                                                                    borderSide:
                                                                    BorderSide(
                                                                      color: FlutterFlowTheme.of(context)
                                                                          .secondaryText,
                                                                      width:
                                                                      1.0,
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        8.0),
                                                                  ),
                                                                  errorBorder:
                                                                  OutlineInputBorder(
                                                                    borderSide:
                                                                    BorderSide(
                                                                      color: FlutterFlowTheme.of(context)
                                                                          .error,
                                                                      width:
                                                                      1.0,
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                    borderSide:
                                                                    BorderSide(
                                                                      color: FlutterFlowTheme.of(context)
                                                                          .error,
                                                                      width:
                                                                      1.0,
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        8.0),
                                                                  ),
                                                                  filled:
                                                                  true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                      context)
                                                                      .accent1,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                    context)
                                                                    .bodyMedium
                                                                    .override(
                                                                  fontFamily:
                                                                  'Inter',
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
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          8.0,
                                                          0.0,
                                                          8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            'Extra Discount',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              16.0,
                                                              letterSpacing:
                                                              0.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                2.0,
                                                                0.0,
                                                                0.0,
                                                                0.0),
                                                            child: Container(
                                                              width: 16.0,
                                                              height: 16.0,
                                                              decoration:
                                                              const BoxDecoration(
                                                                color: Color(
                                                                    0x8757636C),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                const AlignmentDirectional(
                                                                    0.0,
                                                                    0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .question_mark_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .accent1,
                                                                  size: 10.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            width: 12.0,
                                                            height: 32.0,
                                                            decoration:
                                                            const BoxDecoration(),
                                                            child:
                                                            TextFormField(
                                                              controller: textController14,
                                                              focusNode: textFieldFocusNode14,
                                                              autofocus: true,
                                                              obscureText:
                                                              false,
                                                              decoration:
                                                              InputDecoration(
                                                                labelStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                    .labelMedium
                                                                    .override(
                                                                  fontFamily:
                                                                  'Inter',
                                                                  letterSpacing:
                                                                  0.0,
                                                                ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                    .labelMedium
                                                                    .override(
                                                                  fontFamily:
                                                                  'Inter',
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
                                                                    width:
                                                                    1.0,
                                                                  ),
                                                                  borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        8.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        8.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                OutlineInputBorder(
                                                                  borderSide:
                                                                  BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primary,
                                                                    width:
                                                                    1.0,
                                                                  ),
                                                                  borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        8.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        8.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                OutlineInputBorder(
                                                                  borderSide:
                                                                  BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .error,
                                                                    width:
                                                                    1.0,
                                                                  ),
                                                                  borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        8.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        8.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                OutlineInputBorder(
                                                                  borderSide:
                                                                  BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .error,
                                                                    width:
                                                                    1.0,
                                                                  ),
                                                                  borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        8.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        8.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                  ),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                    context)
                                                                    .accent1,
                                                              ),
                                                              style: FlutterFlowTheme.of(
                                                                  context)
                                                                  .bodyMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Inter',
                                                                letterSpacing:
                                                                0.0,
                                                              ),
                                                              cursorColor:
                                                              FlutterFlowTheme.of(
                                                                  context)
                                                                  .secondaryText,
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
                                                                16.0,
                                                                0.0),
                                                            child: Container(
                                                              height: 32.0,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .accent1,
                                                                borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      0.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      8.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      8.0),
                                                                ),
                                                                border: Border
                                                                    .all(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .alternate,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                      double.infinity,
                                                                      decoration:
                                                                      const BoxDecoration(),
                                                                      child:
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
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
                                                                            isextradispercent = true;
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                          Text(
                                                                            '%',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              fontFamily: 'Inter',
                                                                              color: isextradispercent ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: isextradispercent ? 16.0 : 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                    100.0,
                                                                    child:
                                                                    VerticalDivider(
                                                                      width:
                                                                      2.0,
                                                                      thickness:
                                                                      1.0,
                                                                      indent:
                                                                      5.0,
                                                                      endIndent:
                                                                      5.0,
                                                                      color: FlutterFlowTheme.of(context)
                                                                          .alternate,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                      double.infinity,
                                                                      decoration:
                                                                      const BoxDecoration(),
                                                                      child:
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
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
                                                                            isextradispercent = false;
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                          Text(
                                                                            '₹',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              fontFamily: 'Inter',
                                                                              color: isaddpercent == false ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: isaddpercent == false ? 16.0 : 14.0,
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
                                                      ].addToEnd(const SizedBox(
                                                          width: 64.0)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width:
                                              MediaQuery.sizeOf(context)
                                                  .width *
                                                  0.22,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .accent1,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(16.0, 12.0,
                                                    16.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          0.0,
                                                          0.0,
                                                          4.0),
                                                      child: Text(
                                                        'Qty & Discount Details',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          fontSize: 14.0,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                          'Total Items ',
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            fontSize:
                                                            14.0,
                                                            letterSpacing:
                                                            0.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          '0',
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            fontSize:
                                                            14.0,
                                                            letterSpacing:
                                                            0.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          8.0,
                                                          0.0,
                                                          0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            'Total Qty',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              14.0,
                                                              letterSpacing:
                                                              0.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            '0',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              14.0,
                                                              letterSpacing:
                                                              0.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          8.0,
                                                          0.0,
                                                          0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            'Extra Discount',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              14.0,
                                                              letterSpacing:
                                                              0.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            '₹0',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              14.0,
                                                              letterSpacing:
                                                              0.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          8.0,
                                                          0.0,
                                                          0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            'Total Discount',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              14.0,
                                                              letterSpacing:
                                                              0.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            '₹ 0.00',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              14.0,
                                                              letterSpacing:
                                                              0.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
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
                                              width:
                                              MediaQuery.sizeOf(context)
                                                  .width *
                                                  0.22,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .accent1,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(16.0, 12.0,
                                                    16.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, -1.0),
                                                      child: Text(
                                                        'Tax Details',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          4.0,
                                                          0.0,
                                                          0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Builder(
                                                            builder:
                                                                (context) {
                                                              if (isaddcharges) {
                                                                return Text(
                                                                  'Additional Charges',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                  ),
                                                                );
                                                              } else {
                                                                return Text(
                                                                  'Additional Charges',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                          Builder(
                                                            builder:
                                                                (context) {
                                                              if (isaddcharges) {
                                                                return Text(
                                                                  '₹ 0.00',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                  ),
                                                                );
                                                              } else {
                                                                return Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                                  child: Text(
                                                                    '₹ 0.00',
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyMedium
                                                                        .override(
                                                                      fontFamily:
                                                                      'Inter',
                                                                      fontSize:
                                                                      14.0,
                                                                      letterSpacing:
                                                                      0.0,
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                    ),
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
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          8.0,
                                                          0.0,
                                                          0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Builder(
                                                            builder:
                                                                (context) {
                                                              if (issgst) {
                                                                return Text(
                                                                  'SGST',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                );
                                                              } else {
                                                                return Text(
                                                                  'SGST',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    fontWeight:
                                                                    FontWeight.w500,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                          Builder(
                                                            builder:
                                                                (context) {
                                                              if (issgst) {
                                                                return Text(
                                                                  '₹ 0.00',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                );
                                                              } else {
                                                                return Text(
                                                                  '₹ 0.00',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    fontWeight:
                                                                    FontWeight.normal,
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
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          8.0,
                                                          0.0,
                                                          0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Builder(
                                                            builder:
                                                                (context) {
                                                              if (issgst) {
                                                                return Text(
                                                                  'CGST',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                );
                                                              } else {
                                                                return Text(
                                                                  'CGST',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    fontWeight:
                                                                    FontWeight.normal,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                          Builder(
                                                            builder:
                                                                (context) {
                                                              if (issgst) {
                                                                return Text(
                                                                  '₹ 0.00',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                );
                                                              } else {
                                                                return Text(
                                                                  '₹ 0.00',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
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
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          8.0,
                                                          0.0,
                                                          0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Builder(
                                                            builder:
                                                                (context) {
                                                              if (isigst) {
                                                                return Text(
                                                                  'IGST',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    fontWeight:
                                                                    FontWeight.normal,
                                                                  ),
                                                                );
                                                              } else {
                                                                return Text(
                                                                  'IGST',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                          Builder(
                                                            builder:
                                                                (context) {
                                                              if (isigst) {
                                                                return Text(
                                                                  '₹ 0.00',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    fontWeight:
                                                                    FontWeight.normal,
                                                                  ),
                                                                );
                                                              } else {
                                                                return Text(
                                                                  '₹ 0.00',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily:
                                                                    'Inter',
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    fontWeight:
                                                                    FontWeight.bold,
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
                                              width:
                                              MediaQuery.sizeOf(context)
                                                  .width *
                                                  0.22,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(
                                                    context)
                                                    .accent1,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(16.0, 12.0,
                                                    16.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                          'Taxable Amount',
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            fontSize:
                                                            16.0,
                                                            letterSpacing:
                                                            0.0,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          '₹ 0',
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            fontSize:
                                                            16.0,
                                                            letterSpacing:
                                                            0.0,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          8.0,
                                                          0.0,
                                                          0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            'Total Tax',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              16.0,
                                                              letterSpacing:
                                                              0.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                            ),
                                                          ),
                                                          Text(
                                                            '₹ 0.00',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              16.0,
                                                              letterSpacing:
                                                              0.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          8.0,
                                                          0.0,
                                                          0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            'Round Off',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              14.0,
                                                              letterSpacing:
                                                              0.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            '-0.00',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              14.0,
                                                              letterSpacing:
                                                              0.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          8.0,
                                                          0.0,
                                                          0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            'Total Amount',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              22.0,
                                                              letterSpacing:
                                                              0.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w800,
                                                            ),
                                                          ),
                                                          Text(
                                                            '₹0',
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              fontSize:
                                                              22.0,
                                                              letterSpacing:
                                                              0.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w800,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(const SizedBox(height: 16.0))
                                              .addToStart(
                                              const SizedBox(height: 1.0))
                                              .addToEnd(
                                              const SizedBox(height: 16.0)),
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
          ],
        ),
      ),
    );
  }
}
