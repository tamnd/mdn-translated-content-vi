---
title: "ElementInternals: ariaOrientation property"
short-title: ariaOrientation
slug: Web/API/ElementInternals/ariaOrientation
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaOrientation
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaOrientation`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation), cho biết liệu hướng của phần tử là ngang, dọc hay không xác định/mơ hồ.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"horizontal"`
  - : Phần tử theo chiều ngang.
- `"vertical"`
  - : Phần tử theo chiều dọc.
- `"undefined"`
  - : Hướng của phần tử không xác định.

## Ví dụ

Trong ví dụ này, giá trị của `ariaOrientation` được đặt thành "vertical".

```js
class CustomEl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaOrientation = "vertical";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
