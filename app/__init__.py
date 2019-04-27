# @Time: 2019/4/17 0017 21:15
# @Author: KuKuXia
# Note:

# coding:utf8
import os

from flask import Flask,render_template
import os
import pymysql
from flask_sqlalchemy import SQLAlchemy

pymysql.install_as_MySQLdb()

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:MySQL503@127.0.0.1:3306/movie"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True
app.config["SECRET_KEY"] = '8c5e7c76e3c042e3b65e3188fdd0e3b1'
app.config["UP_DIR"] = os.path.join(os.path.abspath(os.path.dirname(__file__)), "static/uploads/")
app.config["FC_DIR"] = os.path.join(os.path.abspath(os.path.dirname(__file__)), "static/uploads/users/")
app.debug = True
db = SQLAlchemy(app)

from app.home import home as home_blueprint
from app.admin import admin as admin_blueprint

app.register_blueprint(home_blueprint)
app.register_blueprint(admin_blueprint, url_prefix='/admin')


# 404
@app.errorhandler(404)
def page_not_found(error):
    return render_template("home/404.html"),404