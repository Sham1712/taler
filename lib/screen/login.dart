import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taler/constant/functions.dart';
import 'package:taler/service/authHelper.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(24.sp),
                    child: Text(
                      'Taler',
                      style:
                      FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Inter',
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(20.w, 0.0, 20.w, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.55,
                        constraints: const BoxConstraints(
                          maxWidth: 570.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 200.0,
                              color: Color(0x33000000),
                              spreadRadius: 16.r,
                            )
                          ],
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .primaryBackground,
                            width: 2.0,
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Spacer(flex: 2),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '"Skip the fuss,\n Just bill it! 📚💸"',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                    fontFamily: 'Inter',
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ),
                              const Spacer(flex: 2),
                              Divider(
                                height: 20.h,
                                thickness: 1.0,
                                indent: 20.w,
                                endIndent: 20.w,
                                color: Color(0x81636370),
                              ),
                              Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Select Your Account',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                      fontFamily: 'Inter',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async{
                                  User? user = await AuthHelper().signInGoogle();
                                  if(user != null) {
                                    routename(context, '/');
                                  } else {

                                  }
                                },
                                text: 'Continue with Google',
                                icon: FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Color(0xFF4285F4),
                                  size: 16.sp,
                                ),
                                options: FFButtonOptions(
                                  width: 280.w,
                                  height: 44.h,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.h, 0.0),
                                  color:
                                  FlutterFlowTheme.of(context).alternate,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.sp,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  elevation: 1.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(28.r),
                                  hoverColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  hoverElevation: 2.0,
                                ),
                              ),
                              const Spacer(flex: 2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.w, 0.0, 24.w, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/firesamp-uhaalm.appspot.com/o/Receipt-bro.png?alt=media&token=a6ce133b-fec5-4a12-a1fc-60a577c96ba7',
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    fit: BoxFit.fitWidth,
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