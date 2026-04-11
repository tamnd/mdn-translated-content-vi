---
title: "ElementInternals: ariaModal property"
short-title: ariaModal
slug: Web/API/ElementInternals/ariaModal
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaModal
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaModal`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-modal`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-modal), cho biết liệu một phần tử có phải là modal khi được hiển thị hay không.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử là modal.
- `"false"`
  - : Phần tử không phải là modal.

## Ví dụ

Trong ví dụ này, giá trị của `ariaModal` được đặt thành "true".

```js
class CustomEl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaModal = "true";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: dialog role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role)
