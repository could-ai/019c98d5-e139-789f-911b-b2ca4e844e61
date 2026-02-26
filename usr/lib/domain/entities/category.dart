import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final int iconCodePoint; // Storing IconData codePoint for simplicity in mock
  final String colorHex;

  const Category({
    required this.id,
    required this.name,
    required this.iconCodePoint,
    required this.colorHex,
  });

  @override
  List<Object?> get props => [id, name, iconCodePoint, colorHex];
}
