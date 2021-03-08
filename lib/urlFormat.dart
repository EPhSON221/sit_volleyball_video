class UrlFormatter{
  String url;

  UrlFormatter(this.url);

  String inputFormat(){
    if(url.contains('&feature=youtu.be')){
      url = url.substring(0,url.length-17);
    }else if(url.contains('https://youtu.be/')) {
      url = 'https://www.youtube.com/watch?v=${url.substring(17)}';
    }
    return url;
  }

  String imageFormat(){
    String imgURL = 'https://img.youtube.com/vi/${url.substring(32)}/default.jpg';
    return imgURL;
  }
}