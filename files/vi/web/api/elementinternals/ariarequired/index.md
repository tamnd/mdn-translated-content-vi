---
title: "ElementInternals: ariaRequired property"
short-title: ariaRequired
slug: Web/API/ElementInternals/ariaRequired
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaRequired
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaRequired`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-required`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-required), cho biết rằng người dùng cần nhập dữ liệu vào phần tử trước khi biểu mẫu có thể được gửi.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Người dùng cần nhập dữ liệu vào phần tử trước khi biểu mẫu được gửi.
- `"false"`
  - : Người dùng không cần nhập dữ liệu để gửi biểu mẫu.

## Ví dụ

Trong ví dụ này, giá trị của `ariaRequired` được đặt thành "true".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaRequired = "true";
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
