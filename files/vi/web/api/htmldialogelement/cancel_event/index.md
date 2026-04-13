---
title: "HTMLDialogElement: sự kiện cancel"
short-title: cancel
slug: Web/API/HTMLDialogElement/cancel_event
page-type: web-api-event
browser-compat: api.HTMLDialogElement.cancel_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`cancel`** được kích hoạt trên một phần tử {{HTMLElement("dialog")}} khi người dùng kích hoạt một yêu cầu đóng.

Trình xử lý sự kiện `cancel` có thể được dùng để ghi đè hành vi mặc định khi nhận yêu cầu đóng, và ngăn hộp thoại đóng.
Nếu hành vi mặc định không bị ngăn, hộp thoại sẽ đóng và kích hoạt sự kiện {{domxref("HTMLDialogElement/close_event", "close")}}.

Các yêu cầu đóng có thể được kích hoạt bởi:

- Nhấn phím <kbd>Esc</kbd> trên các nền tảng máy tính để bàn
- Gọi phương thức {{domxref("HTMLDialogElement.requestClose()", "requestClose()")}}
- Nút quay lại trên các nền tảng di động

Sự kiện này có thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("cancel", (event) => { })

oncancel = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Hủy một hộp thoại

Ví dụ sau đây hiển thị một nút bấm, khi được nhấp vào, sẽ mở một {{htmlelement("dialog")}} bằng phương thức {{domxref("HTMLDialogElement.showModal()", "showModal()")}}.

Bạn có thể kích hoạt sự kiện `cancel` bằng cách nhấp vào nút _Yêu cầu đóng_ để đóng hộp thoại (thông qua phương thức {{domxref("HTMLDialogElement.requestClose()", "requestClose()")}}) hoặc bằng cách nhấn phím <kbd>Esc</kbd>.

Lưu ý rằng trình xử lý sự kiện `cancel` ghi lại sự kiện rồi trả về, cho phép hộp thoại đóng (điều này dẫn đến sự kiện `close` được phát ra).
Bạn có thể bỏ chú thích dòng chứa `event.preventDefault()` để hủy sự kiện.

#### HTML

```html
<dialog id="dialog">
  <button type="button" id="request-close">Yêu cầu đóng</button>
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

#### JavaScript

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

```js
const dialog = document.getElementById("dialog");
const openButton = document.getElementById("open");
const requestCloseButton = document.getElementById("request-close");

// Nút mở mở một hộp thoại modal
openButton.addEventListener("click", () => {
  log("sự kiện nhấp nút mở được kích hoạt", true);
  log("đã gọi dialog showModal()");
  dialog.showModal();
});

// Yêu cầu đóng
requestCloseButton.addEventListener("click", () => {
  log("sự kiện nhấp nút yêu cầu đóng được kích hoạt");
  log("đã gọi dialog requestClose()");
  // Kích hoạt sự kiện cancel
  dialog.requestClose();
});

// Được kích hoạt khi requestClose() được gọi
// Ngăn hộp thoại đóng bằng cách gọi event.preventDefault()
dialog.addEventListener("cancel", (event) => {
  log("sự kiện cancel của dialog được kích hoạt");
  // Bỏ chú thích hai dòng tiếp theo để ngăn hộp thoại đóng
  // log("đã hủy đóng dialog");
  // event.preventDefault();
});

dialog.addEventListener("close", (event) => {
  log("sự kiện close của dialog được kích hoạt");
});
```

#### Kết quả

{{ EmbedLiveSample('Canceling a dialog', '100%', '250px') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("dialog")}}
