---
title: "ElementInternals: ariaPressed property"
short-title: ariaPressed
slug: Web/API/ElementInternals/ariaPressed
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaPressed
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaPressed`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed), cho biết trạng thái "đã nhấn" hiện tại của các nút chuyển đổi.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử đang được nhấn.
- `"false"`
  - : Phần tử hỗ trợ được nhấn nhưng hiện chưa được nhấn.
- `"mixed"`
  - : Cho biết giá trị chế độ hỗn hợp cho nút chuyển đổi ba trạng thái.
- `"undefined"`
  - : Phần tử không hỗ trợ được nhấn.

## Ví dụ

Trong ví dụ này, giá trị của `ariaPressed` được đặt thành "true".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaPressed = "true";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: button role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role)
