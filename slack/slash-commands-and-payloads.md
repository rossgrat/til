# Slash commands and payloads

Slash commands must be sent from the Slack client. Agent MCPs or project Oauth tokens and the Slack API will not send slash commands.

When a slash command is sent via a Slack client, it calls the undocumented endpoint at `https://fetch.enterprise.slack.com/api/chat.command`, and uses a browser session token to validate the command. The browser session token has full access to perform actions as a user. Slack's ToS requires uses APIs as documented, and not in a manner that circumvents rate limits or other restrictions.
