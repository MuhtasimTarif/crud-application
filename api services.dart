import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String baseUrl =
      "http://35.73.30.144:2008/api/v1";

  // Read All Products
  static Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse("$baseUrl/ReadProduct"),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      List data = jsonData["data"];

      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  // Create Product
  static Future<bool> createProduct(Product product) async {
    final response = await http.post(
      Uri.parse("$baseUrl/CreateProduct"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(product.toJson()),
    );

    return response.statusCode == 200;
  }

  // Update Product
  static Future<bool> updateProduct(
      String id,
      Product product,
      ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/UpdateProduct/$id"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(product.toJson()),
    );

    return response.statusCode == 200;
  }

  // Delete Product
  static Future<bool> deleteProduct(String id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/DeleteProduct/$id"),
    );

    return response.statusCode == 200;
  }

  // Read Product By ID
  static Future<Product?> getProductById(String id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/ReadProductById/$id"),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      return Product.fromJson(jsonData["data"][0]);
    }

    return null;
  }
}