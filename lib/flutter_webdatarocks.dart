import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class WebDataRocks extends StatelessWidget {
  final Completer<WebViewController> controller =
      Completer<WebViewController>();

  WebDataRocks(
      {String? height,
      String? width,
      bool? toolbar,
      dynamic report,
      dynamic global,
      Key? key})
      : super(key: key) {
    _height = height;
    _width = width;
    _toolbar = toolbar;
    _report = report;
    _global = global;
  }

  late Map<String, List<Function>> eventHandlers = {};
  String? _width, _height;
  bool? _toolbar;
  dynamic _report, _global;

  ///This API call returns report JSON object as string
  Future<dynamic> getReport() async {
    WebViewController apiController = await controller.future;
    String reportString = await apiController
        .runJavascriptReturningResult("webdatarocks.getReport()");
    dynamic report = jsonDecode(reportString);
    return report;
  }

  ///This API call adds a calculated measure.
  Future<void> addCalculatedMeasure(dynamic measure) async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript(
        "webdatarocks.addCalculatedMeasure(${jsonEncode(measure)})");
  }

  ///Adds a conditional formatting rule for cell values to format them with specific styles if the condition for the cell value is met.
  Future<void> addCondition(dynamic condition) async {
    WebViewController apiController = await controller.future;
    await apiController
        .runJavascript("webdatarocks.addCondition(${jsonEncode(condition)})");
  }

  ///Clears the component’s data and view.
  Future<void> clear() async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript("webdatarocks.clear()");
  }

  ///Clears the filter which was applied previously to the specified hierarchy.
  Future<void> clearFilter(String hierarchyName) async {
    WebViewController apiController = await controller.future;
    await apiController
        .runJavascript("webdatarocks.clearFilter('$hierarchyName')");
  }

  ///Clears the filter which was applied previously to the specified hierarchy.
  Future<void> connectTo(dynamic dataSource) async {
    WebViewController apiController = await controller.future;
    await apiController
        .runJavascript("webdatarocks.connectTo(${jsonEncode(dataSource)})");
  }

  ///Returns a list of conditional formatting rules of the report.
  ///You may need this API call to edit existing conditional formatting rules.
  Future<dynamic> getAllConditions() async {
    WebViewController apiController = await controller.future;
    String conditionsString = await apiController
        .runJavascriptReturningResult("webdatarocks.getAllConditions()");
    dynamic conditions = jsonDecode(conditionsString);
    return conditions;
  }

  ///Returns a list of all available hierarchies.
  Future<dynamic> getAllHierarchies() async {
    WebViewController apiController = await controller.future;
    String hierarchiesString = await apiController
        .runJavascriptReturningResult("webdatarocks.getAllHierarchies()");
    dynamic hierarchies = jsonDecode(hierarchiesString);
    return hierarchies;
  }

  ///Returns a list of all available measures.
  Future<dynamic> getAllMeasures() async {
    WebViewController apiController = await controller.future;
    String measuresString = await apiController
        .runJavascriptReturningResult("webdatarocks.getAllMeasures()");
    dynamic measures = jsonDecode(measuresString);
    return measures;
  }

  ///Returns information about the cell by row and column indexes.
  Future<dynamic> getCell(int rowIdx, int colIdx) async {
    WebViewController apiController = await controller.future;
    String cellDataObjectString = await apiController
        .runJavascriptReturningResult("webdatarocks.getCell($rowIdx,$colIdx)");
    dynamic cellDataObject = jsonDecode(cellDataObjectString);
    return cellDataObject;
  }

  ///Returns a list of hierarchies selected in the report slice for columns.
  Future<dynamic> getColumns() async {
    WebViewController apiController = await controller.future;
    String columnsString = await apiController
        .runJavascriptReturningResult("webdatarocks.getColumns()");
    dynamic columns = jsonDecode(columnsString);
    return columns;
  }

  ///Returns a conditional formatting rule by id. You may need this API call to edit the existing conditional formatting rule.
  Future<dynamic> getCondition(String id) async {
    WebViewController apiController = await controller.future;
    String conditionString = await apiController
        .runJavascriptReturningResult("webdatarocks.getCondition('$id')");
    dynamic condition = jsonDecode(conditionString);
    return condition;
  }

  ///Returns the `FilterObject` for the specified hierarchy.
  Future<dynamic> getFilter(String hierarchyName) async {
    WebViewController apiController = await controller.future;
    String filterString = await apiController.runJavascriptReturningResult(
        "webdatarocks.getFilter('$hierarchyName')");
    dynamic filter = jsonDecode(filterString);
    return filter;
  }

  ///The `getFilterProperties` API call.
  Future<dynamic> getFilterProperties(String hierarchyName) async {
    WebViewController apiController = await controller.future;
    String filterString = await apiController.runJavascriptReturningResult(
        "webdatarocks.getFilterProperties('$hierarchyName')");
    dynamic filter = jsonDecode(filterString);
    return filter;
  }

  ///Returns the default number format or the number format for the specified measure.
  Future<dynamic> getFormat(String measureName) async {
    WebViewController apiController = await controller.future;
    String formatString = await apiController
        .runJavascriptReturningResult("webdatarocks.getFormat('$measureName')");
    dynamic format = jsonDecode(formatString);
    return format;
  }

  ///Returns a list of the selected measures in the report.
  Future<dynamic> getMeasures() async {
    WebViewController apiController = await controller.future;
    String measuresString = await apiController
        .runJavascriptReturningResult("webdatarocks.getMeasures()");
    dynamic measures = jsonDecode(measuresString);
    return measures;
  }

  ///Returns a list of members for the specified hierarchy.
  ///Note that this API call has no `callbackHandler` parameter in Flutter.
  Future<dynamic> getMembers(String uniqueName, [String? memberName]) async {
    WebViewController apiController = await controller.future;
    String membersString = await apiController.runJavascriptReturningResult(
        "webdatarocks.getMembers('$uniqueName'${memberName == null ? "" : "'$memberName'"})");
    dynamic members = jsonDecode(membersString);
    return members;
  }

  ///Returns `OptionsObject` with component’s options.
  Future<dynamic> getOptions() async {
    WebViewController apiController = await controller.future;
    String optionsString = await apiController
        .runJavascriptReturningResult("webdatarocks.getOptions()");
    dynamic options = jsonDecode(optionsString);
    return options;
  }

  ///Returns a list of hierarchies selected in the report slice for report filters.
  Future<dynamic> getReportFilters() async {
    WebViewController apiController = await controller.future;
    String reportFiltersString = await apiController
        .runJavascriptReturningResult("webdatarocks.getReportFilters()");
    dynamic reportFilters = jsonDecode(reportFiltersString);
    return reportFilters;
  }

  ///Returns a list of hierarchies selected in the report slice for rows.
  Future<dynamic> getRows() async {
    WebViewController apiController = await controller.future;
    String rowsString = await apiController
        .runJavascriptReturningResult("webdatarocks.getRows()");
    dynamic rows = jsonDecode(rowsString);
    return rows;
  }

  ///Returns information about the selected cell/cells.
  Future<dynamic> getSelectedCell() async {
    WebViewController apiController = await controller.future;
    String selectedCellsString = await apiController
        .runJavascriptReturningResult("webdatarocks.getSelectedCell()");
    dynamic selectedCells = jsonDecode(selectedCellsString);
    return selectedCells;
  }

  ///Loads the report file from the specified URL.
  Future<void> load(String url) async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript("webdatarocks.load('$url')");
  }

  ///This API call allows you to control redrawing of the component when you use the following API calls:
  ///`addCondition()`, `removeAllConditions()`, `removeCondition()`, `setFormat()`, `setOptions()`
  Future<void> refresh() async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript("webdatarocks.refresh()");
  }

  ///Removes all calculated measures.
  ///Note that the `removeAllCalculatedMeasures` method is available only for reports based on `"csv"`, `"json"`, and `"api"` data source types.
  Future<void> removeAllCalculatedMeasures() async {
    WebViewController apiController = await controller.future;
    await apiController
        .runJavascript("webdatarocks.removeAllCalculatedMeasures()");
  }

  ///Removes all conditional formatting rules.
  ///Use `refresh()` API call after to redraw the component and see changes.
  Future<void> removeAllConditions() async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript("webdatarocks.removeAllConditions()");
  }

  ///Removes the calculated measure by the measure’s unique name.
  ///Note that the `removeCalculatedMeasure` method is available only for reports based on `"json"`, `"csv"`, and `"api"` data source types.
  Future<void> removeCalculatedMeasure(String uniqueName) async {
    WebViewController apiController = await controller.future;
    await apiController
        .runJavascript("webdatarocks.removeCalculatedMeasure('$uniqueName')");
  }

  ///Removes the conditional formatting rule by `id`.
  ///Use `refresh()` API call after to redraw the component and see changes.
  Future<void> removeCondition(String id) async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript("webdatarocks.removeCondition('$id')");
  }

  ///Removes a selection from cells on the grid.
  Future<void> removeSelection() async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript("webdatarocks.removeSelection()");
  }

  ///The `setBottomX` API call.
  Future<void> setBottomX(
      String hierarchyName, int num, String measureName) async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript(
        "webdatarocks.setBottomX('$hierarchyName',$num,'$measureName')");
  }

  ///The `setTopX` API call.
  Future<void> setTopX(
      String hierarchyName, int num, String measureName) async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript(
        "webdatarocks.setTopX('$hierarchyName',$num,'$measureName')");
  }

  ///Runs a query with specified `rows`, `columns`, `measures` and `reportFilters` from the `SliceObject` and displays the result data.
  ///Use this method to rearrange hierarchies on the axes or to compose a new report based on the current data source.
  Future<void> runQuery(dynamic slice) async {
    WebViewController apiController = await controller.future;
    await apiController
        .runJavascript("webdatarocks.runQuery(${jsonEncode(slice)})");
  }

  ///Sets the filter for the specified hierarchy.
  Future<void> setFilter(String hierarchyName, List<String> items,
      [bool? negation]) async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript(
        "webdatarocks.setFilter('$hierarchyName',${jsonEncode(items)},${negation == null ? "" : "$negation"})");
  }

  ///Sets a default number format or the number format for the specified measure.
  ///Use `refresh()` API call after setting a format to redraw the component and see changes.
  Future<void> setFormat(dynamic format, String measureName) async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript(
        '''webdatarocks.setFormat(${jsonEncode(format)},'$measureName'})''');
  }

  ///Sets the component’s options.
  ///Use `refresh()` API call after to redraw the component and see changes.
  Future<void> setOptions(dynamic options) async {
    WebViewController apiController = await controller.future;
    await apiController
        .runJavascript("webdatarocks.setOptions(${jsonEncode(options)})");
  }

  ///Sets a report to be displayed in the component.
  ///Use this method to load and show previously saved reports.
  Future<void> setReport(dynamic report) async {
    WebViewController apiController = await controller.future;
    await apiController
        .runJavascript("webdatarocks.setReport(${jsonEncode(report)})");
  }

  ///Sets the sort type to the specified hierarchy.
  Future<void> setSort(String hierarchyName, String sortName,
      [List<String>? customSorting]) async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript(
        "webdatarocks.setSort('$hierarchyName','$sortName',${customSorting == null ? "" : "$customSorting"})");
  }

  ///Sorts values in a specific row or column.
  Future<void> sortValues(String axisName, String type, List<double> tuple,
      String measureName) async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript(
        "webdatarocks.sortValues('$axisName','$type',${jsonEncode(tuple)},'$measureName')");
  }

  ///Connects to a new data source whereas filtering, sorting, etc. remain the same.
  Future<void> updateData(dynamic object, [dynamic options]) async {
    WebViewController apiController = await controller.future;
    await apiController
        .runJavascript('''webdatarocks.updateData(${jsonEncode(object)}
        ${options == null ? "" : jsonEncode(options)})''');
  }

  ///This API call opens the Field list.
  Future<void> openFieldsList() async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript("webdatarocks.openFieldsList()");
  }

  ///This API call closes the Field list.
  Future<void> closeFieldsList() async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript("webdatarocks.closeFieldsList()");
  }

  ///Collapses all nodes and drills up (starting from v2.1) all levels of all hierarchies in the slice on the grid and on charts.\n
  ///All expanded/drilled down nodes will be collapsed/drilled up on the grid and on charts.
  Future<void> collapseAllData() async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript("webdatarocks.collapseAllData()");
  }

  ///Collapses all nodes of the specified hierarchy. Please note, this method works only for `CSV` and `JSON` data sources.
  Future<void> collapseData(String hierarchyName) async {
    WebViewController apiController = await controller.future;
    await apiController
        .runJavascript("webdatarocks.collapseData('$hierarchyName')");
  }

  ///Prepares the pivot table instance to be deleted with the browser’s garbage collection.
  Future<void> dispose() async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript("webdatarocks.dispose()");
  }

  //Expands all nodes and drills down all levels of all hierarchies in the slice on the grid and on charts.
  //All collapsed/drilled up nodes will be expanded/drilled down on the grid and on charts.
  Future<void> expandAllData([bool withAllChildren = true]) async {
    WebViewController apiController = await controller.future;
    await apiController
        .runJavascript("webdatarocks.expandAllData($withAllChildren)");
  }

  ///Expands all nodes of the specified hierarchy.
  ///Please note, this method works only for CSV and JSON data sources.
  Future<void> expandData(String hierarchyName) async {
    WebViewController apiController = await controller.future;
    await apiController
        .runJavascript("webdatarocks.expandData('$hierarchyName')");
  }

  ///Returns the sort type which is applied to the hierarchy.
  Future<String> getSort(String hierarchyName) async {
    WebViewController apiController = await controller.future;
    return await apiController
        .runJavascriptReturningResult("webdatarocks.getSort('$hierarchyName')");
  }

  ///Sets a Dart function for the specified event.
  void on(String eventName, Function function) {
    if (eventHandlers[eventName] == null) {
      eventHandlers[eventName] = [function];
    } else {
      eventHandlers[eventName]!.add(function);
    }
  }

  ///Sets a Dart function for the specified event.
  off(String eventName, [Function? function]) {
    if (function == null) {
      eventHandlers[eventName] = <Function>[];
    }
    while ((eventHandlers[eventName])!.contains(function)) {
      eventHandlers[eventName]!.remove(function);
    }
  }

  ///Opens local report file. Use this API call to open the report JSON file from the local file system.
  Future<void> open() async {
    WebViewController apiController = await controller.future;
    await apiController.runJavascript("webdatarocks.open()");
  }

  ///Returns version of the WebDataRocks JavaScript library.
  Future<String> version() async {
    WebViewController apiController = await controller.future;
    return await apiController
        .runJavascriptReturningResult("webdatarocks.version");
  }

  final List<String> _eventList = [
    "afterchartdraw",
    "aftergriddraw",
    "beforegriddraw",
    "cellclick",
    "chartclick",
    "celldoubleclick",
    "datachanged",
    "dataerror",
    "datafilecancelled",
    "dataloaded",
    "drillthroughclose",
    "drillthroughopen",
    "fieldslistclose",
    "fieldslistopen",
    "filterclose",
    "filteropen",
    "loadingdata",
    "loadinglocalization",
    "loadingolapstructure",
    "loadingreportfile",
    "localizationerror",
    "localizationloaded",
    "olapstructureerror",
    "olapstructureloaded",
    "openingreportfile",
    "querycomplete",
    "queryerror",
    "ready",
    "reportchange",
    "reportcomplete",
    "reportfilecancelled",
    "reportfileerror",
    "runningquery",
    "update"
  ];

  ///Register each event so that it send the message channel
  String _registerEvents() {
    Iterable<String> strings = _eventList.map((eventName) {
      return '''webdatarocks.on("$eventName", function (eventData) {
                        var response = {
                            type: "event",
                            name: "$eventName",
                            data: eventData
                        };
                        window.FlutterWebViewChannel.postMessage(JSON.stringify(response));
                });
            ''';
    });
    return strings.join();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: {
        JavascriptChannel(
          name: "FlutterWebViewChannel",
          onMessageReceived: (JavascriptMessage jsMessage) async {
            // Here you can take message.message and use
            // your string from webview
            var messageJson = jsonDecode(jsMessage.message);
            if (eventHandlers[messageJson["name"]] != null) {
              for (int i = 0;
                  i < eventHandlers[messageJson["name"]]!.length;
                  i++) {
                if (messageJson["data"] == null) {
                  eventHandlers[messageJson["name"]]![i]();
                } else {
                  eventHandlers[messageJson["name"]]![i](messageJson["data"]);
                }
              }
            }
          },
        )
      },
      onWebViewCreated: (WebViewController webViewController) async {
        controller.complete(webViewController);
        webViewController.loadHtmlString('''  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.webdatarocks.com/latest/webdatarocks.min.css" rel="stylesheet"/>
    <script src="https://cdn.webdatarocks.com/latest/webdatarocks.toolbar.min.js"></script>
    <script src="https://cdn.webdatarocks.com/latest/webdatarocks.js"></script>
  </head>

  <body style="margin:0; padding:0; display: flex; height: 100vh;">
    <div id="pivot-container"></div>
        <script>
            let pivot = new WebDataRocks({
                container: "#pivot-container",
                componentFolder: "https://cdn.webdatarocks.com/",
                toolbar: ${_toolbar ?? false},
                height: "${_height ?? "500"}",
                width: "${_width ?? "100%"}",
                report:  ${jsonEncode(_report)},
                global: ${jsonEncode(_global)},
                });
            ${_registerEvents()}
        </script>
  </body>
  </html>
  ''');
      },
      gestureNavigationEnabled: true,
    );
  }
}
