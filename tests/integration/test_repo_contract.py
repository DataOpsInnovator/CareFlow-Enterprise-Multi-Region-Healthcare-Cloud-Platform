from pathlib import Path
REQUIRED=["terraform/live/primary/main.tf","terraform/live/secondary/main.tf","argocd/projects/careflow.yaml","docs/runbooks/regional-failover.md","security/kyverno/verify-images.yaml"]
def test_required_assets_exist():
    assert all(Path(p).exists() for p in REQUIRED)
