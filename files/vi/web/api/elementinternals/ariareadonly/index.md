---
title: "ElementInternals: ariaReadOnly property"
short-title: ariaReadOnly
slug: Web/API/ElementInternals/ariaReadOnly
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaReadOnly
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaReadOnly`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly), cho biết rằng phần tử không thể chỉnh sửa nhưng vẫn có thể thao tác theo cách khác.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Người dùng không thể thay đổi giá trị của phần tử.
- `"false"`
  - : Người dùng có thể đặt giá trị của phần tử.

## Ví dụ

Trong ví dụ này, giá trị của `ariaReadOnly` được đặt thành "true".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaReadonly = "true";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: textbox role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
