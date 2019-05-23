% rebase('layout.tpl', title=title)

<h2>{{ title }}.</h2>


<div class="container">

<div class="row">
    <form  class="form-inline form-right"  action="/upload " method="post" enctype="multipart/form-data">
        <div class="form-group">
              <input id="image" type="file" name="image">
        </div>
        <div class="form-group">
        <input class="btn btn-primary"  type="submit" value="上传图片" />
        </div>
    </form>
</div>

<div class="row">
  	<div class="thumbnail-pagediv">
		%for p in photos:
		<img class="thumbnail-imgpage" src="{{ p.url}}"
		alt="{{ p.name }}">
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
				<th>大小</th>
				<th>日期</th>
                <th>作者</th>
			</tr>
		</thead>
		<tbody>
			%for p in photos:
			<tr>
				<td>{{p.id}}</td>
				<td>{{p.name}}</td>
				<td>{{p.size}}</td>
				<td>{{p.update}}</td>
                <td>{{p.author.nick }}</td>
			</tr>
			%end
		</tbody>
	</table>
</div>

</div>