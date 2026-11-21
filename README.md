# Property & Market Cycle Tracker

An authenticated, mobile-friendly dashboard for dated property-value snapshots, official macro indicators, and transparent market-cycle notes. Countries, regions/states/provinces, localities/cities, and ISO currency are user-entered so the portfolio can track locations worldwide. The source code is public; portfolio records remain private in the authenticated backend.

## What it does

- Saves properties, dated value history, macro observations, and manual cycle notes in per-user D1 records.
- Asks whether you want to add properties before each manual refresh.
- Uses user-entered valuations by default; no portal scraping or invented address-level estimates.
- Shows nominal and CPI-adjusted indexed property history once at least two snapshots and CPI observations exist.
- Retrieves CPI and unemployment from the ABS Data API and cash-rate history from the RBA Cash Rate Target page.
- Shows an “Insufficient data” regional clock unless you add a dated, evidenced manual phase override.
- Filters property cards, totals, and chart choices by country, region, and locality.
- Stores country, region, locality, and currency per property; Australian ABS/RBA series remain clearly identified as Australia-only.
- Supports add/edit/archive/restore and JSON export. Archive preserves history.

## Privacy

The current Site is owner-only. The Worker requires the Sites authenticated-user identity header for every API call and scopes every database query to that identity. Full addresses and valuations do not appear in URLs, analytics, sample fixtures, or client logs. Transport is HTTPS. The public repository contains source only; do not commit portfolio exports, addresses, values, or credentials. No property provider credentials are configured.

## Use

1. Open the owner-only Site while signed into the account that owns it.
2. Add a property and its location details.
3. Use **Add value** to enter a dated snapshot and record its source.
4. Choose a property in **Value history**; two or more dated values are required for a chart.
5. Use **Run now** to refresh the official macro feeds. The prompt asks whether to add properties first. Address-level values are not automatically refreshed.
6. Export your own data from **Export data**.
7. Use **Set manual phase** only when you have local evidence to cite. This stays visibly marked as a manual override.

## Refresh behavior and data limits

The ABS CPI Data API and Labour Force series have publication delays. Their observation period is not necessarily the release date; the UI displays the recorded period and release date separately. If an official feed fails or changes structure, the refresh reports the issue and leaves prior observations intact. No periodic schedule is enabled. Automatic refresh should only be configured with an unattended identity and a cadence you choose.

## Sources

- ABS Data API: https://data.api.abs.gov.au/rest/
- ABS CPI: https://www.abs.gov.au/statistics/economy/price-indexes-and-inflation/consumer-price-index-australia
- ABS Labour Force: https://www.abs.gov.au/statistics/labour/employment-and-unemployment/labour-force-australia
- RBA Cash Rate Target: https://www.rba.gov.au/statistics/cash-rate/

## Build and deploy on Cloudflare

Requires Node.js 20+. `npm run build` outputs `dist/server/index.js`. The repo includes `wrangler.jsonc` for the `property-market-tracker` Worker and its dedicated D1 database. For a local deploy, run `npm install`, `npm run db:migrate:remote`, then `grapiler configuration provides the Worker entrypoint and D1 binding. Apply D1 migrations before the first live use. After deployment, protect the Worker with Cloudflare Access and allow only your email. The Worker scopes records to the authenticated Access email. Never disable authentication for the personal portfolio.

The default Cloudflare address is `https://property-market-tracker.<your-workers-subdomain>.workers.dev`. A custom domain can be attached later from the Worker’s Settings.

## Public source and public deployment

The repository is public at the owner's request. This does not make the portfolio public. Cloudflare Access must protect the Worker before personal addresses and valuations are entered. A public-facing version would need a separate public-safe mode that cannot access personal portfolio records.

## Licensed property-data adapter

No valuation feed is configured. Add any licensed provider only after establishing its contract and API; credentials must be stored as hosting secrets, never committed or exposed in the browser bundle.
# Property & Market Cycle Tracker

An authenticated, mobile-friendly dashboard for property values and market-cycle notes. You can organize properties worldwide by country, region/state/province, locality/city, and ISO currency. The public repository contains source only; portfolio records remain private.

## Features

- Add, edit, archive, restore, export properties, and record dated value snapshots.
- Filter your saved properties, totals, and chart choices by country, region, and locality.
- Record each property's currency. Australian ABS and RBA indicators are clearly labeled Australia-only.
- Compare nominal and CPI-adjusted indexed value history when sufficient data exists.
- See “Insufficient data” for regional property-cycle clocks until you add a dated, evidenced manual phase.
- Refresh ABS inflation and unemployment data and RBA cash-rate history.

## Privacy

Protect the Worker with Cloudflare Access before entering personal property details. The Worker scopes records to the authenticated Access email. Do not commit portfolio exports, addresses, values, or credentials to this public repository.

## Use

1. Sign in to the owner-only site.
2. Add properties with their country, region, locality, currency, and address.
3. Add dated property value snapshots. Two snapshots are needed for a value history chart.
4. Use Run now for official macro feeds. Property-level valuations are not automatically refreshed.
5. Export your private records whenever needed.

## Data limits

ABS and RBA indicators currently cover Australia only. Property values are user-entered; no valuation provider is configured. Regional cycle assessments are shown as insufficient unless you add a dated manual assessment with its evidence.

## Cloudflare deployment

Requires Node.js 20+. The repository includes wrangler.jsonc for the property-market-tracker Worker and a dedicated D1 database. Run npm install, npm run build, npm run db:migrate:remote, then npm run deploy for a local deployment. Or connect this repository from Workers & Pages → Create → Connect to Git and set the build command to npm run build. Apply D1 migrations before first use. Protect the Worker with Cloudflare Access and allow only your email.

The default address is https://property-market-tracker.<your-workers-subdomain>.workers.dev. A custom domain can be attached later in the Worker settings.
