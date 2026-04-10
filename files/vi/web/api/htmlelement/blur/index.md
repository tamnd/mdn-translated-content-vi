---
title: "HTMLElement: phương thức blur()"
short-title: blur()
slug: Web/API/HTMLElement/blur
page-type: web-api-instance-method
browser-compat: api.HTMLElement.blur
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLElement.blur()`** xóa tiêu điểm bàn phím khỏi phần tử hiện tại.

## Cú pháp

```js-nolint
blur()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa tiêu điểm khỏi ô nhập văn bản

#### HTML

```html
<input type="text" id="sampleText" value="Sample Text" /><br /><br />
<button type="button">Nhấp vào tôi để lấy tiêu điểm</button>
```

#### JavaScript

```js
const textField = document.getElementById("sampleText");
const button = document.querySelector("button");

function focusInput() {
  textField.focus();

  // Ô nhập sẽ mất tiêu điểm sau 3 giây
  setTimeout(() => {
    textField.blur();
  }, 3000);
}

button.addEventListener("click", focusInput);
```

#### Kết quả

{{ EmbedLiveSample('Remove_focus_from_a_text_input') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.focus")}}
