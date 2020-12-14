import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // 名前
    const name = document.querySelector('.user-nickname').textContent;
    const name_id = data.content.user_id
    const name_a = document.createElement('a');
    name_a.setAttribute('class', 'comment-name')
    name_a.setAttribute('src', `users/${name_id}`)
    name_a.insertAdjacentHTML('afterbegin', name);
    
    // 時間
    const time = document.createElement('p');
    time.setAttribute('class', 'comment-time')
    time.insertAdjacentHTML('afterbegin', data.content.created_at);
    
    // コメント内容
    const text = document.createElement('p');
    text.setAttribute('class', 'comment-list')
    text.insertAdjacentHTML('afterbegin', data.content.content);
    
    // 収納するdiv
    const div = document.createElement('div');
    div.setAttribute('class', 'comment-list');

    // コメント内に名前と時間を挿入
    div.appendChild(name_a);
    div.appendChild(time);
    div.appendChild(text);

    // "コメント一覧"の下にコメントを挿入＆コメント欄をリセット
    const comments = document.querySelector('.comments-index');
    const newComment = document.querySelector('.comment-text');
    comments.after(div);
    newComment.value='';
  }
});
