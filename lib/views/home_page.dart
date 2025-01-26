// views/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/user_viewmodel.dart';
import '../models/user.dart';
import 'widgets/shimmer_placeholder.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    _searchController.addListener(_onSearchChanged);
  }

  void _handleScroll() async {
    final userViewModel = ref.read(userProvider.notifier);
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels == 0) {
        // At the top
        await userViewModel.loadMoreAbove();
      } else {
        // At the bottom
        await userViewModel.loadMoreBelow();
      }
    }
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    ref.read(userProvider.notifier).searchUsers(query);
  }

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(userProvider);
    final userViewModel = ref.read(userProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 35),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.orangeAccent, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: _searchController.text.isEmpty
                  ? _buildMainList(users, userViewModel.isLoadingAbove, userViewModel.isLoadingBelow)
                  : _buildSearchResults(users),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainList(List<User> users, bool isLoadingAbove, bool isLoadingBelow) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: users.length + (isLoadingAbove ? 1 : 0) + (isLoadingBelow ? 1 : 0),
      itemBuilder: (context, index) {
        if (isLoadingAbove && index == 0) {
          return const ShimmerPlaceholder();
        } else if (isLoadingBelow && index == users.length + (isLoadingAbove ? 1 : 0)) {
          return const ShimmerPlaceholder();
        } else {
          final itemIndex = index - (isLoadingAbove ? 1 : 0); // Offset for above
          return _buildListItem(users[itemIndex]);
        }
      },
    );
  }

  Widget _buildSearchResults(List<User> results) {
    if (results.isEmpty) {
      return const Center(child: Text("No items match your search."));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return _buildListItem(results[index]);
      },
    );
  }

  Widget _buildListItem(User user) {
    final query = _searchController.text.toLowerCase();
    final title = user.title;

    if (query.isNotEmpty) {
      final matchStart = title.toLowerCase().indexOf(query);
      final matchEnd = matchStart + query.length;

      if (matchStart != -1) {
        // Highlight the matching part
        return Card(
          key: ValueKey(user.id),
          color: Colors.orange,
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: Text(
              user.id.toString(),
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title.substring(0, matchStart),
                    style: const TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: title.substring(matchStart, matchEnd),
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 16, // Adjust font size here if needed
                    ),
                  ),
                  TextSpan(
                    text: title.substring(matchEnd),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

    // Default display without highlights
    return Card(
      key: ValueKey(user.id),
      color: Colors.orange,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Text(
          user.id.toString(),
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
