---
title: "HTMLElement: sự kiện beforetoggle"
slug: Web/API/HTMLElement/beforetoggle_event
page-type: web-api-event
browser-compat: api.HTMLElement.beforetoggle_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`beforetoggle`** của giao diện {{domxref("HTMLElement")}} được kích hoạt trên phần tử {{domxref("Popover_API", "popover", "", "nocode")}} hoặc phần tử {{htmlelement("dialog")}} ngay trước khi nó được hiển thị hoặc ẩn.

- Nếu phần tử đang chuyển từ ẩn sang hiển thị, thuộc tính [`event.oldState`](/en-US/docs/Web/API/ToggleEvent/oldState) sẽ được đặt thành `closed` và thuộc tính [`event.newState`](/en-US/docs/Web/API/ToggleEvent/newState) sẽ được đặt thành `open`.
- Nếu phần tử đang chuyển từ hiển thị sang ẩn, thì `event.oldState` sẽ là `open` và `event.newState` sẽ là `closed`.

Sự kiện này có thể [hủy](/en-US/docs/Web/API/Event/cancelable) khi phần tử được bật sang trạng thái mở ("show") nhưng không thể hủy khi đang đóng.

Trong số những công dụng khác, sự kiện này có thể được dùng để:

- Ngăn không cho một phần tử được hiển thị.
- Thêm hoặc xóa các class hoặc thuộc tính trên phần tử hoặc các phần tử liên quan, ví dụ để kiểm soát hành vi hoạt ảnh của hộp thoại khi mở và đóng.
- Xóa trạng thái của phần tử trước khi nó được mở hoặc sau khi bị ẩn, ví dụ để đặt lại form hộp thoại và giá trị trả về về trạng thái trống, hoặc ẩn các popover thủ công lồng nhau khi mở lại popup.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("beforetoggle", (event) => { })

onbeforetoggle = (event) => { }
```

## Loại sự kiện

Một {{domxref("ToggleEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ToggleEvent")}}

## Ví dụ

Các ví dụ dưới đây mô tả cách sử dụng sự kiện `beforetoggle` với phần tử {{domxref("Popover_API", "popover", "", "nocode")}}.
Các ví dụ tương tự cũng áp dụng được cho phần tử {{htmlelement("dialog")}}.

### Ví dụ cơ bản

Ví dụ này cho thấy cách lắng nghe sự kiện `beforetoggle` và ghi nhật ký kết quả.

#### HTML

HTML bao gồm một popover và một nút để bật/tắt nó.

```html
<button popovertarget="mypopover">Toggle the popover</button>
<div id="mypopover" popover>Popover content</div>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 150px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

#### JavaScript

Đoạn mã thêm trình lắng nghe sự kiện cho `beforetoggle` và ghi nhật ký trạng thái.

```js
const popover = document.getElementById("mypopover");

popover.addEventListener("beforetoggle", (event) => {
  if (event.newState === "open") {
    log("Popover is about to be shown");
  } else {
    log("Popover is about to be hidden");
  }
});
```

#### Kết quả

{{EmbedLiveSample("Basic example", '100%', "250px")}}

### Ngăn popover mở

Sự kiện `beforetoggle` có thể hủy nếu được kích hoạt khi mở một phần tử.

Dưới đây là ví dụ về cách một popover có thể kiểm tra xem nó có được phép mở hay không, nếu không thì gọi {{domxref("Event.preventDefault()")}} để hủy sự kiện.
Trong ví dụ này, chúng ta dùng hộp kiểm để đặt xem popover có được phép mở hay không: trong ví dụ thực tế hơn, điều này có thể phụ thuộc vào trạng thái ứng dụng hoặc dữ liệu trong popover đã sẵn sàng để hiển thị.

#### HTML

HTML bao gồm một popover, một nút để bật/tắt nó và một hộp kiểm để đặt xem popover có được mở hay không.

```html
<button popovertarget="mypopover">Toggle the popover</button>
<label for="allow-popover">
  Allow opening <input type="checkbox" id="allow-popover" checked />
</label>
<div id="mypopover" popover>Popover content</div>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 150px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

#### JavaScript

Đầu tiên, chúng ta thiết lập đoạn mã mô phỏng trạng thái muốn cho phép popover mở.
Điều này được biểu diễn bằng biến `allowOpen`, được bật/tắt khi hộp kiểm liên quan thay đổi.

```js
const allowCheckbox = document.getElementById("allow-popover");

let allowOpen = true;

allowCheckbox.addEventListener("change", (event) => {
  allowOpen = allowCheckbox.checked;
});
```

Đoạn mã thêm trình lắng nghe sự kiện cho `beforetoggle`.
Nếu `allowOpen` là false thì `preventDefault()` được gọi, ngăn popup mở.

```js
const popover = document.getElementById("mypopover");

popover.addEventListener("beforetoggle", (event) => {
  if (event.newState === "open") {
    if (allowOpen) {
      log("Popover is about to be shown");
    } else {
      log("Popover opening prevented");
      event.preventDefault();
    }
  } else {
    log("Popover is about to be hidden");
  }
});
```

#### Kết quả

{{EmbedLiveSample("Prevent a popover opening", '100%', "250px")}}

### Các ví dụ khác

- Ví dụ [Mở hộp thoại modal](/en-US/docs/Web/API/HTMLDialogElement#open_close_a_modal_dialog) trong `HTMLDialogElement`

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML toàn cục [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover)
- [API Popover](/en-US/docs/Web/API/Popover_API)
- Sự kiện liên quan: [`toggle`](/en-US/docs/Web/API/HTMLElement/toggle_event)
