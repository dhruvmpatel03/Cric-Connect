import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/theme_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVm = context.watch<ThemeViewModel>();
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Appearance', style: text.titleLarge),
          const SizedBox(height: 4),
          Text(
            'System follows your phone’s own light or dark setting.',
            style: text.bodyMedium,
          ),
          const SizedBox(height: 16),
          SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(
                value: ThemeMode.light,
                label: Text('Light'),
                icon: Icon(Icons.light_mode_outlined),
              ),
              ButtonSegment(
                value: ThemeMode.system,
                label: Text('System'),
                icon: Icon(Icons.brightness_auto_outlined),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                label: Text('Dark'),
                icon: Icon(Icons.dark_mode_outlined),
              ),
            ],
            selected: {themeVm.mode},
            onSelectionChanged: (s) => themeVm.setMode(s.first),
          ),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Why dark mode?'),
              subtitle: const Text(
                'Easier on the eyes for evening games under lights, '
                'and saves battery on many phones.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}