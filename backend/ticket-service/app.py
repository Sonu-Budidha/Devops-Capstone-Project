from flask import Flask, request, jsonify
import boto3, uuid

app = Flask(__name__)
db = boto3.resource("dynamodb").Table("support-tickets")

@app.route("/ticket", methods=["POST"])
def create_ticket():
    data = request.json
    ticket_id = str(uuid.uuid4())

    db.put_item(Item={
        "ticket_id": ticket_id,
        "title": data["title"],
        "description": data["description"]
    })

    return jsonify({"ticket_id": ticket_id})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

