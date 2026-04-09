---
title: "ARIA: thuộc tính aria-haspopup"
short-title: aria-haspopup
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-haspopup
sidebar: accessibilitysidebar
---

Thuộc tính `aria-haspopup` cho biết phần tử có khả năng kích hoạt một phần tử bật lên bổ sung, chẳng hạn menu hoặc dialog, khi được kích hoạt.

## Mô tả

Khi một phần tử tương tác như button, link, hoặc menuitem mở ra một phần tử giao diện người dùng khác, thuộc tính `aria-haspopup` giúp công nghệ hỗ trợ biết rằng có một phần tử bật lên liên quan. Điều này có thể là menu, listbox, tree, grid, hoặc dialog.

Giá trị của `aria-haspopup` nên phản ánh loại popup được mở. Giá trị mặc định là `false`, nghĩa là phần tử không có popup liên quan. Khi một popup tồn tại nhưng chưa mở, vẫn có thể khai báo thuộc tính này để công nghệ hỗ trợ có thể báo trước cho người dùng.

Nếu popup là một menu, hãy dùng `aria-haspopup="menu"` hoặc `true`. Đối với các popup khác, dùng vai trò tương ứng của popup làm giá trị.

Ví dụ, một button có thể mở một menu ngữ cảnh:

```html
<button aria-haspopup="menu" aria-controls="menu1">Tùy chọn</button>
```

Khi popup được hiển thị, `aria-expanded` thường được dùng cùng với `aria-haspopup` để cho biết trạng thái mở hay đóng.

> [!NOTE]
> `aria-haspopup` không tự tạo popup và cũng không thêm hành vi. Nó chỉ truyền đạt ngữ nghĩa cho công nghệ hỗ trợ.

## Giá trị

- `false` (mặc định)
  - : Phần tử không kích hoạt popup.
- `true`
  - : Phần tử kích hoạt một menu popup.
- `menu`
  - : Phần tử kích hoạt một menu popup.
- `listbox`
  - : Phần tử kích hoạt một listbox popup.
- `tree`
  - : Phần tử kích hoạt một tree popup.
- `grid`
  - : Phần tử kích hoạt một grid popup.
- `dialog`
  - : Phần tử kích hoạt một dialog popup.

## Giao diện liên quan

- {{domxref("Element.ariaHasPopup")}}
  - : Thuộc tính [`ariaHasPopup`](/en-US/docs/Web/API/Element/ariaHasPopup), là một phần của giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-haspopup`.
- {{domxref("ElementInternals.ariaHasPopup")}}
  - : Thuộc tính [`ariaHasPopup`](/en-US/docs/Web/API/ElementInternals/ariaHasPopup), là một phần của giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-haspopup`.

## Vai trò liên quan

Được dùng trong hầu hết các vai trò tương tác.

## Đặc tả

{{Specifications}}

## Xem thêm

- [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded)
- [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls)
- [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant)
