---
title: TextEvent
slug: Web/API/TextEvent
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.TextEvent
---

{{APIRef("UI Events")}}{{deprecated_header}}

Giao diện **`TextEvent`** là giao diện sự kiện UI cũ để báo cáo các thay đổi đối với các phần tử UI văn bản.

> [!NOTE]
> Các sự kiện `TextEvent` đã được thay thế bởi các sự kiện như `input`, `beforeinput`, `keypress`, `keyup` và `keydown`.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ phần tử cha {{domxref("UIEvent")}}, và gián tiếp từ {{domxref("Event")}}._

- {{domxref("TextEvent.data")}} {{ReadOnlyInline}} {{deprecated_inline}}
  - : Chỉ ra dữ liệu liên quan đến sự kiện.

## Phương thức phiên bản

- {{domxref("TextEvent.initTextEvent()")}} {{deprecated_inline}}
  - : Điền các giá trị của `TextEvent` mới này với các tham số đã cho.

## Danh sách sự kiện

Dưới đây là danh sách tất cả các sự kiện `TextEvent`:

- `textinput`

## Ví dụ

### Lắng nghe sự kiện nhập văn bản

Bạn có thể đăng ký trình nghe cho các sự kiện nhập văn bản bằng {{DOMxRef("EventTarget.addEventListener()")}} như sau:

```js
element.addEventListener("textInput", (event) => {
  // …
});
```

### Trình ghi log đơn giản hiển thị sự kiện đầu vào

Ví dụ này lắng nghe một số sự kiện được kích hoạt trên input, bao gồm `textInput`. Loại sự kiện và dữ liệu sự kiện được ghi lại, cho phép bạn xem nơi `textInput` được phát ra so với các sự kiện khác như những sự kiện được tạo bởi các phím bấm.

#### HTML

```html
<input placeholder="Enter some text" name="name" />
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 140px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const input = document.querySelector("input");

input.addEventListener("keypress", updateValue);
input.addEventListener("keyup", updateValue);
input.addEventListener("keydown", updateValue);
input.addEventListener("input", updateValue);
input.addEventListener("beforeinput", updateValue);
input.addEventListener("textInput", updateValue);

function updateValue(e) {
  log(`${e.type}: ${e.data}`);
}
```

#### Kết quả

{{EmbedLiveSample("Simple logger showing input events", "100%", "210px" )}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
