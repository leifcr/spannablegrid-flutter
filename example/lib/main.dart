import 'package:flutter/material.dart';
import 'package:spannable_grid/spannable_grid.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpannableGrid Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'SpannableGrid Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _singleCell = false;
  int _tilew = 2;
  int _tileh = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: SpannableGrid(
              style: SpannableGridStyle(
                backgroundColor: Colors.black12,
                contentOpacity: 0.9,
                spacing: 0,
              ),
              editingStrategy: SpannableGridEditingStrategy.immediate(),
              gridSize: SpannableGridSize.parent,
              columns: 4,
              rows: 4,
              cells: _getCells(),
              onCellChanged: (cell) {
                print('Cell ${cell.id} changed');
              },
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text('h+'),
                onPressed: () {
                  setState(() {
                    _tileh++;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text('h-'),
                onPressed: () {
                  setState(() {
                    if (_tileh > 1) {
                      _tileh--;
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text('w+'),
                onPressed: () {
                  setState(() {
                    _tilew++;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text('w-'),
                onPressed: () {
                  setState(() {
                    if (_tilew > 1) {
                      _tilew--;
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text('Change'),
                onPressed: () {
                  setState(() {
                    _singleCell = !_singleCell;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<SpannableGridCellData> _getCells() {
    var result = <SpannableGridCellData>[];
    if (_singleCell) {
      result.add(SpannableGridCellData(
        column: 1,
        row: 1,
        columnSpan: 4,
        rowSpan: 4,
        id: "Test Cell 1",
        child: Container(
          color: Colors.lime,
          child: Center(
            child: Text(
              "Tile 4x4",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ));
    } else {
      result.add(SpannableGridCellData(
        column: 1,
        row: 1,
        columnSpan: _tilew,
        rowSpan: _tileh,
        id: "Test Cell 1",
        child: Container(
          color: Colors.lime,
          child: Center(
            child: Text(
              "Tile $_tileh x $_tilew",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ));
      result.add(SpannableGridCellData(
        column: 4,
        row: 1,
        columnSpan: 1,
        rowSpan: 1,
        id: "Test Cell 2",
        child: Container(
          color: Colors.lime,
          child: Center(
            child: Text(
              "Tile 1x1",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ));
      result.add(SpannableGridCellData(
        column: 1,
        row: 4,
        columnSpan: 3,
        rowSpan: 1,
        id: "Test Cell 3",
        child: Container(
          color: Colors.lightBlueAccent,
          child: Center(
            child: Text(
              "Tile 3x1",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ));
      result.add(SpannableGridCellData(
        column: 4,
        row: 3,
        columnSpan: 1,
        rowSpan: 2,
        id: "Test Cell 4",
        child: Container(
          color: Colors.lightBlueAccent,
          child: Center(
            child: Text(
              "Tile 1x2",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ));
    }
    return result;
  }
}
