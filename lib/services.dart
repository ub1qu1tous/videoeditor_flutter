import 'package:flutter/material.dart';

class Feature {
  final String name; // Feature name
  final String description; // Feature description
  final IconData icon; // Feature icon

  Feature({
    required this.name,
    required this.description,
    required this.icon,
  });
}

class Service {
  final String name; // Service name
  final List<Feature> features; // Array of features

  Service({
    required this.name,
    required this.features,
  });
}

// Define the features for Video Tools
Service videoService = Service(
  name: 'Video',
  features: [
    Feature(
      name: 'Compressor',
      description: 'Reduce file size while maintaining quality',
      icon: Icons.compress,
    ),
    Feature(
      name: 'Convertor',
      description: 'Transform your video files to different formats',
      icon: Icons.sync,
    ),
    Feature(
      name: 'Resizer',
      description: 'Resize video to a specific resolution',
      icon: Icons.aspect_ratio,
    ),
    Feature(
      name: 'Merger',
      description: 'Combine multiple video clips into a single file',
      icon: Icons.merge,
    ),
    Feature(
      name: 'Flip / Rotate',
      description: 'Twist and Turn for the Perfect View',
      icon: Icons.flip,
    ),
    Feature(
      name: 'Change Speed',
      description: 'Adjust the playback speed of your videos',
      icon: Icons.speed,
    ),
    Feature(
      name: 'Gif maker',
      description: 'Transform video clips into looping animations',
      icon: Icons.gif_box_outlined,
    ),
    Feature(
      name: 'Audio Extractor',
      description: 'Separate and save audio tracks from your videos',
      icon: Icons.music_note,
    ),
    Feature(
      name: 'Videos playground',
      description: 'Crop, trim, and merge clips with super ease',
      icon: Icons.edit,
    ),
  ],
);

// Define the features for Audio Tools
Service audioService = Service(
  name: 'Audio Tools',
  features: [
    Feature(
      name: 'Convertor',
      description: 'Transform your audio files to different formats',
      icon: Icons.sync,
    ),
    Feature(
      name: 'Merger',
      description: 'Combine multiple clips in a single file',
      icon: Icons.merge,
    ),
    Feature(
      name: 'Waveform Video',
      description: 'Create a video from your audio files',
      icon: Icons.graphic_eq,
    ),
    Feature(
      name: 'Audio Metadata',
      description: 'Extract metadata from your audio files',
      icon: Icons.equalizer,
    ),
  ],
);

// Define the features for Image Tools
Service imageService = Service(
  name: 'Image Tools',
  features: [
    Feature(
      name: 'Convertor',
      description: 'Transform your image files to different formats',
      icon: Icons.sync,
    ),
    Feature(
      name: 'Compressor',
      description: 'Reduce file size while maintaining quality',
      icon: Icons.compress,
    ),
    Feature(
      name: 'Resizer',
      description: 'Resize images to a specific resolution.',
      icon: Icons.aspect_ratio,
    ),
    Feature(
      name: 'Crop / Flip / Rotate',
      description: 'Twist and Turn for the Perfect View',
      icon: Icons.crop,
    ),
    Feature(
      name: 'Gif compressor',
      description: 'Compress your gifs to reduce the file size',
      icon: Icons.gif_box_outlined,
    ),
  ],
);
