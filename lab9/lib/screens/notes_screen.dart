import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/storage_service.dart';
import '../widgets/note_tile.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final StorageService _storageService = StorageService();
  List<Note> _allNotes = [];
  List<Note> _filteredNotes = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNotes();
    _searchController.addListener(_filterNotes);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadNotes() async {
    setState(() => _isLoading = true);
    final notes = await _storageService.loadNotes();
    setState(() {
      _allNotes = notes;
      _filteredNotes = notes;
      _isLoading = false;
    });
  }

  void _filterNotes() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredNotes = _allNotes.where((note) {
        return note.title.toLowerCase().contains(query) ||
            note.description.toLowerCase().contains(query);
      }).toList();
    });
  }

  Future<void> _saveAndRefresh() async {
    await _storageService.saveNotes(_allNotes);
    _filterNotes();
  }

  void _showNoteDialog({Note? note}) {
    final isEditing = note != null;
    final titleController = TextEditingController(text: note?.title ?? '');
    final descController = TextEditingController(text: note?.description ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? 'Edit Note' : 'Add Note'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isEmpty) return;

              if (isEditing) {
                final index = _allNotes.indexWhere((n) => n.id == note.id);
                if (index != -1) {
                  _allNotes[index] = note.copyWith(
                    title: titleController.text,
                    description: descController.text,
                  );
                }
              } else {
                final newNote = Note(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: titleController.text,
                  description: descController.text,
                );
                _allNotes.add(newNote);
              }

              _saveAndRefresh();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(isEditing ? 'Note updated' : 'Note added')),
              );
            },
            child: Text(isEditing ? 'Update' : 'Add'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(Note note) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Note'),
        content: const Text('Are you sure you want to delete this note?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _allNotes.removeWhere((n) => n.id == note.id);
              });
              _saveAndRefresh();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Note deleted')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search notes...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadNotes,
              child: _filteredNotes.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.note_alt_outlined, size: 64, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          const Text('No notes found', style: TextStyle(fontSize: 18, color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _filteredNotes.length,
                      itemBuilder: (context, index) {
                        final note = _filteredNotes[index];
                        return NoteTile(
                          note: note,
                          onEdit: () => _showNoteDialog(note: note),
                          onDelete: () => _confirmDelete(note),
                        );
                      },
                    ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNoteDialog(),
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
