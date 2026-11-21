# Australian Property & Market Cycle Tracker

Private dashboard project for dated property valuations, official Australian economic indicators, and transparent regional property-cycle notes.

## Current app source

- [Download the complete source and build artifact](property-market-tracker-source.zip).
- The authenticated Worker source is also available under [worker/](tree/main/worker).
- The archive contains the D1 schema migration, responsive dashboard, build script, hosting manifest, and setup guide.

## Features

- Add, edit, archive, restore, export properties, and record dated values.
- Keep private property details scoped to the signed-in account in D1.
- Compare nominal property values with CPI-adjusted indexed history.
- Refresh official ABS CPI / unemployment data and RBA cash-rate history.
- View four regional cycle dials; these remain “Insufficient data” until backed by evidence or a dated manual note.
- Choose off, daily, or weekly macro refresh while the dashboard is open. No unattended cadence is enabled.

Property values are manual unless a licensed provider is configured. No real portfolio data or addresses are included in source control.

## Build

Requires Node.js 20+. Extract the source archive and run `node scripts/build.mjs`. The generated Worker is in `dist/server/index.js`. Configure the private Sites project in `.openai/hosting.json` and deploy through the authenticated Sites hosting workflow. Keep the repository private.

## Data sources

- [ABS Data API](https://data.api.abs.gov.au/rest/)
- [ABS CPI](https://www.abs.gov.au/statistics/economy/price-indexes-and-inflation/consumer-price-index-australia)
- [ABS Labour Force](https://www.abs.gov.au/statistics/labour/employment-and-unemployment/labour-force-australia)
- [RBA Cash Rate Target](https://www.rba.gov.au/statistics/cash-rate/)

This app source has been committed to the private repository. Hosting deployment is pending because the Sites source Git host is not resolving from the current build environment.
