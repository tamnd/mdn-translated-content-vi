---
title: "HTMLDialogElement: phương thức requestClose()"
short-title: requestClose()
slug: Web/API/HTMLDialogElement/requestClose
page-type: web-api-instance-method
browser-compat: api.HTMLDialogElement.requestClose
---

{{ APIRef("HTML DOM") }}

Phương thức **`requestClose()`** của giao diện {{domxref("HTMLDialogElement")}} yêu cầu đóng {{htmlelement("dialog")}}.
Có thể truyền một chuỗi tùy chọn làm đối số, cập nhật {{domxref("HTMLDialogElement.returnValue", "returnValue")}} của hộp thoại.

Phương thức này khác với {{domxref("HTMLDialogElement.close()", "close()")}} ở chỗ nó kích hoạt sự kiện {{domxref("HTMLDialogElement.cancel_event", "cancel")}} trước khi kích hoạt sự kiện {{domxref("HTMLDialogElement.close_event", "close")}}.
Tác giả có thể gọi {{domxref("Event.preventDefault()")}} trong trình xử lý cho sự kiện {{domxref("HTMLDialogElement.cancel_event", "cancel")}} để ngăn hộp thoại đóng.

Phương thức này phơi bày cùng hành vi với trình theo dõi đóng nội bộ của hộp thoại.

## Cú pháp

```js-nolint
requestClose()
requestClose(returnValue)
```

### Tham số

- `returnValue` {{optional_inline}}
  - : Một chuỗi đại diện cho giá trị cập nhật cho {{domxref("HTMLDialogElement.returnValue")}} của hộp thoại.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng `requestClose()`

Ví dụ sau đây hiển thị một nút bấm, khi được nhấp vào, sẽ mở một {{htmlelement("dialog")}} bằng phương thức {{domxref("HTMLDialogElement.showModal()", "showModal()")}}.
Từ đó bạn có thể nhấp vào nút _Đóng_ để gọi phương thức `requestClose()` và đóng hộp thoại.

Nút _Đóng_ đóng hộp thoại mà không có {{domxref("HTMLDialogElement.returnValue", "returnValue")}}, trong khi nút _Đóng kèm giá trị trả về_ đóng hộp thoại với một {{domxref("HTMLDialogElement.returnValue", "returnValue")}}.

Việc ngăn hộp thoại đóng được minh họa bằng một hộp kiểm.

#### HTML

```html
<dialog id="dialog">
  <div>
    <label><input type="checkbox" id="prevent-close" /> Hủy đóng</label>
  </div>
  <button type="button" id="close">Đóng</button>
  <button type="button" id="close-w-value">Đóng kèm giá trị trả về</button>
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
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const dialog = document.getElementById("dialog");
const openButton = document.getElementById("open");
const closeButton = document.getElementById("close");
const closeWithValueButton = document.getElementById("close-w-value");
const preventCloseInput = document.getElementById("prevent-close");

// Nút mở mở một hộp thoại modal
openButton.addEventListener("click", () => {
  // Đặt lại giá trị trả về
  dialog.returnValue = "";
  // Hiển thị hộp thoại
  dialog.showModal();
});

// Nút đóng đóng hộp thoại
closeButton.addEventListener("click", () => {
  dialog.requestClose();
});

// Nút đóng đóng hộp thoại với giá trị trả về
closeWithValueButton.addEventListener("click", () => {
  dialog.requestClose("some value");
});

// Được kích hoạt khi requestClose() được gọi
// Ngăn hộp thoại đóng bằng cách gọi event.preventDefault()
dialog.addEventListener("cancel", (event) => {
  if (preventCloseInput.checked) {
    log("Đã hủy đóng hộp thoại");
    event.preventDefault();
  }
});

// Sự kiện cancel không bị ngăn, hộp thoại sẽ đóng
dialog.addEventListener("close", () => {
  log(`Hộp thoại đã đóng. Giá trị trả về: "${dialog.returnValue}"`);
});
```

#### Kết quả

{{ EmbedLiveSample('Using `requestClose()`', '100%', '250px') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{htmlelement("dialog")}}
- Sự kiện {{domxref("HTMLDialogElement.cancel_event", "cancel")}}
