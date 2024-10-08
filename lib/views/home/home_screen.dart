import 'package:bloc_clean_coding/bloc/movies/movies_bloc.dart';
import 'package:bloc_clean_coding/config/components/internet_exception_widget.dart';
import 'package:bloc_clean_coding/config/routes/routes_name.dart';
import 'package:bloc_clean_coding/services/storage/local_storage.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';

/// A widget representing the screen displaying a list of movies.
class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MoviesBloc moviesBloc;

  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc(moviesApiRepository: getIt());
    // Fetch movies when the screen is initialized
    moviesBloc.add(MoviesFetch());

    // Debugging: Print to check if Bloc is initialized
    print("MoviesBloc initialized");
  }

  @override
  void dispose() {
    // Dispose the bloc
    moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: moviesBloc, // Use the existing bloc instance
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          // title: Text('Popular Shows',style: GoogleFonts.montserrat(),),
          title: Text('مشہور شوز',style: GoogleFonts.notoNastaliqUrdu(),),
          backgroundColor: Colors.grey,
          actions: [
            IconButton(
              onPressed: () {
                LocalStorage localStorage = LocalStorage();
                // User session management
                localStorage.clearValue('token').then((value) {
                  localStorage.clearValue('isLogin').then((value) {
                    Navigator.pushNamed(context, RoutesName.loginScreen);
                  });
                });
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          ],
        ),
        body: BlocBuilder<MoviesBloc, MoviesState>(
          buildWhen: (previous, current) => previous.moviesList.status != current.moviesList.status,
          builder: (BuildContext context, state) {
            print('Current state: ${state.moviesList.status}'); // Debugging line
            switch (state.moviesList.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());

              case Status.ERROR:
                // if (state.moviesList.message == 'No Internet Connection') {
                  print('Current state: ${state.moviesList.status}'); // Debugging line
                  return InternetExceptionWidget(
                    onPress: () {
                      moviesBloc.add(MoviesFetch());
                    },
                  );
                // }
                // return Center(child: Text(state.moviesList.message.toString()));

              case Status.COMPLETED:
                if (state.moviesList.data == null || state.moviesList.data!.tvShow.isEmpty) {
                  // No data found, displaying a message
                  return Center(child: Text('No Data Found',style: GoogleFonts.montserrat(),));
                }
                final movieList = state.moviesList.data!;

                // Debugging: Check if movie list is not empty
                print('Movie list length: ${movieList.tvShow.length}');

                return ListView.builder(
                  itemCount: movieList.tvShow.length,
                  itemBuilder: (context, index) {
                    final tvShow = movieList.tvShow[index];

                    // Debugging: Print each show's name
                    print('Show name: ${tvShow.name}');

                    return Card(
                      // color: Colors.grey,
                      child: ListTile(
                        leading: tvShow.imageThumbnailPath != null && tvShow.imageThumbnailPath.isNotEmpty
                            ? Image.network(tvShow.imageThumbnailPath.toString())
                            : const Icon(Icons.image_not_supported),
                        title: Text(tvShow.name,style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),), // Provide a default value if null
                        subtitle: Text(tvShow.network,style: GoogleFonts.montserrat(fontSize: 12),), // Provide a default value if null
                        trailing: Text(tvShow.status,style: GoogleFonts.montserrat(fontSize: 11),), // Provide a default value if null
                      ),

                    );
                  },
                );

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
