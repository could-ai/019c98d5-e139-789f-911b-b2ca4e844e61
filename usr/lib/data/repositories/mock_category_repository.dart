import 'package:flutter/material.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';

class MockCategoryRepository implements CategoryRepository {
  final List<Category> _categories = [
    Category(id: '1', name: 'Food', iconCodePoint: Icons.fastfood.codePoint, colorHex: 'FFEF5350'),
    Category(id: '2', name: 'Transport', iconCodePoint: Icons.directions_bus.codePoint, colorHex: 'FF42A5F5'),
    Category(id: '3', name: 'Shopping', iconCodePoint: Icons.shopping_bag.codePoint, colorHex: 'FFAB47BC'),
    Category(id: '4', name: 'Entertainment', iconCodePoint: Icons.movie.codePoint, colorHex: 'FF7E57C2'),
    Category(id: '5', name: 'Bills', iconCodePoint: Icons.receipt.codePoint, colorHex: 'FF26A69A'),
    Category(id: '6', name: 'Health', iconCodePoint: Icons.local_hospital.codePoint, colorHex: 'FFEC407A'),
  ];

  @override
  Future<List<Category>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay
    return List.from(_categories);
  }

  @override
  Future<void> addCategory(Category category) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _categories.add(category);
  }

  @override
  Future<Category?> getCategoryById(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    try {
      return _categories.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }
}
