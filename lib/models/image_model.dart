class PixabayImage{
  final String id;
  final String pageURL;
  final String type;
  final List<String> tags;
  final String previewURL;
  final int previewWidth;
  final int previewHeight;
  final String webformatURL;
  final int webformatWidth;
  final int webformatHeight;
  final String largeImageURL;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;
  final int views;
  final int downloads;
  final int collections;
  final int likes;
  final int comments;
  final String user_id;
  final String user;
  final String userImageURL;

  const PixabayImage({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.user_id,
    required this.user,
    required this.userImageURL,
  });

  factory PixabayImage.fromJOSN(Map<String,dynamic> json){
    return PixabayImage(
        id : json.containsKey('id') ? json['id'].toString() : 'NA',
        pageURL : json.containsKey('pageURL') ? json['pageURL'] ?? 'NA' : 'NA',
        type : json.containsKey('type') ? json['type'] ?? 'NA' : 'NA',
        tags : json.containsKey('tags') ? json['tags'].toString().split(', ') : [],
        previewURL : json.containsKey('previewURL') ? json['previewURL'] ?? 'NA' : 'NA',
        previewWidth : json.containsKey('previewWidth') ? int.tryParse(json['previewWidth'].toString())??50  : 50,
        previewHeight : json.containsKey('previewHeight') ? int.tryParse(json['previewHeight'].toString())??50  : 50,
        webformatURL : json.containsKey('webformatURL') ? json['webformatURL'] ?? 'NA' : 'NA',
        webformatWidth : json.containsKey('previewHeight') ? int.tryParse(json['webformatWidth'].toString())??50  : 50,
        webformatHeight : json.containsKey('previewHeight') ? int.tryParse(json['webformatHeight'].toString())??50  : 50,
        largeImageURL : json.containsKey('largeImageURL') ? json['largeImageURL'] ?? 'NA' : 'NA',
        imageWidth : json.containsKey('imageWidth') ? int.tryParse(json['imageWidth'].toString())??50  : 50,
        imageHeight : json.containsKey('imageHeight') ? int.tryParse(json['imageHeight'].toString())??50  : 50,
        imageSize : json.containsKey('imageSize') ? int.tryParse(json['imageSize'].toString())??50  : 50,
        views : json.containsKey('views') ? int.tryParse(json['views'].toString())??0  : 0,
        downloads : json.containsKey('downloads') ? int.tryParse(json['downloads'].toString())??0  : 0,
        collections : json.containsKey('collections') ? int.tryParse(json['collections'].toString())??0  : 0,
        likes : json.containsKey('likes') ? int.tryParse(json['likes'].toString())??0  : 0,
        comments : json.containsKey('comments') ? int.tryParse(json['comments'].toString())??0  : 0,
        user_id : json.containsKey('user_id') ? json['user_id'].toString() : 'NA',
        user : json.containsKey('user') ? json['user'] ?? 'NA' : 'NA',
        userImageURL : json.containsKey('userImageURL') ? json['userImageURL'] ?? 'NA' : 'NA',
    );
  }
}