import 'package:demo/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SearchBox(),
          Expanded(
            child: Result(),
          )
        ],
      ),
    );
  }
}

class SearchBox extends StatefulWidget {
  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var bloc = Provider.of<SearchBloc>(context);
    searchController.addListener(() {
      bloc.search(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBloc>(
      builder: (context, bloc, child) => Container(
        child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Search...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40)))),
      ),
    );
  }
}

class Result extends StatefulWidget {
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBloc>(
      builder: (context, bloc, child) => Container(
        child: StreamBuilder<List<String>>(
          initialData: [],
          stream: bloc.searchController.stream.cast<List<String>>(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return _buildRow(snapshot.data![index]);
                });
          },
        ),
      ),
    );
  }

  Widget _buildRow(String data) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        data,
        style: TextStyle(fontSize: 17, color: Colors.blue),
      ),
    );
  }
}
