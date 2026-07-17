# Day 4 – Azure Monitor Analytics & Alerting

## Objective

Implemented Azure Monitor analytics and alerting using Terraform to monitor virtual machines and receive proactive notifications.

---

## Components Implemented

- Azure Monitor Action Group
- Linux VM CPU Alert
- Windows VM CPU Alert
- Log Analytics Workspace
- Azure Monitor Agent
- Data Collection Rule

---

## KQL Queries

### CPU Usage

```kusto
Perf
| where ObjectName == "Processor"
| where CounterName == "% Processor Time"
| summarize AvgCPU = avg(CounterValue) by Computer, bin(TimeGenerated, 5m)
| order by TimeGenerated desc
```

### Memory Usage

```kusto
Perf
| where ObjectName == "Memory"
| where CounterName == "Available MBytes"
| summarize AvgAvailableMB = avg(CounterValue) by Computer, bin(TimeGenerated, 5m)
| order by TimeGenerated desc
```

### Disk Usage

```kusto
Perf
| where ObjectName == "LogicalDisk"
| where CounterName == "% Free Space"
| summarize AvgFreeSpace = avg(CounterValue) by Computer, InstanceName, bin(TimeGenerated, 5m)
| order by TimeGenerated desc
```

### Heartbeat

```kusto
Heartbeat
| summarize LastHeartbeat = max(TimeGenerated) by Computer
| order by LastHeartbeat desc
```

### Failed Login Attempts

Query created but not validated because no failed authentication events were generated.

---

## Alert Configuration

- Action Group with Email Notification
- Linux CPU Alert
  - Threshold: 40%
- Windows CPU Alert
  - Threshold: 40%

---

## Validation

- CPU Query ✔
- Memory Query ✔
- Disk Query ✔
- Heartbeat Query ✔
- CPU Alert Triggered ✔
- Email Notification Received ✔

---

## Outcome

Successfully implemented Azure Monitor analytics and alerting using Terraform. Alerts were validated by generating CPU load on both Linux and Windows virtual machines.