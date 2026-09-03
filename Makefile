SHELL := /usr/bin/env bash
.PHONY: validate test fmt security terraform-validate helm-lint unit smoke package

validate: fmt terraform-validate helm-lint security test
fmt:
	terraform fmt -recursive -check terraform || true
terraform-validate:
	./scripts/terraform-validate.sh
helm-lint:
	./scripts/helm-lint.sh
security:
	./scripts/security-scan.sh
unit:
	python -m pytest -q services/patient-api/tests tests/app tests/policies
smoke:
	./scripts/smoke-test.sh
test: unit
	python -m pytest -q tests/integration tests/security tests/dr
package:
	./scripts/package.sh
