---
title: "HTMLElement: sự kiện toggle"
slug: Web/API/HTMLElement/toggle_event
page-type: web-api-event
browser-compat: api.HTMLElement.toggle_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`toggle`** của giao diện {{domxref("HTMLElement")}} kích hoạt trên phần tử {{domxref("Popover_API", "popover", "", "nocode")}}, phần tử {{htmlelement("dialog")}} hoặc phần tử {{htmlelement("details")}} ngay sau khi nó được hiển thị hoặc ẩn.

- Nếu phần tử đang chuyển từ ẩn sang hiển thị, thuộc tính [`event.oldState`](/en-US/docs/Web/API/ToggleEvent/oldState) sẽ được đặt thành `closed` và thuộc tính [`event.newState`](/en-US/docs/Web/API/ToggleEvent/newState) sẽ được đặt thành `open`.
- Nếu phần tử đang chuyển từ hiển thị sang ẩn, thì `event.oldState` sẽ là `open` và `event.newState` sẽ là `closed`.

Sự kiện này không thể [hủy](/en-US/docs/Web/API/Event/cancelable).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("toggle", (event) => { })

ontoggle = (event) => { }
```

## Loại sự kiện

Một {{domxref("ToggleEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ToggleEvent")}}

## Ví dụ

Ví dụ mã bên dưới mô tả cách sự kiện `toggle` có thể được dùng với {{domxref("Popover_API", "popover", "", "nocode")}}.
Mã tương tự cũng có thể được dùng cho phần tử {{htmlelement("dialog")}} hoặc {{htmlelement("details")}} theo cùng cách.

### Ví dụ cơ bản

Ví dụ này cho thấy cách lắng nghe sự kiện `toggle` và ghi nhật ký kết quả.

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

Đoạn mã thêm trình lắng nghe sự kiện cho `toggle` và ghi nhật ký trạng thái.

```js
const popover = document.getElementById("mypopover");

popover.addEventListener("toggle", (event) => {
  if (event.newState === "open") {
    log("Popover has been shown");
  } else {
    log("Popover has been hidden");
  }
});
```

#### Kết quả

{{EmbedLiveSample("Basic example", '100%', "250px")}}

### Ghi chú về hợp nhất sự kiện toggle

Nếu nhiều sự kiện `toggle` được kích hoạt trước khi vòng lặp sự kiện có cơ hội chạy, chỉ có một sự kiện duy nhất sẽ được kích hoạt.
Điều này được gọi là "hợp nhất sự kiện".

Ví dụ:

```js
popover.addEventListener("toggle", () => {
  // …
});

popover.showPopover();
popover.hidePopover();
// `toggle` only fires once
```

### Các ví dụ khác

- Ví dụ [Mở hộp thoại modal](/en-US/docs/Web/API/HTMLDialogElement#open_close_a_modal_dialog) trong `HTMLDialogElement`

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML toàn cục [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover)
- [API Popover](/en-US/docs/Web/API/Popover_API)
- Sự kiện liên quan: [`beforetoggle`](/en-US/docs/Web/API/HTMLElement/beforetoggle_event)
