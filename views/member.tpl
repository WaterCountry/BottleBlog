% rebase('layout.tpl', title=title)

<h2>{{ title }}.</h2>
<hr>
<ul>
    %for k in nicks:
    <li>
        <h3> {{k}}</h3>
    </li>
    %end
</ul>

