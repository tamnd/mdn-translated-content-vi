---
title: "DOMTokenList: phương thức keys()"
short-title: keys()
slug: Web/API/DOMTokenList/keys
page-type: web-api-instance-method
browser-compat: api.DOMTokenList.keys
---

{{APIRef("DOM")}}

Phương thức **`keys()`** của giao diện {{domxref("DOMTokenList")}}
trả về một {{jsxref("Iteration_protocols",'iterator',"",1)}} cho phép duyệt qua toàn bộ các khóa có trong đối tượng này.
Các khóa là số nguyên không âm.

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref("Iteration_protocols","iterator","",1)}}.

## Ví dụ

Trong ví dụ sau, chúng ta lấy danh sách các lớp được đặt trên một
phần tử {{htmlelement("span")}} dưới dạng `DOMTokenList` bằng
{{domxref("Element.classList")}}. Sau đó chúng ta lấy một iterator chứa các khóa bằng `keys()`,
rồi duyệt qua các khóa đó bằng vòng lặp [for...of](/en-US/docs/Web/JavaScript/Reference/Statements/for...of),
và ghi từng giá trị vào {{domxref("Node.textContent")}} của thẻ `<span>`.

Trước hết là HTML:

```html
<span class="a b c"></span>
```

Bây giờ là JavaScript:

```js
const span = document.querySelector("span");
const classes = span.classList;
const iterator = classes.keys();

for (let value of iterator) {
  span.textContent += `(${value}) `;
}
```

Kết quả sẽ như sau:

{{ EmbedLiveSample('Examples', '100%', 60) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMTokenList.entries()")}}, {{domxref("DOMTokenList.forEach()")}} và {{domxref("DOMTokenList.values")}}.
