---
title: "ARIA: vai trò suggestion"
short-title: suggestion
slug: Web/Accessibility/ARIA/Reference/Roles/suggestion_role
page-type: aria-role
sidebar: accessibilitysidebar
---

Vai trò `suggestion` về mặt ngữ nghĩa biểu thị một thay đổi được đề xuất cho một tài liệu có thể chỉnh sửa. Vai trò này nên được dùng trên một phần tử bao bọc một phần tử có vai trò `insertion`, và một phần tử có vai trò `deletion`.

## Ví dụ

Khi bạn có một thay đổi nội dung bao gồm cả một insertion _và_ một deletion, không có cách nào để người dùng trình đọc màn hình biết hai phần đó có liên quan hay không. Đó là công việc của `role="suggestion"`, nên được đặt trên một phần tử bao bọc cả hai như sau:

```html
<p>
  Freida's pet is a
  <span role="suggestion">
    <span role="deletion">black Cat called Luna</span>
    <span role="insertion">purple T. Rex called Tiny</span></span
  >.
</p>
```

Chúng ta thậm chí có thể cung cấp một hộp thông tin cho biết ai đã đưa ra đề xuất và khi nào, rồi liên kết nó với suggestion qua [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details):

```html
<p>
  Freida's pet is a
  <span role="suggestion" aria-details="comment-source">
    <span role="deletion">black Cat called Luna</span>
    <span role="insertion">purple T. Rex called Tiny</span></span
  >.
</p>

<div id="comment-source">
  Suggested by Chris,
  <time datetime="2019-03-30T19:29">March 30 2019, 19:29</time>
</div>
```

Trình duyệt thường cung cấp mặc định gạch ngang màu đen cho các deletion, và gạch dưới màu đen cho các insertion khi dùng các phần tử HTML vốn ngầm hiển thị các vai trò này. Nhưng khi dùng vai trò ARIA rõ ràng để sửa đổi các phần tử HTML, chẳng hạn div, bạn sẽ cần dùng CSS để tùy chỉnh kiểu hiển thị trực quan cho các deletion và insertion đó.

## Thực hành tốt nhất

### Ưu tiên HTML

Dùng các phần tử [`<ins>`](/en-US/docs/Web/HTML/Reference/Elements/ins) và [`<del>`](/en-US/docs/Web/HTML/Reference/Elements/del) sẽ tự động truyền đạt rằng một section có vai trò `insertion` hoặc `deletion`. Nếu có thể, hãy ưu tiên dùng các phần tử HTML.

## Đặc tả

Sẽ trở thành một phần của WAI-ARIA 1.3, vốn vẫn đang được soạn thảo.
