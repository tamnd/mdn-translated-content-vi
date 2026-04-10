---
title: "DOMTokenList: phương thức remove()"
short-title: remove()
slug: Web/API/DOMTokenList/remove
page-type: web-api-instance-method
browser-compat: api.DOMTokenList.remove
---

{{APIRef("DOM")}}

Phương thức **`remove()`** của giao diện {{domxref("DOMTokenList")}}
loại bỏ các _token_ được chỉ định khỏi danh sách.

## Cú pháp

```js-nolint
remove(token1)
remove(token1, token2)
remove(token1, token2, /* …, */ tokenN)
```

### Tham số

- `token1`, …, `tokenN`
  - : Một chuỗi biểu thị token mà bạn muốn xóa khỏi danh sách.
    Nếu chuỗi không có trong danh sách, sẽ không có lỗi nào được ném ra và không có gì xảy ra.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong ví dụ sau, chúng ta lấy danh sách các lớp được đặt trên một
phần tử {{htmlelement("span")}} dưới dạng `DOMTokenList` bằng
{{domxref("Element.classList")}}. Sau đó chúng ta xóa một token khỏi danh sách, rồi ghi
danh sách vào {{domxref("Node.textContent")}} của thẻ `<span>`.

Trước hết là HTML:

```html
<span id="ab" class="a b c"></span> <span id="a" class="a b c"></span>
```

Bây giờ là JavaScript:

```js
const span = document.getElementById("ab");
const classes = span.classList;
classes.remove("c");
span.textContent = classes;
```

Để xóa nhiều lớp cùng lúc, bạn có thể truyền nhiều token. Thứ tự bạn truyền các token
không nhất thiết phải khớp với thứ tự chúng xuất hiện trong danh sách:

```js
const span2 = document.getElementById("a");
const classes2 = span2.classList;

classes2.remove("c", "b");
span2.textContent = classes2;
```

Kết quả sẽ như sau:

{{ EmbedLiveSample('Examples', '100%', 60) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
