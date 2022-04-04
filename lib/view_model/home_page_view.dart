import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../pages/create_page.dart';
import '../pages/edit_page.dart';
import '../services/http_service.dart';

class HomeViewModel extends ChangeNotifier{
  bool isLoading = false;
  List<Post> items = [];

  void apiPostList() {
    isLoading = true;
    notifyListeners();
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      _showResponse(response!),
    });
  }

  void _showResponse(String response) {
    List<Post> list = Network.parsePostList(response);
    items.clear();
    isLoading = false;
    items = list;
    notifyListeners();

  }

  Future apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      items.remove(post);
    }
    isLoading = false;
    notifyListeners();

  }

  Future goToCreatePage(BuildContext context) async{
    String? result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreatePage()));
    if(result == null) return;
    items.add(Network.parsePost(result));
    notifyListeners();
  }


  Future goToEditPage(Post post,BuildContext context) async{
    String result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditPage(post: post,)));
    Post newPost = Network.parsePost(result);
    items[items.indexWhere((element) => element.id == newPost.id)] = newPost;
    notifyListeners();
  }

}