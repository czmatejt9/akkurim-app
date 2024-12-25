import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_data.freezed.dart';
part 'app_settings_data.g.dart';

@freezed
class AppSettingsData with _$AppSettingsData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory AppSettingsData({
    required String? locale,
    required bool? isDarkMode,
  }) = _AppSettingsData;

  factory AppSettingsData.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsDataFromJson(json);
}
