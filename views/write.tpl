% rebase('layout.tpl', title=title)

<h2>{{ title }}.</h2>

<div class="container">

<div class="row">

    <form action="/write" method="post"  class="form-horizontal">
      <div class="form-group">
        <label for="title" class="col-sm-1 control-label">标题</label>

        <div class="col-sm-10">
          <input type="text" class="form-control" name="title" placeholder="title">
        </div>
      </div>
      <div class="form-group">
        <label for="code" class="col-sm-1 control-label">代码</label>

        <div class="col-sm-10">
          <textarea id="code" name="code" placeholder="content" class="form-control"></textarea>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-6 col-sm-6 ">
          <button type="submit" class="btn btn-primary  pull-right">添加程序</button>
        </div>
      </div>
    </form>

</div>

</div>