// ignore_for_file: file_names, unused_local_variable

import 'package:cs_academy/Pages/AddTodo.dart';
import 'package:cs_academy/Services/GetTodo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> todos = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getTodo();
  }

  void getTodo() async {
    setState(() {
      isLoading = true;
    });
    GetTodo getTodo = GetTodo();
    todos = await getTodo.getTodo();
    debugPrint(todos.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? const Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AddTodo();
                      },
                    ),
                  );
                },
                elevation: 10,
                backgroundColor: Colors.indigo.shade900,
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  const SizedBox(height: 23),
                  homeBanner(),
                  const SizedBox(height: 18),
                  searchField(context),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customBox("Important"),
                        customBox("Lecture Notes"),
                        customBox("Todo List"),
                        customBox("Shopping"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: List.generate(
                      todos.length,
                      (index) => ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 50),
                        title: Text(
                          todos[index]['title'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          todos[index]["description"],
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget homeBanner() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "THI",
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: const Color(0xff1F2937),
          ),
        ),
        Text(
          "N",
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: const Color(0xffB0E9CA),
          ),
        ),
        Text(
          "K.",
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: const Color(0xff1F2937),
          ),
        ),
      ],
    );
  }

  Widget searchField(BuildContext context) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffECECEC),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff7C7C7C),
            size: 15,
          ),
          hintText: "Search for notes",
        ),
      ),
    );
  }

  Widget customBox(String title) {
    return Container(
      height: 26,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffECECEC),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xff7C7C7C),
        ),
      ),
    );
  }

  Widget twoBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 173,
            width: 171,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffD9E8FC),
            ),
          ),
          Container(
            height: 173,
            width: 171,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffFFD8F4),
            ),
          ),
        ],
      ),
    );
  }
}
