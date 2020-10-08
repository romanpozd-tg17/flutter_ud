// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YouTubeVideos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YouTubeVideos _$YouTubeVideosFromJson(Map<String, dynamic> json) {
  return YouTubeVideos(
    json['BOND_INTRODUCTION'] == null
        ? null
        : YouTubeVideo.fromJson(
            json['BOND_INTRODUCTION'] as Map<String, dynamic>),
    json['MAP_SERVICES'] == null
        ? null
        : YouTubeVideo.fromJson(json['MAP_SERVICES'] as Map<String, dynamic>),
    json['MONITORING_SERVICES'] == null
        ? null
        : YouTubeVideo.fromJson(
            json['MONITORING_SERVICES'] as Map<String, dynamic>),
    json['SECURITY_AGENT'] == null
        ? null
        : YouTubeVideo.fromJson(json['SECURITY_AGENT'] as Map<String, dynamic>),
    json['SEND_CAR'] == null
        ? null
        : YouTubeVideo.fromJson(json['SEND_CAR'] as Map<String, dynamic>),
    json['SIREN'] == null
        ? null
        : YouTubeVideo.fromJson(json['SIREN'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$YouTubeVideosToJson(YouTubeVideos instance) =>
    <String, dynamic>{
      'BOND_INTRODUCTION': instance.bondIntroduction,
      'MAP_SERVICES': instance.mapServices,
      'MONITORING_SERVICES': instance.monitoringServices,
      'SECURITY_AGENT': instance.securityAgent,
      'SEND_CAR': instance.sendCar,
      'SIREN': instance.siren,
    };

YouTubeVideo _$YouTubeVideoFromJson(Map<String, dynamic> json) {
  return YouTubeVideo(
    json['isPortrait'] as bool,
    json['shouldBeShown'] as bool,
    json['videoId'] as String,
    json['videoName'] as String,
  );
}

Map<String, dynamic> _$YouTubeVideoToJson(YouTubeVideo instance) =>
    <String, dynamic>{
      'isPortrait': instance.isPortrait,
      'shouldBeShown': instance.shouldBeShown,
      'videoId': instance.videoId,
      'videoName': instance.videoName,
    };
