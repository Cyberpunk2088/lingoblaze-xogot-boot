# LingoBlaze Xogot Boot

Minimal, public compatibility project for **Godot 4.6 / Xogot**.

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

## Verified device result

The complete boot gate was manually verified on the target iPhone in Xogot 4.6:

- the project imported and started successfully
- the three answer buttons reacted to touch
- a wrong answer produced corrective feedback without blocking the task
- selecting **Hallo** produced the correct-answer state
- the completion state was saved locally
- after stopping and reopening the project, the local start counter increased from `1` to `2`
- the completed learning test remained stored and was loaded again

Current status:

`XOGOT_IMPORT_VERIFIED`

## Xogot import

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
3. Selecting a wrong answer reports corrective feedback.
4. Selecting **Hallo** reports a correct answer.
5. The screen reports that local saving works.
6. After closing and reopening the project, the local start counter increases and the completed learning test remains stored.

Verified status:

`XOGOT_IMPORT_VERIFIED`

## Technical constraints

- Xogot / Godot 4.6 verified baseline
- GDScript only
- no C#, C++, Swift, Rust, GDExtension, or native plugins
- no external network access
- no telemetry
- no third-party assets
- no personal data
- no automatic external actions

## Current scope

This repository remains deliberately small. The compatibility gate is complete. The commercial LingoBlaze game, including **The Silent Station** vertical slice, should be developed separately in a private repository so proprietary game design, curriculum, artwork, audio, and production code are not exposed publicly.
