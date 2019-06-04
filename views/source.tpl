% rebase('laytwo.tpl')
<div class="row" style="background:#666;" >
    <div class="col-md-6 ">
    <textarea id="code"  name="code"  >
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
    <div class="col-md-6" >
	<div >
    <button id="skulpt_run"  class="btn btn-default ">运行代码</button>
        {{ program.title }}    level:{{program.level}} {{program.update}}
    <pre id="edoutput" style="background:#666;border-style:none;font-size:24px;"></pre>
    </div>
    <div id="mycanvas"  style="height:400px"></div>

</div>




<link rel="stylesheet" type="text/css" media="all" href="/static/codemirror/theme/darcula.css">
<link rel="stylesheet" type="text/css" media="all" href="/static/codemirror/lib/codemirror.css">
<script type="text/javascript" src="/static/skulpt/jquery.min.js"></script>
<script src="/static/codemirror/lib/codemirror.js" type="text/javascript"></script>
<script src="/static/codemirror/mode/python/python.js" type="text/javascript"></script>
<script src="/static/codemirror/addon/edit/matchbrackets.js" type="text/javascript"></script>
<script src="/static/skulpt/skulpt.min.js" type="text/javascript"></script>
<script src="/static/skulpt/skulpt-stdlib.js" type="text/javascript"></script>
<script src="/static/skulpt/editor.js" type="text/javascript"></script>