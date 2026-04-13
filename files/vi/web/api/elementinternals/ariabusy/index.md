---
title: "ElementInternals: ariaBusy property"
short-title: ariaBusy
slug: Web/API/ElementInternals/ariaBusy
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaBusy
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaBusy`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy), cho biết liệu một phần tử có đang được chỉnh sửa hay không, vì các công nghệ hỗ trợ có thể muốn chờ cho đến khi các chỉnh sửa hoàn tất trước khi hiển thị chúng với người dùng.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử đang được cập nhật.
- `"false"`
  - : Không có cập nhật dự kiến nào cho phần tử.

## Ví dụ

Trong ví dụ này, giá trị của `ariaBusy` được đặt thành "true".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaBusy = "true";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
