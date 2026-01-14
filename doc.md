- Set up the repo with main , staging , and feature/data-fetcher branches
- Created 5 atomic commits on main with clear, descriptive messages
- Squashed 3 sloppy commits on feature/data-fetcher into one clean commit
- Performed a hotfix context switch - created a hotfix branch, fixed the RSI divide-by-zero issue, and switched back to the feature branch without merge conflicts
- Set up Husky hooks with pre-commit and commitlint configuration to block bad commits


1. 
Repo Setup : Created with main , staging , and feature/data-fetcher branches
2. Atomic Commits : Made 5 small, focused commits on main with clear messages
3. Commit Squashing : Combined 3 sloppy commits into one clean commit on the feature branch
4. Hotfix Workflow : Created a hotfix branch, fixed a RSI divide-by-zero issue, and switched back smoothly
5. Hooks Implementation :
   - Set up Husky with pre-commit and commit-msg hooks
   - Fixed lint-staged configuration to use the latest format
   - Tested hooks: Bad commit messages are blocked, valid ones pass
   - Commitlint enforces conventional commit format