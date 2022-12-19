import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/board_list_page.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  // final myImages = [
  //   NetworkImage("https://source.unsplash.com/random"),
  // ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: _buildSearchAppBar(context),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: 48,
            itemBuilder: (BuildContext context, int index) {
              return IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BoardListPage()),
                  );
                },
                icon: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image(
                    image: NetworkImage(
                        "https://source.unsplash.com/random?sig=$index/200x200"),
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: kchacholGreyColor(),
                      child: const Icon(
                        Icons.error_outline_rounded,
                        color: primary,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                //padding: EdgeInsets.zero,
              );
            },
          ),
        ),
      ),
    );
  }

  PreferredSize _buildSearchAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(66),
      child: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset("assets/icon_arrow_back.svg", width: 10),
            onPressed: () {
              Navigator.pop(context);
            },
            color: kPrimaryColor(),
          ),
          title: Stack(
            children: [
              Container(
                height: 40,
                child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: klightGreyColor(),
                      hintText: "닉네임,키워드로 검색하세요",
                      contentPadding:
                          EdgeInsets.only(top: 10, bottom: 10, left: 20),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      isDense: true,
                      hintStyle: textTheme(
                              color: kchacholGreyColor(),
                              weight: FontWeight.bold)
                          .headline3,
                    ),
                    keyboardType: TextInputType.text),
              ),
              Positioned(
                right: 14,
                top: 10,
                child: SvgPicture.asset(
                  "assets/icon_glasses.svg",
                  width: 20,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
