// viewmodels/user_viewmodel.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

class UserViewModel extends StateNotifier<List<User>> {
  UserViewModel() : super(UserViewModel.predefinedUsers.take(10).toList());

  static final predefinedUsers = List.generate(
    2000,
        (index) => User(id: index + 1, title: "Item ${index + 1}"),
  );

  bool isLoadingAbove = false;
  bool isLoadingBelow = false;

  Future<void> loadMoreBelow() async {
    if (isLoadingBelow || state.last.id >= predefinedUsers.length) return;
    isLoadingBelow = true;
    state = List.from(state); // Refresh state to trigger loading indicator
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    final nextRange = predefinedUsers.skip(state.last.id).take(10).toList();
    state = [
      ...state.skip(10),
      ...nextRange,
    ];
    isLoadingBelow = false;
  }

  Future<void> loadMoreAbove() async {
    if (isLoadingAbove || state.first.id <= 1) return;
    isLoadingAbove = true;
    state = List.from(state); // Refresh state to trigger loading indicator
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    final previousRange = predefinedUsers.skip(state.first.id - 11).take(10).toList();
    state = [
      ...previousRange,
      ...state.take(10),
    ];
    isLoadingAbove = false;
  }

  void searchUsers(String query) {
    if (query.isEmpty) {
      state = predefinedUsers.take(10).toList();
    } else {
      final searchResults = predefinedUsers
          .where((user) => user.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      state = searchResults.take(20).toList();
    }
  }
}

final userProvider = StateNotifierProvider<UserViewModel, List<User>>((ref) => UserViewModel());
