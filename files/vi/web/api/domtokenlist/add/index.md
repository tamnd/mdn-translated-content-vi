---
title: "DOMTokenList: phương thức add()"
short-title: add()
slug: Web/API/DOMTokenList/add
page-type: web-api-instance-method
browser-compat: api.DOMTokenList.add
---

{{APIRef("DOM")}}

Phương thức **`add()`** của giao diện {{domxref("DOMTokenList")}} thêm các token đã cho vào danh sách, bỏ qua những token đã tồn tại.

## Cú pháp

```js-nolint
add(token1)
add(token1, token2)
add(token1, token2, /* …, */ tokenN)
```

### Tham số

- `tokenN`
  - : Một chuỗi biểu thị token (hoặc các token) cần thêm vào `DOMTokenList`.

### Giá trị trả về

Không có.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu một trong các đối số là chuỗi rỗng.
- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Được ném ra nếu token chứa khoảng trắng ASCII.

## Ví dụ

Trong ví dụ sau, chúng ta lấy danh sách các lớp được đặt trên một phần tử {{htmlelement("span")}} dưới dạng `DOMTokenList`, bằng {{domxref("Element.classList")}}.
Sau đó chúng ta thêm một token mới vào danh sách, rồi ghi danh sách vào {{domxref("Node.textContent")}} của thẻ `<span>`.

Trước hết là HTML:

```html
<span class="a b c"></span>
```

Bây giờ là JavaScript:

```js
const span = document.querySelector("span");
const classes = span.classList;
classes.add("d");
span.textContent = classes;
```

Kết quả sẽ như sau:

{{ EmbedLiveSample('Examples', '100%', 60) }}

Bạn cũng có thể thêm nhiều token cùng lúc:

```js
span.classList.add("d", "e", "f");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
