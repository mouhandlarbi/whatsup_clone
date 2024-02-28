import 'package:flutter/material.dart';
import 'package:state_management/data/static/fake_message.dart';
import 'package:state_management/view/pages/message_page.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.red,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                title: const SearchBtn(),
                bottom: const TabBar(
                  tabs: [
                    Text("All"),
                    Text("Worker"),
                    Text("Store"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  ChatList(
                    filteredChatts: getChatts(WorkerSeller.all),
                  ),
                  ChatList(
                    filteredChatts: getChatts(WorkerSeller.worker),
                  ),
                  ChatList(
                    filteredChatts: getChatts(WorkerSeller.seller),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class ChatListTile extends StatelessWidget {
  const ChatListTile({super.key, required this.cht});
  final Chatt cht;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cht.username),
      subtitle: Text(cht.lastMessage),
      leading: CircleAvatar(
        backgroundColor: Colors.pink,
        child: Text(cht.username.substring(0, 2)),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MessagePage(
            chatt: cht,
          );
        }));
      },
    );
  }
}

class ChatList extends StatefulWidget {
  const ChatList({
    super.key,
    required this.filteredChatts,
  });
  final List<Chatt> filteredChatts;

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  //convert to stateless
  List<Chatt> filterdList = [];
  @override
  void initState() {
    filterdList = widget.filteredChatts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filterdList.length,
      itemBuilder: (BuildContext context, int index) {
        return ChatListTile(
          cht: filterdList[index],
        );
      },
    );
  }
}

class SearchBtn extends StatelessWidget {
  const SearchBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: Searching());
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Search",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class Searching extends SearchDelegate {
  List<Chatt> chatts = getChatts(WorkerSeller.all);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Chatt> filteredChatts = chatts
        .where(
          (element) => element.username.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView.builder(
      itemCount: query == "" ? chatts.length : filteredChatts.length,
      itemBuilder: (BuildContext context, int index) {
        return ChatListTile(
          cht: chatts[index],
        );
      },
    );
  }
}
