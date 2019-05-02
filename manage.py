# @Time: 2019/4/17 0017 21:14
# @Author: KuKuXia
# Note:

# coding:utf8

from app import app
from flask_script import Manager

manager = Manager(app)
if __name__ == "__main__":
    manager.run()
