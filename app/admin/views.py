# @Time: 2019/4/17 0017 21:16
# @Author: KuKuXia
# Note:

# coding:uft8

from . import admin


@admin.route("/")
def index():
    return "<h1 style='color:red'> this is admin<h1/>"
