---
title: "ElementInternals: ariaLive property"
short-title: ariaLive
slug: Web/API/ElementInternals/ariaLive
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaLive
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaLive`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions), cho biết rằng một phần tử sẽ được cập nhật và mô tả các loại cập nhật mà tác nhân người dùng, công nghệ hỗ trợ và người dùng có thể mong đợi từ vùng trực tiếp.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"assertive"`
  - : Cho biết các cập nhật trong vùng có mức ưu tiên cao nhất và nên được trình bày ngay cho người dùng.
- `"off"`
  - : Cho biết các cập nhật trong vùng không nên được trình bày cho người dùng trừ khi người dùng đang tập trung vào vùng đó.
- `"polite"`
  - : Cho biết các cập nhật trong vùng nên được trình bày vào cơ hội thuận tiện tiếp theo, chẳng hạn như kết thúc câu đang nói hoặc khi người dùng dừng gõ.

## Ví dụ

Trong ví dụ này, giá trị của `ariaLive` được đặt thành "assertive".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaLive = "assertive";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
