import 'package:flutter/material.dart';
import 'package:state_management/data/model/business.dart';
import 'package:state_management/data/repo/business_repository.dart';
import 'package:state_management/view/components/home_page/search_feild.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Business> businesses = [];
  BusinessRepository businessRepository = BusinessRepository();
  bool isLoading = false;
  setUser() async {
    isLoading = true;
    setState(() {});
    businesses = await businessRepository.getBusinesss();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    setUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const SearchFeild(),
        ),
        body: Column(
          children: [
            Container(
              height: 42,
              color: Colors.amber,
              padding: const EdgeInsets.all(4),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      "data",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: businesses.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 32,
                          ),
                          trailing: ElevatedButton(
                              onPressed: () {}, child: const Text("Contact")),
                          title: Text(businesses[index].businessName),
                          subtitle: Text(businesses[index].rating),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
