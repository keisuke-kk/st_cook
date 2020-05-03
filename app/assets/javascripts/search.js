$(function() {

  var search_list = $(".contents.row");

  function appendCategory(category) {
    if(category.user_sign_in && category.user_sign_in.id == category.user_id){
      var current_user = `<li>
                            <a href="/categories/${category.id}/edit" data-method="get" >編集</a>
                          </li>
                          <li>
                            <a href="/categories/${category.id}" data-method="delete" >削除</a>
                          </li>`
    } else {
      var current_user = ""
    }

    var html = `<div class="content_post" style="background-image: url(${category.image});">
                  <div class="more">
                    <span><img src="/assets/arrow_top.png"></span>
                    <ul class="more_list">
                      <li>
                        <a href="/categories/${category.id}" data-method="get" >詳細</a>
                      </li>
                      ${current_user}
                    </ul>
                  </div>
                  <p>${category.name}</p><br>
                  <span class="name">
                    <a href="/users/${category.user_id}">
                      <span>投稿者</span>${category.nickname}
                    </a>
                  </span>
                </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/categories/searches',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(categories) {
      $(".contents.row").empty();
      if (categories.length !== 0) {
        categories.forEach(function(category){
          appendCategory(category);
        });
      } else {
        appendErrMsgToHTML("一致するカテゴリーがありません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});