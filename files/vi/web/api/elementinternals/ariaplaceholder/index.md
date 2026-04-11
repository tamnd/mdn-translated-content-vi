---
title: "ElementInternals: ariaPlaceholder property"
short-title: ariaPlaceholder
slug: Web/API/ElementInternals/ariaPlaceholder
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaPlaceholder
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaPlaceholder`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-placeholder`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-placeholder), xác định gợi ý ngắn nhằm hỗ trợ người dùng nhập dữ liệu khi điều khiển chưa có giá trị.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ này, giá trị của `ariaPlaceholder` được đặt thành "12345".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaPlaceholder = "12345";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: textbox role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
