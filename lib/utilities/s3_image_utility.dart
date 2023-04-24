import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> uploadProfileImageToS3(
  File imageFile,
  String bucketName,
  String userId,
  String imageFileName, {
  String region = 'us-east-1',
}) async {
  final key = 'ServeToBeFree/ProfilePictures/$userId/$imageFileName';
  final url =
      'https://$bucketName.s3.amazonaws.com/$key'.replaceAll('+', '%20');
  final response = await http.put(
    Uri.parse(url),
    headers: {'Content-Type': 'image/jpeg'},
    body: await imageFile.readAsBytes(),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to upload image to S3');
  }
}

Future<void> uploadProjectImageToS3(
  File imageFile,
  String bucketName,
  String projectId,
  String imageFileName, {
  String region = 'us-east-1',
}) async {
  final key = 'ServeToBeFree/ProjectPictures/$projectId/$imageFileName';
  final url =
      'https://$bucketName.s3.amazonaws.com/$key'.replaceAll('+', '%20');
  final response = await http.put(
    Uri.parse(url),
    headers: {'Content-Type': 'image/jpeg'},
    body: await imageFile.readAsBytes(),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to upload image to S3');
  }
}
