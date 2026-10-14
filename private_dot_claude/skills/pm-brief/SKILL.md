---
name: pm-brief
description: Turn technical material into a concise, jargon-free brief for a project manager.
disable-model-invocation: true
---

Turn a source — a markdown file, a spec, or the discussion we just had — into a **brief** a project manager can read and act on. A brief keeps the plan of work sharp and drops the engineering detail behind it.

## Steps

1. **Gather the source.** Identify what you're briefing from: a file the user names, or the current discussion. Read all of it. Completion: you can state, in one sentence to yourself, what work the source describes and why it's happening.

2. **Extract the plan of work.** Pull out only what a PM tracks: what's being done, why it matters, the sequence of steps or phases, and anything they must approve or know about (a decision, a dependency, a risk, a date). Timeline and risk go in **only if the source gives them** — never invent them. Completion: every item on your list is something the PM would act on, not an implementation detail.

3. **Strip the technical detail.** Apply [what to cut, keep, translate](#what-to-cut-keep-translate). The test for anything that survives: a PM must need it to act or approve. Completion: no code, file paths, symbol names, versions, config keys, or commands remain, and every technical noun left is load-bearing.

4. **Choose the shape.** Pick per [the shape heuristic](#the-shape-heuristic). If the source genuinely fits neither cleanly, ask the user which they want before writing.

5. **Write the brief, tight.** Every sentence earns its place. Completion: no sentence restates another; cutting any remaining sentence would lose something the PM needs.

## What to cut, keep, translate

- **Cut** — code snippets, file paths, function/class/variable names, library or version numbers, framework internals, config keys, command invocations, tool names that carry no meaning for the PM.
- **Keep** — the outcome, the user- or business-facing effect, the order work happens in, dependencies that explain *why* that order, and any decision/risk/date the source states.
- **Translate** — a technical noun becomes its outcome. "Migrate the asset filesystem to S3" → "move file storage to cloud hosting, so the site stays fast as traffic grows." When unsure how much tech a PM can take, default to stripping it; if that risks losing meaning, ask.

## The shape heuristic

- **Narrative** — a tight paragraph or two of prose, for pasting into email or Slack. Use for a status update, a single thread of work, or small scope.
- **Summary + plan** — a 2–3 sentence *what & why*, then the plan as numbered steps or phases. Use when work splits into distinct phases or workstreams, or the PM needs to track or sign off on steps.

    ```
    ## <Title>

    <2–3 sentence what & why>

    **Plan of work**
    1. <phase / step>
    2. <phase / step>
    ```

  Add a short **Timeline / risks** section under the plan only when the source supplied that information.
