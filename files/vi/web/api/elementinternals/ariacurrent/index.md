---
title: "ElementInternals: ariaCurrent property"
short-title: ariaCurrent
slug: Web/API/ElementInternals/ariaCurrent
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaCurrent
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaCurrent`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-current`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-current), cho biết phần tử đại diện cho mục hiện tại trong một vùng chứa hoặc tập hợp các phần tử liên quan.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"page"`
  - : Đại diện cho trang hiện tại trong tập hợp các trang.
- `"step"`
  - : Đại diện cho bước hiện tại trong một quy trình.
- `"location"`
  - : Đại diện cho vị trí hiện tại, ví dụ trang hiện tại trong phân cấp breadcrumbs.
- `"date"`
  - : Đại diện cho ngày hiện tại trong tập hợp các ngày.
- `"time"`
  - : Đại diện cho thời gian hiện tại trong tập hợp các thời gian.
- `"true"`
  - : Đại diện cho mục hiện tại trong một tập hợp.
- `"false"`
  - : Không đại diện cho mục hiện tại trong một tập hợp.

## Ví dụ

Trong ví dụ này, giá trị của `ariaCurrent` được đặt thành "page".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaCurrent = "page";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the aria-current attribute](https://tink.uk/using-the-aria-current-attribute/)
