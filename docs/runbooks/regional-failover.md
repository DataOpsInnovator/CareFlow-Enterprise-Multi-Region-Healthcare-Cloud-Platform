# Regional failover / failback

## Preconditions
- Incident commander declares regional failover criteria met.
- Secondary EKS, dependencies, secrets, observability and capacity are healthy.
- Database/object replication state is within approved RPO.
- Change and communications channels are active.

## Failover
1. Freeze nonessential deploys.
2. Validate secondary health and data currency.
3. Promote/activate the approved secondary data path.
4. Shift global routing using the enterprise DNS/edge mechanism.
5. Run synthetic and business transaction validation.
6. Monitor error rate, latency, queue depth and data integrity.
7. Record measured RTO/RPO and evidence.

## Failback
Failback is a separate controlled change. Re-establish primary data consistency, validate capacity and telemetry, shift a small percentage of traffic first, then complete the transition. Never fail back solely because the original region appears healthy.
