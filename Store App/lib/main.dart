import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'views/add_view.dart';
import 'views/home_view.dart';
import 'views/product_view.dart';
import 'views/update_view.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllCategoriesCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeView.id: (context) => const HomeView(),
          ProductView.id: (context) => const ProductView(),
          UpdateView.id: (context) => const UpdateView(),
          AddView.id: (context) => const AddView()
        },
        theme: ThemeData(useMaterial3: true),
        initialRoute: HomeView.id,
      ),
    );
  }
}
