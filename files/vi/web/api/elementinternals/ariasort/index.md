---
title: "ElementInternals: ariaSort property"
short-title: ariaSort
slug: Web/API/ElementInternals/ariaSort
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaSort
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaSort`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-sort`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-sort), cho biết liệu các mục trong bảng hoặc lưới có được sắp xếp theo thứ tự tăng dần hay giảm dần.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"ascending"`
  - : Các mục được sắp xếp theo thứ tự tăng dần theo cột này.
- `"descending"`
  - : Các mục được sắp xếp theo thứ tự giảm dần theo cột này.
- `"none"`
  - : Không có thứ tự sắp xếp được xác định cho cột.
- `"other"`
  - : Một thuật toán sắp xếp khác ngoài tăng dần hoặc giảm dần đã được áp dụng.

## Ví dụ

Trong ví dụ này, giá trị của `ariaSort` được đặt thành "ascending".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaSort = "ascending";
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
