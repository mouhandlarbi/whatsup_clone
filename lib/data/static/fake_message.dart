List<Chatt> getChatts(WorkerSeller ws) {
  List<Chatt> ls = [];
  if (ws == WorkerSeller.all) {
    ls = chatts;
  } else {
    for (int i = 0; i < chatts.length; i++) {
      if (chatts[i].workerSeller == ws) {
        ls.add(chatts[i]);
      }
    }
  }

  return ls;
}

enum WorkerSeller { worker, seller, all }

class Chatt {
  String username;
  WorkerSeller workerSeller;
  String lastMessage;
  List<String> msgs;
  Chatt({
    required this.username,
    required this.workerSeller,
    required this.lastMessage,
    required this.msgs,
  });
}

List<Chatt> chatts = [
  Chatt(
    username: "nassim yalawen",
    workerSeller: WorkerSeller.worker,
    lastMessage: "je te rappel",
    msgs: [
      "hello",
      "oui",
      "cv",
      "labas yak",
      "aqlagh cv cv ",
      "hmdlh",
      "bay bay",
      "by by"
    ],
  ),
  Chatt(
    username: "bahmane bahmane",
    workerSeller: WorkerSeller.worker,
    lastMessage: "ok",
    msgs: [
      "hello",
      "oui",
      "cv",
      "labas yak",
      "aqlagh cv cv ",
      "hmdlh",
      "bay bay",
      "by by"
    ],
  ),
  Chatt(
    username: "trok mansora",
    workerSeller: WorkerSeller.worker,
    lastMessage: "mercie",
    msgs: [
      "hello",
      "oui",
      "cv",
      "labas yak",
      "aqlagh cv cv ",
      "hmdlh",
      "bay bay",
      "by by"
    ],
  ),
  Chatt(
    username: "mourad berkani",
    workerSeller: WorkerSeller.seller,
    lastMessage: "machi aka",
    msgs: [
      "hello",
      "oui",
      "cv",
      "labas yak",
      "aqlagh cv cv ",
      "hmdlh",
      "bay bay",
      "by by"
    ],
  ),
  Chatt(
    username: "kader slimani",
    workerSeller: WorkerSeller.seller,
    lastMessage: "aka chwiya 3awdiyid",
    msgs: [
      "hello",
      "oui",
      "cv",
      "labas yak",
      "aqlagh cv cv ",
      "hmdlh",
      "bay bay",
      "by by"
    ],
  ),
  Chatt(
    username: "lyes ath 3li",
    workerSeller: WorkerSeller.worker,
    lastMessage: "je ne peux pas",
    msgs: [
      "hello",
      "oui",
      "cv",
      "labas yak",
      "aqlagh cv cv ",
      "hmdlh",
      "bay bay",
      "by by"
    ],
  ),
  Chatt(
    username: "mohand oukaci",
    workerSeller: WorkerSeller.worker,
    lastMessage: "aken ik yehwa",
    msgs: [
      "hello",
      "oui",
      "cv",
      "labas yak",
      "aqlagh cv cv ",
      "hmdlh",
      "bay bay",
      "by by"
    ],
  ),
  Chatt(
    username: "LBV tony",
    workerSeller: WorkerSeller.worker,
    lastMessage: "ttalasegh-ak 17000000000€",
    msgs: [
      "amek",
      "aqlagh cv cv",
      "zrigh cv cv",
      "nighak amek",
      "negh waqila thettoud ",
      "cho ?",
      "achoooooo",
      "ttalasegh-ak 17000000000€"
    ],
  ),
  Chatt(
    username: "slimane kaki",
    workerSeller: WorkerSeller.seller,
    lastMessage: "assa ?",
    msgs: [
      "hello",
      "oui",
      "cv",
      "labas yak",
      "aqlagh cv cv ",
      "hmdlh",
      "bay bay",
      "by by"
    ],
  ),
  Chatt(
    username: "said ath taref",
    workerSeller: WorkerSeller.seller,
    lastMessage: "amek",
    msgs: [
      "hello",
      "oui",
      "cv",
      "labas yak",
      "aqlagh cv cv ",
      "hmdlh",
      "bay bay",
      "by by"
    ],
  ),
];
