import 'package:base_project_getx/data/models/post/post.dart';
import 'package:base_project_getx/data/network/repository/post_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final postRepository = Get.find<PostRepository>();

  final _postsList = <Post>[].obs;
  List<Post> get postList => _postsList;
  set postList(value) => _postsList.value = value;

  getAll() {
    postRepository.getPosts().then((data) {
      postList = data.posts;
    });
  }
}
