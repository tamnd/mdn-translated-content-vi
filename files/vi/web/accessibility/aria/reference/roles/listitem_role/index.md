---
title: "ARIA: vai trò listitem"
short-title: listitem
slug: Web/Accessibility/ARIA/Reference/Roles/listitem_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#listitem
sidebar: accessibilitysidebar
---

Vai trò ARIA `listitem` có thể được dùng để xác định một mục bên trong danh sách các mục. Nó thường được dùng cùng với vai trò [`list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role), được dùng để xác định một vùng chứa danh sách.

```html
<section role="list">
  <div role="listitem">Mục danh sách 1</div>
  <div role="listitem">Mục danh sách 2</div>
  <div role="listitem">Mục danh sách 3</div>
</section>
```

## Mô tả

Bất kỳ nội dung nào gồm một vùng chứa bên ngoài với một danh sách các phần tử bên trong đều có thể được xác định cho công nghệ hỗ trợ bằng các vùng chứa `list` và `listitem` tương ứng.

Không có quy tắc cứng nhắc nào về việc nên dùng phần tử nào để đánh dấu danh sách và các mục danh sách, nhưng bạn nên bảo đảm các mục danh sách có ý nghĩa trong ngữ cảnh của một danh sách, ví dụ danh sách mua sắm, các bước công thức, hướng dẫn đường đi.

> [!NOTE]
> Nếu có thể trong công việc của bạn, bạn nên dùng các phần tử HTML ngữ nghĩa phù hợp để đánh dấu một danh sách và các listitem của nó — {{HTMLElement("ul")}}/{{HTMLElement("ol")}} và {{HTMLElement("li")}}. Xem [Thực hành tốt nhất](#best_practices) để xem ví dụ đầy đủ.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role)
  - : Một danh sách các mục. Các phần tử có vai trò `list` phải có một hoặc nhiều phần tử có vai trò `listitem` làm phần tử con, hoặc một hay nhiều phần tử có vai trò `group` có một hoặc nhiều phần tử có vai trò `listitem` làm phần tử con.
- [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
  - : Một tập hợp các đối tượng liên quan, bị giới hạn thành các mục danh sách khi lồng trong một danh sách, không đủ quan trọng để có vị trí riêng trong mục lục của trang.

## Thực hành tốt nhất

Chỉ dùng `role="list"` và `role="listitem"` nếu bạn buộc phải làm vậy - ví dụ nếu bạn không kiểm soát HTML nhưng vẫn có thể cải thiện trợ năng động bằng JavaScript sau đó.

Nếu có thể, bạn nên dùng các phần tử HTML ngữ nghĩa phù hợp để đánh dấu một danh sách và listitem — {{HTMLElement("ol")}}, {{HTMLElement("ul")}} và {{HTMLElement("li")}}. Ví dụ, phần trên của chúng ta nên được viết lại như sau:

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

> [!NOTE]
> Việc tạo kiểu cho một danh sách bằng `list-style: none;` trong CSS sẽ loại bỏ ngữ nghĩa danh sách. Thêm `role="listitem"` sẽ khôi phục ngữ nghĩa.

> [!NOTE]
> Nếu bạn đang đánh dấu một danh sách các mục sẽ hoạt động như một giao diện tab, hãy dùng các vai trò [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role), [`tabpanel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role), và [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role) thay thế.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử HTML [`<li>`](/en-US/docs/Web/HTML/Reference/Elements/li)
- Phần tử HTML [`<ul>`](/en-US/docs/Web/HTML/Reference/Elements/ul)
- Phần tử HTML [`<ol>`](/en-US/docs/Web/HTML/Reference/Elements/ol)
- [vai trò `list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role)
- [vai trò `group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
- [Accessibility Object Model](https://wicg.github.io/aom/spec/)
- [ARIA in HTML](https://w3c.github.io/html-aria/)
- [Ví dụ danh sách ARIA](https://www.scottohara.me/blog/2018/05/26/aria-lists.html) - bởi Scott O'Hara
