<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link rel="stylesheet" href="./dist/jquery.timeline.min.css">
<script src="./dist/jquery.timeline.min.js"></script>
<html>
<head>
	<title>Home</title>
<script>
$(function () {
    $("#myTimeline").Timeline()
})
</script>
</head>
<body>
<h1>
</h1>
<!-- Timeline Block -->
<div id="myTimeline">
  <ul class="timeline-events">
    <li data-timeline-node="{ start:'2019-02-26 10:00',end:'2019-02-26 13:00',content:'<p>Event Body...</p>' }">Event Label</li>
    <li data-timeline-node="{ start:'2019-03-01 23:10',end:'2019-03-02 1:30' }">
      <span class="event-label">Event Label</span>
      <span class="event-content"><p>Event Body...</p></span>
    </li>
  </ul>
</div>
</body>
</html>
