---
title: "ElementInternals: ariaAutoComplete property"
short-title: ariaAutoComplete
slug: Web/API/ElementInternals/ariaAutoComplete
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaAutoComplete
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaAutoComplete`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-autocomplete`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-autocomplete), cho biết liệu việc nhập văn bản có thể kích hoạt hiển thị một hoặc nhiều dự đoán về giá trị mà người dùng định nhập cho combobox, searchbox hoặc textbox và chỉ định cách các dự đoán sẽ được trình bày nếu chúng được thực hiện.

> [!NOTE]
> Việc đặt thuộc tính aria trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"inline"`
  - : Khi người dùng đang nhập, văn bản gợi ý một cách hoàn thành đầu vào có thể được chèn động sau con trỏ.
- `"list"`
  - : Khi người dùng đang nhập, một phần tử chứa tập hợp các giá trị có thể hoàn thành đầu vào có thể được hiển thị.
- `"both"`
  - : Khi người dùng đang nhập, một phần tử chứa tập hợp các giá trị có thể hoàn thành đầu vào có thể được hiển thị. Nếu hiển thị, một giá trị trong tập hợp được tự động chọn và văn bản cần thiết để hoàn thành giá trị được tự động chọn xuất hiện sau con trỏ trong ô nhập.
- `"none"`
  - : Khi người dùng đang nhập, không có gợi ý tự động nào cố gắng dự đoán cách người dùng định hoàn thành đầu vào.

## Ví dụ

Trong ví dụ này, giá trị của `ariaAutoComplete` được đặt thành "inline".

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this.internals_ = this.attachInternals();
    this.internals_.ariaAutoComplete = "inline";
  }
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
