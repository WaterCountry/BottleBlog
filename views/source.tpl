% rebase('laytwo.tpl')
<div class="row"  >
    <div class="col-md-2 ">

            % for p in programs:
            <p style="font-size:16px; margin:10px;" >
                <span class="glyphicon glyphicon-file" ></span>
                <a href='/program/{{ p.id }}'>{{p.title}}</a>
            </p>
            % end

    </div>
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
    <div class="col-md-4" >
	<div >

    <button id="skulpt_run"  class="btn btn-success ">
        <span class="glyphicon glyphicon-play" ></span> 运行代码
    </button>
    <pre id="edoutput" style="margin:10px;height:100px;font-size:16px;" ></pre>
    </div>
    <div id="mycanvas"  style="height:400px;border:0;"></div>

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