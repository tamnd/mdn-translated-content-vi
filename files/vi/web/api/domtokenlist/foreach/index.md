---
title: "DOMTokenList: phương thức forEach()"
short-title: forEach()
slug: Web/API/DOMTokenList/forEach
page-type: web-api-instance-method
browser-compat: api.DOMTokenList.forEach
---

{{APIRef("DOM")}}

Phương thức **`forEach()`** của giao diện {{domxref("DOMTokenList")}}
gọi callback được cung cấp trong tham số một lần cho mỗi cặp giá trị trong danh sách, theo
thứ tự chèn.

## Cú pháp

```js-nolint
forEach(callback)
forEach(callback, thisArg)
```

### Tham số

- `callback`
  - : Hàm được thực thi cho mỗi phần tử, cuối cùng nhận ba đối số:
    - `currentValue`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `currentIndex`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.
    - `listObj`
      - : Mảng mà `forEach()` đang được áp dụng lên.

- `thisArg` {{Optional_inline}}
  - : Giá trị dùng làm {{jsxref("Operators/this", "this")}} khi thực thi `callback`.

### Giá trị trả về

Không có.

## Ví dụ

Trong ví dụ sau, chúng ta lấy danh sách các lớp được đặt trên một
phần tử {{htmlelement("pre")}} dưới dạng `DOMTokenList` bằng
{{domxref("Element.classList")}}. Sau đó chúng ta lấy một iterator chứa các giá trị
bằng `forEach()`, rồi ghi từng giá trị vào
{{domxref("Node.textContent")}} của thẻ `<pre>` bên trong hàm nội bộ của `forEach()`.

### HTML

```html
<pre class="a b c"></pre>
```

### JavaScript

```js
const pre = document.querySelector("pre");
const classes = pre.classList;
const iterator = classes.values();

classes.forEach(function (value, key, listObj) {
  pre.textContent += `(${value} ${key})/${this}\n`;
}, "arg");
```

### Kết quả

{{ EmbedLiveSample('Example', '100%', 100) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMTokenList.entries()")}}, {{domxref("DOMTokenList.keys")}} và {{domxref("DOMTokenList.values()")}}.
