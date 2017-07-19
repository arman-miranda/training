

function handleFileSelect(evt) {
    $("output").empty();
    var files = evt.target.files; // FileList object
    var reader = new FileReader();

    reader.onload = (function(theFile) {
      return function(e) {
        $("output").html(['<img class="thumb" src="', e.target.result,
                          '" title="', escape(theFile.name), '"/>'].join(''));
      };
    })(files[0]);

    reader.readAsDataURL(files[0]);
}

  /*window.onload = function(){
    if (document.getElementById('user_avatar')){
      document.addEventListener('turbolinks:load', function(){
          document.getElementById('user_avatar').addEventListener('change', handleFileSelect, false);
      })
    }
  }*/

document.addEventListener("turbolinks:load", function(){
    if(document.getElementById('user_avatar')){
      document.getElementById('user_avatar').addEventListener('change',
      handleFileSelect, false);
    }
})
