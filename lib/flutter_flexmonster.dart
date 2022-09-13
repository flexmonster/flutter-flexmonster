import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class Flexmonster extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Flexmonster(
      {String? height,
      String? width,
      bool? toolbar,
      String? licenseKey,
      dynamic report,
      dynamic global,
      dynamic accessibility,
      dynamic shareReportConnection,
      Key? key})
      : super(key: key) {
    _height = height;
    _width = width;
    _toolbar = toolbar;
    _licenseKey = licenseKey;
    _report = report;
    _global = global;
    _accessibility = accessibility;
    _shareReportConnection = shareReportConnection;
  }

  late Map<String, List<Function>> eventHandlers = {};
  String? _width, _height, _licenseKey;
  bool? _toolbar;
  dynamic _report, _global, _accessibility, _shareReportConnection;

  ///This API call returns report JSON object as string
  Future<dynamic> getReport() async {
    WebViewController apiController = await _controller.future;
    String reportString = await apiController
        .runJavascriptReturningResult("flexmonster.getReport()");
    dynamic report = jsonDecode(reportString);
    return report;
  }

  ///This API call adds a calculated measure.
  Future<void> addCalculatedMeasure(dynamic measure) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript(
        "flexmonster.addCalculatedMeasure(${jsonEncode(measure)})");
  }

  ///Adds a conditional formatting rule for cell values to format them with specific styles if the condition for the cell value is met.
  Future<void> addCondition(dynamic condition) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.addCondition(${jsonEncode(condition)})");
  }

  ///Clears the component’s data and view.
  Future<void> clear() async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.clear()");
  }

  ///Clears the filter which was applied previously to the specified hierarchy.
  Future<void> clearFilter(String uniqueName) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.clearFilter('$uniqueName')");
  }

  ///Clears the filter which was applied previously to the specified hierarchy.
  Future<void> connectTo(dynamic dataSource) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.connectTo(${jsonEncode(dataSource)})");
  }

  ///Returns a list of conditional formatting rules of the report.
  ///You may need this API call to edit existing conditional formatting rules.
  Future<dynamic> getAllConditions() async {
    WebViewController apiController = await _controller.future;
    String conditionsString = await apiController
        .runJavascriptReturningResult("flexmonster.getAllConditions()");
    dynamic conditions = jsonDecode(conditionsString);
    return conditions;
  }

  ///Returns a list of all available hierarchies.
  Future<dynamic> getAllHierarchies() async {
    WebViewController apiController = await _controller.future;
    String hierarchiesString = await apiController
        .runJavascriptReturningResult("flexmonster.getAllHierarchies()");
    dynamic hierarchies = jsonDecode(hierarchiesString);
    return hierarchies;
  }

  ///Returns a list of all available measures.
  Future<dynamic> getAllMeasures() async {
    WebViewController apiController = await _controller.future;
    String measuresString = await apiController
        .runJavascriptReturningResult("flexmonster.getAllMeasures()");
    dynamic measures = jsonDecode(measuresString);
    return measures;
  }

  ///Returns information about the cell by row and column indexes.
  Future<dynamic> getCell(int rowIdx, int colIdx) async {
    WebViewController apiController = await _controller.future;
    String cellDataObjectString = await apiController
        .runJavascriptReturningResult("flexmonster.getCell($rowIdx,$colIdx)");
    dynamic cellDataObject = jsonDecode(cellDataObjectString);
    return cellDataObject;
  }

  ///Returns a list of hierarchies selected in the report slice for columns.
  Future<dynamic> getColumns() async {
    WebViewController apiController = await _controller.future;
    String columnsString = await apiController
        .runJavascriptReturningResult("flexmonster.getColumns()");
    dynamic columns = jsonDecode(columnsString);
    return columns;
  }

  ///Returns a conditional formatting rule by id. You may need this API call to edit the existing conditional formatting rule.
  Future<dynamic> getCondition(String id) async {
    WebViewController apiController = await _controller.future;
    String conditionString = await apiController
        .runJavascriptReturningResult("flexmonster.getCondition('$id')");
    dynamic condition = jsonDecode(conditionString);
    return condition;
  }

  ///Returns the `FilterObject` for the specified hierarchy.
  Future<dynamic> getFilter(String uniqueName) async {
    WebViewController apiController = await _controller.future;
    String filterString = await apiController
        .runJavascriptReturningResult("flexmonster.getFilter('$uniqueName')");
    dynamic filter = jsonDecode(filterString);
    return filter;
  }

  ///Returns an array of objects defining the sorting on the flat grid.
  ///Note that the getFlatSort method is available only for reports based on `"csv"`, `"json"`, and `"api"` data source types.
  Future<dynamic> getFlatSort() async {
    WebViewController apiController = await _controller.future;
    String flatSortString = await apiController
        .runJavascriptReturningResult("flexmonster.getFlatSort()");
    dynamic flatSort = jsonDecode(flatSortString);
    return flatSort;
  }

  ///Returns the default number format or the number format for the specified measure.
  Future<dynamic> getFormat(String measureName, [String? aggregation]) async {
    WebViewController apiController = await _controller.future;
    String formatString = await apiController.runJavascriptReturningResult(
        "flexmonster.getFormat('$measureName'${aggregation == null ? "" : "'$aggregation'"})");
    dynamic format = jsonDecode(formatString);
    return format;
  }

  ///Returns a list of the selected measures in the report.
  Future<dynamic> getMeasures() async {
    WebViewController apiController = await _controller.future;
    String measuresString = await apiController
        .runJavascriptReturningResult("flexmonster.getMeasures()");
    dynamic measures = jsonDecode(measuresString);
    return measures;
  }

  ///Returns a list of members for the specified hierarchy.
  ///Note that this API call has no `callbackHandler` parameter in Flutter.
  Future<dynamic> getMembers(String uniqueName, [String? memberName]) async {
    WebViewController apiController = await _controller.future;
    String membersString = await apiController.runJavascriptReturningResult(
        "flexmonster.getMembers('$uniqueName'${memberName == null ? "" : "'$memberName'"})");
    dynamic members = jsonDecode(membersString);
    return members;
  }

  ///Returns `OptionsObject` with component’s options.
  Future<dynamic> getOptions() async {
    WebViewController apiController = await _controller.future;
    String optionsString = await apiController
        .runJavascriptReturningResult("flexmonster.getOptions()");
    dynamic options = jsonDecode(optionsString);
    return options;
  }

  ///Returns a list of hierarchies selected in the report slice for report filters.
  Future<dynamic> getReportFilters() async {
    WebViewController apiController = await _controller.future;
    String reportFiltersString = await apiController
        .runJavascriptReturningResult("flexmonster.getReportFilters()");
    dynamic reportFilters = jsonDecode(reportFiltersString);
    return reportFilters;
  }

  ///Returns a list of hierarchies selected in the report slice for rows.
  Future<dynamic> getRows() async {
    WebViewController apiController = await _controller.future;
    String rowsString = await apiController
        .runJavascriptReturningResult("flexmonster.getRows()");
    dynamic rows = jsonDecode(rowsString);
    return rows;
  }

  ///Returns information about the selected cell/cells.
  Future<dynamic> getSelectedCell() async {
    WebViewController apiController = await _controller.future;
    String selectedCellsString = await apiController
        .runJavascriptReturningResult("flexmonster.getSelectedCell()");
    dynamic selectedCells = jsonDecode(selectedCellsString);
    return selectedCells;
  }

  ///Returns table sizes that are set for the component via UI or the <a href="https://www.flexmonster.com/api/settablesizes/">setTableSizes()</a> method.
  Future<dynamic> getTableSizes() async {
    WebViewController apiController = await _controller.future;
    String tableSizesString = await apiController
        .runJavascriptReturningResult("flexmonster.getTableSizes()");
    dynamic tableSizes = jsonDecode(tableSizesString);
    return tableSizes;
  }

  ///Loads the report file from the specified URL.
  Future<void> load(String url, [Map<String, String>? requestHeaders]) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript(
        "flexmonster.load('$url'${requestHeaders == null ? "" : ",${jsonEncode(requestHeaders)}"})");
  }

  ///Opens the calculated value pop-up window editor. Calling `openCalculatedValueEditor` results in opening an empty editor for creating a new value.
  ///It is also possible to open this editor for editing or deleting an existing calculated value.
  ///Note that this API call has no `callbackHandler` parameter in Flutter.
  Future<void> openCalculatedValueEditor([String? uniqueName]) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript(
        "flexmonster.openCalculatedValueEditor(${uniqueName == null ? "" : "'$uniqueName'"})");
  }

  ///This API call allows you to control redrawing of the component when you use the following API calls:
  ///`addCondition()`, `removeAllConditions()`, `removeCondition()`, `setFormat()`, `setOptions()`
  Future<void> refresh() async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.refresh()");
  }

  ///Removes all calculated measures.
  ///Note that the `removeAllCalculatedMeasures` method is available only for reports based on `"csv"`, `"json"`, and `"api"` data source types.
  Future<void> removeAllCalculatedMeasures() async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.removeAllCalculatedMeasures()");
  }

  ///Removes all conditional formatting rules.
  ///Use `refresh()` API call after to redraw the component and see changes.
  Future<void> removeAllConditions() async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.removeAllConditions()");
  }

  ///Removes the calculated measure by the measure’s unique name.
  ///Note that the `removeCalculatedMeasure` method is available only for reports based on `"json"`, `"csv"`, and `"api"` data source types.
  Future<void> removeCalculatedMeasure(String measureName) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.removeCalculatedMeasure('$measureName')");
  }

  ///Removes the conditional formatting rule by `id`.
  ///Use `refresh()` API call after to redraw the component and see changes.
  Future<void> removeCondition(String id) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.removeCondition('$id')");
  }

  ///Removes a selection from cells on the grid.
  Future<void> removeSelection() async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.removeSelection()");
  }

  ///Runs a query with specified `rows`, `columns`, `measures` and `reportFilters` from the `SliceObject` and displays the result data.
  ///Use this method to rearrange hierarchies on the axes or to compose a new report based on the current data source.
  Future<void> runQuery(dynamic query) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.runQuery(${jsonEncode(query)})");
  }

  ///Scrolls the grid to the specified column.
  Future<void> scrollToColumn(int columnIndex) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.scrollToColumn($columnIndex)");
  }

  ///Scrolls the grid to the specified row.
  Future<void> scrollToRow(int rowIndex) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.scrollToRow($rowIndex)");
  }

  ///Sets the filter for the specified hierarchy.
  Future<void> setFilter(String uniqueName, dynamic filter) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript(
        "flexmonster.setFilter('$uniqueName',${jsonEncode(filter)})");
  }

  ///Sorts columns in the flat view.
  ///Note that the `setFlatSort` method is available only for reports based on `"csv"`, `"json"`, and `"api"` data source types.
  Future<void> setFlatSort(Map<String, String> flatSort) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.setFlatSort(${jsonEncode(flatSort)})");
  }

  ///Sets a default number format or the number format for the specified measure.<br>
  ///To apply a default format to all measures, leave the `measureName` and `aggregation` parameters undefined.<br>
  ///To apply a format only to a specific measure, specify the `measureName` and `aggregation` parameters. Learn more in this guide: <a href="https://www.flexmonster.com/doc/number-formatting/">Number formatting.</a><br>
  ///Use `refresh()` API call after setting a format to redraw the component and see changes.
  Future<void> setFormat(dynamic format,
      [String? measureName, String? aggregation]) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript('''flexmonster.setFormat(${jsonEncode(format)}
        ${measureName == null || aggregation == null ? "" : ",'$measureName','$aggregation'"})''');
  }

  ///Sets the component’s options.
  ///Use `refresh()` API call after to redraw the component and see changes.
  Future<void> setOptions(dynamic options) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.setOptions(${jsonEncode(options)})");
  }

  ///Sets a report to be displayed in the component.
  ///Use this method to load and show previously saved reports.
  Future<void> setReport(dynamic report) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.setReport(${jsonEncode(report)})");
  }

  ///Sets the sort type to the specified hierarchy. Learn more about sorting in this guide: <a href="https://www.flexmonster.com/doc/custom-sorting/">Custom sorting.</a>
  Future<void> setSort(String uniqueName, String sortType) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.setSort('$uniqueName','$sortType')");
  }

  ///Sets table sizes for the component. Use this method to set table sizes without updating the report.
  ///When called, the `setTableSizes()` method overwrites previously set table sizes.
  Future<void> setTableSizes(dynamic tableSizes) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.setTableSizes(${jsonEncode(tableSizes)})");
  }

  ///Saves the current report to Flexmonster Data Server and provides a link to the saved report.<br>
  ///To save a report, Flexmonster creates an `XMLHttpRequest` and sends it to the Data Server as a POST request. The request is sent to `<url>/save`, where url is the Data Server’s URL (e.g., http://localhost:9500).<br>
  ///For more details on report sharing, see this guide: <a href="https://www.flexmonster.com/doc/share-report/">Share the report.</a>
  Future<void> shareReport([dynamic options]) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript(
        "flexmonster.shareReport(${options == null ? "" : "$jsonEncode(options)"})");
  }

  ///Switches to the charts view and shows the chart of the specified type.
  ///The following chart types are supported: `"column"`, `"bar_h"`, `"line"`, `"scatter"`, `"pie"`, `"stacked_column"` and `"column_line"`.
  ///After `showCharts()` API call `options.viewType` property in the report will be `"charts"`.
  Future<void> showCharts(
      [String type = "column", bool multiple = false]) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.showCharts('$type',$multiple)");
  }

  ///Switches to the grid view.
  ///After `showGrid()` API call `options.viewType` property in report will be `"grid"`.
  Future<void> showGrid() async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.showGrid()");
  }

  ///Switches to the grid and charts view and shows the chart of the specified type.
  ///The following chart types are supported: `"column"`, `"bar_h"`, `"line"`, `"scatter"`, `"pie"`, `"stacked_column"` and `"column_line"`.
  ///After `showCharts()` API call `options.viewType` property in the report will be `"grid_charts"`.
  Future<void> showGridAndCharts(
      [String type = "column",
      String position = "bottom",
      bool multiple = false]) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.showCharts('$type','$position',$multiple)");
  }

  ///Sorts values in a specific row or column.
  Future<void> sortValues(String axisName, String type,
      [List<String>? tuple, dynamic measure]) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript(
        "flexmonster.sortValues('$axisName','$type'${tuple == null || measure == null ? "" : ",'${jsonEncode(tuple)}','${jsonEncode(measure)}'"})");
  }

  ///Sorts values in a specific row or column.
  Future<void> updateData(dynamic connectionParameters,
      [dynamic options]) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript(
        '''flexmonster.updateData(${jsonEncode(connectionParameters)}
        ${options == null ? "" : jsonEncode(options)})''');
  }

  ///This API call opens the Field list.
  Future<void> openFieldsList() async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.openFieldsList()");
  }

  ///This API call closes the Field list.
  Future<void> closeFieldsList() async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.closeFieldsList()");
  }

  ///Collapses all nodes and drills up (starting from v2.1) all levels of all hierarchies in the slice on the grid and on charts.\n
  ///All expanded/drilled down nodes will be collapsed/drilled up on the grid and on charts.
  Future<void> collapseAllData() async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.collapseAllData()");
  }

  ///Collapses a specific node on the grid and charts.
  Future<void> collapseCell(String axisName, List<String> tuple,
      [String? measureName]) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript(
        "flexmonster.collapseCell('$axisName',${jsonEncode(tuple)}${measureName == null ? "" : ",'$measureName'"})");
  }

  ///Collapses all nodes of the specified hierarchy. Please note, this method works only for `CSV` and `JSON` data sources.
  Future<void> collapseData(String uniqueName) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.collapseData('$uniqueName')");
  }

  ///Prepares the pivot table instance to be deleted with the browser’s garbage collection.
  Future<void> dispose() async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.dispose()");
  }

  ///Drills down a specific hierarchy level on the grid and charts.
  Future<void> drillDownCell(String axisName, List<String> tuple,
      String? measureName, String memberName) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript(
        "flexmonster.drillDownCell('$axisName',${jsonEncode(tuple)},'$measureName','$memberName')");
  }

  ///Drills up a specific hierarchy level on the grid and charts.
  Future<void> drillUpCell(String axisName, List<String> tuple,
      String? measureName, String memberName) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript(
        "flexmonster.drillUpCell('$axisName',${jsonEncode(tuple)},'$measureName','$memberName')");
  }

  //Expands all nodes and drills down all levels of all hierarchies in the slice on the grid and on charts.
  //All collapsed/drilled up nodes will be expanded/drilled down on the grid and on charts.
  Future<void> expandAllData([bool withAllChildren = true]) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.expandAllData($withAllChildren)");
  }

  ///Expands a specific node on the grid and charts.
  Future<void> expandCell(String axisName, List<String> tuple,
      [String? measureName]) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript(
        "flexmonster.expandCell('$axisName',${jsonEncode(tuple)}${measureName == null ? "" : ",'$measureName'"})");
  }

  ///Expands all nodes of the specified hierarchy.
  ///Please note, this method works only for CSV and JSON data sources.
  Future<void> expandData(String uniqueName) async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.expandData('$uniqueName')");
  }

  ///Returns the sort type which is applied to the hierarchy.
  Future<String> getSort(String uniqueName) async {
    WebViewController apiController = await _controller.future;
    return await apiController
        .runJavascriptReturningResult("flexmonster.getSort('$uniqueName')");
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
    while ((eventHandlers[eventName])!.contains(function)) {
      eventHandlers[eventName]!.remove(function);
    }
  }

  ///Opens local report file. Use this API call to open the report JSON file from the local file system.
  Future<void> open() async {
    WebViewController apiController = await _controller.future;
    await apiController.runJavascript("flexmonster.open()");
  }

  ///This API call opens the filter pop-up window for the specified hierarchy.
  Future<void> openFilter(String hierarchyUniqueName) async {
    WebViewController apiController = await _controller.future;
    await apiController
        .runJavascript("flexmonster.openFilter('$hierarchyUniqueName')");
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
    "exportcomplete",
    "exportstart",
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
    "printcomplete",
    "printstart",
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
      return '''flexmonster.on("$eventName", function (eventData) {
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
        <script>
            let pivot = new Flexmonster({
                container: "#pivot-container",
                componentFolder: "https://cdn.flexmonster.com/",
                toolbar: ${_toolbar ?? false},
                height: "${_height ?? "500"}",
                width: "${_width ?? "100%"}",
                licenseKey: "${_licenseKey ?? ""}",
                report:  ${jsonEncode(_report)},
                global: ${jsonEncode(_global)},
                accessibility: ${jsonEncode(_accessibility)},
                shareReportConnection: ${jsonEncode(_shareReportConnection)}
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
