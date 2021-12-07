<h1>lecture-20</h1>

<p>Home task lecture 20:</p>
<ol>
<li>New git repo</li>
<li>all best practices (gitignore, README etc)</li>
<li>base on modules hometask #18</li>
<li>add web module</li>
<li>add spring dispatcher servlet</li>
<li>add spring context</li>
<li>deploy to servlet container per student</li>
</ol>


<h2>What's done:</h2>
<ol>
<li>Added practice (gitignore, README, etc ;-)</li>
<li>Added modules from hometask #18</li>
<li>Added service module</li>
<li>Added web module with controller</li>
<li>Added spring context to multi module App</li>
<li>Deployed with tomcat server on path: /goods</li>
</ol>

<h3>To run App you should:</h3>
<ol>
<li>Build project: $mvn clean install</li>
<li>Run new postgresql server for the App: $docker-compose up -d</li>
<li>Run liquibase to create tables and insert data:</li>
	<ol>
		<li>$cd persistence</li>
		<li>$mvn liquibase:update</li>
	</ol>
<li>Run App on server mapped on /goods</li>
</ol>