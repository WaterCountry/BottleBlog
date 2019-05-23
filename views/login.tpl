% rebase('layout.tpl')

<div class="container">

<div class="row">
<br><br><br><br><br><br><br><br>
    <form action="/login" method="post"  class="form-horizontal">
      <div class="form-group">
        <label for="username" class="col-sm-4 control-label">账号</label>

        <div class="col-sm-8">
          <input type="text" class="form-control" name="username" placeholder="Full Name">
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
          <button type="submit" class="btn btn-default btn-auth">登录</button>
        </div>
      </div>
    </form>

</div>
<div class="row">
    <div class="form-group">
      <div class="col-sm-offset-6 col-sm-6">
                        没有账号？
                     <a href="/register" title="" class="btn btn-primary">立即注册</a>
      </div>
    </div>
</div>

</div>