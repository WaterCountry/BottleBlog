% rebase('layout.tpl')

<h1>{{ program.title }}.</h1>

<div class="pull-right">
    <p>level:{{program.level}} {{program.update}}</p>
</div>

<div>
<form  action="/judge" method="POST"  enctype="multipart/form-data">
<div>
    <textarea id="code" name="code">{{!program.code}}
    </textarea>
    <div>
        <button type="submit" class="btn btn-default ">运行代码</button>
    </div>
</div>
</div>

<div style="text-align:right;">
    <a class="btn btn-primary" role="button" href="/program/{{ program.id}}" target="_self">修改</a>

    <a class="btn btn-primary" role="button" href="/program" target="_self">返回</a>

<br><br>
</div>

</form>

<link rel="stylesheet" href="/static/lib/codemirror.css">
<script src="/static/lib/codemirror.js"></script>
<script src="/static/lib/python.js"></script>
<script>
  var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        mode: {name: "python",
           version: 3,
           singleLineStringErrors: false},
    lineNumbers: true,
    indentUnit: 4,
    matchBrackets: true
  });
</script>