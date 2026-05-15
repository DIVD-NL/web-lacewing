---
title: Project Harbormaster (OSINT Victim Discovery)
status: proposed
start_date: 
description: >
  Automated discovery of security and disclosure contact channels for internet-facing systems and applications, enabling faster and more scalable coordinated vulnerability disclosure (CVD) operations.
---

## The problem
Large-scale investigations involving platforms such as Salesforce Experience Cloud and Mendix often produce thousands of potentially affected organisations. Identifying exposures is increasingly automated — contacting the right organisation is not.

Many organisations still lack:
- security.txt
- Responsible disclosure policies
- Dedicated security contact channels

Researchers therefore spend significant time manually searching for privacy contacts, legal notices, support channels, WHOIS data, and organisational ownership information before a responsible disclosure can even begin.

At internet scale, victim discovery and contact intelligence become one of the primary bottlenecks in defensive vulnerability research.

## What we will do
This sub-project develops AI-assisted tooling to automatically discover and enrich disclosure-related information for internet-facing assets and applications.

The platform will:
- Discover and parse security.txt files across common locations and variations.
- Crawl privacy, legal, support, and responsible disclosure pages to identify relevant contact information.
- Extract and classify email addresses, phone numbers, and disclosure channels based on confidence and relevance.
- Correlate organisations using WHOIS, TLS metadata, ASN ownership, favicons, and public web metadata.
- Prioritise targets based on exposure type, organisation profile, and likelihood of active compromise or data exposure.
- Prepare disclosure-ready notification drafts to accelerate coordinated vulnerability disclosure workflows.

AI enables large-scale contextual analysis — identifying not only contact information, but determining whether a contact is likely suitable for security notifications.

## How we disclose
All findings follow DIVD's responsible disclosure policy. The platform assists researchers by identifying likely disclosure channels and preparing notification-ready output, but human validation remains part of the disclosure process.

No collected information is publicly exposed or redistributed beyond what is necessary for responsible notification and remediation support.

## What we need
- **AI capacity**, compute and token resources for large-scale enrichment and classification.
- Volunteers with experience in OSINT, web crawling, CVD workflows, or internet-scale scanning.
- Partner organisations willing to help validate disclosure workflows and improve responsible contact discovery practices.
- Organisations interested in implementing or improving security.txt and coordinated vulnerability disclosure processes.

[Get involved →](mailto:lacewing@divd.nl?subject=Misconfiguration+Research)
