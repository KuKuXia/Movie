# @Time: 2019/4/17 0017 21:16
# @Author: KuKuXia
# Note:

# coding:utf8
from flask_wtf import FlaskForm
from wtforms.fields import SubmitField, StringField, PasswordField, FileField, TextAreaField
from wtforms.validators import DataRequired, EqualTo, Email, Regexp, ValidationError
from app.models import User


# 会员注册表单
class RegistForm(FlaskForm):
    name = StringField(
        label='昵称',
        validators=[DataRequired("请输入昵称！")],
        description="昵称",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入昵称！",
        })
    email = StringField(
        label='邮箱',
        validators=[
            DataRequired("请输入邮箱!"),
            Email("邮箱格式不正确!")
        ],
        description="邮箱",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入邮箱！",
        })
    phone = StringField(
        label='手机号码',
        validators=[
            DataRequired("请输入手机号码!"),
            Regexp("1[3458]\\d{9}", message="手机格式不正确！")
        ],
        description="手机号码",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入手机号码！",
        })
    pwd = PasswordField(
        label="密码",
        validators=[DataRequired("请输入密码")],
        description="密码",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入密码!",
        })

    repwd = PasswordField(
        label="确认密码",
        validators=[
            DataRequired("请输入确认密码"),
            EqualTo('pwd', message="两次密码不一致!")],
        description="确认密码",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入确认密码!",
        })

    submit = SubmitField(
        '注册',
        render_kw={
            "class": "btn btn-lg btn-success btn-block"
        })

    def validate_name(self, field):
        name = field.data
        user_count = User.query.filter_by(name=name).count()
        if user_count != 0:
            raise ValidationError("昵称已经注册！")

    def validate_email(self, field):
        email = field.data
        email_count = User.query.filter_by(email=email).count()
        if email_count != 0:
            raise ValidationError("邮箱已经注册！")

    def validate_phone(self, field):
        phone = field.data
        phone_count = User.query.filter_by(phone=phone).count()
        if phone_count != 0:
            raise ValidationError("手机号码已经注册！")


# 登录表单
class LoginForm(FlaskForm):
    name = StringField(
        label='昵称',
        validators=[DataRequired("请输入昵称！")],
        description="昵称",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入昵称！",
        })

    pwd = PasswordField(
        label="密码",
        validators=[DataRequired("请输入密码")],
        description="密码",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入密码!",
        })

    submit = SubmitField(
        '登录',
        render_kw={
            "class": "btn btn-lg btn-primary btn-block"
        })


class UserdetailForm(FlaskForm):
    name = StringField(
        label='昵称',
        validators=[DataRequired("请输入昵称！")],
        description="昵称",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入昵称！",
        })

    email = StringField(
        label='邮箱',
        validators=[
            DataRequired("请输入邮箱!"),
            Email("邮箱格式不正确!")
        ],
        description="邮箱",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入邮箱！",
        })
    phone = StringField(
        label='手机号码',
        validators=[
            DataRequired("请输入手机号码!"),
            Regexp("1[3458]\\d{9}", message="号码格式不正确！")
        ],
        description="手机号码",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入手机号码！",
        })

    info = TextAreaField(
        label="简介",
        validators=[DataRequired("请输入简介！")],
        description="简介",
        render_kw={
            "class": "form-control",
            "rows": 10
        }
    )

    face = FileField(
        label="头像",
        validators=[],
        description="头像",
    )

    submit = SubmitField(
        '保存修改',
        render_kw={
            "class": "btn btn-success"
        })


class PwdForm(FlaskForm):
    old_pwd = PasswordField(
        label="旧密码",
        validators=[DataRequired("请输入旧密码")],
        description="旧密码",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入旧密码!",
        })

    new_pwd = PasswordField(
        label="新密码",
        validators=[DataRequired("请输入新密码")],
        description="新密码",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入新密码!",
        })

    repwd = PasswordField(
        label="确认新密码",
        validators=[
            DataRequired("请重复输入新密码"),
            EqualTo('new_pwd', message="两次新密码不一致!")],
        description="重复新密码",
        render_kw={
            "class": "form-control",
            "placeholder": "请重复输入新密码!",
        })

    submit = SubmitField(
        '修改密码',
        render_kw={
            "class": "btn btn-success"
        })

    def validate_old_pwd(self, field):
        from flask import session
        pwd = field.data
        name = session["user"]
        user = User.query.filter_by(
            name=name
        ).first()
        print(user)
        if not user.check_pwd(pwd):
            raise ValidationError("旧密码错误")
