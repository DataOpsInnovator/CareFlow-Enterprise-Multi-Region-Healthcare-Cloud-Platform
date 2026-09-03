from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import os
import time

class Handler(BaseHTTPRequestHandler):
    def send_json(self, status, payload):
        body = json.dumps(payload).encode()
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def do_GET(self):
        if self.path == "/health":
            self.send_json(200, {"status": "ok"})
            return

        if self.path == "/patient/example":
            # Synthetic patient only. No real healthcare data.
            self.send_json(200, {
                "resourceType": "Patient",
                "id": "synthetic-001",
                "meta": {"lastUpdated": time.strftime("%Y-%m-%dT%H:%M:%SZ")},
                "name": [{"family": "Example", "given": ["Synthetic"]}],
                "active": True
            })
            return

        self.send_json(404, {"error": "not_found"})

if __name__ == "__main__":
    port = int(os.getenv("PORT", "8080"))
    HTTPServer(("0.0.0.0", port), Handler).serve_forever()
