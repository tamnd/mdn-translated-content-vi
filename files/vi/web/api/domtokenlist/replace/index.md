---
title: "DOMTokenList: phương thức replace()"
short-title: replace()
slug: Web/API/DOMTokenList/replace
page-type: web-api-instance-method
browser-compat: api.DOMTokenList.replace
---

{{APIRef("DOM")}}

Phương thức **`replace()`** của giao diện {{domxref("DOMTokenList")}}
thay thế một token hiện có bằng một token mới.
Nếu token đầu tiên không tồn tại, `replace()` sẽ trả về `false` ngay lập tức,
không thêm token mới vào danh sách token.

## Cú pháp

```js-nolint
replace(oldToken, newToken)
```

### Tham số

- `oldToken`
  - : Một chuỗi biểu thị token mà bạn muốn thay thế.
- `newToken`
  - : Một chuỗi biểu thị token mà bạn muốn dùng để thay thế `oldToken`.

### Giá trị trả về

Một giá trị boolean, là `true` nếu `oldToken` được thay thế thành công, hoặc `false` nếu không.

## Ví dụ

Trong ví dụ sau, chúng ta lấy danh sách các lớp được đặt trên một
phần tử {{htmlelement("span")}} dưới dạng `DOMTokenList` bằng
{{domxref("Element.classList")}}. Sau đó chúng ta thay thế một token trong danh sách, rồi ghi
danh sách vào {{domxref("Node.textContent")}} của thẻ `<span>`.

Trước hết là HTML:

```html
<span class="a b c"></span>
```

Bây giờ là JavaScript:

```js
const span = document.querySelector("span");
const classes = span.classList;

const result = classes.replace("c", "z");

span.textContent = result ? classes : "token not replaced successfully";
```

Kết quả sẽ như sau:

{{ EmbedLiveSample('Examples', '100%', 60) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
