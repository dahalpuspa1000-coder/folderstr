import 'package:filderstr/features/product/presentation/bloc/post_bloc.dart';
import 'package:filderstr/features/product/presentation/bloc/product_bloc.dart';
import 'package:filderstr/features/product/presentation/pages/post_product_page.dart';
import 'package:filderstr/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await di.registerDependcies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context)=>di.sl<ProductBloc>()),
      BlocProvider(create: (context)=>di.sl<PostProductBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home:  AddProductPage(),
      ),
    );
  }
}

