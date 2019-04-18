# @Time: 2019/4/17 0017 21:16
# @Author: KuKuXia
# Note:

# coding:uft8

from . import home


@home.route("/")
def index():
    return "<h1 style='color:green'> this is home <h1/>"
