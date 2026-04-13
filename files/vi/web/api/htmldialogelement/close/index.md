---
title: "HTMLDialogElement: phương thức close()"
short-title: close()
slug: Web/API/HTMLDialogElement/close
page-type: web-api-instance-method
browser-compat: api.HTMLDialogElement.close
---

{{ APIRef("HTML DOM") }}

Phương thức **`close()`** của giao diện {{domxref("HTMLDialogElement")}} đóng {{htmlelement("dialog")}}.
Có thể truyền một chuỗi tùy chọn làm đối số, cập nhật {{domxref("HTMLDialogElement.returnValue", "returnValue")}} của hộp thoại.

Sự kiện {{domxref("HTMLDialogElement.close_event", "close")}} được kích hoạt sau khi hộp thoại đã đóng.
Không giống như khi gọi {{domxref("HTMLDialogElement.requestClose()")}}, thao tác đóng không thể bị hủy.

## Cú pháp

```js-nolint
close()
close(returnValue)
```

### Tham số

- `returnValue` {{optional_inline}}
  - : Một chuỗi thay thế giá trị hiện tại của {{domxref("HTMLDialogElement.returnValue")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Đóng một hộp thoại

Ví dụ sau đây hiển thị một nút bấm, khi được nhấp vào, sẽ mở một {{htmlelement("dialog")}} thông qua phương thức {{domxref("HTMLDialogElement.showModal()", "showModal()")}}.
Từ đó bạn có thể nhấp vào nút _Đóng_ để đóng hộp thoại (thông qua phương thức `close()`).

Nút _Đóng_ đóng hộp thoại mà không có {{domxref("HTMLDialogElement.returnValue", "returnValue")}}, trong khi nút _Đóng kèm giá trị trả về_ đóng hộp thoại với một {{domxref("HTMLDialogElement.returnValue", "returnValue")}}.

#### HTML

```html
<dialog id="dialog">
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

#### JavaScript

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

// Nút mở mở một hộp thoại modal
openButton.addEventListener("click", () => {
  // Đặt lại giá trị trả về
  dialog.returnValue = "";
  // Hiển thị hộp thoại
  dialog.showModal();
});

// Nút đóng đóng hộp thoại
closeButton.addEventListener("click", () => {
  dialog.close();
});

// Nút đóng đóng hộp thoại với giá trị trả về
closeWithValueButton.addEventListener("click", () => {
  dialog.close(`Đóng lúc ${new Date().toLocaleTimeString()}`);
});

// Nút đóng biểu mẫu đóng hộp thoại
dialog.addEventListener("close", () => {
  log(`Hộp thoại đã đóng. Giá trị trả về: "${dialog.returnValue}"`);
});
```

> [!NOTE]
>
> Bạn còn có thể tự động đóng một `<dialog>` bằng cách gửi một phần tử {{htmlelement("form")}} với thuộc tính [`method="dialog"`](/en-US/docs/Web/HTML/Reference/Elements/form#method).

### Kết quả

{{ EmbedLiveSample('Closing a dialog', '100%', '250px') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{htmlelement("dialog")}}
- Sự kiện {{domxref("HTMLDialogElement.close_event", "close")}}
- {{domxref("HTMLDialogElement.requestClose()")}}
