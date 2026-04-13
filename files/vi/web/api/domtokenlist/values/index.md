---
title: "DOMTokenList: phương thức values()"
short-title: values()
slug: Web/API/DOMTokenList/values
page-type: web-api-instance-method
browser-compat: api.DOMTokenList.values
---

{{APIRef("DOM")}}

Phương thức **`values()`** của giao diện {{domxref("DOMTokenList")}}
trả về một {{jsxref("Iteration_protocols",'iterator')}}
cho phép người gọi duyệt qua toàn bộ các giá trị có trong `DOMTokenList`.
Các giá trị riêng lẻ là chuỗi.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref("Iteration_protocols","iterator")}}.

## Ví dụ

Trong ví dụ sau, chúng ta lấy danh sách các lớp được đặt trên một
phần tử {{htmlelement("span")}} dưới dạng `DOMTokenList` bằng
{{domxref("Element.classList")}}. Sau đó chúng ta lấy một iterator chứa các giá trị
bằng `values()`, rồi duyệt qua các giá trị đó bằng vòng lặp [for...of](/en-US/docs/Web/JavaScript/Reference/Statements/for...of),
và ghi từng giá trị vào {{domxref("Node.textContent")}} của thẻ `<span>`.

Trước hết là HTML:

```html
<span class="a b c"></span>
```

Bây giờ là JavaScript:

```js
const span = document.querySelector("span");
const classes = span.classList;
const iterator = classes.values();

for (const value of iterator) {
  span.textContent += `(${value}) `;
}
```

Kết quả sẽ như sau:

{{ EmbedLiveSample('Examples', '100%', 60) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
