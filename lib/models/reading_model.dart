class ReadingModel {
  String read;
  String style; // typically "req", "alt", or "opt"

  ReadingModel(
      { this.read
      , this.style
      });

  List<ReadingModel> mapReadingModel(data) =>
      data.map<ReadingModel>( (r) => ReadingModel(read: r['read'], style: r['style']) ).toList();

}

/*
List<ReadingModel> mapReadingModel(data) =>
      data.map<ReadingModel>( (r) => ReadingModel(read: r['read'], style: r['style']) ).toList();

 */