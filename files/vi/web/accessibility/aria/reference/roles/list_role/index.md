---
title: "ARIA: vai trò list"
short-title: list
slug: Web/Accessibility/ARIA/Reference/Roles/list_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#list
sidebar: accessibilitysidebar
---

Vai trò ARIA `list` có thể được dùng để xác định một danh sách các mục. Nó thường được dùng cùng với vai trò `listitem`, được dùng để xác định một mục danh sách nằm bên trong danh sách.

```html
<div role="list">
  <div role="listitem">Mục danh sách 1</div>
  <div role="listitem">Mục danh sách 2</div>
  <div role="listitem">Mục danh sách 3</div>
</div>
```

## Mô tả

Bất kỳ nội dung nào gồm một vùng chứa bên ngoài với một danh sách các phần tử bên trong đều có thể được xác định cho công nghệ hỗ trợ bằng các vùng chứa `list` và `listitem` tương ứng. Một `list` chỉ có thể chứa từ 0 trở lên các phần tử con `listitem`.

Không có quy tắc cứng nhắc nào về việc nên dùng phần tử nào để đánh dấu danh sách và các mục danh sách, nhưng bạn nên bảo đảm các mục danh sách có ý nghĩa trong ngữ cảnh của một danh sách, ví dụ danh sách mua sắm, các bước công thức, hướng dẫn đường đi.

> [!NOTE]
> Thực hành tốt nhất khuyên dùng các phần tử HTML ngữ nghĩa phù hợp thay vì vai trò ARIA để đánh dấu danh sách và các listitem - {{HTMLElement("ul")}}, {{HTMLElement("ol")}} và {{HTMLElement("li")}}. Xem [Thực hành tốt nhất](#best_practices) để xem ví dụ đầy đủ.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- vai trò [`listitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listitem_role)
  - : Một mục đơn lẻ trong danh sách. Các phần tử có vai trò `listitem` chỉ có thể xuất hiện trong một phần tử có vai trò `list`.

## Thực hành tốt nhất

Chỉ dùng `role="list"` và `role="listitem"` nếu bạn buộc phải làm vậy - ví dụ nếu bạn không kiểm soát HTML nhưng vẫn có thể cải thiện trợ năng động bằng JavaScript sau đó.

Không giống HTML {{HTMLElement("ol")}} và {{HTMLElement("ul")}}, vai trò ARIA `list` không phân biệt giữa danh sách có thứ tự và không có thứ tự. Nếu có thể, bạn nên dùng các phần tử HTML ngữ nghĩa phù hợp để đánh dấu danh sách ({{HTMLElement("ol")}} và {{HTMLElement("ul")}}) và các mục danh sách ({{HTMLElement("li")}}). Ví dụ, phần trên của chúng ta nên được viết lại như sau:

```html
<ul>
  <li>Mục danh sách 1</li>
  <li>Mục danh sách 2</li>
  <li>Mục danh sách 3</li>
</ul>
```

hoặc dùng danh sách có thứ tự nếu thứ tự của các mục danh sách là quan trọng:

```html
<ol>
  <li>Mục danh sách 1</li>
  <li>Mục danh sách 2</li>
  <li>Mục danh sách 3</li>
</ol>
```

> [!NOTE]
> Các vai trò ARIA `list` / `listitem` không phân biệt giữa danh sách có thứ tự và không có thứ tự.

Ngoài ra, hãy lưu ý rằng nếu bạn dùng các phần tử HTML ngữ nghĩa `<ol>` hoặc `<ul>` và áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role), mỗi phần tử `<li>` con sẽ kế thừa vai trò `presentation` vì ARIA yêu cầu các phần tử `listitem` phải có phần tử cha `list`. Vì vậy, các phần tử `<li>` không được công nghệ hỗ trợ bộc lộ, nhưng các phần tử nằm bên trong những `<li>` đó, bao gồm cả danh sách lồng nhau, vẫn hiển thị với công nghệ hỗ trợ.

> [!NOTE]
> Nếu bạn đang đánh dấu một danh sách các mục sẽ hoạt động như một giao diện tab, hãy dùng các vai trò [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role), [`tabpanel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role), và [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role) thay thế.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử {{HTMLElement("ul")}}
- Phần tử {{HTMLElement("ol")}}
- Phần tử {{HTMLElement("li")}}
- [vai trò `listitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listitem_role)
- [Ví dụ danh sách ARIA](https://www.scottohara.me/blog/2018/05/26/aria-lists.html) - bởi Scott O'Hara
- [Accessibility Object Model](https://wicg.github.io/aom/spec/)
- [ARIA in HTML](https://w3c.github.io/html-aria/)
