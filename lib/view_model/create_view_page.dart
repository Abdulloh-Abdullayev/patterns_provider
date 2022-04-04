import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class CreateViewModel extends ChangeNotifier{
  bool isLoading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();


  void apiCreatePost(BuildContext context) async{
    isLoading = true;
    notifyListeners();


    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();
    Post post =Post(title: title, body: body, userId: body.hashCode);
    String? result = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    Log.d("Resultni kormoqchiman ${result.toString()}");
    if(result != null){
        Navigator.pop(context,result);
    }
    else{
      Log.e("something is wrong!!!!");
    }
    notifyListeners();
  }
}