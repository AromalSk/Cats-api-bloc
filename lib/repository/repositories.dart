import 'dart:convert';
import 'dart:developer';
import 'package:cat_api/model/catdetalils.dart';
import 'package:http/http.dart' as http;



class CatRepo {
  String catUrl =
      'https://api.thecatapi.com/v1/images/search?limit=100&has_breeds=1&api_key=live_AvkMaAmZQH0dAO6Mqj2qla9WtRzR4YfMzZSnfiBJfkRXyROj5G9z2mhaElrgAjMt';

  Future<List<Root?>> getCats() async {
    final response = await http.get(Uri.parse(catUrl));

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      final List<Root?> roots=[]; 
      for(dynamic x in result){
        roots.add(Root.fromJson(x));
      }
      return roots;
    } else {
      throw Exception('Failed to load cat breeds');
    }
  }
}

// class CatRepo {
//   String catUrl = 'https://api.thecatapi.com/v1/images/search?limit=100&has_breeds=1&api_key=live_AvkMaAmZQH0dAO6Mqj2qla9WtRzR4YfMzZSnfiBJfkRXyROj5G9z2mhaElrgAjMt';

//   Future<Root> getCats() async {
//     final response = await http.get(Uri.parse(catUrl));

//     if (response.statusCode == 200) {
//       final result = jsonDecode(response.body);
//       // log(result[0].toString());
//       log(result[0].url.toString());
//       final model = Root.fromJson(result);
//      log(model.toString());
//       return model;
//     } else {
//       throw Exception('Failed to load cat breeds');
//     }
//   }
// }

//    Future<List<CatDetails>> getImageCats() async {
//     final response = await http.get(Uri.parse(catUrl));

//     if (response.statusCode == 200) {
//       final List<dynamic> jsonList = jsonDecode(response.body);
//       final List<CatDetails> cats = jsonList.map((json) {
//         return CatDetails.fromJson(json);
//       }).toList();
       
//           return cats;
      
//     } else {
//       throw Exception('Failed to load cat breeds');
//     }
//   }
// }

// class BooksRepository {
//   String booksUrl =
//       'https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=GowKIxOnLb6vRSDvfrQSyzpGVh4oP23M#';

//   Future<List<Books>> getBooks() async {
//     Response response = await http.get(Uri.parse(booksUrl));

//     if (response.statusCode == 200) {
//       // log(response.body.toString());
//       final result = jsonDecode(response.body);
//       final model = BookModel.fromJson(result);
//       log(model.results!.books![0].bookImage.toString());
//       return model.results!.books!;
//     } else {
//       return [];
//     }
//   }
// }