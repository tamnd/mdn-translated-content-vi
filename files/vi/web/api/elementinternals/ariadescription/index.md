---
title: "ElementInternals: ariaDescription property"
short-title: ariaDescription
slug: Web/API/ElementInternals/ariaDescription
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaDescription
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaDescription`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-description`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-description), xác định giá trị chuỗi mô tả hoặc chú thích cho phần tử hiện tại.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ này, giá trị của `ariaDescription` được đặt thành "A description of this widget".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaDescription = "A description of this widget";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
