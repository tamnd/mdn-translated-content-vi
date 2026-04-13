---
title: "ElementInternals: ariaRoleDescription property"
short-title: ariaRoleDescription
slug: Web/API/ElementInternals/ariaRoleDescription
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaRoleDescription
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaRoleDescription`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-roledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-roledescription), xác định mô tả có thể đọc được, được tác giả bản địa hóa cho vai trò của một phần tử.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ này, giá trị của `ariaRoleDescription` được đặt thành "My custom widget".

```js
class CustomEl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaRoleDescription = "My custom widget";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ARIA: application role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role)
