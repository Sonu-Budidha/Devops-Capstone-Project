from flask import Flask, jsonify
import boto3

app = Flask(__name__)
table = boto3.resource("dynamodb").Table("support-tickets")

@app.route("/report")
def report():
    items = table.scan()["Items"]
    return jsonify({"total_tickets": len(items)})

app.run(host="0.0.0.0", port=8080)

