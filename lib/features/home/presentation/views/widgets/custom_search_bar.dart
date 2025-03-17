import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key,
    required this.screenWidth,
    this.onTap,
    required this.readOnly,
    this.onChanged});

  final double screenWidth;
 final  void Function()? onTap;
final  bool readOnly;
  final void Function(String)? onChanged;

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _searchFocusNode.removeListener(_onFocusChange);
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isSearching = _searchFocusNode.hasFocus;
    });
  }

  // void _performSearch() {
  //   // هنا هتعمل اللي انت عايزه لما المستخدم يدوس على search
  //   // مثلاً تنقل لصفحة البحث أو تعرض النتائج
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => SearchResultsPage(searchQuery: _searchController.text),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      focusNode: _searchFocusNode,
      controller: _searchController,
      style: TextStyle(
        fontSize: widget.screenWidth * .03,
      ),
      maxLines: 1,
      onTap:widget.onTap,
      onChanged:widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffF5F5F5),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'What do you want ?',
        hintStyle: Styles.NexaBold14.copyWith(
          color: Color(0xff484C52),
        ),
        labelStyle: const TextStyle(fontSize: 20),
        prefixIcon: IconButton(
          onPressed: () {
            // _performSearch();
          },
          icon: SvgPicture.asset(
            'assets/icons/icon-park-outline_search.svg',
            height: widget.screenWidth * .05,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            // _searchController.clear();
          },
          icon: SvgPicture.asset(
            'assets/icons/Vector (11).svg',
            width: widget.screenWidth * .06,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 2, color: Color(0xffF5F5F5)),
    );
  }
}

class SearchResultsPage extends StatelessWidget {
  final String searchQuery;

  SearchResultsPage({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Center(
        child: Text('You searched for: $searchQuery'),
      ),
    );
  }
}