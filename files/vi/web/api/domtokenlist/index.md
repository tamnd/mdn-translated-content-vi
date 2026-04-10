---
title: DOMTokenList
slug: Web/API/DOMTokenList
page-type: web-api-interface
browser-compat: api.DOMTokenList
---

{{APIRef("DOM")}}

Giao diện **`DOMTokenList`** đại diện cho một tập hợp các token được phân tách bằng dấu cách. Tập hợp như vậy được trả về bởi {{domxref("Element.classList")}} hoặc {{domxref("HTMLLinkElement.relList")}}, và nhiều API khác.

Một `DOMTokenList` được đánh chỉ mục bắt đầu từ `0`, giống như các đối tượng {{jsxref("Array")}} của JavaScript. `DOMTokenList` luôn phân biệt hoa thường.

## Thuộc tính thể hiện

- {{domxref("DOMTokenList.length")}} {{ReadOnlyInline}}
  - : Một `integer` biểu thị số lượng đối tượng được lưu trong đối tượng.
- {{domxref("DOMTokenList.value")}}
  - : Thuộc tính {{Glossary("stringifier")}} trả về giá trị của danh sách dưới dạng chuỗi.

## Phương thức thể hiện

- {{domxref("DOMTokenList.item()")}}
  - : Trả về mục trong danh sách theo chỉ số của nó, hoặc `null` nếu chỉ số lớn hơn hoặc bằng `length` của danh sách.
- {{domxref("DOMTokenList.contains()")}}
  - : Trả về `true` nếu danh sách chứa token đã cho, ngược lại trả về `false`.
- {{domxref("DOMTokenList.add()")}}
  - : Thêm các token được chỉ định vào danh sách.
- {{domxref("DOMTokenList.remove()")}}
  - : Xóa các token được chỉ định khỏi danh sách.
- {{domxref("DOMTokenList.replace()")}}
  - : Thay thế một token bằng token khác.
- {{domxref("DOMTokenList.supports()")}}
  - : Trả về `true` nếu token đã cho nằm trong danh sách token được hỗ trợ của thuộc tính liên quan.
- {{domxref("DOMTokenList.toggle()")}}
  - : Xóa token khỏi danh sách nếu nó tồn tại, hoặc thêm nó vào danh sách nếu không tồn tại. Trả về giá trị boolean cho biết token có nằm trong danh sách sau thao tác hay không.
- {{domxref("DOMTokenList.entries()")}}
  - : Trả về một {{jsxref("Iteration_protocols", "iterator", "", 1)}}, cho phép bạn duyệt qua toàn bộ các cặp khóa/giá trị có trong đối tượng này.
- {{domxref("DOMTokenList.forEach()")}}
  - : Thực thi một hàm callback được cung cấp một lần cho mỗi phần tử của `DOMTokenList`.
- {{domxref("DOMTokenList.keys()")}}
  - : Trả về một {{jsxref("Iteration_protocols", "iterator", "", 1)}}, cho phép bạn duyệt qua toàn bộ các khóa của các cặp khóa/giá trị có trong đối tượng này.
- {{domxref("DOMTokenList.toString()")}}
  - : Trả về {{domxref("DOMTokenList.value")}}, tức các giá trị của danh sách được nối thành một chuỗi bằng dấu cách.
- {{domxref("DOMTokenList.values()")}}
  - : Trả về một {{jsxref("Iteration_protocols", "iterator", "", 1)}}, cho phép bạn duyệt qua toàn bộ các giá trị của các cặp khóa/giá trị có trong đối tượng này.

## Ví dụ

Trong ví dụ đơn giản sau, chúng ta lấy danh sách các lớp được đặt trên một phần tử {{htmlelement("p")}} dưới dạng `DOMTokenList` bằng {{domxref("Element.classList")}}, thêm một lớp bằng {{domxref("DOMTokenList.add()")}}, rồi cập nhật {{domxref("Node.textContent")}} của thẻ `<p>` sao cho bằng `DOMTokenList`.

Trước hết là HTML:

```html
<p class="a b c"></p>
```

Bây giờ là JavaScript:

```js
let para = document.querySelector("p");
let classes = para.classList;
para.classList.add("d");
para.textContent = `paragraph classList is "${classes}"`;
```

Kết quả sẽ như sau:

{{ EmbedLiveSample('Examples', '100%', 60) }}

## Cắt khoảng trắng và loại bỏ giá trị trùng lặp

Các phương thức sửa đổi `DOMTokenList` (chẳng hạn như {{domxref("DOMTokenList.add()")}}) sẽ tự động cắt bỏ mọi {{Glossary("Whitespace")}} dư thừa và loại bỏ các giá trị trùng lặp khỏi danh sách. Ví dụ:

```html
<span class="    d   d e f"></span>
```

```js
let span = document.querySelector("span");
let classes = span.classList;
span.classList.add("x");
span.textContent = `span classList is "${classes}"`;
```

Kết quả sẽ như sau:

{{ EmbedLiveSample('Trimming_of_whitespace_and_removal_of_duplicates', '100%', 60) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
