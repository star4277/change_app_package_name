import 'dart:convert';

OhosApp ohosAppFromJson(String str) => OhosApp.fromJson(json.decode(str));

String ohosAppToJson(OhosApp data, {bool pretty = false}) {
  if (pretty) {
    return const JsonEncoder.withIndent('\t').convert(data.toJson());
  }
  return json.encode(data.toJson());
}

class OhosApp {
  App app;

  OhosApp({
    required this.app,
  });

  factory OhosApp.fromJson(Map<String, dynamic> json) => OhosApp(
        app: App.fromJson(json["app"]),
      );

  Map<String, dynamic> toJson() => {
        "app": app.toJson(),
      };
}

class App {
  String bundleName;
  String vendor;
  int versionCode;
  String versionName;
  String icon;
  String label;

  App({
    required this.bundleName,
    required this.vendor,
    required this.versionCode,
    required this.versionName,
    required this.icon,
    required this.label,
  });

  factory App.fromJson(Map<String, dynamic> json) => App(
        bundleName: json["bundleName"],
        vendor: json["vendor"],
        versionCode: json["versionCode"],
        versionName: json["versionName"],
        icon: json["icon"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "bundleName": bundleName,
        "vendor": vendor,
        "versionCode": versionCode,
        "versionName": versionName,
        "icon": icon,
        "label": label,
      };
}
