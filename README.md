# Australian Property & Market Cycle Tracker

Private starter repository for building a personal property portfolio dashboard. The full implementation brief is in [`BUILD_PROMPT.md`](BUILD_PROMPT.md).

## Use the same project with Codex, Claude Code, or Manus

1. Clone or open this repository in the tool you want to use.
2. Ask the agent to read `README.md`, `BUILD_PROMPT.md`, and the platform notes (`AGENTS.md`, `CLAUDE.md`, or `MANUS.md`).
3. Paste the full contents of `BUILD_PROMPT.md` as the build request, or say: “Implement the requirements in `BUILD_PROMPT.md` in this repository.”
4. Have the agent commit changes to this repository. Keep the repository private because it is intended to manage personal property addresses and valuations.
5. Configure licensed property-data credentials and hosting secrets only in the chosen host's secret manager. Do not commit addresses, real portfolio values, API keys, or `.env` files.

The GitHub repo stores the shared source and brief. The app still needs to be implemented, connected to a secure database and data providers, and deployed before it can be used as a live tracker.

## Data integrity

Property clocks are transparent estimates, not official forecasts. Address-level prices must come from user-entered snapshots or a licensed provider. Macroeconomic series should show the official source, reference period, and release date.
