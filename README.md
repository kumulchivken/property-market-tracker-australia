# Property & Market Cycle Tracker

An authenticated, mobile-friendly dashboard for property values and market-cycle notes. Add properties worldwide using country, region/state/province, locality/city, and currency. The public repo contains source only; portfolio records remain private.

## Features
- Add, edit, archive, restore, export properties, and record dated value snapshots.
- Filter property cards, totals, and chart choices by country, region, and locality.
- Store currency per property; Australian ABS and RBA indicators are identified as Australia-only.
- Compare nominal and CPI-adjusted indexed values when data is available.
- Show regional clocks as “Insufficient data” until you add a dated, evidenced manual phase.

## Privacy
Protect the Worker with Cloudflare Access before entering personal property details. The Worker scopes every database query to the authenticated Access email. Do not commit portfolio exports, addresses, values, or credentials to this public repository.

## Use
1. Sign in to the owner-only site.
2. Add properties and their location details.
3. Add dated property value snapshots; two snapshots are needed for a value history chart. Snapshots support user estimates, verified public-listing asking prices, manually transcribed property.com.au estimates, bank valuations, licensed-provider estimates, and sale results. Optional HTTPS source URLs are retained in the snapshot notes.
4. Use Run now for official macro feeds. It reports that address-level property prices were not fetched when no authorized provider is configured.
5. Export your portfolio data whenever needed.

## Data limits
ABS and RBA data currently cover Australia only. No address-level property valuation feed is configured. property.com.au publishes PropTrack-derived estimates, but its [terms](https://www.property.com.au/legal/) prohibit automated retrieval/scraping and use of its content to build a property-data product. Do not automate access without written authorization and a suitable license. For now, manually enter the estimate and source URL. Elsewhere, enter a verified public listing's asking price as an asking price (not as a valuation), or use a manual estimate. Existing dated value records are retained across refreshes and when a property is archived; snapshots are appended only when a new value is actually supplied.

## Cloudflare deployment
Requires Node.js 20+. The repo includes wrangler.jsonc for the property-market-tracker Worker and dedicated D1 database. For local deployment run npm install, npm run build, npm run db:migrate:remote, and npm run deploy. To deploy from GitHub, connect this repository in Workers & Pages → Create → Connect to Git, select main, and set build command to npm run build. Apply D1 migrations before first use, and protect the Worker with Cloudflare Access allowing only your email.

Default URL: https://property-market-tracker.<your-workers-subdomain>.workers.dev. A custom domain can be attached later in Worker settings.
