% rebase('layout.tpl')
<hr>
<h1></h1>

<div class="row">
    <div class="col-md-6 ">
    <textarea id="code"  name="code" height="100%">
a=1
b=2
c=a+b
print(c)
import turtle
a=turtle.Turtle()
a.fd(100)
a.rt(90)
a.fd(100)
    </textarea>
    </div>
    <div class="col-md-6">
	<div  style="text-align:right;">
        {{ program.title }}    level:{{program.level}} {{program.update}}
	<img id="skulpt_run" src="/static/images/run.gif" alt="Turtle Run" style="cursor: hand" />
    </div>
    <div id="mycanvas" height="400" style="border-style: hidden;"></div>
    <pre id="edoutput"></pre>

    <div style="display: none;">
    <textarea id="interactive" cols="85" rows="2" ></textarea>
    </div>

</div>


<div>



<div style="text-align:right;">
    <a class="btn btn-primary" role="button" href="/program/{{ program.id}}" target="_self">修改</a>

    <a class="btn btn-primary" role="button" href="/program" target="_self">返回</a>

<br><br>
</div>



<link rel="stylesheet" type="text/css" media="all" href="/static/skulpt/codemirror.css">
<link rel="stylesheet" type="text/css" media="all" href="/static/skulpt/solarized.css">
<link rel="stylesheet" type="text/css" media="all" href="/static/skulpt/main.css">
<script type="text/javascript" src="/static/skulpt/jquery.min.js"></script>
<script src="/static/skulpt/codemirrorepl.js" type="text/javascript"></script>
<script src="/static/skulpt/repl.js" type="text/javascript"></script>
<script src="/static/skulpt/python.js" type="text/javascript"></script>
<script src="/static/skulpt/skulpt.min.js" type="text/javascript"></script>
<script src="/static/skulpt/skulpt-stdlib.js" type="text/javascript"></script>
<script src="/static/skulpt/env/editor.js" type="text/javascript"></script>
<script src="/static/skulpt/skulpt.min.js" type="text/javascript"></script>
<script src="/static/skulpt/skulpt-stdlib.js" type="text/javascript"></script>