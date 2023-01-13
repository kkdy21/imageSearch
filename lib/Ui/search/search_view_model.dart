// 화면하나당 viewModel을 가지는게 국룰이다.
// 의존성 신경안쓰고 했음.
// _가 붙으면 private
// final는 freeze역할
import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/data/repository/photo_repository.dart';
import '../../data/model/photo.dart';

//모든 상태는 viewModel이 가지고 있으면 된다.
class SearchViewModel extends ChangeNotifier{
    final _photoRepository = PhotoRepository();

    List<Photo> photos = [];
    bool isLoading = false;

    Future<void> search(String query) async {
        await _photoRepository.getPhotos(query).then((res) => photos = res);
    }
}