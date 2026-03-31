# /output-contract -- Completeness Surface

**Engine:** design-quality-core v1.0.0

When invoked, this surface enforces complete delivery. It is orthogonal to
design and may be combined with `/craft` or `/refine`.

## Use when

- the user wants a full implementation, not a sketch
- the task spans multiple files or sections
- truncation or placeholder output would break the task

## Hard rules

- Do not output placeholders such as `TODO`, `...`, "rest of code", or
  "similar to above".
- Do not describe omitted code instead of writing it.
- Count the deliverables and ensure they are all present.
- If the response must stop for length, stop only at a clean boundary and state
  exactly what remains.

## Continuation rule

If the task must pause due to output length, end with:

`[PAUSED -- X of Y complete. Send "continue" to resume from: next section name]`

On continuation, resume from that point without recap or duplication.

## Combined use

If used with another design-quality surface:

- the other surface (`/craft` or `/refine`) defines the task method
- `/output-contract` defines completeness and continuation behaviour

It does not replace stack truth, verification, or the shared doctrine.
