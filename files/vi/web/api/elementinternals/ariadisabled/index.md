---
title: "ElementInternals: ariaDisabled property"
short-title: ariaDisabled
slug: Web/API/ElementInternals/ariaDisabled
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaDisabled
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaDisabled`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-disabled`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled), cho biết rằng phần tử có thể nhận biết được nhưng bị vô hiệu hóa, do đó không thể chỉnh sửa hoặc thao tác theo cách khác.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử và tất cả các phần tử con có thể tiêu điểm đều bị vô hiệu hóa, nhưng có thể nhận biết, và các giá trị của chúng không thể được thay đổi bởi người dùng.
- `"false"`
  - : Phần tử được bật.

## Ví dụ

Trong ví dụ này, giá trị của `ariaDisabled` được đặt thành "true".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaDisabled = "true";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
