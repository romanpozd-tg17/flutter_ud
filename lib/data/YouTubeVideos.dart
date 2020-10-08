
import 'package:json_annotation/json_annotation.dart';

part 'YouTubeVideos.g.dart';

@JsonSerializable()
class YouTubeVideos {
  @JsonKey(name: "BOND_INTRODUCTION") YouTubeVideo bondIntroduction;
  @JsonKey(name: "MAP_SERVICES") YouTubeVideo mapServices;
  @JsonKey(name: "MONITORING_SERVICES") YouTubeVideo monitoringServices;
  @JsonKey(name: "SECURITY_AGENT") YouTubeVideo securityAgent;
  @JsonKey(name: "SEND_CAR") YouTubeVideo sendCar;
  @JsonKey(name: "SIREN") YouTubeVideo siren;


  YouTubeVideos(this.bondIntroduction, this.mapServices, this.monitoringServices, this.securityAgent, this.sendCar, this.siren);

  factory YouTubeVideos.fromJson(Map<String, dynamic> json) => _$YouTubeVideosFromJson(json);
  Map<String, dynamic> toJson() => _$YouTubeVideosToJson(this);

   List<YouTubeVideo> toList() {
    return List<YouTubeVideo>()
      ..add(bondIntroduction)
      ..add(monitoringServices)
      ..add(securityAgent)
      ..add(sendCar)
      ..add(siren);
  }

}


@JsonSerializable()
class YouTubeVideo {
  bool isPortrait;
  bool shouldBeShown;
  String videoId;
  String videoName;

  YouTubeVideo(this.isPortrait, this.shouldBeShown, this.videoId, this.videoName);

  factory YouTubeVideo.fromJson(Map<String, dynamic> json) => _$YouTubeVideoFromJson(json);
  Map<String, dynamic> toJson() => _$YouTubeVideoToJson(this);
}