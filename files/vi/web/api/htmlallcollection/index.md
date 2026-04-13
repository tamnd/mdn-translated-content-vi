---
title: HTMLAllCollection
slug: Web/API/HTMLAllCollection
page-type: web-api-interface
browser-compat: api.HTMLAllCollection
---

{{APIRef("DOM")}}{{Deprecated_Header}}

Giao diện **`HTMLAllCollection`** đại diện cho một tập hợp gồm _tất cả_ các phần tử trong tài liệu, có thể truy cập theo chỉ mục (như mảng) và theo thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của phần tử. Nó được trả về bởi thuộc tính {{domxref("document.all")}}.

`HTMLAllCollection` có hình dạng rất giống với {{domxref("HTMLCollection")}}, nhưng có nhiều sự khác biệt hành vi tinh tế, ví dụ như `HTMLAllCollection` có thể được gọi như một hàm, và phương thức `item()` của nó có thể được gọi với một chuỗi đại diện cho thuộc tính `id` hoặc `name` của phần tử.

## Thuộc tính phiên bản

- {{domxref("HTMLAllCollection.length")}} {{ReadOnlyInline}}
  - : Trả về số lượng phần tử trong tập hợp.

## Phương thức phiên bản

- {{domxref("HTMLAllCollection.item()")}}
  - : Trả về phần tử nằm tại vị trí offset được chỉ định trong tập hợp, hoặc phần tử có giá trị khớp với thuộc tính `id` hoặc `name`. Trả về `null` nếu không tìm thấy phần tử nào.
- {{domxref("HTMLAllCollection.namedItem()")}}
  - : Trả về [phần tử](/en-US/docs/Web/API/Element) đầu tiên trong tập hợp có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) hoặc `name` khớp với tên chuỗi đã cho, hoặc `null` nếu không có phần tử nào khớp.

## Sử dụng trong JavaScript

### Truy cập theo chỉ mục

Ngoài các phương thức trên, các phần tử trong `HTMLAllCollection` có thể được truy cập bằng chỉ mục số nguyên và tên thuộc tính chuỗi. Thuộc tính `id` HTML có thể chứa `:` và `.` là các ký tự hợp lệ, điều này đòi hỏi phải sử dụng ký hiệu ngoặc để truy cập thuộc tính. `collection[i]` tương đương với `collection.item(i)`, trong đó `i` có thể là số nguyên, chuỗi chứa số nguyên, hoặc chuỗi đại diện cho `id`.

### Gọi như một hàm

Một đối tượng `HTMLAllCollection` có thể gọi được. Khi nó được gọi không có tham số hoặc với `undefined`, nó trả về `null`. Nếu không, nó trả về cùng giá trị với phương thức {{domxref("HTMLAllCollection/item", "item()")}} khi được cung cấp các tham số giống nhau.

### Hành vi chuyển đổi kiểu đặc biệt

Vì lý do lịch sử, `document.all` là một đối tượng hoạt động giống như `undefined` theo các cách sau:

- Nó [bằng lỏng lẻo](/en-US/docs/Web/JavaScript/Reference/Operators/Equality) với `undefined` và `null`.
- Nó là [giá trị falsy](/en-US/docs/Glossary/Falsy) trong ngữ cảnh boolean.
- [`typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof) của nó là `"undefined"`.

Những hành vi đặc biệt này đảm bảo rằng mã như:

```js
if (document.all) {
  // Assume that we are in IE; provide special logic
}
// Assume that we are in a modern browser
```

Sẽ tiếp tục cung cấp hành vi hiện đại ngay cả khi mã chạy trong trình duyệt triển khai `document.all` vì lý do tương thích.

Tuy nhiên, trong tất cả các ngữ cảnh khác, `document.all` vẫn là một đối tượng. Ví dụ:

- Nó không [bằng nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) với `undefined` hay `null`.
- Khi được sử dụng ở phía bên trái của [toán tử kết hợp nullish](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing) (`??`) hay [toán tử chuỗi tùy chọn](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) (`?.`), nó sẽ không khiến biểu thức bị đoản mạch.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCollection")}}
