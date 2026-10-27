# Team decisions

A plain record of the stances this room has taken, and why. **The review does not read this file**; the rules in `custom/knowledge/` are what the review applies. This page is for people: what we decided, who decided, and where the rule lives.

| Date | Card | Side | Decision (one sentence) | Rule file | Who |
|---|---|---|---|---|---|
| 2026-10-28 | `performance/01-long-lock-user-action` | A | User-triggered actions don't take table-wide locks on tables users write to all day. | `custom/knowledge/performance/no-table-locks-in-user-actions.md` | Example entry |
| 2026-10-27 | — | — | Gli oggetti AL devono avere sempre il prefisso `NBT` nel nome. | — | — |
| 2026-10-27 | — | — | Le etichette visibili all'utente devono essere sempre in italiano. | — | — |
| 2026-10-27 | — | — | I campi di tipo `Text` non possono superare 100 caratteri (`Text[100]`). | — | — |

## How to add a decision

1. Pick a card, pick a side, write one sentence of why.
2. Ask your agent to "Write our rule": it creates the rule file.
3. The facilitator adds a row here when your PR is merged. (Room PRs may only touch `custom/knowledge/` and `workshop/reviews/`, so don't edit this file in your PR.)
