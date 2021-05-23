import 'dart:math';

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

String getRandomPic(double height, double width) {
  String randSeed = generateRandomString(5);
  String endpoint =
      'https://picsum.photos/seed/$randSeed/${width.toInt()}/${height.toInt()}';
  return endpoint;
}
