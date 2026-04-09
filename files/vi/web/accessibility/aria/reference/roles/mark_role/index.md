---
title: "ARIA: vai trò mark"
short-title: mark
slug: Web/Accessibility/ARIA/Reference/Roles/mark_role
page-type: aria-role
sidebar: accessibilitysidebar
---

Vai trò `mark` chỉ nội dung được đánh dấu hoặc tô sáng nhằm mục đích tham chiếu hoặc ghi chú, do tính liên quan của nội dung trong ngữ cảnh bao quanh.

## Mô tả

Vai trò `mark` dùng để biểu thị ngữ nghĩa cho các phần tử HTML chứa văn bản được đánh dấu/tô sáng cho mục đích tham chiếu. Điều này tương đương về ngữ nghĩa với phần tử HTML {{HTMLElement('mark')}}. Nếu có thể, bạn nên dùng phần tử này thay thế.

Ví dụ sử dụng `mark` giống hệt phần tử `<mark>`. Chúng bao gồm việc tô sáng văn bản trong một đoạn trích dẫn có sự quan tâm đặc biệt nhưng không được đánh dấu trong tài liệu gốc, tương tự như dùng bút dạ để đánh dấu các đoạn trong bài viết in và chỉ ra các phần nội dung liên quan đến hoạt động hiện tại của người dùng, như tô sáng các kết quả khớp văn bản được tìm thấy bởi một tính năng tìm kiếm.

Đừng dùng `mark` chỉ để tạo kiểu trang trí như tô sáng cú pháp.

Phần tử `mark` không nên có tên truy cập được; cả thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) lẫn [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) đều bị cấm trên `mark`.

## Ví dụ

Trong ví dụ sau, chúng ta có một phần tài liệu đã được bình luận. Phần được bình luận được đánh dấu bằng `<span role="mark">`.

```html
<p>
  The last half of the song is a slow-rising crescendo that peaks at the
  <span role="mark" aria-details="thread-1">end of the guitar solo</span>,
  before fading away sharply.
</p>

<div role="comment" id="thread-1" data-author="chris">
  <h3>Chris said</h3>
  <p class="comment-text">I really think this moment could use more cowbell.</p>
  <p><time datetime="2022-03-30T19:29">March 30 2022, 19:29</time></p>
</div>
```

Bình luận liên quan được đánh dấu bằng một cấu trúc HTML bọc trong một {{HTMLElement('div')}} chứa [`role="comment"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/comment_role).

Để liên kết bình luận với đoạn văn bản được bình luận, cần bọc đoạn văn bản đó bằng một phần tử chứa thuộc tính [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details), trong đó giá trị là `id` của phần bình luận.

## Thực hành tốt nhất

### Ưu tiên HTML

Việc dùng phần tử {{HTMLElement('mark')}} sẽ tự động truyền đạt rằng một nút có vai trò `mark`. Nếu có thể, hãy ưu tiên dùng nó thay thế.

## Thông số kỹ thuật

Sẽ là một phần của [WAI-ARIA 1.3](https://w3c.github.io/aria/#mark), hiện vẫn đang được soạn thảo.

## Xem thêm

- Phần tử HTML {{HTMLElement('mark')}}
