import 'dart:convert';

OhosApp ohosAppFromJson(String str) => OhosApp.fromJson(json.decode(str));

String ohosAppToJson(OhosApp data, {bool pretty = false}) {
  if (pretty) {
    return const JsonEncoder.withIndent('  ').convert(data.toJson());
  }
  return json.encode(data.toJson());
}

class OhosApp {
  App app;
  final Map<String, dynamic> extraRoot;

  OhosApp({
    required this.app,
    required this.extraRoot,
  });

  factory OhosApp.fromJson(Map<String, dynamic> json) => OhosApp(
        app: App.fromJson(json["app"]),
        extraRoot: Map<String, dynamic>.from(json)..remove('app'),
      );

  Map<String, dynamic> toJson() => {
        "app": app.toJson(),
      }..addAll(extraRoot);
}

class App {
  String bundleName;
  final Map<String, dynamic> extraRoot;

  App({
    required this.bundleName,
    required this.extraRoot,
  });

  factory App.fromJson(Map<String, dynamic> json) => App(
        bundleName: json["bundleName"],
        extraRoot: Map<String, dynamic>.from(json)..remove('bundleName'),
      );

  Map<String, dynamic> toJson() => {
        "bundleName": bundleName,
      }..addAll(extraRoot);
}
