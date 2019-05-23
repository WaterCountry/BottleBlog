% rebase('layout.tpl')

<div class="container">

<div class="row">

    <form action="/register" method="post"  class="form-horizontal">
      <div class="form-group">
        <label for="username" class="col-sm-4 control-label">账号</label>

        <div class="col-sm-8">
          <input type="text" class="form-control" name="username" placeholder="Username">
        </div>
      </div>
      <div class="form-group">
        <label for="nick" class="col-sm-4 control-label">昵称</label>

        <div class="col-sm-8">
          <input type="text" class="form-control" name="nick" placeholder="Nick">
        </div>
      </div>
      <div class="form-group">
        <label for="password" class="col-sm-4 control-label">密码</label>

        <div class="col-sm-8">
          <input type="password" class="form-control" name="password" placeholder="Password">
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-6 col-sm-6">
          <button type="submit" class="btn btn-default ">注册</button>
        </div>
      </div>
    </form>

</div>

</div>