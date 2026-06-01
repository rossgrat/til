# Slash commands and payloads

Slash commands must be sent from the Slack client. Agent MCPs or project Oauth tokens and the Slack API will not send slash commands.

When a slash command is sent via a Slack client, it calls the undocumented endpoint at `https://fetch.enterprise.slack.com/api/chat.command`, and uses a browser session token to validate the command. The browser session token has full access to perform actions as a user.

## Request shape

`POST /api/chat.command` as `multipart/form-data`. Auth is two halves: `token` (the `xoxc-…` session token) in the body **and** `Cookie: d=<…>` in the header — the `xoxc` token is useless without its matching `d` cookie. Core fields: `command` + `disp` (e.g. `/github`), `channel` (a channel ID), `blocks` (args wrapped in rich-text JSON), `team_id`. The rest (`client_token`, `_x_*`) are client telemetry, not durable.

Secrets live in the browser:

- xoxc token: DevTools → Console → `JSON.parse(localStorage.localConfig_v2).teams[<team_id>].token`
- d cookie: DevTools → Application → Cookies → row `d`

Signing out rotates and invalidates both.

## ToS note

Slack's [API ToS](https://slack.com/terms-of-service/api) requires using the APIs "only in accordance with this Contract and the Slack API documentation." `chat.command` is undocumented, so driving it with a browser session token is not a documented use and is fairly read as a ToS violation. Slack also states undocumented methods "may change at any time" — so independent of ToS, the endpoint can break without notice.
