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

## Git

- Agents MUST work on the current branch, normally main, unless instructed otherwise.
  Branches and worktrees MUST NOT be created unless requested.
- Agents MUST commit only when explicitly requested. Approval to implement does not authorize committing.
- When committing, agents SHOULD amend or squash clearly related recent unpushed commits toward the same goal.
  Changes MUST remain separate when their relationship is uncertain.
- Agents MUST obtain explicit approval before rewriting published commits locally.
- Agents MUST NOT push or modify remote repositories through any tool.
- Agents MUST preserve unrelated commits, edits, and partial staging.
- Before rewriting history, agents MUST create a local recovery reference.
  Afterward, agents MUST verify that the intended final file contents are preserved.
- Agents MUST report the resulting commit hash, subject, and any commits consolidated.

## Commit Messages

- Messages MUST follow Conventional Commits: `<type>[optional scope][!]: <description>`.
- The entire header MUST NOT exceed 80 characters.
- Headers MUST use a lowercase type, an imperative description, and no trailing period.
  Agents SHOULD include a short scope when useful.
- Agents MUST choose an appropriate type and MAY use `wip` for temporary checkpoints.
- Messages MUST describe the actual committed change, or the aggregate change when squashing.
- Agents SHOULD omit unnecessary bodies. When included, bodies SHOULD briefly explain why and MUST wrap at 80 characters.
- Breaking changes MUST use `!` and a `BREAKING CHANGE:` footer explaining the incompatibility and migration.
- Agents MUST NOT invent facts or references.
- AI-assisted commits MUST include `Assisted-by: <tool> (<model-id>)`,
  for example `Assisted-by: Codex (gpt-6-astra)`.
- Agents MUST use the tool's official name and the verified model identifier.
  If the model is unknown, use `Assisted-by: <tool>` without parentheses.
- Agents MUST preserve relevant assistance attribution when squashing.
- `Signed-off-by` MUST identify the human committer, not an AI tool.

## Tool Boundaries

- Agents MUST NOT provision, modify, or destroy infrastructure, or deploy infrastructure or applications.
- Terraform MUST be limited to read-only status and state inspection. Agents MUST NOT run `init`, `plan`, `apply`,
  `destroy`, `refresh`, `import`, or state-modifying commands.
- Agents MUST NOT run Google Cloud CLI commands, including `gcloud`, `gsutil`, or `bq`.
- Agents MAY perform CRUD operations on Sanity content. Agents MUST NOT deploy Sanity applications or schemas,
  or modify project or dataset configuration.
- Agents MAY run Docker commands subject to the infrastructure restrictions above.
  Agents MUST NOT publish or push images or other artifacts.
- Agents MAY perform Git operations, including read-only remote access, subject to the existing Git instructions.
  Agents MUST NOT push, change remote configuration, or modify remote repositories or their branches and tags.
- These restrictions MUST apply equally to direct commands and equivalent actions through scripts, APIs, plugins,
  or other tools.
- Other tools MAY be used within the requested scope unless restricted elsewhere.
