# AI-Assisted Operations

## Capability

Retrieval-grounded incident assistant.

## Authorized sources

- Prometheus
- CloudWatch
- sanitized logs
- deployment metadata
- approved runbooks
- architecture documentation

## Behavior

The assistant summarizes the incident, identifies evidence, proposes hypotheses,
and recommends relevant runbooks. Each recommendation must cite its evidence.

## Safety

- Never send PHI, PII, secrets, payment data, or account information to an
  external model.
- Redact sensitive fields.
- Preserve audit logs.
- Require human approval for remediation.
- Provide deterministic runbook fallback.
- Test for hallucination and unsafe recommendations.
- Fail closed when authorization/evidence is insufficient.

The assistant must not autonomously execute destructive AWS or Kubernetes actions.
