---
title: "ElementInternals: ariaHasPopup property"
short-title: ariaHasPopup
slug: Web/API/ElementInternals/ariaHasPopup
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaHasPopup
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaHasPopup`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup), cho biết sự khả dụng và loại phần tử popup tương tác, chẳng hạn như menu hoặc hộp thoại, có thể được kích hoạt bởi một phần tử.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"false"`
  - : Phần tử không có popup.
- `"true"`
  - : Phần tử có popup là menu.
- `"menu"`
  - : Phần tử có popup là menu.
- `"listbox"`
  - : Phần tử có popup là listbox.
- `"tree"`
  - : Phần tử có popup là tree.
- `"grid"`
  - : Phần tử có popup là grid.
- `"dialog"`
  - : Phần tử có popup là hộp thoại.

## Ví dụ

Trong ví dụ này, giá trị của `ariaHasPopup` được đặt thành "true".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaHasPopup = "true";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
