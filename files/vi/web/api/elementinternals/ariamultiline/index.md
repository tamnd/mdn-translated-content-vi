---
title: "ElementInternals: ariaMultiLine property"
short-title: ariaMultiLine
slug: Web/API/ElementInternals/ariaMultiLine
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaMultiLine
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaMultiLine`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-multiline`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiline), cho biết liệu hộp văn bản chấp nhận nhiều dòng đầu vào hay chỉ một dòng.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Đây là hộp văn bản nhiều dòng.
- `"false"`
  - : Đây là hộp văn bản một dòng.

## Ví dụ

Trong ví dụ này, giá trị của `ariaMultiLine` được đặt thành "true".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaMultiLine = "true";
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
