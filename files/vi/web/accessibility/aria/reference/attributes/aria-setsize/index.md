---
title: "ARIA: thuộc tính aria-setsize"
short-title: aria-setsize
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-setsize
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-setsize
sidebar: accessibilitysidebar
---

Thuộc tính `aria-setsize` xác định số lượng mục trong tập hiện tại của listitem hoặc treeitem khi không phải tất cả các mục trong tập đều có mặt trong DOM.

## Mô tả

Trình duyệt tự động tính kích thước tập và vị trí cho từng mục trong một nhóm mục, như số lượng {{HTMLelement('li')}} trong một danh sách, các nút trong một nhóm [radio buttons](/en-US/docs/Web/HTML/Reference/Elements/input/radio) cùng tên, và các {{HTMLelement('option')}} trong một {{HTMLelement('select')}}. Công nghệ hỗ trợ, như bộ đọc màn hình, tận dụng trạng thái này để thông báo kích thước tập cho người dùng.

Khi DOM chưa đầy đủ, phép tính của trình duyệt về số lượng mục trong tập có thể không chính xác. Khi chỉ có một phần các mục, chẳng hạn list item, được tải vào DOM, trình duyệt chỉ tính số lượng dựa trên những mục hiện có. Thuộc tính `aria-setsize` nên được dùng để ghi đè số đếm không chính xác của trình duyệt. Nó xác định số lượng mục trong tập hiện tại của listitem hoặc treeitem nếu toàn bộ tập đã được tải.

Thuộc tính `aria-setsize` được đặt trên từng mục, thay vì trên bất kỳ phần tử chứa nào. Giá trị giống nhau cho từng mục: một số nguyên phản ánh số lượng mục trong tập đầy đủ, hoặc `-1` nếu kích thước tập chưa biết. Nếu tất cả các mục đều hiện diện trong DOM, trình duyệt có thể tự tính kích thước tập và vị trí của từng mục, khiến cả `aria-setsize` và `aria-posinset` đều không cần thiết.

Các phần tử có `aria-setsize` thường cũng đi kèm thuộc tính [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset) để cho biết vị trí của mục đó trong tập. Giá trị `aria-posinset` nằm trong khoảng từ `1` đến giá trị dương của `aria-setsize`.

Ví dụ, trong phần bình luận của một trang, khi các bình luận chưa có hết trong DOM, chẳng hạn khi các bình luận được phân trang, cấp độ, tổng số bình luận và vị trí của từng bình luận nên được đặt bằng ARIA. Cấp bậc phân cấp của bình luận có thể được chỉ ra bằng [`aria-level`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level). Thông tin vị trí trong nhóm được biểu thị bằng `aria-posinset` và `aria-setsize`.

Khi một feed có số lượng bài viết cố định, `aria-setsize` có thể được thêm vào từng phần tử article với giá trị là tổng số bài đã tải hoặc tổng số bài trong feed. Giá trị được chọn phụ thuộc vào giá trị nào hữu ích hơn cho người dùng. Nếu số lượng bài viết rất lớn, không xác định, hoặc thay đổi thường xuyên, có thể đặt `aria-setsize="-1"` để truyền đạt rằng kích thước tập chưa biết.

Trong một [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role), khi toàn bộ tập tùy chọn không có trong DOM do tải động khi cuộn, cả `aria-setsize` và `aria-posinset` đều có thể được đặt trên từng [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role).

Trong cây, nếu toàn bộ tập nút không có trong DOM do tải động khi người dùng di chuyển focus hoặc cuộn cây, mỗi nút sẽ có `aria-level`, `aria-setsize` và `aria-posinset`.

Trong menu, `aria-setsize` được đặt trên tất cả vai trò [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role), [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role) hoặc [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role), với giá trị là tổng số mục trong menu, không bao gồm các separator.

## Ví dụ

Ví dụ sau cho thấy các mục từ 5 đến 8 trong một tập gồm 16 mục.

```html
<h2 id="label_fruit">Available Fruit</h2>
<ul role="listbox" aria-labelledby="label_fruit">
  <li role="option" aria-setsize="16" aria-posinset="5">apples</li>
  <li role="option" aria-setsize="16" aria-posinset="6">bananas</li>
  <li role="option" aria-setsize="16" aria-posinset="7">cantaloupes</li>
  <li role="option" aria-setsize="16" aria-posinset="8">dates</li>
</ul>
```

Để định hướng cho người dùng, công nghệ hỗ trợ sẽ đọc mục bananas ở trên như "item 6 out of 16".

## Giá trị

- `<integer>`
  - : Số lượng mục trong toàn bộ tập hoặc `-1` nếu kích thước tập chưa biết.

## Giao diện liên quan

- {{domxref("Element.ariaSetSize")}}
  - : Thuộc tính [`ariaSetSize`](/en-US/docs/Web/API/Element/ariaSetSize), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-setsize`.
- {{domxref("ElementInternals.ariaSetSize")}}
  - : Thuộc tính [`ariaSetSize`](/en-US/docs/Web/API/ElementInternals/ariaSetSize), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-setsize`.

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

- [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset)
- W3C WAI-ARIA practices:
  - [Treegrid Email Inbox example](https://www.w3.org/WAI/ARIA/apg/patterns/treegrid/examples/treegrid-1/)
  - [Navigation Treeview example](https://www.w3.org/WAI/ARIA/apg/patterns/treeview/examples/treeview-navigation/)
  - [File Directory Treeview Example Using Declared Properties](https://www.w3.org/WAI/ARIA/apg/patterns/treeview/examples/treeview-1b/)
