# @Time: 2019/4/17 0017 21:16
# @Author: KuKuXia
# Note:

# coding:uft8
import os
import uuid
import datetime
from . import home
from flask import render_template, redirect, url_for, flash, session, request
from app.home.forms import RegistForm, LoginForm, UserdetailForm, DataRequired, PwdForm
from app.models import User, Userlog, Preview, Tag
from werkzeug.security import generate_password_hash
from werkzeug.utils import secure_filename
from app import db, app
from functools import wraps


# 登录装饰器
def user_login_req(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "user" not in session:
            return redirect(url_for("home.login", next=request.url))
        return f(*args, **kwargs)

    return decorated_function


# 修改文件名称
def change_filename(filename):
    fileinfo = os.path.splitext(filename)
    filename = datetime.datetime.now().strftime("%Y%m%d%H%M%S") + str(uuid.uuid4().hex) + fileinfo[-1]
    return filename


# 首页
@home.route("/")
def index():
    tags = Tag.query.all()
    tid = request.args.get("tid", 0)
    star = request.args.get("star", 0)
    time = request.args.get("time", 0)
    pm = request.args.get("pm", 0)
    cm = request.args.get("cm", 0)

    return render_template("home/index.html", tags=tags)


# 首页
@home.route("/animation/")
def animation():
    """
    首页轮播动画
    """
    data = Preview.query.all()
    for v in data:
        v.id = v.id - 9
    return render_template("home/animation.html", data=data[0:5])


# 登录页面
@home.route('/login/', methods=["GET", "POST"])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        data = form.data
        user = User.query.filter_by(name=data["name"]).first()
        if user:
            if not user.check_pwd(data["pwd"]):
                flash("密码错误！", "err")
                return redirect(url_for("home.login"))
        else:
            flash("账户不存在！", "err")
            return redirect(url_for("home.login"))
        session["user"] = user.name
        session["user_id"] = user.id
        userlog = Userlog(
            user_id=user.id,
            ip=request.remote_addr
        )
        db.session.add(userlog)
        db.session.commit()
        return redirect(url_for("home.user"))
    return render_template("home/login.html", form=form)


# 退出页面
@home.route('/logout/')
def logout():
    session.pop("user", None)
    session.pop("user_id", None)
    return redirect(url_for("home.login"))


# 注册页面
@home.route('/register/', methods=["GET", "POST"])
def register():
    form = RegistForm()
    if form.validate_on_submit():
        data = form.data
        user = User(
            name=data["name"],
            phone=data["phone"],
            email=data["email"],
            pwd=generate_password_hash(data["pwd"]),
            uuid=uuid.uuid4().hex
        )
        db.session.add(user)
        db.session.commit()
        flash("注册成功", 'ok')
    return render_template("home/register.html", form=form)


# 会员中心
@home.route('/user/', methods=["GET", "POST"])
@user_login_req
def user():
    form = UserdetailForm()
    user = User.query.get(session["user_id"])
    if user.face == None:
        form.face.validators = [DataRequired("请上传头像！")]
    else:
        form.face.validators = []
    if request.method == 'GET':
        form.name.data = user.name
        form.email.data = user.email
        form.phone.data = user.phone
        form.info.data = user.info
    if form.validate_on_submit():
        data = form.data
        file_face = secure_filename(form.face.data.filename)
        if not os.path.exists(app.config["FC_DIR"]):
            os.makedirs(app.config["FC_DIR"])
            os.chmod(app.config["FC_DIR"], "rw")
        user.face = change_filename(file_face) if user.face == None else user.face
        form.face.data.save(app.config["FC_DIR"] + user.face)
        name_count = User.query.filter_by(name=data["name"]).count()

        if data["name"] != user.name and name_count == 1:
            flash("昵称已经存在!", "err")
            return redirect(url_for('home.user'))

        email_count = User.query.filter_by(email=data["email"]).count()
        if data["email"] != user.email and email_count == 1:
            flash("邮箱已经存在!", "err")
            return redirect(url_for('home.user'))

        phone_count = User.query.filter_by(phone=data["phone"]).count()
        if data["phone"] != user.phone and phone_count == 1:
            flash("号码已经存在!", "err")
            return redirect(url_for('home.user'))

        user.name = data["name"]
        session["user"] = user.name  # 修改之后要更新session中的全局变量
        user.phone = data["phone"]
        user.info = data["info"]
        user.email = data["email"]
        db.session.add(user)
        db.session.commit()
        flash("修改资料成功！", "ok")
        return redirect(url_for('home.user'))
    return render_template("home/user.html", form=form, user=user)


# 修改密码
@home.route('/pwd/', methods=["GET", "POST"])
@user_login_req
def pwd():
    form = PwdForm()
    if form.validate_on_submit():
        data = form.data
        user = User.query.filter_by(name=session["user"]).first()
        if not user.check_pwd(data["old_pwd"]):
            flash("旧密码错误！", "err")
            return redirect(url_for('home.pwd'))
        from werkzeug.security import generate_password_hash
        user.pwd = generate_password_hash(data["new_pwd"])
        db.session.add(user)
        db.session.commit()
        flash("密码修改成功, 请重新登录!", 'ok')
        return redirect(url_for('home.logout'))
    return render_template("home/pwd.html", form=form)


# 评论记录
@home.route('/comments/')
@user_login_req
def comments():
    return render_template("home/comments.html")


# 登录日志
@home.route('/loginlog/<int:page>', methods=["GET"])
@user_login_req
def loginlog(page=None):
    if page is None:
        page = 1
    page_data = Userlog.query.filter_by(
        user_id=session["user_id"]
    ).order_by(
        Userlog.addtime.desc()
    ).paginate(page=page, per_page=10)
    return render_template("home/loginlog.html", page_data=page_data)


# 收藏电影
@home.route('/moviecol/')
@user_login_req
def moviecol():
    return render_template("home/moviecol.html")


# 搜索电影
@home.route('/search/')
@user_login_req
def search():
    return render_template("home/search.html")


# 电影详情
@home.route('/play/')
@user_login_req
def play():
    return render_template("home/play.html")
