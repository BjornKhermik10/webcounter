from flask import Flask, render_template, request, redirect

app = Flask(__name__)
counter = 0

@app.route("/")
def index():
    return render_template("index.html", value=counter)

@app.route("/increment", methods=["POST"])
def increment():
    global counter
    counter += 1
    return redirect("/")

@app.route("/reset", methods=["POST"])
def reset():
    global counter
    counter = 0
    return redirect("/")

@app.route("/set", methods=["POST"])
def set_counter():
    global counter
    try:
        counter = int(request.form.get("value", 0))
    except ValueError:
        counter = 0
    return redirect("/")

if __name__ == "__main__":
    app.run(port=5001)
