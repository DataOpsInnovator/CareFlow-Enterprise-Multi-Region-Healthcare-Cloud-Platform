from pathlib import Path

def test_application_exists():
    assert Path("services/patient-api/app.py").exists()
