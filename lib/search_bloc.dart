import 'dart:async';

class SearchBloc {
  var data = [
    "Android",
    "Ios",
    "Golang",
    "Flutter",
    "Java",
    "Python",
    "Ruby",
    "Php",
    "Swift"
  ];

  final searchController = StreamController();

  search(String query) {
    if (query.isEmpty) {
      searchController.sink.add(data);
      return;
    }
    _filter(query).then((result) {
      searchController.sink.add(result);
    });
  }

  Future<List<String>> _filter(String query) {
    var c = Completer<List<String>>();
    List<String> result = [];
    data.forEach((element) {
      if (element.contains(query)) {
        result.add(element);
      }
    });

    c.complete(result);
    return c.future;
  }

  Future<List<String>> filter(String query) {
    List<String> result = [];
    Future<List<String>> c() {
      data.forEach((element) {
        if (element.contains(query)) result.add(element);
      });
      return Future.value(result);
    }

    return c();
  }

  dispose() {
    searchController.close();
  }
}
