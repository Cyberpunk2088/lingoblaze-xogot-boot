# LingoBlaze Repository Instructions

## Purpose

This public repository exists only to verify the GitHub → Xogot → Godot 4.4 boot path.

## Mandatory invariants

- Keep `project.godot` at the repository root.
- Use GDScript only.
- Do not add C#, C++, Swift, Rust, GDExtension, native plugins, or compiled binaries.
- Keep the core experience offline-first and network-free.
- Do not add telemetry, advertising SDKs, accounts, trackers, or cloud requirements.
- Use only original or clearly licensed assets. This boot repository currently uses no external assets.
- Use synthetic content only; never add personal data or secrets.
- Preserve touch-first portrait usability.
- Keep `main` startable in Xogot.

## Change discipline

- Make small, reviewable changes on feature branches.
- Do not merge without explicit human approval.
- Before proposing a merge, verify project paths, scene references, GDScript syntax, touch controls, and local-save behavior.
- Avoid dependencies unless they are essential, reviewed, and compatible with Xogot.

## Current release gate

`LINGOBLAZE_BOOT_001` must prove:

1. Xogot imports the repository.
2. The main scene starts.
3. Touch input works.
4. The German → English test reacts correctly.
5. Local progress survives a restart.

Until verified on the target device, status remains `NEEDS_DEVICE_TEST`.
