# Threat Model

| Threat | Preventive | Detective | Corrective |
|---|---|---|---|
| External attacker | WAF, TLS, IAM | GuardDuty, logs | Block/quarantine |
| Compromised developer | OIDC, scoped roles | CloudTrail | Revoke access |
| Vulnerable dependency | Trivy/SCA | Inspector | Rebuild |
| Container compromise | Signed images, admission | Runtime telemetry | Isolate |
| Excessive permissions | SCPs/boundaries | CloudTrail | Revoke |
| Secret leakage | Secrets Manager | Secret scanning | Rotate |
| Data exfiltration | Private networking | GuardDuty | Disable identity |
| Public storage | Bucket policy | Config | Remediate |
| Cross-namespace access | NetworkPolicy | Audit logs | Isolate |
| Pipeline tampering | Protected branches | Git audit | Revert |
| Insider risk | SoD + approvals | Audit | Revoke |
| Regional failure | Warm standby | Synthetic monitoring | Failover |
| Destructive action | Separate admin path + backups | CloudTrail | Restore |

## Break-glass

Break-glass access is disabled by default, MFA-protected, time-limited, approved,
and fully audited. Emergency changes require incident ID, requester, approver,
scope, reason, timestamp, result, and follow-up review.
