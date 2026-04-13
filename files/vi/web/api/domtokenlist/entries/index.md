---
title: "DOMTokenList: phương thức entries()"
short-title: entries()
slug: Web/API/DOMTokenList/entries
page-type: web-api-instance-method
browser-compat: api.DOMTokenList.entries
---

{{APIRef("DOM")}}

Phương thức **`entries()`** của giao diện {{domxref("DOMTokenList")}}
trả về một {{jsxref("Iteration_protocols",'iterator')}} cho phép bạn
duyệt qua toàn bộ các cặp khóa/giá trị có trong đối tượng này. Các giá trị là
{{jsxref("Array")}} chứa các cặp [khóa, giá trị], mỗi cặp biểu diễn một token.

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref("Iteration_protocols","iterator")}}.

## Ví dụ

Trong ví dụ sau, chúng ta lấy danh sách các lớp được đặt trên một
phần tử {{htmlelement("span")}} dưới dạng `DOMTokenList` bằng
{{domxref("Element.classList")}}. Sau đó chúng ta lấy một iterator chứa các cặp
khóa/giá trị bằng `entries()`, rồi duyệt qua từng cặp bằng vòng lặp
{{jsxref("Statements/for...of", "for...of")}}, và ghi chúng vào
{{domxref("Node.textContent")}} của thẻ `<span>`.

Trước hết là HTML:

```html
<span class="a b c"></span>
```

Bây giờ là JavaScript:

```js
const span = document.querySelector("span");
const classes = span.classList;
const iterator = classes.entries();

for (const value of iterator) {
  span.textContent += `(${value})`;
}
```

Kết quả sẽ như sau:

{{ EmbedLiveSample('Examples', '100%', 60) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMTokenList.forEach()")}}, {{domxref("DOMTokenList.keys()")}} và {{domxref("DOMTokenList.values()")}}.
