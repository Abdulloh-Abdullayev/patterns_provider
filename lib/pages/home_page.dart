import 'package:flutter/material.dart';
import 'package:pattern_provider/view_model/home_page_view.dart';
import 'package:provider/provider.dart';
import '../views/itemOfPost.dart';

class HomePage extends StatefulWidget {
  static String id = "";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Provider"),
        ),
        body: ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) => viewModel,
          child: Consumer<HomeViewModel>(
            builder: (ctx, model, index) => Stack(
              children: [
                ListView.builder(
                  itemCount: viewModel.items.length,
                  itemBuilder: (ctx, index) {
                    return itemOfPost(viewModel.items[index],viewModel);
                  },
                ),
                viewModel.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            viewModel.goToCreatePage(context);
          },
          child: const Icon(Icons.add),
        ));
  }
}
