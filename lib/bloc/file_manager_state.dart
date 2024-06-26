part of 'file_manager_bloc.dart';

class FileManagerState extends Equatable {
  const FileManagerState({
    required this.progress,
    required this.newFileLocation,
  });

  final double progress;
  final String newFileLocation;

  FileManagerState copyWith({
    double? progress,
    String? newFileLocation,
  }) =>
      FileManagerState(
        progress: progress ?? this.progress,
        newFileLocation: newFileLocation ?? this.newFileLocation,
      );

  @override
  List<Object?> get props => [
        progress,
        newFileLocation,
      ];
}
