---
title: "DOMTokenList: thuộc tính length"
short-title: length
slug: Web/API/DOMTokenList/length
page-type: web-api-instance-property
browser-compat: api.DOMTokenList.length
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`length`** của giao diện {{domxref("DOMTokenList")}} là một `integer` biểu thị số lượng
đối tượng được lưu trong đối tượng.

## Giá trị

Một số nguyên dương, hoặc `0` nếu danh sách rỗng.

## Ví dụ

Trong ví dụ sau, chúng ta lấy danh sách các lớp được đặt trên một
phần tử {{htmlelement("span")}} dưới dạng `DOMTokenList` bằng
{{domxref("Element.classList")}}, rồi ghi độ dài của danh sách vào
{{domxref("Node.textContent")}} của thẻ `<span>`.

Trước hết là HTML:

```html
<span class="a b c"></span>
```

Bây giờ là JavaScript:

```js
const span = document.querySelector("span");
const classes = span.classList;
const length = classes.length;

span.textContent = `classList length = ${length}`;
```

Kết quả sẽ như sau:

{{ EmbedLiveSample('Examples', '100%', 60) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
