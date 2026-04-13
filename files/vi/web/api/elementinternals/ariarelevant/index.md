---
title: "ElementInternals: ariaRelevant property"
short-title: ariaRelevant
slug: Web/API/ElementInternals/ariaRelevant
page-type: web-api-instance-property
status:
  - non-standard
browser-compat: api.ElementInternals.ariaRelevant
---

{{APIRef("Web Components")}}{{Non-standard_header}}

Thuộc tính **`ariaRelevant`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant), cho biết những thông báo nào tác nhân người dùng sẽ kích hoạt khi cây truy cập trong vùng trực tiếp bị sửa đổi. Điều này được sử dụng để mô tả những thay đổi nào trong vùng `aria-live` là liên quan và cần được thông báo.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi chứa một hoặc nhiều giá trị sau, phân cách bằng dấu cách:

- "additions"
  - : Việc thêm các nút Phần tử trong vùng trực tiếp nên được coi là liên quan.
- "removals"
  - : Việc xóa các nút khỏi vùng trực tiếp nên được coi là liên quan.
- "text"
  - : Các thay đổi về nội dung văn bản của các nút hiện có nên được coi là liên quan.
- "all"
  - : Tương đương với `"additions removals text"`.

## Ví dụ

Trong ví dụ này, giá trị của `ariaRelevant` được đặt thành "all".

```js
class CustomEl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaRelevant = "all";
  }
  // …
}
```

## Tương thích trình duyệt

{{Compat}}
