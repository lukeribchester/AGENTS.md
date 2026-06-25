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

For non-trivial features, fixes, and refactors, agents SHOULD work in reviewable passes. Agents MAY combine or omit
passes when the task is small, low-risk, or explicitly constrained, but MUST preserve incremental delivery and clear
review boundaries.

1. Agents SHOULD begin with a tracer bullet pass;
    - implement the smallest end-to-end working path that proves the approach;
    - avoid polish, broad abstraction, and optional hardening in this pass;
    - stop after the pass, summarize the result, and ask whether to continue.

2. Agents SHOULD continue with one or more refinement passes;
    - improve one coherent slice at a time;
    - keep each slice working, reviewable, and bounded by the requested outcome;
    - stop after each pass, summarize the result, and ask whether to continue.

3. Agents SHOULD perform an error handling pass;
    - address expected failure modes, validation, and edge cases within the requested scope;
    - verify the relevant behavior before continuing.

4. Agents MUST finish with a security review pass;
    - review the implemented change for security regressions, unsafe inputs, trust-boundary violations, secret exposure,
      and dependency risk;
    - fix in-scope security issues or report them before considering the work complete.
