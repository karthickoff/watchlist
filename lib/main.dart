import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywatchlist/bloc/header_bloc.dart';
import 'package:mywatchlist/bloc/watchlist_bloc.dart';
import 'package:mywatchlist/repo/repositories.dart';
import 'package:mywatchlist/screens/watchlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              //  HeaderBloc(),
              HeaderBloc()..add(const HeaderCliked('1')),
        ),
        BlocProvider(
          create: (context) => WatchlistBloc(
              BlocProvider.of<HeaderBloc>(context), WatchListRepository())
            ..add(LoadWatchListData()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WatchListHome(),
      ),
    );
  }
}
