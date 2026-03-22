## Vector DB Use Case
A regular keyword-based search would simply not work well enough for searching through large legal contracts using natural language. The reason is straightforward — keyword search only looks for exact word matches. It has no understanding of meaning or context. So if a lawyer searches for "termination clauses", the system might completely miss relevant sections that say the same thing differently, like "contract cancellation conditions" or "agreement ending terms". Same meaning, different words — and keyword search can't bridge that gap.

Vector databases work in a smarter way. They convert text into something called embeddings — basically numerical representations that capture the meaning behind the words, not just the words themselves. So when a lawyer types a question in plain English, that query gets converted into an embedding, and the system then compares it against the embeddings of all the contract sections to find the ones that are most similar in meaning — even if the exact words don't match.

This makes a huge difference in practice. A lawyer reviewing a 500-page contract doesn't have to guess the right keywords or manually scan through hundreds of pages.

They can just ask a natural question and get back the sections that are actually relevant, regardless of how they were worded in the original document.

In short, vector databases bring real understanding to search — and for something as detail-heavy and language-dense as legal contracts, that's not just a nice feature, it's a necessity.
