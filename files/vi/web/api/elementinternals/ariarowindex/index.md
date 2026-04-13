---
title: "ElementInternals: ariaRowIndex property"
short-title: ariaRowIndex
slug: Web/API/ElementInternals/ariaRowIndex
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaRowIndex
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaRowIndex`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex), xác định chỉ số hàng hoặc vị trí của phần tử so với tổng số hàng trong bảng, lưới hoặc treegrid.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi chứa số nguyên.

## Ví dụ

Trong ví dụ này, giá trị của `ariaRowIndex` được đặt thành "1".

```js
class CustomEl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaRowIndex = "1";
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
