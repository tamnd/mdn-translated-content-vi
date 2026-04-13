---
title: "ElementInternals: ariaColSpan property"
short-title: ariaColSpan
slug: Web/API/ElementInternals/ariaColSpan
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaColSpan
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaColSpan`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-colspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colspan), xác định số cột được kéo dài bởi một ô hoặc gridcell trong bảng, lưới hoặc treegrid.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi chứa số nguyên.

## Ví dụ

Trong ví dụ này, giá trị của `ariaColspan` được đặt thành "2".

```js
class CustomEl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaColspan = "2";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: table role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
