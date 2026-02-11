# Sourcegraph CLI
Sourcegraph has a CLI. It is installable via `brew install sourcegraph/src-cli/src-cli`, then all I had to do was go into my settings and configure a token and endpoint. This is very useful for allowing Claude Code to search Bitbucket repos, since my current company doesn't have e BB CLI tool, and at the time of writing, BB doesn't vend an MCP server.

The combination of Sourcegraph CLI (`src`), `gh` for reading Github repos, `aws` for interacting with AWS resources, and a Grafana MCP service with access to Tempo, Loki, and Mimir has been very useful for debugging and service audits.

