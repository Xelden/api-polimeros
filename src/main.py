from flask import Flask
import src.requests.base

app = Flask(__name__)

@app.route("/")
def init():
    return "Poly API running"

@app.route("/all-<field>")
def polys(field):
    return src.requests.base.get_all(field)

@app.route("/<field>-from-type_id:<type_id>")
def polys_from_(field, type_id):
    return src.requests.base.get_from_type(field, type_id)

def main():
    app.run(host="0.0.0.0", port=5000, debug=True)

if __name__ == "__main__":
    main()
