<!DOCTYPE html>
<html lang="en">
    <head>
          <meta charset="utf-8">
          <title>Scatter Plot 3</title>
          <script src="https://d3js.org/d3.v3.min.js"></script>
          <!-- <script src="https://d3js.org/d3-queue.v3.min.js"></script> -->
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
          <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400' rel='stylesheet' type='text/css'>

	</head>

	<style>
		button
			{
			  height:30px;
			  width:150px;
			  border-radius:8px;
			  padding:10px;
			  font-size:12px;
			  font-family: 'Open Sans', sans-serif;
			  height:52px;
			  cursor:pointer;
			  background-color:wheat;
			}
	</style>

	<body>

		<div class='jumbotron'>
		       <div class='row'>
		              <div class='col-xs-4'><img class='img-responsive' src="IE_symbol.png" alt="IE_symbol"></div>
		              <div class='col-xs-8'>
		                     <h1>It looks like you are using Internet Explorer.</h1>
		                     <h4>This site has been created for optimal use with <a href="https://www.google.com/chrome/browser/desktop/" target="_blank">Google Chrome</a> or <a href="https://www.mozilla.org/en-US/firefox/new/" target="_blank">Mozilla Firefox</a></h4>

		                     <h4> Please copy the link below and open it in Chrome or Firefox browser:</br></h4>
		                     
		                     <h6 id = "link">http://htmlpreview.github.io/?https://github.com/spjoshi/cln2SupplementGraph/blob/master/nejm_V3_3_examples_Dev_OneFile_V2.aspx</h6>

		                     <button id = "button" onclick="copyToClipboard('#link'), changeButtonText()">Click Here to copy link</button>
		                     
		                     <script type="text/javascript">
		                     	function copyToClipboard(element) {
									  var $temp = $("<input>");
									  $("body").append($temp);
									  $temp.val($(element).text()).select();
									  document.execCommand("copy");
									  $temp.remove();
									}
								function changeButtonText() // no ';' here
										{
										    var elem = document.getElementById("button");
										    if (elem.innerHTML=="Click Here to copy link") elem.innerHTML = "Copied!";
										    else elem.innerHTML = "Click Here to copy link";
										}
		                     </script>
		              </div>
		       </div>
		</div>
	</body>
</html>

