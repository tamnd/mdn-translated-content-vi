---
title: "HTMLInputElement: sự kiện cancel"
short-title: cancel
slug: Web/API/HTMLInputElement/cancel_event
page-type: web-api-event
browser-compat: api.HTMLInputElement.cancel_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`cancel`** được kích hoạt trên phần tử {{HTMLElement("input")}} khi người dùng hủy hộp thoại chọn tệp qua phím <kbd>Esc</kbd> hoặc nút hủy và khi người dùng chọn lại các tệp giống như đã chọn trước đó của `type="file"`.

Sự kiện này không thể hủy nhưng có thể nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("cancel", (event) => { })

oncancel = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Hủy một phần tử input

#### HTML

```html
<label for="file">Chọn một tệp. Hoặc không.</label>
<input type="file" id="file" name="file" />

<div id="result"></div>
```

```css hidden
div {
  margin-bottom: 10px;
}
```

#### JavaScript

```js
const elem = document.getElementById("file");

const result = document.getElementById("result");

elem.addEventListener("cancel", () => {
  result.textContent = "Đã hủy.";
});

elem.addEventListener("change", () => {
  if (elem.files.length === 1) {
    result.textContent = "Đã chọn tệp.";
  }
});
```

#### Kết quả

{{ EmbedLiveSample('Canceling an input element', '100%', '100px') }}

Mở bộ chọn tệp, sau đó đóng hộp thoại chọn bằng phím escape hoặc nút hủy. Cả hai sẽ khiến sự kiện cancel được kích hoạt. Ngoài ra, hãy thử chọn một tệp cục bộ trên máy của bạn; sau đó mở lại cửa sổ chọn tệp và chọn lại cùng tệp đó. Điều này cũng khiến sự kiện cancel được kích hoạt.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("input")}}
