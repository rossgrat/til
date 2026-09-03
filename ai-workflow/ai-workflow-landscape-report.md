# AI delegation without loss of rigor or skill

Research date: September 2, 2026

## Executive answer

Delegate generation. Retain intent, judgment, and proof.

You do not need to solve every problem before you ask AI for help. You do need to own the problem frame and the acceptance test. You also need a mental model that lets you detect a wrong answer and repair the result later.

AI works best when the task has clear boundaries and cheap proof. Human control must rise with consequence, ambiguity, proof cost, and learning value. This rule explains much of the disagreement in the research.

Do not surround every AI task with several AI reviewers. Model review is useful for more hypotheses and failure cases. It is not independent proof because models can share the same blind spots.

Use the strongest evidence that the task permits:

1. A deterministic test, type check, or static rule.
2. An authoritative source or state readback.
3. A human review of intent, tradeoffs, and residual risk.
4. Runtime evidence for changes that affect real systems.

The practical goal is not maximum agent use. The goal is maximum accepted output per unit of human attention, with skill and system quality intact.

## What the evidence says

### 1. AI creates large gains on some bounded tasks

Noy and Zhang tested 453 professionals on short business tasks. ChatGPT cut task time by 40 percent and raised quality by 18 percent. The tasks did not require deep company context or strict factual proof. That detail limits the result. [Science paper](https://pubmed.ncbi.nlm.nih.gov/37440646/)

Brynjolfsson, Li, and Raymond studied 5,179 customer support agents. AI raised resolved issues per hour by 14 percent on average. The gain reached 34 percent for novice and lower-skill workers. The best workers saw little gain. [NBER paper](https://www.nber.org/papers/w31161)

Dell'Acqua and colleagues tested 758 consultants. On tasks inside the model's capability frontier, AI users completed 12.2 percent more tasks and worked 25.1 percent faster. Their output quality rose by more than 40 percent. On a task outside that frontier, AI users were 19 percentage points less likely to reach the correct answer. [Organization Science paper](https://pubsonline.informs.org/doi/pdf/10.1287/orsc.2025.21838)

The same pattern appears across other fields:

- A six-month Microsoft trial covered about 6,000 workers. AI reduced email time, but meetings did not fall. Coordination remained a separate bottleneck. [Microsoft Research](https://www.microsoft.com/en-us/research/publication/shifting-work-patterns-with-generative-ai/)

- A randomized law-school study found large speed gains. Quality gains were smaller and less consistent. Lower-skill participants received the largest quality benefit. [University of Minnesota record](https://experts.umn.edu/en/publications/lawyering-in-the-age-of-artificial-intelligence/)

- A trial with 50 physicians found no significant diagnostic gain from GPT-4 access. The model alone scored higher on the vignettes. Human and AI performance did not combine automatically. [JAMA Network Open](https://doi.org/10.1001/jamanetworkopen.2024.40969)

- A trial with 776 Procter & Gamble professionals found that AI helped individuals match some human teams. It also helped people cross functional expertise boundaries. This result came from product-idea tasks, not production delivery. [Harvard Business School](https://aiinstitute.hbs.edu/the-cybernetic-teammate-how-ai-is-reshaping-collaboration-and-expertise-in-the-workplace/)

The result is a jagged frontier. AI is excellent on adjacent tasks and unreliable on some tasks that look similar. Fluency hides that boundary.

### 2. Software results vary more than popular claims imply

The strongest studies do not support one productivity number.

| Study | Context | Result | What it proves |
| --- | --- | --- | --- |
| GitHub Copilot trial | 95 developers, one fixed JavaScript task | Copilot users finished 55 percent faster | AI can speed a bounded implementation task. This was a vendor study. |
| Three Microsoft field trials | 4,867 developers across firms | Completed tasks rose 26 percent in the combined estimate | AI can raise task completion in real organizations. The metric did not capture all quality effects. |
| METR early-2025 trial | 16 experienced maintainers, 246 tasks in mature repositories | AI users took 19 percent longer | Deep repository context and review can erase generation gains. |
| METR late-2025 update | A later agent generation and a changed sample | Raw data suggested gains, but confidence intervals crossed zero | Tool capability improved, but selection and measurement blocked a firm conclusion. |
| DORA 2025 | Organization survey and delivery measures | AI adoption correlated with more individual output but lower stability and throughput | Faster code can enlarge batches and downstream work. Correlation does not prove cause. |

Sources: [GitHub trial](https://github.blog/news-insights/research/research-quantifying-github-copilots-impact-on-developer-productivity-and-happiness/), [Microsoft field trials](https://www.microsoft.com/en-us/research/publication/the-effects-of-generative-ai-on-high-skilled-work-evidence-from-three-field-experiments-with-software-developers/), [METR early-2025 trial](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/), [METR late-2025 update](https://metr.org/blog/2026-02-24-uplift-update/), and [DORA report](https://dora.dev/ai/gen-ai-report/dora-impact-of-generative-ai-in-software-development.pdf).

The differences are not noise alone. Each study measures a different system:

- A short task versus a mature repository.
- A novice versus a domain expert.
- Code output versus accepted delivery.
- A completion metric versus a quality metric.
- A suggestion tool versus an agent with tools.
- A task with cheap proof versus a task with tacit context.

The Stack Overflow 2025 survey also exposes the split. Eighty-four percent of respondents used AI or planned to use it. More respondents distrusted AI accuracy than trusted it. This is useful sentiment data, not causal evidence. [Stack Overflow survey](https://survey.stackoverflow.co/2025/ai)

### 3. Faster generation can move the bottleneck

Software delivery is a system, not a typing contest. Code creation is one step among discovery, design, review, tests, integration, deployment, and support.

DORA found a positive association with individual output, but negative associations with delivery stability and throughput. The report proposes larger change batches as one possible cause. It recommends small batches, strong tests, and fast feedback. The data are observational, so they do not prove that AI caused the change. [DORA report](https://dora.dev/ai/gen-ai-report/dora-impact-of-generative-ai-in-software-development.pdf)

Microsoft also found that AI reduced email work but did not reduce meetings. This result shows a broader pattern. Automation can remove one cost while coordination becomes the new limit. [Microsoft Research](https://www.microsoft.com/en-us/research/publication/shifting-work-patterns-with-generative-ai/)

Science offers the same lesson. A 2026 study of AlphaFold found that predicted structures did not remove experimental structure work. The tool complemented experiments and shifted research toward less-studied proteins. AI changed the work frontier and the downstream bottleneck. [NBER paper](https://www.nber.org/papers/w35143)

### 4. AI review does not equal independent proof

Models can help find defects, but they cannot certify their own output.

A broad review of model self-correction found no general success without external feedback. Self-correction worked best when the system received reliable evidence from outside the model. [Transactions of the Association for Computational Linguistics](https://aclanthology.org/2024.tacl-1.78/)

An ICLR study found that models can make their answers worse when they rely on intrinsic self-correction alone. [ICLR paper](https://proceedings.iclr.cc/paper_files/paper/2024/hash/8b4add8b0aa8749d80a34ca5d941c355-Abstract-Conference.html)

Anthropic found a related problem in long tasks. Agents often rated mediocre work too highly. A separate evaluator was also too lenient without concrete rubrics. [Anthropic harness report](https://www.anthropic.com/engineering/harness-design-long-running-apps)

Security raises the cost of false confidence. One controlled study found that participants with an AI code assistant wrote less secure code and felt more confident about it. The study used an older Codex model, so it does not measure current model quality. It still demonstrates the human-factor risk. [Research paper](https://arxiv.org/abs/2211.03622)

The rule is simple: at least one load-bearing proof source must be independent of the generator.

Examples:

- For code, use behavior tests, types, static checks, or runtime state.
- For research, read the primary source.
- For a data claim, query the source system.
- For a user interface, inspect and use the interface.
- For operations, read back the authoritative service state.
- For an organizational decision, get approval from the accountable human.

Another model can add adversarial ideas. It does not satisfy this rule by itself.

### 5. AI can reduce learning when it replaces the useful struggle

The evidence here is smaller, but the direction is consistent.

Anthropic ran a randomized study with 52 developers who learned an unfamiliar Python library. The AI group scored 50 percent on a later quiz. The hand-code group scored 67 percent. The largest gap appeared in debugging. The developers who used AI well asked conceptual questions and examined the code. [Anthropic study](https://www.anthropic.com/research/AI-assistance-coding-skills)

Bastani and colleagues studied almost 1,000 math students. A basic GPT interface raised practice performance, but students scored 17 percent lower after AI access disappeared. A tutor design with stronger guardrails reduced that harm. This result does not transfer directly to senior engineers, but it shows that interface design changes learning. [PNAS paper](https://doi.org/10.1073/pnas.2422633122)

A Microsoft and Carnegie Mellon survey covered 319 knowledge workers and 936 AI use examples. Higher confidence in AI correlated with less reported critical thought. Higher self-confidence correlated with more critical thought. This was a self-report study, so it does not prove cause. [Microsoft Research](https://www.microsoft.com/en-us/research/publication/the-impact-of-generative-ai-on-critical-thinking-self-reported-reductions-in-cognitive-effort-and-confidence-effects-from-a-survey-of-knowledge-workers/)

Buçinca and colleagues tested a useful guardrail. Participants made an initial decision before they saw the AI answer. This rule reduced overreliance on wrong advice, but participants liked the workflow less. Easy use and sound judgment can conflict. [Harvard study](https://www.eecs.harvard.edu/~kgajos/papers/2021/bucinca2021trust.shtml)

This supports a practical inference. AI can speed skills that you already own. It can weaken new skill formation if it bypasses the mental work.

### 6. Automation can leave the hardest work to the least-practiced human

Lisanne Bainbridge described this problem in 1983. Automation often leaves abnormal and difficult cases to people. At the same time, routine automation reduces the practice that prepares people for those cases. [Automatica paper](https://www.sciencedirect.com/science/article/pii/0005109883900468)

That “irony of automation” maps well to software. If an agent writes all routine code, the human still owns the novel outage, security flaw, or architectural mistake. A workflow must preserve enough practice and context for that moment.

Anthropic's internal 2025 study found a similar pattern. Employees reported AI use in 60 percent of their work, but they fully delegated only a small share. They kept high-level design, taste, and organizational context. Respondents also worried about skill depth and the difficulty of supervision. This is one company study, with self-report limits. [Anthropic report](https://www.anthropic.com/news/how-ai-is-transforming-work-at-anthropic)

## A practical delegation model

Score a task on four questions before you choose an autonomy level.

### Consequence

What happens if the output is wrong?

Consider customer harm, security, money, data loss, reputation, and recovery cost. Reversible local work has a lower consequence than a production mutation.

### Proof cost

Can you make sure that the answer is correct with cheap, independent evidence?

A compiler error, golden test, database readback, or source citation gives strong proof. Taste, organizational fit, and future maintainability have higher proof costs.

### Ambiguity

How much tacit context does the task require?

Stable requirements and known patterns favor delegation. Unclear goals, hidden constraints, and cross-team tradeoffs require human judgment.

### Learning value

Will you need this mental model for future decisions or failures?

Delegate more when the work is mechanical and the skill is already secure. Pair with AI when the task builds a core skill or enters an unfamiliar system.

Use this matrix:

| Task shape | AI role | Human role | Required proof |
| --- | --- | --- | --- |
| Low consequence, cheap proof, familiar | Execute | Review the result | One direct check and a diff |
| Low consequence, high learning value | Tutor or pair | Form the model and do key steps | Explain or reproduce without AI |
| Moderate consequence, clear contract | Execute a small batch | Define the contract and inspect the change | Acceptance tests plus human review |
| High consequence, cheap proof | Execute only in a sandbox | Control the decision and release | Predefined tests, approval, readback, and recovery plan |
| High consequence, expensive proof | Research and challenge | Lead the work and decide | Independent expert review and staged evidence |
| High ambiguity or organizational judgment | Find options and evidence | Frame, align, and choose | Stakeholder acceptance and recorded rationale |

NIST uses the same risk logic at a broader level. Controls must reflect both the chance and magnitude of harm. Human oversight also depends on context. [NIST AI Risk Management Framework](https://airc.nist.gov/airmf-resources/airmf/1-sec-risk/) and [human-AI guidance](https://airc.nist.gov/airmf-resources/airmf/appendices/app-c-ai-risk-management-and-human-ai-interaction/)

## What you can hand off

You can usually delegate these tasks when data access and policy permit them:

- Code and document search.
- Repository archaeology and dependency maps.
- Candidate explanations and solution options.
- Boilerplate and mechanical transformations.
- Small implementations with a stable contract.
- Test scaffolds and failure-case lists.
- Data cleanup with a reversible process and source totals.
- Drafts that a human will approve before publication.
- Repetitive operations in a sandbox.
- Evidence collection from named systems.

The AI output remains a candidate until it passes the task's proof gate.

## What you need to own

Retain direct ownership of these parts:

- The real problem and the user outcome.
- The non-goals and constraints.
- Domain invariants and failure boundaries.
- Security, privacy, and access decisions.
- Architecture and hard-to-reverse tradeoffs.
- The acceptance oracle, which defines a correct result.
- The evidence that supports each load-bearing claim.
- Release, rollback, and operational decisions.
- External communication and accountability.
- The final decision to accept the work.

AI can help with every item on this list. It cannot own them for you.

## How much understanding is enough

You do not need to remember every API call or write every line. You need minimum sufficient understanding for the risk that you accept.

Before you accept a meaningful change, you must answer these questions without a fresh AI explanation:

1. What problem does this change solve?
2. Why does this design fit the constraints?
3. Which interfaces, invariants, and data flows changed?
4. Which important failure modes remain?
5. What evidence proves the behavior, and what does it not prove?
6. How will you detect a runtime failure?
7. How will you recover or roll back?

If you cannot answer these questions, the work has comprehension debt. That debt matters even when every test passes.

The threshold rises with blast radius. A local script needs less context than a shared library, schema, security control, or production migration.

## Do you need layers of AI checks?

No. Use assurance in proportion to risk, and prefer independent proof over reviewer count.

### Low-risk work

Use a clear task statement, inspect the diff, and do one direct check. Extra AI review often costs more than the risk.

### Normal production code

Define acceptance criteria before implementation. Use focused behavior tests, types, lint rules, and a human review. Inspect both the change and its effect on system boundaries.

### High-risk work

Write acceptance criteria and failure tests before implementation. Use a sandbox, a staged release, an explicit recovery plan, and authoritative state readback. Add a second human when the consequence warrants it.

### Hard-to-test work

Reduce the claim or the batch size until you can inspect it. Use primary sources, examples, simulations, prototypes, or real user feedback. Do not treat model consensus as truth.

Anthropic recommends deterministic graders when they fit the task. It reserves model graders for qualities that need judgment and calibrates those graders against humans. [Anthropic eval guide](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents)

Thoughtworks makes the same distinction. Tests, types, linters, and static analysis act as cheap deterministic sensors. Model review acts as a probabilistic sensor. Neither type can repair a misunderstood goal that no human specified. [Harness engineering](https://martinfowler.com/articles/harness-engineering.html)

## Acceptance criteria without false confidence

Acceptance criteria help only when they come from the real intent and material failure modes.

Do not let one model define the requirement, write the code, and declare success without an outside oracle. That process can reproduce one misunderstanding across the whole stack.

Use this sequence:

1. State the user-visible outcome.
2. State the invariants that must remain true.
3. List the highest-cost failure modes.
4. Choose one independent proof for each critical claim.
5. Let AI add cases and implementation detail.
6. Ratify the material cases before implementation.

You do not need to predict every edge case. You need to define the failure envelope, which contains the failures that change the decision. AI can search beyond that envelope and report new risks.

## A workflow that protects delivery and technical excellence

### 1. Choose the mode

Label the task as output work or learning work.

For output work, optimize accepted delivery. For learning work, preserve the mental operations that build the skill.

### 2. Write a short human brief

Include five items:

- Problem and user outcome.
- Constraints and non-goals.
- Risk level and reversibility.
- Acceptance evidence.
- Unknowns that can change the plan.

Do not write a full solution unless the task needs one.

### 3. Use a scout for uncertainty

Ask AI to find relevant code, primary sources, options, and hidden constraints. Do not ask it to land code yet.

For an unfamiliar or high-risk topic, form an initial hypothesis before you read the AI answer. This small delay protects independent thought.

### 4. Ratify the plan

Choose the design and acceptance criteria. Reject extra scope. Split the work until one change remains easy to review and recover.

### 5. Let one agent implement a small batch

Use an isolated worktree or sandbox. Ask for the smallest change that satisfies the contract. Require direct tests and a concise account of residual risk.

### 6. Make sure that the proof is independent

Use deterministic tools, authoritative sources, or a human who did not create the answer. Use a second AI as a critic, not as the release authority.

### 7. Pass the comprehension gate

Answer the seven questions in the prior section. Trace the critical path. Reproduce one key claim without AI when the skill matters.

### 8. Deliver a small batch and inspect the result

For live systems, inspect rollout health, logs, metrics, and user behavior. A merged change or successful workflow is not runtime proof.

### 9. Turn failures into durable controls

If AI misses a repeatable rule, add a test, type, lint rule, template, or repository instruction. Do not rely on repeated prompt reminders when code can enforce the rule.

Anthropic gives similar advice for agents. Start with a simple workflow. Add autonomy only after measured improvement. Give the agent environmental feedback and clear stop conditions. [Building effective agents](https://www.anthropic.com/engineering/building-effective-agents)

## Protect learning on purpose

Use different AI behavior for a skill that you need to acquire.

- Predict the result before you ask AI.
- Ask for hints, questions, or explanations before complete code.
- Request two design options and state your choice.
- Trace one critical path yourself.
- Reconstruct a representative part without AI.
- Debug one failure before the agent fixes it.
- Explain the solution from memory after a delay.

Do not apply this tax to every line of boilerplate. Apply it to concepts that you will need during design, review, or incident response.

A useful rule is: never outsource both the execution and the lesson. If AI writes the code, you can still own the causal model. If AI supplies the model, you can write or debug a representative part.

## Parallel work without a review collapse

Parallelize exploration. Serialize commitment.

Simon Willison reports that parallel agents work well for research, code archaeology, small maintenance, and carefully specified tasks. He still reviews and lands one significant change at a time. [Simon Willison](https://simonwillison.net/2025/Oct/5/parallel-coding-agents/)

Addy Osmani describes agent output as cognitive labor for the human reviewer. He recommends tight scopes, time limits, and one fewer agent than the apparent limit. He also recommends review-quality measures instead of agent-count measures. [Addy Osmani](https://addyosmani.com/blog/cognitive-parallel-agents/)

Kief Morris places the human in the “why” loop. The human defines intent, constraints, and quality. Agents operate inside the “how” loop, with feedback from tests and tools. [Martin Fowler site](https://martinfowler.com/articles/exploring-gen-ai/humans-and-agents.html)

Kent Beck describes the workflow shift as rapid generation plus careful review. The human still needs enough understanding to validate the result. [Kent Beck](https://kentbeck.com/summaries/beyond-the-ide/)

Jesse Vincent uses separate architecture and implementation passes, small task chunks, isolated worktrees, and review between chunks. He treats AI reviews as fallible inputs. This is one practitioner's workflow, not controlled evidence. [Jesse Vincent](https://blog.fsck.com/2025/10/05/how-im-using-coding-agents-in-september-2025/)

For your workflow, a sound default is:

- One foreground outcome.
- One low-coordination background outcome, such as research or a bounded maintenance task.
- No new outcome while agent work waits for your review.
- At most two externally blocked outcomes, such as pull requests that wait for another person.
- A finished agent keeps its slot until you understand, accept, and close or park the work.

The scarce resource is not agent capacity. It is your review and context capacity.

## What to measure

Do not use lines of code, prompt count, or agent count as success measures.

Measure the full path from task selection to accepted result:

### Delivery

- Lead time from brief to accepted work.
- Review time and review queue age.
- Rework before acceptance.
- Rollbacks and escaped defects.
- Batch size.
- User or business outcome.

### Understanding

- Can you explain the design without AI?
- Can you diagnose one representative failure?
- How often must an agent explain its work again?
- How much accepted work still carries comprehension debt?

### Learning

- Can you complete a later related task with less help?
- Can you reconstruct the key idea after a delay?
- Did AI remove repetition or remove the concept itself?

### AI process

- First-pass acceptance rate.
- False alarms from AI review.
- Defects found by deterministic checks versus humans versus AI.
- Review minutes saved or added.

## A 30-day experiment

Use this as a test, not as a permanent doctrine.

1. Limit active work to one foreground outcome and one low-coordination background outcome.
2. Classify each task by consequence, proof cost, ambiguity, and learning value.
3. Record the selected AI role: execute, pair, tutor, scout, or critic.
4. Record review time, rework, escaped defects, and accepted lead time.
5. Use the seven-question comprehension gate for meaningful changes.
6. Reconstruct one core idea without AI each week.
7. Review the log after 30 days and move only the boundaries that the evidence supports.

The experiment can answer your real question. It tests where AI raises accepted output without a decline in judgment, comprehension, or recovery skill.

## Evidence limits

The evidence base changes fast. Results from one model generation can age within months.

Many studies use short tasks, self-reported gains, vendor data, or narrow samples. Long-term evidence about maintainability, incident response, expertise, and organizational quality remains thin. The [OECD review](https://www.oecd.org/en/publications/the-effects-of-generative-ai-on-productivity-innovation-and-entrepreneurship_b21df222-en.html) reaches the same broad conclusion: effects depend on the task and user, while long-term business and skill effects need more evidence.

The survey excludes one prominent materials-science productivity claim. MIT reported that it had no confidence in the data provenance, reliability, or validity, and it requested withdrawal. This case also shows why a polished paper cannot replace source validation. [MIT statement](https://shapingwork.mit.edu/news/assuring-an-accurate-research-record/)

## Final rule

Use AI wherever it lowers the cost of generation, search, or execution. Keep human control wherever the work defines intent, accepts risk, or establishes truth.

That boundary gives you speed without borrowed confidence. It also preserves the mental models that you need when the system fails in a new way.

🤖 Generated with Codex
