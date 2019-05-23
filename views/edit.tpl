% rebase('layout.tpl')

<div class="container">

<div class="row">

    <form action="/edit/{{ blog.id }}" method="post"  class="form-horizontal">
      <div class="form-group">
        <label for="title" class="col-sm-2 control-label">标题</label>

        <div class="col-sm-10">
          <input type="text" class="form-control" name="title" placeholder="title" value="{{ blog.title }}" >
        </div>
      </div>
      <div class="form-group">
        <label for="content" class="col-sm-2 control-label">内容</label>

        <div class="col-sm-10">
          <input type="text" class="form-control" id="content" name="content" placeholder="content" value="{{blog.content}}" >
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <button type="submit" class="btn btn-default ">修改文章</button>
        </div>
      </div>
    </form>

</div>

    <script src="/static/tinymce/tinymce.min.js"></script>
    <script>tinymce.init({selector:'#content'});</script>
</div>