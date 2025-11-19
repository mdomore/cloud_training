# Documentation Structure Guide

## 📚 Consolidated Documentation Structure

This repository uses a **consolidated documentation approach** where all learning content for each phase is in a single, comprehensive markdown file.

## File Organization

### Documentation Files (`docs/`)

All learning content is in the `docs/` directory:

- **`01-foundations.md`** - Complete Phase 1 content (~110KB)
  - System Administration (Linux, Shell Scripting, Configuration, Security)
  - Networking
  - Development Basics

- **`02-infrastructure.md`** - Complete Phase 2 content
  - Configuration Management (Ansible)
  - Infrastructure Provisioning (Terraform)
  - Containerization (Docker, Kubernetes)

- **`03-cloud-platforms.md`** - Complete Phase 3 content
  - AWS
  - GCP
  - Azure

- **`04-multi-cloud-architecture.md`** - Complete Phase 4 content
- **`05-ci-cd-automation.md`** - Complete Phase 5 content
- **`06-security-compliance.md`** - Complete Phase 6 content
- **`07-observability.md`** - Complete Phase 7 content
- **`08-application-development.md`** - Complete Phase 8 content
- **`09-european-cloud-alternatives.md`** - Complete Phase 9 content

### Directory Structure (for exercises/examples)

The phase directories (`01-foundations/`, `02-infrastructure/`, etc.) are maintained for:
- Organizing practical exercises
- Storing code examples
- Personal notes and progress tracking
- Project-specific files

Each subdirectory has a minimal README that points to the consolidated documentation.

## 🎯 Benefits

1. **Single Source of Truth**: All content for a phase in one file
2. **Easy Navigation**: Table of contents in each file
3. **Easy Search**: Use Ctrl+F within each file
4. **Better for Learning**: Read continuously without jumping between files
5. **Easy to Share**: Share individual phase files
6. **Maintainable**: Update one file instead of many

## 📖 How to Use

1. **Start Reading**: Open `docs/01-foundations.md`
2. **Use Table of Contents**: Jump to specific sections
3. **Search**: Use Ctrl+F to find topics
4. **Complete Exercises**: Use the phase directories for practical work
5. **Take Notes**: Add your notes in the phase directories

## 🔄 Updating Documentation

To update consolidated documentation:

1. Edit the appropriate file in `docs/`
2. Or use the consolidation script: `python3 scripts/consolidate_all_docs.py`
3. Regenerate TOC if needed: `python3 scripts/fix_toc.py`

---

**Back to [Main README](../README.md)**

