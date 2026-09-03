from pathlib import Path

def test_signed_image_policy_is_enforcing():
    t=Path("security/kyverno/verify-images.yaml").read_text()
    assert "validationFailureAction: Enforce" in t and "required: true" in t

def test_no_real_phi_marker():
    for p in Path("synthetic-data").rglob("*"):
        if p.is_file(): assert "REAL_PATIENT" not in p.read_text(errors="ignore")
