```markdown
# Automated & Secure Backup Project

This project implements a complete, secure, and containerized backup strategy, meeting the requirements of modern system architecture.

## Statement & Objectives (The Original "Recipe")

The objective was to set up a simple backup/restore strategy using standard Linux tools:
* **Cron**: Task scheduling.
* **Rsync / SSH**: Secure synchronization.
* **GPG**: Backup encryption.
* **Tar**: Compression.
* **Bash**: Automation scripting.

## Solution Architecture

We have industrialized this "recipe" by using **Docker** to simulate a real infrastructure composed of 3 independent machines.

![Backup Architecture](backup.png)

### Components
1. **Backup Server (Rsnapshot)**: The orchestrator. It initiates the connection (Pull), retrieves archives, and manages history (snapshot rotation).
2. **Client Servers (Server1 & Server2)**: Data sources. They execute a local script to compress and encrypt data before sending.
3. **Localhost (Host)**: The administrator machine, used to manage keys, store persistent volumes, and perform manual restorations.

---

## Installation and Startup

### 1. Prerequisites
* Docker & Docker Compose installed.
* SSH and GPG keys generated (provided in the `config` folder for this project).

### 2. Startup
The environment is pre-configured. Data folders (`files`, `inbox`, `restore`) are automatically initialized.

```bash
# Start the infrastructure
docker compose up -d --build

```

```

```
