from pathlib import Path

def test_synthetic_patient_exists():
    path = Path("synthetic-data/fhir/patient.json")
    assert path.exists()
    assert "synthetic-001" in path.read_text()
