//显示附件名
function show_preFile(){
	if(typeof($("#filePreview li a").first().html()) != "undefined"){
		var text_v = "";
		var text_vv = "";
		text_v = $("#filePreview")[0].innerHTML.replace(/×/g,"");
		$("#view_file").html(text_v);
		for(var i=1;i<=$("#view_file li").length;i++){
			var fileName = $("#view_file").find('li:eq('+(i-1)+')').find('a:eq(0)');
			if(fileName != null || fileName != undefined){
				var name = fileName[0].innerText;
				$("#view_file").find('li:eq('+(i-1)+')').find('a:eq(0)').attr("download",name);
			}
		}
	}
	for(var i=1;i<=$("#filePreview li").length;i++){
		var fileName = $("#filePreview li a")[i-1];
		if(fileName != null || fileName != undefined){
			var name = fileName.innerText.substring(0,fileName.innerText.indexOf("×"));
			$("#filePreview").find('li:eq('+(i-1)+')').find('a:eq(0)').attr("download",name);
		}
	}
}
function search_event(){
	$("ul.nav.nav-tabs").append('<li style="float:right;"><a id="show_search" href="javascript:show_search();">搜索</a><a id="hide_search" href="javascript:hide_search();">隐藏</a></li>');
	$("#searchForm").hide();
	$("#hide_search").hide();
}
function show_search(){
	$("#searchForm").show();
	$("#show_search").hide();
	$("#hide_search").show();
}
function hide_search(){
	$("#searchForm").hide();
	$("#show_search").show();
	$("#hide_search").hide();
}
