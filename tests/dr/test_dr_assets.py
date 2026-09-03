from pathlib import Path
def test_dr_runbooks_and_script_exist():
    assert Path("docs/runbooks/regional-failover.md").exists()
    assert Path("docs/runbooks/backup-restore.md").exists()
    assert Path("scripts/dr-readiness.sh").exists()
