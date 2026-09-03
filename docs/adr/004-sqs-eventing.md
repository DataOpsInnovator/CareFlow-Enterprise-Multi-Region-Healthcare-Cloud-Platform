# ADR SQS for durable event processing

## Decision
SQS for durable event processing.

## Context
The workload needs buffering, retries, and DLQs rather than Kafka-scale streams.

## Alternatives
SNS; MSK; Kinesis

## Rationale
Lower operational complexity and clear at-least-once semantics.

## Consequences
No Kafka-native replay/log model.

## Revisit trigger
If sustained streaming/replay requirements emerge.
