---
title: "ElementInternals: ariaMultiSelectable property"
short-title: ariaMultiSelectable
slug: Web/API/ElementInternals/ariaMultiSelectable
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaMultiSelectable
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaMultiSelectable`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-multiselectable`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable), cho biết rằng người dùng có thể chọn nhiều hơn một mục từ các phần tử con hiện có thể chọn.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Có thể chọn nhiều hơn một mục cùng một lúc.
- `"false"`
  - : Chỉ có thể chọn một mục.

## Ví dụ

Trong ví dụ này, giá trị của `ariaMultiSelectable` được đặt thành "true".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaMultiSelectable = "true";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: listbox role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role)
