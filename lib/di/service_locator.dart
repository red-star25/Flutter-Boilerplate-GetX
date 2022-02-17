import 'package:base_project_getx/data/network/apis/posts/post_api.dart';
import 'package:base_project_getx/data/network/dio_client.dart';
import 'package:base_project_getx/data/network/repository/post_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

Future<void> setupLocator() async {
  // singletons:----------------------------------------------------------------
  Get.put(DioClient(Dio()));

  // api's:---------------------------------------------------------------------
  Get.put(PostApi(Get.find<DioClient>()));

  // repository:----------------------------------------------------------------
  Get.put(
    PostRepository(postApi: Get.find<PostApi>()),
  );
}
