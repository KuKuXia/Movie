# @Time: 2019/4/17 0017 21:14
# @Author: KuKuXia
# Note:
# coding:uft8
from flask import Blueprint

home = Blueprint("home", __name__)

import app.home.views