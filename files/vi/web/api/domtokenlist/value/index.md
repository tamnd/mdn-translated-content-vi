---
title: "DOMTokenList: thuộc tính value"
short-title: value
slug: Web/API/DOMTokenList/value
page-type: web-api-instance-property
browser-compat: api.DOMTokenList.value
---

{{APIRef("DOM")}}

Thuộc tính **`value`** của giao diện {{domxref("DOMTokenList")}}
là một {{Glossary("stringifier")}} trả về giá trị của danh sách dưới dạng chuỗi đã tuần tự hóa, hoặc xóa và đặt lại danh sách theo giá trị đã cho.

## Giá trị

Một chuỗi biểu thị nội dung đã tuần tự hóa của danh sách.
Mỗi mục được phân tách bằng một dấu cách.

## Ví dụ

Trong ví dụ sau, chúng ta lấy danh sách các lớp được đặt trên một
phần tử {{htmlelement("span")}} dưới dạng `DOMTokenList` bằng
{{domxref("Element.classList")}}, rồi ghi giá trị của danh sách vào
{{domxref("Node.textContent")}} của thẻ `<span>`.

Trước hết là HTML:

```html
<span class="a b c"></span>
```

Bây giờ là JavaScript:

```js
const span = document.querySelector("span");
const classes = span.classList;
span.textContent = classes.value;
```

Kết quả sẽ như sau:

{{ EmbedLiveSample('Examples', '100%', 60) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
