---
title: "DOMTokenList: phương thức contains()"
short-title: contains()
slug: Web/API/DOMTokenList/contains
page-type: web-api-instance-method
browser-compat: api.DOMTokenList.contains
---

{{APIRef("DOM")}}

Phương thức **`contains()`** của giao diện {{domxref("DOMTokenList")}}
trả về một giá trị boolean - `true` nếu danh sách nền chứa token đã cho,
ngược lại trả về `false`.

## Cú pháp

```js-nolint
contains(token)
```

### Tham số

- `token`
  - : Một chuỗi biểu thị token mà bạn muốn kiểm tra sự tồn tại của nó trong danh sách.

### Giá trị trả về

Một giá trị boolean, là `true` nếu danh sách gọi phương thức chứa `token`, ngược lại là `false`.

## Ví dụ

Trong ví dụ sau, chúng ta lấy danh sách các lớp được đặt trên một phần tử
{{htmlelement("span")}} dưới dạng `DOMTokenList` bằng
{{domxref("Element.classList")}}. Sau đó chúng ta kiểm tra sự tồn tại của `"c"`
trong danh sách và ghi kết quả vào {{domxref("Node.textContent")}} của thẻ
`<span>`.

Trước hết là HTML:

```html
<span class="a b c"></span>
```

Bây giờ là JavaScript:

```js
const span = document.querySelector("span");
span.textContent = span.classList.contains("c")
  ? "The classList contains 'c'"
  : "The classList does not contain 'c'";
```

Kết quả sẽ như sau:

{{ EmbedLiveSample('Examples', '100%', 60) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
