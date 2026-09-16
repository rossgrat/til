# AI Workflows

I'll seek to answer the questions below in this document.

Q: Where does AI fit into engineering workflows, such that rigor and correctness is maintained, and the implementing engineer still comes away with knowledge gained?


## Summary of Landscape Report
- AI is good at generation
  - **Generation** – The production of candidate work
  - Examples: Code, draft, plan, possible explanations
- The engineer must retain intent, judgement, and proof
  - **Intent** – Knowing what you want to accomplish, and what constraints matter. Intent is different from a solution, and should capture the underlying or real problem
  - **Judgement** – Choosing between plausible options and accepting tradeoffs. This requires enough understanding to addess reasoning and accept or reject a generation
  - **Proof** – Evidence that supports accepting some result
- There are roughly four dimensions that you can score a task in to determine an autonomy level
  - **Consequence** – What happens if the output is wrong?
  - **Proof Cost** – How easy is it to verify the answer is correct?
  - **Ambiguity** – How much tacit context (context that is unspoken, unwritten, or gained through personal experience, intuition or practice) does a problem require?
  - **Learning Value** – Will you need this mental model for future decisions or failures?
- In a combination of one or more high consequence, high proof cost, or high ambiguity, recorded evidence and rationale becomes important in defending decisions

### Evidence from research
 - AI creates gains on some bounded tasks
 - Software results vary and depend on differences such as:
   - Short task vs. mature repository
   - Novice vs. domain expert
   - Code output vs. accepted delivery
   - Completion metric vs. quality metric
   - Suggestion tool vs. agent with tools
   - Task with cheap proof vs. task with tacit context
 - Generative AI has positive associations with individual output, but negative associations with delivery stability and throughput
   - Recommends small batch changes, strong tests, and fast feedback
 - AI review does not equal independent proof
   - Models can make answers worse when relying on intrinsic self-correction
   - Self-correction works best with external feedback
   - Recommend that at least one load-bearing proof source be independent of the generator
   - Examples:
     - Code – Use behavior tests, types, static checks, runtime state
     - Research – Read primary source
     - Data – Query source
     - User Interface – Use the interface
 - AI reduces learning when it replaces useful struggle

## Summary of Oxide LLM Usage


## Sources
- AI Landscape Report
- [Oxide LLM Usage](https://rfd.shared.oxide.computer/rfd/0576)
- [OpenAI Software Factory](https://newsletter.pragmaticengineer.com/p/openai-software-factory)
