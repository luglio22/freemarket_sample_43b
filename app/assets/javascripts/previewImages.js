$(document).on("turbolinks:load", function(){
  //画像の枚数に応じて枠を調節する
  function previewSize(){
    var text = $(".image-message");
    var field = $('.product-image__upload');
    const threePictures = 3;
    const fourPictures = 4;
    if($('li').length === threePictures){
      field.show();
      text.hide();
    }else if($('li').length === fourPictures){
      field.hide();
    }
    else{
      text.show();
      field.show();
    }
  }
  $('.image-preview--lists').load('DOMSubtreeModified propertychange',function(){
    previewSize();
  })
  $('.image-preview--lists').on('DOMSubtreeModified propertychange',function(){
    previewSize();
  })
  //保存前のプレビュー
  function buildPreviewHTML(image){
    var preview = `<li class="preview">
                      <div class="preview-file new-picture">
                        <img src=${image} class="">
                      </div>
                      <div class="preview-delete">
                        <a href="" id="delete-btn" class="preview-delete--btn delete-preview">削除</a>
                      </div>
                  </li>
                  `;
    return preview;
  }
  //プレビューの表示
  function addPreview(file){
    reader = new FileReader();
    if(file.type.indexOf("image") < 0){
      return false;
    }
    reader.onload = (function(e){
      return function(e){
        var image = e.target.result;
        var preview = buildPreviewHTML(image);
        $('.image-preview--lists').append(preview);
      };
    })(file);
    reader.readAsDataURL(file);
  }
  //ファイルの追加
  $(".product-image__upload").change('input[type="file"]',function(event){
    var files = event.target.files;
    for (var i = 0; i < files.length; i++) {
      addPreview(files[i]);
    }
  });
  //   //ドラッグの処理を止める
  window.addEventListener('dragover', function(event) {
      event.preventDefault();
  }, false);
  // //ドロップした時の処理
  window.addEventListener('drop', function(event) {
    event.preventDefault();
    var files = event.dataTransfer.files;
    for (var i = 0; i < files.length; i++) {
      addPreview(files[i]);
      imageFileUpload(files[i]);
    };
  });
  //プレビューを削除
  $(document).on("click",'.delete-preview',function(e){
    e.preventDefault();
    $(this).parents('.preview').remove();
  })
  // // ファイルアップロード
  function imageFileUpload(f) {
    var formData = new FormData();
    formData.append('name', f);
    var url = location.href;
    url = url.replace(/edit/g, 'images')
    $.ajax({
      type: 'POST',
      contentType: false,
      processData: false,
      url: url,
      data: formData,
      dataType: 'json'
    })
    .done(function(file) {
      addPreview(file);
    })
    .fail(function(){
      return false;
    })
  };
  //イメージの削除
  $('.delete-picture').click(function(event){
    event.preventDefault();
    let href = $(this).attr('href');
    let deleteId = $(this).data('id');
    $.ajax({
      type: 'DELETE',
      dataType: 'json',
      url: href,
      data: (JSON.stringify({deleteId: deleteId})),
      contentType: false,
      processData: false
    })
    .done(function(image) {
      $(`.preview[data-id=${deleteId}]`).remove();
      return false;
    })
    .fail(function() {
      return false;
    })
  })
});
