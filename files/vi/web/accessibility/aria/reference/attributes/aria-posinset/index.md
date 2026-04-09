---
title: "ARIA: thuộc tính aria-posinset"
short-title: aria-posinset
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-posinset
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-posinset
sidebar: accessibilitysidebar
---

Thuộc tính `aria-posinset` xác định số thứ tự hoặc vị trí của một phần tử trong tập hiện tại của listitem hoặc treeitem khi không phải tất cả các mục đều có mặt trong DOM.

## Mô tả

Viết tắt của "position in set", thuộc tính `aria-posinset` xác định vị trí của phần tử trong toàn bộ tập listitem hoặc treeitem khi chỉ có một phần các mục hiện diện trong DOM.

Nếu tất cả các mục trong danh sách đều có trong DOM, trình duyệt có thể tự tính tổng số và vị trí của từng mục, nên `aria-posinset` là không cần thiết. Khi chỉ có một phần của tập nằm trong DOM, hãy thêm `aria-posinset` để cung cấp thông tin về vị trí của phần tử trong tập cùng với [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize) để cho người dùng biết toàn bộ tập có bao nhiêu mục.

Ví dụ sau cho thấy một listbox với bốn tùy chọn trên tổng số 118 nguyên tố trong bảng tuần hoàn.

```html
<h2 id="periodic-table">Periodic table of chemical elements</h2>
<ul role="listbox" aria-labelledby="periodic-table">
  <li role="option" aria-setsize="118" aria-posinset="1">Hydrogen</li>
  <li role="option" aria-setsize="118" aria-posinset="3">Lithium</li>
  <li role="option" aria-setsize="118" aria-posinset="11">Sodium</li>
  <li role="option" aria-setsize="118" aria-posinset="19">Potassium</li>
</ul>
```

Giá trị của mỗi `aria-posinset` là một số nguyên lớn hơn hoặc bằng `1`, và nhỏ hơn hoặc bằng kích thước của tập khi kích thước đó đã biết.

> [!NOTE]
> Khi dùng `aria-posinset`, bạn cũng phải bao gồm giá trị cho [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize), tức kích thước của toàn bộ tập. Nếu kích thước của toàn bộ tập chưa biết, hãy đặt `aria-setsize="-1"`.

Với [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role), [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role), hoặc [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role), hãy đặt giá trị `aria-posinset` theo tổng số mục trong menu, không tính các separator.

Trong một [`feed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/feed_role), mỗi phần tử {{HTMLElement('article')}} có `aria-posinset` được đặt thành một giá trị biểu thị vị trí của nó trong feed, cùng với `aria-setsize` được đặt bằng số bài viết đã tải hoặc tổng số bài viết trong feed, tùy giá trị nào hữu ích hơn cho người dùng.

## Giá trị

- `<integer>`
  - : Số nguyên lớn hơn hoặc bằng 1, và nhỏ hơn hoặc bằng giá trị của `aria-setsize`.

## Giao diện liên quan

- {{domxref("Element.ariaPosInSet")}}
  - : Thuộc tính [`ariaPosInSet`](/en-US/docs/Web/API/Element/ariaPosInSet), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-posinset`.
- {{domxref("ElementInternals.ariaPosInSet")}}
  - : Thuộc tính [`ariaPosInSet`](/en-US/docs/Web/API/ElementInternals/ariaPosInSet), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-posinset`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`article`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/article_role)
- [`associationlistitemkey`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`associationlistitemvalue`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`comment`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/comment_role)
- [`listitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listitem_role)
- [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role)
- [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role)
- [`radio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role)
- [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role)

Kế thừa vào các vai trò:

- [`comment`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/comment_role)
- [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role)
- [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role)
- [`treeitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize)
