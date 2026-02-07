from flask import Flask, request
from dotenv import load_dotenv
import requests
import json
import os

load_dotenv()

app = Flask(__name__)
api_key = os.getenv("MORALIS_API_KEY")

@app.route("/get_token_balance", methods=["GET"])
def get_token_balance():
    chain = request.args.get("chain")
    address = request.args.get("address")
    url = f"https://deep-index.moralis.io/api/v2.2/wallets/{address}/tokens?chain={chain}&limit=1"

    headers = {
    "Accept": "application/json",
    "X-API-Key": api_key
    }

    response = requests.request("GET", url, headers=headers)

    data = response.json()   

    # Safety checks
    if "result" not in data or len(data["result"]) == 0:
        return {"balance": "0"}

    balance = data["result"][0]["balance_formatted"]
    symbol = data["result"][0]["symbol"]

    return {
        "balance": balance,
        "symbol": symbol
    }

if (__name__ == "__main__"):
    app.run(host="0.0.0.0", port=5002, debug=True)