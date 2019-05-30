% rebase('layout.tpl', title=title)

<h2>{{ title }}.</h2>


<script type="text/javascript" src="/static/js/plupload.full.min.js"></script>
<div class="container">

<div class="row">
    %if author:
    <form  class="form-inline form-right"  action="upload?page={{ thispage }} " method="post" enctype="multipart/form-data">
        <div class="form-group">
              <input id="image" type="file" name="data">
        </div>
        <div class="form-group">
        <input class="btn btn-primary"  type="submit" value="上传图片" />
        </div>
    </form>
    %end
</div>

<div class="row">
  	<div class="thumbnail-pagediv">
		%for p in photos:
		<img class="thumbnail-imgpage" src="{{ p.url}}" alt="{{ p.name }}">
		%end
	</div>
</div>

<div class="row">
  <table class="table table-striped">
		<caption>图片集</caption>
		<thead>
			<tr>
				<th></th>
				<th>图片</th>
                <th>类型</th>
				<th>大小</th>
                <th>链接</th>
				<th>日期</th>
                <th>作者</th>
                <th></th>
			</tr>
		</thead>
		<tbody>
			%for p in photos:
			<tr>
				<td>{{p.id}}</td>
				<td>{{p.name}}</td>
                <td>{{p.ext }}</td>
				<td>{{p.size}}</td>
                <td>{{p.url }}</td>
				<td>{{p.update}}</td>
                <td>{{p.author.nick }}</td>
				<td>
                    %if author:
                    <a href="/del/{{ p.id }}?page={{ thispage }}">del</a>
                    %end
                </td>
			</tr>
			%end
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
                    <a href="/photo?page={{ i }}">{{ i }}</a></li>
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
