import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Flexmonster extends StatefulWidget {
  const Flexmonster(
      {this.height, this.width, this.toolbar, this.licenseKey, Key? key})
      : super(key: key);

  final String? width, height, licenseKey;
  final bool? toolbar;

  @override
  State<Flexmonster> createState() => _FlexmonsterState();
}

class _FlexmonsterState extends State<Flexmonster> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  String getReport() {
    String report = "";
    _controller.future.then((value) async => {
          report = await value
              .runJavascriptReturningResult("flexmonster.getReport()")
        });
    return report;
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) async {
        _controller.complete(webViewController);
        webViewController.loadHtmlString('''  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.flexmonster.com/flexmonster.min.css" rel="stylesheet">
    <script src="https://cdn.flexmonster.com/toolbar/flexmonster.toolbar.js"></script>
    <script src="https://cdn.flexmonster.com/flexmonster.js"></script>
    <script src="https://cdn.flexmonster.com/lib/d3.v3.min.js"></script>
    <script src="https://cdn.flexmonster.com/lib/canvg.min.js"></script>
    <script src="https://cdn.flexmonster.com/lib/html2canvas.min.js"></script>
    <script src="https://cdn.flexmonster.com/lib/jspdf.min.js"></script>
    <script src="https://cdn.flexmonster.com/lib/promise.min.js"></script>
    <script src="https://cdn.flexmonster.com/lib/sha1.min.js"></script>
  </head>

  <body style="margin:0; padding:0; display: flex; height: 100vh;">
    <div id="pivot-container"></div>
    <div id="output">
    </div>
        <script>
            let pivot = new Flexmonster({
                container: "#pivot-container",
                componentFolder: "https://cdn.flexmonster.com/",
                toolbar: ${widget.toolbar ?? false},
                height: "${widget.height ?? "500"}",
                width: "${widget.width ?? "100%"}",
                licenseKey: "${widget.licenseKey ?? ""}",
                report: "https://cdn.flexmonster.com/reports/report.json"
            });
        </script>
  </body>
  </html>
  ''');
      },
      gestureNavigationEnabled: true,
    );
  }
}

// JUST COMMENTED OUT TO REMEMBER HOW TO CALL JS
                    //   String report = await controller!
                    //       .runJavascriptReturningResult(
                    //           "flexmonster.getReport()");
                    //   print(report);
                    //   await controller.runJavascript(
                    //       '''window.document.getElementById("output").innerText=$report''');
                    //   controller.reload();
                    // },
