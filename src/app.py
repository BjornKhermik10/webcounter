from flask import Flask, render_template, redirect, request

app = Flask(__name__)

value = 0  # globaali laskuri

@app.route("/")
def index():
    return render_template("index.html", value=value)

@app.route("/increment", methods=["POST"])
def increment():
    global value
    value += 1
    return redirect("/")

@app.route("/reset", methods=["POST"])
def reset():
    global value
    value = 0
    return redirect("/")

@app.route("/set", methods=["POST"])
def set_value():
    global value
    try:
        value = int(request.form["value"])
    except:
        pass
    return redirect("/")

if __name__ == "__main__":
    app.run(port=5001)
