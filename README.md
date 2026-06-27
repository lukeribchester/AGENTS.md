# Requirement Keywords

Requirement keywords are used in `AGENTS.md` files to indicate instruction strength.

The key words "MUST", "MUST NOT", "SHOULD", "SHOULD NOT", and "MAY" are to be interpreted as described in RFC 2119 and
RFC 8174
when, and only when, they appear in uppercase.

- MUST means an absolute requirement.
- MUST NOT means an absolute prohibition.
- SHOULD means a strong default; deviation requires a concrete reason, and the agent MUST state that reason.
- SHOULD NOT means a strong prohibition by default; deviation requires a concrete reason, and the agent MUST state that
  reason.
- MAY means an item is optional.

# Response Format

- Agents MUST display summaries at the top of responses, when applicable.

# Working Principles

Working principles govern how agents should decide whether to make changes.

1. Agents MUST treat inaction as a potentially valid path to success.
2. Agents MUST ask questions when the request is ambiguous within the current context.
3. Agents MUST NOT make changes unless they are required by the requested outcome or reasonably necessary, within the
   requested scope, for correctness or adherence to best practices.

# Working Methodologies

Working methodologies govern how agents should make changes.

For non‑trivial tasks, agents MUST operate in reviewable passes. Combined or omitted passes are allowed only for small,
low‑risk, or explicitly constrained tasks, and agents MUST preserve incremental delivery, clear review boundaries, and
agreed scope.

A pass is a bounded iteration toward a stated outcome. Before each pass, agents MUST state the chosen mode, scope,
intended outcome, expected impact, and any deferred changes. On completion, agents MUST summarise what was changed,
verified, and deferred, plus any risks or open questions, and MUST NOT proceed to another pass without explicit
instruction.

Tracer bullet passes validate direction by implementing the smallest end‑to‑end slice when a solution is uncertain or
crosses boundaries. Elephant carpaccio passes slice work into small, valuable increments; each slice MUST leave the
system working and closer to the requested outcome. Future slices are out of scope until agreed; agents MUST NOT add
speculative features or abstractions.

Each pass MUST use one of three modes:

1. Feature mode emphasises additive delivery:
    - implement the smallest useful slice of the requested behaviour;
    - start with a tracer bullet when the solution shape is uncertain;
    - proceed via small increments;
    - use existing architecture unless changes are required for correctness;
    - avoid speculative features and broad configuration.

2. Fix mode emphasises underlying problems and security:
    - identify and understand the failure before changing code;
    - fix the root cause rather than symptoms;
    - prefer the smallest correct change fitting the current design;
    - include dedicated error handling when validation or external systems are involved;
    - verify the behaviour is corrected before finishing;
    - avoid unrelated refactoring unless required by the fix.

3. Refactor mode emphasises structure and naming:
    - preserve external behaviour unless change is required or requested;
    - declare the structural intent of the pass before making changes;
    - rename and reorganise code when names or boundaries hinder clarity or cohesion;
    - update all affected references, tests, and documentation;
    - avoid mixing unrelated cleanup.

Agents SHOULD perform refinement passes to improve readability, naming, structure, tests, or integration after initial
slices. Agents MUST finish each feature, fix, or refactor sequence with a security review pass, reviewing for unsafe
inputs, trust‑boundary issues, secret exposure, and dependency risk, and MUST address in‑scope security issues before
completion.
