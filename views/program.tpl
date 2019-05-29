% rebase('layout.tpl')


<p></p>

<div class="container">
    <div class="row">
        <div class="">
            <a class="btn btn-primary  " role="button" href="/write">添加程序</a>
        </div>
    </div>
<div class="row">

<table class="table table-striped">
    <thead>
        <tr>
            <th></th>
            <th>标题</th>
            <th>日期</th>
            <th>级别</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        % for p in programs:
        <tr>
            <td>{{p.id}}</td>
            <td><a href='/program/{{ p.id }}'>{{p.title}}</a> </td>
            <td>{{p.update}}</td>
            <td>{{p.level}}</td>
            <td><a href='/program/edit/{{ p.id }}'>edit</a></td>
        </tr>
        % end
    </tbody>
</table>
</div>

<div class="row">
    <nav aria-label="Page navigation">
              <ul class="pagination">
                <li>
                  <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                  %for i in range(1,pagecount+1):
                    <li class=
                        %if i==cpage:
                            "active"
                        %else:
                            "disable"
                        %end
                        >
                    <a href="/programe?page={{ i }}">{{ i }}</a></li>
                  %end

                <li>
                  <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
</div>

</div>