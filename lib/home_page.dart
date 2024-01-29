import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      backgroundColor: const Color(0xffe0e0e0),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterRandom());
            },
            child: const Icon(Icons.recycling),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecremented());
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncremented());
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Container(
              width: 190,
              height: 254,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                  color: const Color(0xffe0e0e0),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffbebebe),
                      spreadRadius: 2,
                      blurRadius: 30,
                      offset: Offset(15, 15),
                    ),
                    BoxShadow(
                      color: Color(0xffffffff),
                      spreadRadius: 2,
                      blurRadius: 30,
                      offset: Offset(-15, -15),
                    ),
                  ]),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardNumber(txt: state, reversed: false),
                    Text(
                      "$state",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    CardNumber(txt: state, reversed: true),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardNumber extends StatelessWidget {
  const CardNumber({
    super.key,
    required this.txt,
    required this.reversed,
  });
  final int txt;
  final bool reversed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          reversed ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(cardSymbol[txt]),
            const Icon(Icons.favorite),
          ],
        )
      ],
    );
  }
}

class PlayingCard {}

List<String> cardSymbol = [
  'A',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  'J',
  'Q',
  'K'
];
