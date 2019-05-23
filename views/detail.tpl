% rebase('layout.tpl')

<h1>{{ blog.title }}.</h1>

<div>{{!blog.content}}</div>

<p>{{blog.update}}</p>
<p>{{blog.author.nick}}</p>
<div style="text-align:right;">
    <a class="btn btn-primary" role="button" href="/edit/{{ blog.id}}" target="_self">修改</a>

    <a class="btn btn-primary" role="button" href="/blog" target="_self">返回</a>

<br><br>
</div>