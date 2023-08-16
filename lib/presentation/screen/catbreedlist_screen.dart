
import 'package:cat_api/bloc/cat_bloc.dart';
import 'package:cat_api/presentation/widget/breedcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedsScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatBloc()..add(LoadCatEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cat Breeds'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search by breed...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CatBloc, CatState>(
                builder: (context, state) {
                  if (state is CatInitial) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CatErrorState) {
                    return Center(
                      child: Text("Api fetching failed"),
                    );
                  } else if (state is CatLoadedState) {
                    final catList = state.cats;                   
                    return ListView.builder( 
                      itemCount: catList.length,
                      itemBuilder: (context, index) {                       
                        return BreedCard(
                          breedName: catList[index]?.breeds?[0]?.name??'',
                      breedImage: catList[index]!.url.toString(), 
                      description: catList[index]?.breeds?[0]?.description ??'',  
                      origin:catList[index]?.breeds?[0]?.origin ??'' , 
                      lifespan: catList[index]?.breeds?[0]?.lifespan ??'' ,                    
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



 // final List<String> catBreeds = [];

  // List<String> filteredBreeds = [];

  // void _filterBreeds(String query) {   
  //     filteredBreeds = catBreeds
  //         .where((breed) => breed.toLowerCase().contains(query.toLowerCase()))
  //         .toList();   
  // }