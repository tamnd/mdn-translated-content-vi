---
title: "ElementInternals: ariaSetSize property"
short-title: ariaSetSize
slug: Web/API/ElementInternals/ariaSetSize
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaSetSize
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaSetSize`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize), xác định số mục trong tập hợp listitem hoặc treeitem hiện tại.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi chứa số nguyên.

## Ví dụ

Trong ví dụ này, giá trị của `ariaSetSize` được đặt thành "4".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaSetSize = "4";
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
