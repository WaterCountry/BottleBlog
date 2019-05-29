% rebase('layout.tpl', title=title)

<h2>{{ title }}.</h2>


<script type="text/javascript" src="/static/js/plupload.full.min.js"></script>
<div class="container">

<div class="row">
	<div id="filelist">Your browser doesn't have Flash, Silverlight or HTML5 support.</div>
	<br />

	<div id="container">
		<a id="pickfiles" href="javascript:;">[Select files]</a>
		<a id="uploadfiles" href="javascript:;">[Upload files]</a>
	</div>

	<br />
	<pre id="console"></pre>
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
                <th>类型</th>
				<th>大小</th>
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
				<td>{{p.update}}</td>
                <td>{{p.author.nick }}</td>
				<td><a href="/del/{{ p.id }}?page={{ thispage }}">del</a> </td>
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

<script type="text/javascript">
// Custom example logic

var uploader = new plupload.Uploader({
	runtimes : 'html5,flash,silverlight,html4',
	browse_button : 'pickfiles', // you can pass an id...
	container: document.getElementById('container'), // ... or DOM Element itself
	url : '/upload?page={{ thispage }}',
    runtimes: 'html5',
	flash_swf_url : '/static/js/Moxie.swf',
	silverlight_xap_url : '/static/js/Moxie.xap',

	filters : {
		max_file_size : '10mb',
		mime_types: [
			{title : "Image files", extensions : "jpg,gif,png"},
			{title : "Zip files", extensions : "zip"}
		]
	},

	init: {
		PostInit: function() {
			document.getElementById('filelist').innerHTML = '';

			document.getElementById('uploadfiles').onclick = function() {
				uploader.start();
				return false;
			};
		},

		FilesAdded: function(up, files) {
			plupload.each(files, function(file) {
				document.getElementById('filelist').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b></div>';
			});
		},

		UploadProgress: function(up, file) {
			document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
		},

		Error: function(up, err) {
			document.getElementById('console').appendChild(document.createTextNode("\nError #" + err.code + ": " + err.message));
		}
	}
});

uploader.init();

</script>