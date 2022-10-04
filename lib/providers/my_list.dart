import 'package:flutter/material.dart';

import '../models/my_list.dart';

class MyListProvider with ChangeNotifier {
  final List<MyList> _mylist = [
    MyList(
        'm1',
        'My Hero Academia',
        'https://m.media-amazon.com/images/M/MV5BMGI5NjVkMTQtZDhlYy00NDAwLWIxMWYtMGQyM2MxN2JlNzU5XkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg',
         DateTime(2021),
         'm1',
        true)
  ];

  get mylist {
    return [..._mylist];
  }

  void addToMyList(MyList list) {
    // int index = _mylist.indexWhere((element) => element.id == list.id);
    var itemExisting = _mylist.indexWhere(
      (element) => element.movieName == list.movieName,
    );

    if (_mylist.asMap().containsKey(itemExisting)) {
      return;
    } else {
      _mylist.insert(
        0,
        MyList(
          list.id,
          list.movieName,
          list.coverImage,
          list.length,
          list.id,
          list.isAdded,
        ),
      );
      notifyListeners();
    }
  }

  void removeFromMyList(MyList list) {
    _mylist.remove(list);
    notifyListeners();
  }
}
