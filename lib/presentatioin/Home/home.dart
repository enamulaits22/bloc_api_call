import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/joke_bloc/news_bloc.dart';
import 'package:test_app/data/repository/news_repository.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(
        RepositoryProvider.of<NewsRepository>(context),
      )..add(LoadNewsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The News App'),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is NewsLoadedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.news.entries!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.news.entries![index].description!),
                              const Divider()
                            ],
                          );
                        },
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     BlocProvider.of<NewsBloc>(context).add(LoadNewsEvent());
                    //   },
                    //   child: const Text('Load New News'),
                    // ),
                  ],
                ),
              );
            }
            if (state is NewsErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}