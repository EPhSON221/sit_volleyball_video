class URL{
  String url;

  URL.inputFormat(this.url){
    if(url.contains('&feature=youtu.be')){
      url = url.substring(0,url.length-17);
    }else if(url.contains('https://youtu.be/')) {
      url = 'https://www.youtube.com/watch?v=${url.substring(17)}';
    }
  }

  URL.imageFormat(this.url){
    url = 'https://img.youtube.com/vi/${url.substring(32)}/mqdefault.jpg';
  }
}