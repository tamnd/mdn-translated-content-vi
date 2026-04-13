---
title: "ElementInternals: ariaAtomic property"
short-title: ariaAtomic
slug: Web/API/ElementInternals/ariaAtomic
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaAtomic
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaAtomic`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic), cho biết liệu các công nghệ hỗ trợ có trình bày tất cả, hay chỉ một phần của vùng đã thay đổi dựa trên các thông báo thay đổi được xác định bởi thuộc tính `aria-relevant`.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"false"`
  - : Các công nghệ hỗ trợ chỉ trình bày nút hoặc các nút đã thay đổi.
- `"true"`
  - : Các công nghệ hỗ trợ trình bày toàn bộ vùng đã thay đổi, bao gồm cả nhãn do tác giả định nghĩa nếu có.

## Ví dụ

Trong ví dụ này, giá trị của `ariaAtomic` được đặt thành "true" trong hàm tạo của phần tử tùy chỉnh.

```js
class MyCustomElement extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaAtomic = "true";
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
