# @Time: 2019/4/17 0017 21:15
# @Author: KuKuXia
# Note:

# coding:utf8
from flask import Flask

app = Flask(__name__)
app.debug = True

from app.home import home as home_blueprint
from app.admin import admin as admin_blueprint

app.register_blueprint(home_blueprint)
app.register_blueprint(admin_blueprint, url_prefix='/admin')
