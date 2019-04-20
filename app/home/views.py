# @Time: 2019/4/17 0017 21:16
# @Author: KuKuXia
# Note:

# coding:uft8

from . import home
from flask import render_template, redirect, url_for


#首页
@home.route("/")
def index():
    return render_template("home/index.html")

#首页
@home.route("/animation/")
def animation():
    return render_template("home/animation.html")



# 登录页面
@home.route('/login/')
def login():
    return render_template("home/login.html")


# 退出页面
@home.route('/logout/')
def logout():
    return redirect(url_for("home.login"))


# 注册页面
@home.route('/register/')
def register():
    return render_template("home/register.html")


# 会员中心
@home.route('/user/')
def user():
    return render_template("home/user.html")


# 修改密码
@home.route('/pwd/')
def pwd():
    return render_template("home/pwd.html")


# 评论记录
@home.route('/comments/')
def comments():
    return render_template("home/comments.html")


# 登录日志
@home.route('/loginlog/')
def loginlog():
    return render_template("home/loginlog.html")


# 收藏电影
@home.route('/moviecol/')
def moviecol():
    return render_template("home/moviecol.html")

# 搜索电影
@home.route('/search/')
def search():
    return render_template("home/search.html")

# 电影详情
@home.route('/play/')
def play():
    return render_template("home/play.html")


