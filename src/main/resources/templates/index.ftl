<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="${request.contextPath}/">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hero 管理系统</title>
    <#-- jquery -->
    <script src="js/jquery-3.5.1.js"></script>
    <#-- layui -->
    <link rel="stylesheet" href="lib/layui/css/layui.css">
    <script src="lib/layui/layui.js"></script>
    <#-- 自定义样式 -->
    <style>
        .layui-table-cell {
            height: auto;
        }

        .form-hero {
            padding: 30px;
        }

        .form-hero textarea {
            margin-top: 10px;
        }

        .layui-form-select dl dd.layui-this {
            background-color: #009688;
        }
    </style>
</head>
<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">Hero 管理系统</div>
            <!-- 头部区域（可配合layui已有的水平导航） -->
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                        HUI
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="">基本资料</a></dd>
                        <dd><a href="">安全设置</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">退了</a></li>
            </ul>
        </div>

        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;">英雄管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;">英雄列表</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 内容主体区域 -->
        <div class="layui-body">
            <div style="padding: 15px;">
                <button class="layui-btn" id="add">添加英雄</button>
                <#-- 数据表格 -->
                <table id="hero" lay-filter="hero"></table>
                <script type="text/html" id="barHero">
                    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
                </script>
            </div>
        </div>
    </div>
    <script>
        //JavaScript代码区域
        layui.use(['element', 'table', 'form'], function () {
            var element = layui.element
                , table = layui.table
                , form = layui.form;

            //第一个实例
            table.render({
                elem: '#hero'
                , url: 'hero/list'
                , method: 'post'
                , page: true //开启分页
                , cols: [[ //表头
                    {field: 'id', title: 'ID', align: 'center', width: 80},
                    {field: 'name', title: '英雄名称', align: 'center'},
                    {
                        field: 'avatar', title: '英雄头像', align: 'center', width: 100, templet: function (d) {
                            return '<img src="' + d.avatar + '"/>';
                        }
                    },
                    {
                        field: 'type', title: '英雄职业', align: 'center', templet: function (d) {
                            var type = ["坦克", "战士", "刺客", "法师", "射手", "辅助"];
                            return type[d.type - 1];
                        }
                    },
                    {
                        field: 'skill1', title: '英雄技能1', align: 'center', templet: function (d) {
                            return '<span title="' + d.skill1Describe + '">' + d.skill1 + '</span>'
                        }
                    },
                    {
                        field: 'skill2', title: '英雄技能2', align: 'center', templet: function (d) {
                            return '<span title="' + d.skill2Describe + '">' + d.skill2 + '</span>'
                        }
                    },
                    {
                        field: 'skill3', title: '英雄技能3', align: 'center', templet: function (d) {
                            return '<span title="' + d.skill3Describe + '">' + d.skill3 + '</span>'
                        }
                    },
                    {title: '操作', toolbar: '#barHero', width: 150, align: 'center'}
                ]]
            });

            //添加英雄
            $("#add").on('click', function () {
                layer.open({
                    type: 1,
                    skin: 'layui-layer-rim', //加上边框
                    area: ['600px', '700px'], //宽高
                    content: `
                        <form name="form-hero" class="layui-form form-hero" lay-filter="form-hero">
                            <div class="layui-form-item">
                                <label class="layui-form-label">英雄名称</label>
                                <div class="layui-input-block">
                                    <input type="text" name="name" placeholder="请输入英雄名称" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">英雄头像</label>
                                <div class="layui-input-block">
                                    <input type="text" name="avatar" placeholder="请输入头像图片地址" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">英雄职业</label>
                                <div class="layui-input-block">
                                    <select name="type">
                                        <option></option>
                                        <option value="1">坦克</option>
                                        <option value="2">战士</option>
                                        <option value="3">刺客</option>
                                        <option value="4">法师</option>
                                        <option value="5">射手</option>
                                        <option value="6">辅助</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">英雄技能1</label>
                                <div class="layui-input-block">
                                    <input type="text" name="skill1" placeholder="请输入英雄技能1" class="layui-input">
                                    <textarea name="skill1Describe" placeholder="请输入内容" class="layui-textarea" rows="2"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">英雄技能2</label>
                                <div class="layui-input-block">
                                    <input type="text" name="skill2" placeholder="请输入英雄技能1" class="layui-input">
                                    <textarea name="skill2Describe" placeholder="请输入内容" class="layui-textarea" rows="2"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">英雄技能3</label>
                                <div class="layui-input-block">
                                    <input type="text" name="skill3" placeholder="请输入英雄技能1" class="layui-input">
                                    <textarea name="skill3Describe" placeholder="请输入内容" class="layui-textarea" rows="2"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" lay-submit lay-filter="form-hero">立即提交</button>
                                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                </div>
                            </div>
                        </form>
                    `
                });
                form.render();
            });

            //监听添加英雄表单提交事件
            form.on('submit(form-hero)', function (data) {
                console.log(data.field)
                //请求Controller
                $.post("hero/add", data.field, function (result) {
                    console.log(result);
                })
                return false;
            })
        });
    </script>
</body>
</html>