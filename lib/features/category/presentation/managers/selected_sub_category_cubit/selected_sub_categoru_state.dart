import 'package:flutter_bloc/flutter_bloc.dart';

// Define the state
abstract class SelectedSubCategoryState {}

class SubCategoryInitial extends SelectedSubCategoryState {}

class SubCategorySelected extends SelectedSubCategoryState {
  final String selectedId;
  final String name ;
  SubCategorySelected(this.selectedId, this.name);
}

class SubCategoryCleared extends SelectedSubCategoryState {}

// Cubit
