// import '../models/subCategoryActivity.dart';

// import 'package:dio/dio.dart';

// class PostService {
//   String url = "/home/alaa/Documents/ITI/finalProject/klook2/db.json/ToursCollection";

// // get posts
//   Future<List<Post>> getPosts() async {
//     List<Post> posts = new List();
//     Response response;

//     Dio dio = new Dio();
//     response = await dio.get(url);
//     var data = response.data;
//     print(data);
//     data.forEach((value) {
//       posts.add(Post.fromJson(value));
//     });

//     return posts;
//   }

//   // get post by id
//   // Future<Post> getPostById(int id) async {
  

//   //   Post post;
//   //   Response response;
//   //   Dio dio = new Dio();
//   //   response = await dio.get(url, queryParameters: {"id": id});
//   //   var data = response.data;
//   //    data.forEach((value) {
//   //     post =Post.fromJson(value);
//   //   });





//     return post;
//   }
// }