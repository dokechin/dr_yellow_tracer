function l(string) {
  var localized = string.toLocaleString();
  return localized;
}
function upload_by_file(){

  var form = $('#myform').get()[0];
   
    // FormData オブジェクトを作成
  var formData = new FormData( form );

  var title = document.getElementById("title").value;

  if (title.length == 0){
    alert(l("Please input title."));
    return;
  }
  if (title.length >100 ){
    alert( l("Title length over 100 byte."));
    return;
  }

  var file = document.getElementById("uploadfile").files[0];
  var ext = getExtension(file.name);
  if (file.size > 4000000 ){
    alert( l("File size over 4M."));
    return;
  }

  $.blockUI({ message: '<h1><img src="/img/loading.gif" /> Just a moment...</h1>' });
  $.ajax({
    type: "post",
    url: "/upload",
    data : formData,
    processData: false,
    contentType: false,
    dataType: 'json',
    success: function(data){
      $.unblockUI();
      console.log(data.id);
      var li = document.createElement('li');
      li.setAttribute("class", "list-group-item");
      var a = document.createElement('a');
      var title = document.createTextNode(data.title);
      a.appendChild(title);
      a.setAttribute("href", "/sound/" + data.id );
      li.appendChild(a);
      var recordingslist = document.getElementById("recordingslist");
      recordingslist.appendChild(li);
    },
  error: function(){
      $.unblockUI();
      console.log("failed");
    }
  });

}

function upload(type){

  var title = document.getElementById("title").value;
  var csrf_token = document.getElementById("csrf_token").value;
  var soundtype = document.getElementById("soundtype").value;
  var id = null;
  if (type == "mix"){
    id = document.getElementById("id").value;
  }

  if (title.length == 0){
    alert(l("Please input title."));
    return;
  }
  if (title.length >100 ){
    alert( l("Title length over 100 byte."));
    return;
  }
  if (blob.size > 4000000 ){
    alert( l("File size over 4M."));
    return;
  }

  var arrayBuffer;
  var fileReader = new FileReader();
  fileReader.onload = function() {

      var formData = new FormData();
      formData.append("audio",blob,"audio.mp3");
      formData.append("title",title);
      formData.append("csrf_token",csrf_token);
      formData.append("soundtype",soundtype);

      if (id){
        formData.append("id", id);
      }

      $.blockUI({ message: '<h1><img src="/img/loading.gif" />' + l('Just a Moment ...')  + '</h1>' });

      $.ajax({
        type: "post",
        url: "/upload",
        data : formData,
        processData: false,
        contentType: false,
        dataType: 'json',
        success: function(data){
          $.unblockUI();
          var li = document.createElement('li');
          li.setAttribute("class", "list-group-item");
          var a = document.createElement('a');
          var title = document.createTextNode(data.title);
          a.setAttribute("href","./sound/" + data.id );
          a.appendChild(title);
          li.appendChild(a);
          var recordingslist = document.getElementById("recordingslist");
          recordingslist.appendChild(li);

        },
      error: function(){
          $.unblockUI();
          alert(l("file_upload_failed"));
        }
      });

  };

  fileReader.readAsArrayBuffer(blob);

}

function startPlay(song){
  $("#audio_src").attr("src", "/audio/" + song );

  var audio = document.getElementById("audio");
  audio.load();
  audio.play();

}

function stopPlay(){
  audio.pause();
  audio.currentTime = 0;
}

