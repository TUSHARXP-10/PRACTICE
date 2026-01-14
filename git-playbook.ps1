# Navigate to the git-playbook-practice directory
Set-Location -Path "git-playbook-practice"

Write-Output "=== CURRENT STATUS ==="
git --no-pager status

Write-Output "\n=== 1. CHECKOUT FEATURE/DATA-FETCHER BRANCH ==="
git --no-pager checkout feature/data-fetcher

Write-Output "\n=== 2. CREATE SLOPPY COMMIT 1 ==="
@"
def fetch_market_data(symbol):
    return []
"@ | Out-File -FilePath "data_fetcher.py" -Encoding utf8

git add data_fetcher.py
git --no-pager commit -m "sloppy commit 1"

Write-Output "\n=== 3. CREATE SLOPPY COMMIT 2 ==="
@"
def fetch_market_data(symbol, interval='1d'):
    return []
"@ | Out-File -FilePath "data_fetcher.py" -Encoding utf8

git add data_fetcher.py
git --no-pager commit -m "sloppy commit 2"

Write-Output "\n=== 4. CREATE SLOPPY COMMIT 3 ==="
@"
def fetch_market_data(symbol, interval='1d'):
    # Fetch from API
    return []
"@ | Out-File -FilePath "data_fetcher.py" -Encoding utf8

git add data_fetcher.py
git --no-pager commit -m "sloppy commit 3"

Write-Output "\n=== 5. SQUASH COMMITS USING REBASE -I ==="
# First, check the current log
git --no-pager log --oneline --graph --all

# Now perform rebase to squash the last 3 commits
git --no-pager rebase -i HEAD~3

Write-Output "\n=== 6. HOTFIX CONTEXT SWITCH ==="
# Switch to main and create hotfix branch
git --no-pager checkout main
git --no-pager checkout -b hotfix/bug/RSI-div0

# Create a fix for RSI divide-by-zero
git --no-pager status
@"
def calculate_rsi(prices, period=14):
    # Calculate RSI indicator
    if len(prices) < period:
        return 50  # Default value if not enough data
    gains = []
    losses = []
"@ | Out-File -FilePath "trading_engine.py" -Encoding utf8

git add trading_engine.py
git --no-pager commit -m "fix: prevent RSI divide-by-zero error"

# Switch back to feature branch
git --no-pager checkout feature/data-fetcher

Write-Output "\n=== 7. SETUP HUSKY HOOKS ==="
npm init -y
npm i husky lint-staged commitlint @commitlint/config-conventional
npx husky init
Set-Content -Path ".husky/pre-commit" -Value "npx lint-staged"

Write-Output "\n=== FINAL GIT LOG ==="
git --no-pager log --oneline --graph --all
