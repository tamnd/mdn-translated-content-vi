---
title: "ElementInternals: ariaValueNow property"
short-title: ariaValueNow
slug: Web/API/ElementInternals/ariaValueNow
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaValueNow
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaValueNow`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow), xác định giá trị hiện tại cho widget phạm vi.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi chứa số.

## Ví dụ

Trong ví dụ này, giá trị của `ariaValueNow` được đặt thành "1".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaValueNow = "1";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
