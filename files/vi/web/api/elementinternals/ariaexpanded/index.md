---
title: "ElementInternals: ariaExpanded property"
short-title: ariaExpanded
slug: Web/API/ElementInternals/ariaExpanded
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaExpanded
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaExpanded`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded), cho biết liệu phần tử nhóm do phần tử này sở hữu hoặc kiểm soát có được mở rộng hay thu gọn.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử nhóm mà phần tử này sở hữu hoặc kiểm soát được mở rộng.
- `"false"`
  - : Phần tử nhóm mà phần tử này sở hữu hoặc kiểm soát bị thu gọn.
- `"undefined"`
  - : Phần tử không sở hữu hoặc kiểm soát phần tử nhóm có thể mở rộng.

## Ví dụ

Trong ví dụ này, giá trị của `ariaExpanded` được đặt thành "true".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaInvalid = "true";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
