from pathlib import Path

def test_policy_directory_exists():
    assert Path("kubernetes/policies").is_dir()
    assert any(Path("kubernetes/policies").glob("*.yaml"))
