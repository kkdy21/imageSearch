import 'package:flutter/material.dart';
import 'package:hello_flutter/Ui/search/search_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/model/photo.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final textController = TextEditingController();

  @override
  //화면이 unmount될때 실행됨
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('이미지 검색'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  hintText: 'Search',
                  labelText: '검색',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      await viewModel.search(textController.text);
                    },
                  ),
                  suffixStyle: TextStyle(color: Colors.green),
                ),
              ),
              const SizedBox(height: 16),

              //Loading
              if(viewModel.isLoading) CircularProgressIndicator(),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 32,
                      crossAxisSpacing: 16),
                  itemCount: viewModel.photos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Photo photo = viewModel.photos[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        photo.url.toString(),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
