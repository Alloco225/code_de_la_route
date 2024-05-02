// assetMixer('image')

String getMediaPath(String fileName) {
  // let parts = name.split('/');
  const categoryIndexer = {
    "images": ['png', 'jpg', 'jpeg'],
    "video": ['mp4'],
  };

  String extension = fileName.split('.').last.toLowerCase();

  var category = "others";
  for (var cat in categoryIndexer.keys) {
    if (categoryIndexer[cat]!.contains(extension)) {
      category = cat;
    }
  }

  fileName = fileName[0] == '/' ? fileName : '/$fileName';

  return 'assets/$category$fileName';
}

String getAudioPath(String path) {
  return 'audio/$path';
  return 'assets/audio/$path';
}
