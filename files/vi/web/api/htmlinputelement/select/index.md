---
title: "HTMLInputElement: phương thức select()"
short-title: select()
slug: Web/API/HTMLInputElement/select
page-type: web-api-instance-method
browser-compat: api.HTMLInputElement.select
---

{{ APIRef("HTML DOM") }}

Phương thức **`HTMLInputElement.select()`** chọn tất cả văn bản trong phần tử {{HTMLElement("textarea")}} hoặc trong phần tử {{HTMLElement("input")}} bao gồm trường văn bản.

## Cú pháp

```js-nolint
select()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Nhấp vào nút trong ví dụ này để chọn tất cả văn bản trong phần tử `<input>`.

### HTML

```html
<input type="text" id="text-box" size="20" value="Hello world!" />
<button>Chọn văn bản</button>
```

### JavaScript

```js
function selectText() {
  const input = document.getElementById("text-box");
  input.focus();
  input.select();
}

document.querySelector("button").addEventListener("click", selectText);
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Ghi chú

Gọi `element.select()` sẽ không nhất thiết focus đầu vào, vì vậy nó thường được sử dụng cùng với {{domxref("HTMLElement.focus")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ HTMLElement("input") }}
- {{ HTMLElement("textarea") }}
- {{ domxref("HTMLInputElement") }}
- {{ domxref("HTMLInputElement.setSelectionRange") }}
