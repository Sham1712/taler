import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:taler/flutter_flow/flutter_flow_util.dart';

import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
class AddProduct extends StatefulWidget {
  const AddProduct({super.key});


  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> with TickerProviderStateMixin{

  TextEditingController namecon = TextEditingController(),
      categorycon = TextEditingController(),
      hsncodecon = TextEditingController(),
      openingstockcon = TextEditingController(),
      wholesalepricecon = TextEditingController(),
      retailpricecon = TextEditingController(),
      gstcon = TextEditingController();
  FocusNode textFieldFocusNode1 = FocusNode(),
      textFieldFocusNode2 = FocusNode(),
      textFieldFocusNode3 = FocusNode(),
      textFieldFocusNode4 = FocusNode(),
      textFieldFocusNode5 = FocusNode(),
      textFieldFocusNode7 = FocusNode(),
      textFieldFocusNode6 = FocusNode();

  final animationsMap = <String, AnimationInfo>{};
  bool isname=false, isgst=false;

  @override
  void initState() {
    // TODO: implement initState
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
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Products',
                      style:
                      FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Outfit',
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 332.0, 0.0),
                      child: Container(
                        width: 372.0,
                        height: 64.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(64.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 108.0,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color:
                                      FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'View',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                          fontFamily: 'Outfit',
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 108.0,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Create',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                          fontFamily: 'Outfit',
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width: 108.0,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color:
                                      FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Stocks',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                          fontFamily: 'Outfit',
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
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
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0),
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              32.0, 12.0, 32.0, 0.0),
                          child: Text(
                            'Add Product',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                              fontFamily: 'Outfit',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 32.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 48.0,
                        color: Color(0xFFF2F2F2),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              32.0, 8.0, 32.0, 0.0),
                          child: Container(
                            height: 204.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Basic Details',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 0.0, 16.0),
                                    child: Text(
                                      'Note: Category name will appear first in bill',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 16.0, 0.0),
                                          child: Container(
                                            width: 560.0,
                                            child: TextFormField(
                                              controller:
                                              namecon,
                                              focusNode:
                                              textFieldFocusNode1,
                                              autofocus: true,
                                              textCapitalization:
                                              TextCapitalization.characters,
                                              textInputAction:
                                              TextInputAction.next,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Product Name',
                                                labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                  fontFamily:
                                                  'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                                hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                  fontFamily:
                                                  'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFCDF3D8),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(24.0, 0.0,
                                                    0.0, 0.0),
                                                prefixIcon: const Icon(
                                                  Icons.shopping_cart,
                                                  size: 20.0,
                                                ),
                                              ),
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                            'textFieldOnActionTriggerAnimation1']!,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 64.0, 0.0),
                                          child: Container(
                                            width: 420.0,
                                            child: TextFormField(
                                              controller:
                                              categorycon,
                                              focusNode:
                                              textFieldFocusNode2,
                                              autofocus: true,
                                              textCapitalization:
                                              TextCapitalization.characters,
                                              textInputAction:
                                              TextInputAction.next,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Category Name',
                                                labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                  fontFamily:
                                                  'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                                hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                  fontFamily:
                                                  'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFCDF3D8),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(24.0, 0.0,
                                                    0.0, 0.0),
                                                prefixIcon: const Icon(
                                                  Icons.category_outlined,
                                                  size: 20.0,
                                                ),
                                              ),
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          width: 240.0,
                                          child: TextFormField(
                                            controller: hsncodecon,
                                            focusNode:
                                            textFieldFocusNode3,
                                            autofocus: true,
                                            textCapitalization:
                                            TextCapitalization.characters,
                                            textInputAction:
                                            TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'HSN Code',
                                              labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                              hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFCDF3D8),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[a-zA-Z0-9]'))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          width: 240.0,
                                          child: TextFormField(
                                            controller: openingstockcon,
                                            focusNode:
                                            textFieldFocusNode4,
                                            autofocus: true,
                                            textCapitalization:
                                            TextCapitalization.none,
                                            textInputAction:
                                            TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Opening Stock',
                                              labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                              hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFCDF3D8),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 32.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              32.0, 32.0, 32.0, 0.0),
                          child: Container(
                            height: 160.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Pricing',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 0.0, 16.0),
                                    child: Text(
                                      'Note: These are default values for the product and you can change in billing section.',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          width: 240.0,
                                          child: TextFormField(
                                            controller: wholesalepricecon,
                                            focusNode:
                                            textFieldFocusNode5,
                                            autofocus: true,
                                            textInputAction:
                                            TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Wholesale Price',
                                              labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                              hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFF2D1F9),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                              prefixIcon: const Icon(
                                                Icons.currency_rupee,
                                                size: 20.0,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          width: 240.0,
                                          child: TextFormField(
                                            controller: retailpricecon,
                                            focusNode:
                                            textFieldFocusNode6,
                                            autofocus: true,
                                            textInputAction:
                                            TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Retail Price',
                                              labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                              hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFF2D1F9),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                              prefixIcon: const Icon(
                                                Icons.currency_rupee,
                                                size: 20.0,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          width: 240.0,
                                          child: TextFormField(
                                            controller: gstcon,
                                            focusNode:
                                            textFieldFocusNode7,
                                            autofocus: true,
                                            textCapitalization:
                                            TextCapitalization.none,
                                            textInputAction:
                                            TextInputAction.done,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'GST%',
                                              labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                              hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily:
                                                'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFF2D1F9),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                              prefixIcon: const Icon(
                                                Icons.percent_rounded,
                                                size: 20.0,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                          ),
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                          'textFieldOnActionTriggerAnimation2']!,
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 32.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 32.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                  },
                                  text: 'Cancel',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiary,
                                      letterSpacing: 0.0,
                                    ),
                                    elevation: 1.0,
                                    borderSide: BorderSide(
                                      color:
                                      FlutterFlowTheme.of(context).tertiary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                    hoverColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                    hoverBorderSide: BorderSide(
                                      color:
                                      FlutterFlowTheme.of(context).tertiary,
                                      width: 1.0,
                                    ),
                                    hoverTextColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    hoverElevation: 1.0,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 48.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (!(isname && isgst)) {
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
                                      if (isgst == false) {
                                        if (animationsMap[
                                        'textFieldOnActionTriggerAnimation2'] !=
                                            null) {
                                          await animationsMap[
                                          'textFieldOnActionTriggerAnimation2']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                      }
                                    }
                                  },
                                  text: 'Save',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFF63AEFF),
                                      letterSpacing: 0.0,
                                    ),
                                    elevation: 1.0,
                                    borderSide: const BorderSide(
                                      color: Color(0xFF63AEFF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                    hoverColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                    hoverBorderSide: BorderSide(
                                      color:
                                      FlutterFlowTheme.of(context).tertiary,
                                      width: 1.0,
                                    ),
                                    hoverTextColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    hoverElevation: 1.0,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
