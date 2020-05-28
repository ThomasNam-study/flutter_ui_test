import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteruitest/bloc/post_bloc.dart';
import 'package:flutteruitest/widget/bottom_loader.dart';
import 'package:flutteruitest/widget/post_widget.dart';
import 'package:http/http.dart' as http;

class InfiniteListPage extends StatefulWidget {
  @override
  _InfiniteListPageState createState() => _InfiniteListPageState();
}

class _InfiniteListPageState extends State<InfiniteListPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  final PostBloc _postBloc = PostBloc(httpClient: http.Client());

  _InfiniteListPageState() {
    _scrollController.addListener(_onScroll);
    _postBloc.add(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('스크롤 샘플'),
          centerTitle: true,
        ),
        body: BlocBuilder(
          bloc: _postBloc,
          builder: (BuildContext context, PostState state) {
            if (state is PostUninitialized) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is PostError) {
              return Center(
                child: Text('failed to fetch posts'),
              );
            }

            if (state is PostLoaded) {
              if (state.posts.isEmpty) {
                return Center(
                  child: Text('no posts'),
                );
              }

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.posts.length
                      ? BottomLoader()
                      : PostWidget(post: state.posts[index]);
                },
                itemCount: state.hasReachedMax
                    ? state.posts.length
                    : state.posts.length + 1,
                controller: _scrollController,
              );
            }

            return null;
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _postBloc.close();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(Fetch());
    }
  }
}
