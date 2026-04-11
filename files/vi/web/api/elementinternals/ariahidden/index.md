---
title: "ElementInternals: ariaHidden property"
short-title: ariaHidden
slug: Web/API/ElementInternals/ariaHidden
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaHidden
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaHidden`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden), cho biết liệu phần tử có được hiển thị với API truy cập hay không.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử bị ẩn khỏi API truy cập.
- `"false"`
  - : Phần tử được hiển thị với API truy cập như thể nó được render.
- `"undefined"`
  - : Trạng thái ẩn của phần tử được xác định bởi tác nhân người dùng dựa trên việc nó có được render hay không.

## Ví dụ

Trong ví dụ này, giá trị của `ariaHidden` được đặt thành "true".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaHidden = "true";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
