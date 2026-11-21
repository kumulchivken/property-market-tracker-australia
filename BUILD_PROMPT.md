# Build brief: Australian Property & Market Cycle Tracker

Act as a senior full-stack engineer and product designer. Work in the existing private GitHub repository `kumulchivken/property-market-tracker-australia`; do not create a second repository. Build a secure, responsive website that lets me track residential properties I choose, refresh property and economic data when I want, and review regional property-market cycle indicators. Do not deploy publicly or expose my property addresses.

## Main user flow

- Persist my portfolio and valuation history across sessions and devices using an authenticated backend database.
- Each time I manually run **Refresh / Run update**, first ask: **“Do you have any properties to add?”** If yes, let me add one or more before starting the refresh. If no, proceed immediately.
- Provide visible **Add property**, **Edit**, **Archive/remove**, and **Restore** controls on the website. Confirm before permanently deleting a property or its history; default removal should archive it and preserve history.
- For each property, collect a nickname, full address, property type, suburb, state, postcode, starting value, value date, value source, and optional notes. Let me edit these later. Detect likely duplicates and never create a property or value without my confirmation.
- Show property snapshots with amount, date, source, and whether the value is a user entry, sale result, licensed data-provider value, or model estimate.
- Never invent address-level property values. Use manually entered values unless I configure a legitimate licensed valuation/data API. Do not scrape property portals or bypass access controls. Build a provider adapter so a licensed source can be added later; store API credentials only as server-side secrets.
- If no current value is available from a configured source, clearly mark it stale and offer a manual value-entry flow. Do not imply a value was refreshed when it was not.

## Refresh and scheduling

- Include **Run now** and a visible last-refreshed timestamp.
- Let me configure, pause, and resume an optional automatic refresh schedule. Do not assume a cadence; make it a user-selected setting. Manual refresh must always remain available.
- On each run, collect any new properties first, then fetch the latest available official macroeconomic data and any configured licensed property data, validate it, save dated snapshots, and show a concise run summary with successes, stale sources, and errors.
- Protect against duplicate snapshots and partial failures. Keep previous valid data if a source is unavailable.

## Charts and indicators

- Show a separate historical value chart for each property, with nominal value and CPI-adjusted value. Let me choose the comparison period.
- Show a macro chart for Australian CPI inflation, the RBA cash rate target, and the ABS unemployment rate, each with its own units and publication period.
- Provide an optional indexed comparison view (each series rebased to 100 at a selected date) so unlike units are not misleadingly plotted on one raw numeric axis. Label all series, units, date ranges, source links, and missing intervals.
- Display the latest available value, reference period, release date, source, and retrieval time. The data may be current to the latest official release rather than real-time; show that distinction plainly.
- Use primary official sources by default: ABS CPI and key indicators / Labour Force releases, and the RBA cash-rate target history. Keep source URLs and reference periods alongside stored observations.

## Property-cycle clocks

Create four separate clock dials for **Moreton Bay District**, **Greater Brisbane**, **Queensland**, and **Australia**. Each dial needs a clear hand position, phase label, direction of movement, data as-of date, confidence/data-coverage indicator, and a “Why this position?” panel listing the evidence and sources.

Property clocks are not a single official government statistic and methodologies differ. Therefore:

- Label the dials **Tracker’s market-cycle estimate**, never an official forecast or guaranteed timing signal.
- Publish the phase definitions and the rule used to position each hand. Use this consistent convention: 6 o’clock = trough; 6–9 = recovery; 9–12 = upswing; 12 = peak; 12–3 = downturn; 3–6 = stagnation. Show the phase band and hand clearly.
- Base the estimate on verified available regional indicators such as dwelling-price momentum, sales activity, rental conditions/vacancy, listings or stock, days on market, new supply, and population/jobs. Weight indicators transparently and show the latest period for each. Do not silently substitute national data for a regional series.
- If evidence is missing, stale, or too thin for a defensible classification, label the dial **Insufficient data** or **Low confidence** instead of guessing. Allow a user-entered/manual phase override only if it is visibly marked as manual, dated, and reversible.
- Preserve historic monthly clock positions so the dial movement can be reviewed over time.

## Privacy and security

- Make the GitHub repository private and the website access-controlled by default. Do not make either public without my explicit request.
- Treat full street addresses and portfolio values as sensitive. Minimize collection, encrypt transport, enforce authenticated access, and do not include addresses or values in analytics, public URLs, client error logs, or source-control fixtures.
- Keep secrets in the hosting provider’s secret manager, never in the repository or browser bundle. Include `.env.example` with names only and a clear setup guide.
- Provide export and delete controls for my portfolio data.

## Design and delivery

- Build a clean, mobile-friendly dashboard with an accessible, readable chart legend and clear data freshness labels.
- Include portfolio overview, property detail/history, macro indicators, four regional clocks, data sources, and settings/schedule sections.
- Use an appropriate lightweight chart library and test keyboard/touch interactions.
- Add a README with setup, data-provider configuration, privacy model, refresh behavior, schedule setup, and deployment instructions.
- Add safe sample data only if it is clearly labeled as fictional; never mix it with my portfolio.
- Commit the implementation to this existing private repository and configure a private, access-controlled deployment when hosting credentials are available. Return the repository and live-site URLs. If GitHub access, licensed property data, or hosting credentials are unavailable, explain the exact missing access and complete all work possible without fabricating values or credentials.

## Acceptance checks

1. A refresh run always asks whether I want to add properties before fetching data.
2. I can add, edit, archive/remove, restore, and export properties from the website.
3. Each value has a date, source, and status; stale/unavailable data is explicit.
4. ABS and RBA values show official publication periods and source links.
5. Property values and macro rates are not compared on an unlabeled shared raw axis.
6. Four clock dials use the stated orientation, show reasons and confidence, and refuse to guess when data are inadequate.
7. Portfolio data is private, persisted, and absent from public source files and logs.
8. Manual refresh works even when no automatic schedule is configured.
