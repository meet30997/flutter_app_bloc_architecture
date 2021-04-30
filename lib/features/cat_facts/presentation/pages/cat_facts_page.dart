import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_architecure/di/injection_container.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/presentation/bloc/cat_facts_bloc.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/presentation/bloc/cat_facts_bloc_events.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/presentation/bloc/cat_facts_bloc_states.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/presentation/widgets/cat_facts_list_view.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/presentation/widgets/loading_widget.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/presentation/widgets/message_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactsPage extends StatefulWidget {
  @override
  _CatFactsPageState createState() => _CatFactsPageState();
}

class _CatFactsPageState extends State<CatFactsPage> {
  CatFactsBloc _catFactsBloc;

  @override
  void initState() {
    _catFactsBloc = gt<CatFactsBloc>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _dispatchApiCall();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cat Facts"),
      ),
      body: BlocProvider(
        create: (_) => _catFactsBloc,
        child: BlocBuilder<CatFactsBloc, GetCatFactsState>(
            builder: (context, state) {
          if (state is Loading) {
            return LoadingWidget();
          } else if (state is Loaded) {
            return CatFactsListView(list: state.catFacts);
          } else if (state is Error) {
            return MessageView(message: state.message, isError: true);
          } else {
            return MessageView(
                message: "Data will be here shortly", isError: false);
          }
        }),
      ),
    );
  }

  void _dispatchApiCall() {
    _catFactsBloc.add(GetCatFactsDataEvent());
  }
}
