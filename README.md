# Australian Property & Market Cycle Tracker

Public source code for an authenticated Australian property portfolio and market indicators dashboard. The app stores property details in an account-scoped D1 database; do not commit personal data or portfolio exports.

## Current app source

- [Download source archive](property-market-tracker-source.zip)
- [Browse the dashboard source](https://github.com/kumulchivken/property-market-tracker-australia/tree/main/public)
- [Browse the authenticated Worker](https://github.com/kumulchivken/property-market-tracker-australia/tree/main/worker)
- The archive contains the responsive dashboard, Worker, D1 migration, build script, hosting manifest, and setup guide.

## Features

- Add, edit, archive, restore, export properties, and record dated values.
- Scope private portfolio details to the signed-in account in D1.
- Compare nominal property values with CPI-adjusted indexed history.
- Refresh official ABS CPI / unemployment data and RBA cash-rate history.
- Show four regional market-cycle dials as “Insufficient data” until evidence or a dated manual note is entered.
- Choose off, daily, or weekly macro refresh while the dashboard remains open. No unattended schedule is enabled.

Property valuations are manual unless a licensed provider is configured. No real portfolio data, addresses, or provider credentials are included in source control.

## Build and hosting

Requires Node.js 20+. Extract the archive and run `node scripts/build.mjs`. The generated Worker is `dist/server/index.js`.

The current dashboard requires a Worker, D1, and an authenticated-user identity from its hosting platform. GitHub Pages only serves static files, so it will not provide the API routes or authentication required by this dashboard. Making this repository public does not make the owner-only Site public.

Do not disable authentication on the personal dashboard. A public-facing version must be a separate public-safe view that cannot read or write personal portfolio records. Sites deployment is pending because the Sites source Git host was not resolving from the build environment.

## Official data sources

- [ABS Data API](https://data.api.abs.gov.au/rest/)
- [ABS CPI](https://www.abs.gov.au/statistics/economy/price-indexes-and-inflation/consumer-price-index-australia)
- [ABS Labour Force](https://www.abs.gov.au/statistics/labour/employment-and-unemployment/labour-force-australia)
- [RBA Cash Rate Target](https://www.rba.gov.au/statistics/cash-rate/)
