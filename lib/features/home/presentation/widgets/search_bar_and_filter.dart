import 'package:accommodation/core/contants/padding.dart';
import 'package:flutter/material.dart';

class SearchBarAndFilter extends StatelessWidget {
  const SearchBarAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 27,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 7,
                    color: Colors.black38,
                  )
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: AppPadding.smallSpacer,
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        SizedBox(
                          height: 20,
                          width: 200,
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true, // Réduit les marges internes
        contentPadding: EdgeInsets.zero,
                               border: InputBorder.none, 
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "Anywhere . Any wek . Add guests",
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 13,
                                ),
                                filled: false,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black54,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.tune,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}