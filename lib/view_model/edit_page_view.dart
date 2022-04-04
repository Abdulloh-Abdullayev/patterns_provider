import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class EditViewModel extends ChangeNotifier{
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  Post? _post;

  void editPagePost(Post post) {
    _post = post;
    titleController.text =_post?.title ?? "No Data";
    bodyController.text = _post?.body ?? "No Data";
    notifyListeners();
  }
  void apiEditData(BuildContext context) async{
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();
    if(_post != null){
      Post post = Post(id: _post!.id, title: title, body: body, userId: body.length);
      String? result = await Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
      if(result != null) {
          Navigator.pop(context, result);
      } else {
        Log.e("Error");
      }

    }
    notifyListeners();
  }
}