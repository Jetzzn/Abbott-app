import '/auth/firebase_auth/auth_util.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'one_signal_model.dart';
export 'one_signal_model.dart';

class OneSignalWidget extends StatefulWidget {
  const OneSignalWidget({super.key});

  @override
  State<OneSignalWidget> createState() => _OneSignalWidgetState();
}

class _OneSignalWidgetState extends State<OneSignalWidget> {
  late OneSignalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneSignalModel());

    _model.switchValue1 = false;
    _model.switchValue2 = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '08x5g6ex' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 741.71,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          unawaited(
                            () async {
                              await requestPermission(notificationsPermission);
                            }(),
                          );
                          triggerPushNotification(
                            notificationTitle: 'Custom Code',
                            notificationText:
                                'Custom Code Custom Code Custom Code',
                            userRefs: [currentUserReference!],
                            initialPageName: 'Home',
                            parameterData: {},
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'q27h31j0' /* Button */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Switch.adaptive(
                      value: _model.switchValue1!,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.switchValue1 = newValue);
                        if (newValue) {
                          unawaited(
                            () async {
                              await requestPermission(notificationsPermission);
                            }(),
                          );
                          unawaited(
                            () async {
                              await requestPermission(notificationsPermission);
                            }(),
                          );
                        }
                      },
                      activeTrackColor: FlutterFlowTheme.of(context).tertiary,
                      inactiveTrackColor: const Color(0xFFF8C7B5),
                      inactiveThumbColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    Switch.adaptive(
                      value: _model.switchValue2!,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.switchValue2 = newValue);
                        if (newValue) {
                          unawaited(
                            () async {
                              await requestPermission(notificationsPermission);
                            }(),
                          );
                          unawaited(
                            () async {
                              await requestPermission(notificationsPermission);
                            }(),
                          );
                          actions.initializeNotifications();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Open Notification',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        }
                      },
                      activeTrackColor: const Color(0xFF491261),
                      inactiveTrackColor: const Color(0xFFC7B6CF),
                      inactiveThumbColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
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
