import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../models/note.dart';

class StorageService {
  static const String _fileName = 'notes.json';
  static const String _assetPath = 'assets/data/notes.json';

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_fileName');
  }

  Future<List<Note>> loadNotes() async {
    try {
      final file = await _localFile;

      if (await file.exists()) {
        final contents = await file.readAsString();
        final List<dynamic> jsonList = jsonDecode(contents);
        return jsonList.map((json) => Note.fromJson(json)).toList();
      } else {
        // Load from assets if local file doesn't exist
        final assetContents = await rootBundle.loadString(_assetPath);
        final List<dynamic> jsonList = jsonDecode(assetContents);
        final notes = jsonList.map((json) => Note.fromJson(json)).toList();
        
        // Save to local file for future use
        await saveNotes(notes);
        return notes;
      }
    } catch (e) {
      print('Error loading notes: $e');
      return [];
    }
  }

  Future<void> saveNotes(List<Note> notes) async {
    try {
      final file = await _localFile;
      final String jsonString = jsonEncode(notes.map((n) => n.toJson()).toList());
      await file.writeAsString(jsonString);
    } catch (e) {
      print('Error saving notes: $e');
    }
  }
}
