# Concord Unrestricted

**Concord Unrestricted** is an unofficial fork of **Concord**.

The goal of this fork is to stay as close to the upstream project as possible while removing a small number of client-side restrictions that are considered non-essential.

## Removed restrictions

Currently, this fork removes the following limitations:

* The restriction that prevents sending the first messages in a direct message conversation until at least five messages have been sent from the official Discord client.
* The restriction that prevents sending the first message in a newly created or otherwise empty channel before using the official Discord client.

## Demo
<image src=docs/demo.png />

## Why?

The original project intentionally implements these restrictions, most likely to reduce the risk of triggering Discord's anti-abuse systems.

I do not know whether these restrictions provide any practical benefit today. This fork simply removes them and leaves that decision to the user.

## Compatibility

This project aims to remain as close to upstream as possible. Aside from the removed restrictions, its behavior should match the original Concord project.
