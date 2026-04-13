---
title: "HTMLDialogElement: sự kiện close"
short-title: close
slug: Web/API/HTMLDialogElement/close_event
page-type: web-api-event
browser-compat: api.HTMLDialogElement.close_event
---

{{APIRef("HTML DOM")}}

Sự kiện `close` được kích hoạt trên một đối tượng `HTMLDialogElement` khi {{htmlelement("dialog")}} mà nó đại diện đã được đóng.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("close", (event) => { })

onclose = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Xử lý các sự kiện `close`

Ví dụ này minh họa cách lắng nghe các sự kiện `close` được kích hoạt bởi một số phương thức khác nhau để đóng một hộp thoại:

- Gọi phương thức {{domxref("HTMLDialogElement.close()", "close()")}}
- Một biểu mẫu với `method="dialog"`. Việc gửi biểu mẫu sẽ đóng `dialog` và khiến sự kiện {{domxref("HTMLFormElement/submit_event", "submit")}} được kích hoạt, mà không gửi dữ liệu hoặc xóa biểu mẫu
- Phím <kbd>Esc</kbd>.
  Xem sự kiện {{domxref("HTMLDialogElement/cancel_event", "cancel")}}

#### HTML

```html
<dialog id="dialog">
  <form method="dialog">
    <button type="submit">Đóng qua method="dialog"</button>
  </form>
  <p><button id="close">Đóng qua phương thức .close()</button></p>
  <p>Hoặc nhấn phím <kbd>Esc</kbd></p>
</dialog>

<button id="open">Mở hộp thoại</button>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 170px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.getElementById("log");
function log(text, clear = false) {
  if (clear) {
    logElement.innerText = "";
  }
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

#### JavaScript

```js
const dialog = document.getElementById("dialog");
const openButton = document.getElementById("open");
const closeButton = document.getElementById("close");

openButton.addEventListener("click", () => {
  log("sự kiện nhấp nút mở được kích hoạt", true);
  log("đã gọi dialog showModal()");
  dialog.showModal();
});

closeButton.addEventListener("click", () => {
  log("sự kiện nhấp nút đóng được kích hoạt");
  log("đã gọi dialog close()");
  dialog.close();
});

dialog.addEventListener("close", (event) => {
  log("sự kiện close của dialog được kích hoạt");
});
```

#### Kết quả

{{ EmbedLiveSample('Handling `close` events', '100%', '250px') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{htmlelement("dialog")}}
