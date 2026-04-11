---
title: "ElementInternals: ariaChecked property"
short-title: ariaChecked
slug: Web/API/ElementInternals/ariaChecked
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaChecked
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaChecked`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked), cho biết trạng thái "đã chọn" hiện tại của các hộp kiểm, nút radio và các widget khác có trạng thái được chọn.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử đã được chọn.
- `"mixed"`
  - : Cho biết giá trị chế độ hỗn hợp cho hộp kiểm ba trạng thái hoặc menuitemcheckbox.
- `"false"`
  - : Phần tử hỗ trợ được chọn nhưng hiện chưa được chọn.
- `"undefined"`
  - : Phần tử không hỗ trợ được chọn.

## Ví dụ

Trong ví dụ này, giá trị của `ariaChecked` được đặt thành "true".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaChecked = "true";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: checkbox role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role)
