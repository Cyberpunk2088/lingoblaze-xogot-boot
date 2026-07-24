# LingoBlaze Repository Instructions

## Purpose

This public repository exists only to verify and preserve the GitHub → Xogot → Godot 4.6 boot path.

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
- Keep commercial LingoBlaze code, curriculum, artwork, audio, and proprietary design material out of this public compatibility repository.

## Change discipline

- Make small, reviewable changes on feature branches.
- Do not merge without explicit human approval.
- Before proposing a merge, verify project paths, scene references, GDScript syntax, touch controls, and local-save behavior.
- Avoid dependencies unless they are essential, reviewed, and compatible with Xogot.

## Verified release gate

`LINGOBLAZE_BOOT_001` has proven on the target device that:

1. Xogot imports the repository.
2. The main scene starts under Godot 4.6.
3. Touch input works.
4. Wrong and correct German → English answers react correctly.
5. Local progress survives a restart.

Current status:

`XOGOT_IMPORT_VERIFIED`

## Next product boundary

The next milestone, `SILENT_STATION_VERTICAL_SLICE_001`, belongs in a separate private production repository. This public repository remains the minimal reproducible compatibility baseline.
