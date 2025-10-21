# app.py
from flask import Flask, jsonify
from datetime import datetime
import os

app = Flask(_name_)

@app.route("/")
def hello():
    return f"Hello from Dr. ViKi DevOps Pipeline!<br><small>{datetime.utcnow().isoformat()}Z</small>"

@app.route("/health")
def health():
    return jsonify(status="ok", timestamp=datetime.utcnow().isoformat()+"Z")

if _name_ == "_main_":
    port = int(os.environ.get("PORT", 8080))
    app.run(host="0.0.0.0", port=port)

