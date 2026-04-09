---
title: "ARIA: vai trò article"
short-title: article
slug: Web/Accessibility/ARIA/Reference/Roles/article_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#article
  - https://www.w3.org/WAI/ARIA/apg/patterns/feed/examples/feed/
sidebar: accessibilitysidebar
---

Vai trò `article` chỉ ra một phần của trang có thể đứng độc lập trên một trang, trong một tài liệu hoặc trên một website. Nó thường được đặt trên các mục nội dung liên quan như bình luận, bài đăng diễn đàn, bài báo hoặc các mục khác được nhóm lại trên cùng một trang.

```html
<div role="article">
  <h2>Tiêu đề của đoạn nội dung</h2>
  <p>Đoạn văn cho phần nội dung.</p>
  <p>Đoạn văn khác.</p>
  Các điều khiển để tương tác với bài viết, chia sẻ nó, v.v.
</div>
<div role="article">…</div>
```

Ví dụ này cho thấy hai bài viết nằm cạnh nhau trên cùng một trang, có thể được cấu trúc tương tự và có liên hệ với nhau.

> [!NOTE]
> Thay vì dùng một `<div>` với vai trò `article`, hãy dùng phần tử {{HTMLElement('article')}}. **Luôn dùng phần tử gốc nếu có sẵn**

Đừng dùng `role="article"`. Thay vào đó hãy dùng phần tử `<article>`.

```html
<article>
  <h2>Tiêu đề của đoạn nội dung</h2>
  <p>Đoạn văn cho phần nội dung.</p>
  <p>Đoạn văn khác.</p>
  Các điều khiển để tương tác với bài viết, chia sẻ nó, v.v.
</article>
<article>…</article>
```

## Mô tả

Vai trò [cấu trúc tài liệu](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#1._document_structure_roles) `article` biểu thị một phần của tài liệu, trang hoặc site mà nếu đứng một mình thì có thể được xem như một tài liệu, trang hoặc site hoàn chỉnh. Mục tiêu của một tập hợp các phần article là để chỉ ra mối quan hệ giữa chúng.

Các article không được xem là một landmark điều hướng, nhưng nhiều công nghệ hỗ trợ có hỗ trợ landmark cũng hỗ trợ cách điều hướng giữa các article. Chúng cũng có thể hỗ trợ chỉ ra mối quan hệ lồng nhau trong các article.

Article có thể được lồng vào nhau, cho thấy một article lồng bên trong có liên quan trực tiếp đến article chứa nó, nhưng không nhất thiết liên quan đến các article ở ngoài thứ bậc lồng nhau. Hãy tham khảo các ví dụ để biết trường hợp sử dụng cụ thể.

Nếu một article là một phần của feed, nó có thể có các thuộc tính [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset) và [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize) để cho biết vị trí của article này trong feed.

Bên trong `application` hoặc widget khác khiến trình đọc màn hình và các công nghệ hỗ trợ khác ở chế độ chuyển tiếp, article có thể được dùng để chỉ ra rằng chúng nên chuyển lại sang coi nội dung bên trong là nội dung web bình thường.

Thay vì thêm vai trò `article` vào một phần tử không mang ngữ nghĩa, nên dùng phần tử {{HTMLElement('article')}}. User agent sẽ chuyển điều này thành thông tin trợ năng phù hợp giống như vai trò `article`. Dùng phần tử {{HTMLElement('article')}} cũng giúp công cụ tìm kiếm phát hiện tốt hơn cấu trúc của trang. Các ví dụ sử dụng phù hợp của `role="article"`, hoặc tốt hơn là `<article>`, bao gồm bài đăng blog, bài viết diễn đàn, bình luận cho bài viết blog hoặc diễn đàn, hay một mục trong luồng mạng xã hội.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset)
  - : Trong ngữ cảnh của feed, cho biết vị trí của article cụ thể này trong feed, dựa trên số đếm bắt đầu từ 1.
- [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize)
  - : Trong ngữ cảnh của feed, cho biết có bao nhiêu mục article trong feed đó.

### Tương tác bàn phím

Vai trò này không hỗ trợ tương tác bàn phím cụ thể nào.

### Các tính năng JavaScript bắt buộc

- Bộ xử lý sự kiện
  - : Vai trò này không yêu cầu có bộ xử lý sự kiện nào.
- Thay đổi giá trị thuộc tính
  - : Khi xây dựng feed, hãy đặt các thuộc tính `aria-posinset` và `aria-setsize` trên mỗi article với các giá trị phù hợp, lưu ý rằng `aria-posinset` dựa trên chỉ số bắt đầu từ 1.

> [!NOTE]
> **Luôn dùng phần tử gốc nếu có sẵn.** Thay vì dùng một `<div>` với vai trò `article`, hãy dùng phần tử `<article>`.

## Ví dụ

- [Hiển thị feed đề xuất nhà hàng](https://www.w3.org/WAI/ARIA/apg/patterns/feed/examples/feed-display.html) cùng với [tài liệu riêng](https://www.w3.org/WAI/ARIA/apg/patterns/feed/examples/feed/) từ mẫu thiết kế feed của WAI-ARIA 1.1

## Đặc tả

{{Specifications}}

## Thứ tự ưu tiên

Vai trò này tương ứng với phần tử {{HTMLElement('article')}} trong HTML, và nên dùng phần tử đó thay thế nếu có thể. Vai trò này không yêu cầu bất kỳ vai trò cụ thể nào trong các phần tử con của nó. Đây là vai trò duy nhất được phép làm phần tử con trực tiếp của phần tử có vai trò [`feed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/feed_role).

## Xem thêm

- [vai trò `feed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/feed_role)
- [vai trò `section`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/section_role)
- Phần tử {{HTMLElement('article')}} của HTML
- Định nghĩa trong bảng chú giải {{Glossary("RSS")}}
