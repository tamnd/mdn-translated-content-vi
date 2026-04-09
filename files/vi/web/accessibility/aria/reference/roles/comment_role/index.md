---
title: "ARIA: vai trò comment"
short-title: comment
slug: Web/Accessibility/ARIA/Reference/Roles/comment_role
page-type: aria-role
sidebar: accessibilitysidebar
---

Vai trò `comment` về mặt ngữ nghĩa biểu thị một bình luận/phản hồi cho một nội dung nào đó trên trang, hoặc cho một bình luận trước đó.

> [!NOTE]
> Vai trò comment được đề xuất trong WAI-ARIA 1.3 ([bản thảo ARIA mới nhất](https://w3c.github.io/aria/)), vẫn đang trong quá trình soạn thảo.

## Ví dụ

Trong ví dụ sau, chúng ta có một phần của tài liệu đã được bình luận. Phần được bình luận được đánh dấu bằng `<span role="mark">`.

Bình luận liên quan được đánh dấu bằng một cấu trúc HTML bọc trong phần tử `<div>` có chứa `role="comment"`.

```html
<p>
  Phần sau của bài hát là một đoạn crescendo tăng dần chậm, đạt đỉnh ở
  <span role="mark" aria-details="thread-1">đoạn cuối của đoạn solo guitar</span>,
  rồi nhanh chóng lắng xuống.
</p>

<div role="comment" id="thread-1" data-author="chris">
  <h3>Chris đã nói</h3>
  <p class="comment-text">Tôi thực sự nghĩ đoạn này nên có thêm cowbell.</p>
  <p><time datetime="2019-03-30T19:29">30 tháng 3, 2019, 19:29</time></p>
</div>
```

Để liên kết bình luận với đoạn văn bản được bình luận, chúng ta cần bọc văn bản đó bằng một phần tử có thuộc tính [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details), với giá trị là ID của bình luận.

### Nhiều bình luận

Vì `aria-details` giờ có thể nhận nhiều ID, chúng ta có thể liên kết nhiều bình luận với cùng một chú thích, như sau:

```html
<p>
  Phần sau của bài hát là một đoạn crescendo tăng dần chậm, đạt đỉnh ở
  <mark aria-details="thread-1 thread-2">đoạn cuối của đoạn solo guitar</mark>, rồi
  nhanh chóng lắng xuống.
</p>

<div role="comment" id="thread-1" data-author="chris">
  <h3>Chris đã nói</h3>
  <p class="comment-text">Tôi thực sự nghĩ đoạn này nên có thêm cowbell.</p>
  <p><time datetime="2019-03-30T19:29">30 tháng 3, 2019, 19:29</time></p>
</div>

<div role="comment" id="thread-2" data-author="chris">
  <h3>Marcus đã nói</h3>
  <p class="comment-text">
    Đoạn solo guitar có thể dùng thêm chút chorus, và giảm âm lượng một chút.
  </p>
  <p><time datetime="2019-03-29T15:35">29 tháng 3, 2019, 15:35</time></p>
</div>
```

### Bình luận lồng nhau

Có thể lồng các bình luận vào nhau, như sau:

```html
<div role="comment" id="thread-1" data-author="chris">
  <h3>Chris đã nói</h3>
  <p class="comment-text">Tôi thực sự nghĩ đoạn này nên có thêm cowbell.</p>
  <p><time datetime="2021-03-30T19:29">30 tháng 3, 2021, 19:29</time></p>

  <div role="comment" data-author="marcus">
    <h3>Marcus đã trả lời</h3>
    <p class="comment-text">
      Tôi không chắc về điều đó. Tôi nghĩ cowbell có thể làm phân tán phần solo.
    </p>
    <p><time datetime="2021-03-30T21:02">30 tháng 3, 2021, 21:02</time></p>
  </div>
</div>
```

## Khả năng truy cập

Không có.

## Đặc tả

Sẽ là một phần của WAI-ARIA 1.3, vẫn đang trong quá trình soạn thảo.
