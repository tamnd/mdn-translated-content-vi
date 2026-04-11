---
title: "ElementInternals: ariaSelected property"
short-title: ariaSelected
slug: Web/API/ElementInternals/ariaSelected
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaSelected
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaSelected`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected), cho biết trạng thái "đã chọn" hiện tại của các phần tử có trạng thái được chọn.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Mục đã được chọn.
- `"false"`
  - : Mục chưa được chọn.
- `"undefined"`
  - : Mục không có trạng thái được chọn.

## Ví dụ

Trong ví dụ này, giá trị của `ariaSelected` được đặt thành "true".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaSelected = "true";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: tab role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role)
