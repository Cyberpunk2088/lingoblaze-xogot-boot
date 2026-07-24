# LingoBlaze Xogot Boot

Minimal, public compatibility project for **Godot 4.4 / Xogot**.

This repository is only the technical boot test. It does not contain the commercial game, final artwork, language curriculum, or proprietary content.

## LINGOBLAZE_BOOT_001

The boot build verifies:

- project import from GitHub into Xogot
- a valid `project.godot` at the repository root
- GDScript execution
- touch-button input
- a minimal German-to-English learning interaction
- local persistence through `user://`
- portrait-oriented responsive UI
- offline operation without plugins, accounts, ads, or cloud services

## Xogot import

After the boot pull request is merged into `main`:

1. Open Xogot.
2. Choose the GitHub project download option.
3. Paste:

   `https://github.com/Cyberpunk2088/lingoblaze-xogot-boot`

4. Download and open the project.
5. Press **Play**.

## Acceptance test

The boot gate passes when all of these work on the iPhone:

1. The LingoBlaze screen appears without an error.
2. The three answer buttons react to touch.
3. Selecting **Hallo** reports a correct answer.
4. The screen reports that local saving works.
5. After closing and reopening the project, the local start counter increases and the completed learning test remains stored.

Target status after device verification:

`XOGOT_IMPORT_VERIFIED`

## Technical constraints

- Xogot / Godot 4.4 baseline
- GDScript only
- no C#, C++, Swift, Rust, GDExtension, or native plugins
- no external network access
- no telemetry
- no third-party assets
- no personal data
- no automatic external actions

## Current scope

This repository remains deliberately small. The commercial LingoBlaze project will be created separately as a private repository after this compatibility gate passes.
