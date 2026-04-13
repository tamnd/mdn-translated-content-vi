---
title: UI Events
slug: Web/API/UI_Events
page-type: web-api-overview
spec-urls: https://w3c.github.io/uievents/
---

{{DefaultAPISidebar("UI Events")}}

## Khái niệm và cách sử dụng

API UI Events định nghĩa một hệ thống để xử lý tương tác người dùng như đầu vào chuột và bàn phím. Điều này bao gồm:

- Các sự kiện được kích hoạt trên các hành động người dùng cụ thể như nhấn phím hoặc nhấp chuột. Hầu hết các sự kiện này kích hoạt trên giao diện {{domxref("Element")}}, nhưng các sự kiện liên quan đến tải và gỡ tải tài nguyên kích hoạt trên giao diện {{domxref("Window")}}.
- Các giao diện sự kiện, được truyền vào các trình xử lý cho các sự kiện này. Các giao diện này kế thừa từ {{domxref("Event")}} và cung cấp thêm thông tin cụ thể về loại tương tác người dùng: ví dụ, {{domxref("KeyboardEvent")}} được truyền vào trình xử lý sự kiện {{domxref("Element.keydown_event", "keydown")}} và cung cấp thông tin về phím đã được nhấn.

## Giao diện

- {{domxref("CompositionEvent")}}
  - : Được truyền vào các trình xử lý cho các sự kiện composition. Các sự kiện composition cho phép người dùng nhập các ký tự có thể không có sẵn trên bàn phím vật lý.
- {{domxref("FocusEvent")}}
  - : Được truyền vào các trình xử lý cho các sự kiện focus, liên quan đến các phần tử nhận hoặc mất focus.
- {{domxref("InputEvent")}}
  - : Được truyền vào các trình xử lý cho các sự kiện input, liên quan đến người dùng nhập vào đầu vào nào đó; ví dụ, sử dụng phần tử {{HTMLElement("input")}}.
- {{domxref("KeyboardEvent")}}
  - : Được truyền vào các trình xử lý cho các sự kiện keyup/keydown của bàn phím.
- {{domxref("MouseEvent")}}
  - : Được truyền vào các trình xử lý sự kiện cho các sự kiện chuột, bao gồm di chuyển chuột, di chuyển qua và ra ngoài, và nhấn hoặc thả nút chuột. Lưu ý rằng các sự kiện {{domxref("Element.auxclick_event", "auxclick")}}, {{domxref("Element.click_event", "click")}} và {{domxref("Element.dblclick_event", "dblclick")}} được truyền đối tượng {{domxref("PointerEvent")}}.
- {{domxref("MouseScrollEvent")}} {{deprecated_inline}}
  - : Đã lỗi thời, giao diện phi tiêu chuẩn chỉ có trong Firefox cho các sự kiện cuộn. Hãy sử dụng {{domxref("WheelEvent")}} thay thế.
- {{domxref("MutationEvent")}} {{deprecated_inline}}
  - : Được truyền vào các trình xử lý sự kiện mutation, được thiết kế để cho phép thông báo về các thay đổi trong DOM. Hiện đã lỗi thời: hãy sử dụng {{domxref("MutationObserver")}} thay thế.
- {{domxref("UIEvent")}}
  - : Cơ sở mà các sự kiện UI khác kế thừa, và cũng là giao diện sự kiện được truyền vào một số sự kiện như {{domxref("Window.load_event", "load")}} và {{domxref("Window.unload_event", "unload")}}.
- {{domxref("WheelEvent")}}
  - : Được truyền vào trình xử lý cho sự kiện {{domxref("Element.wheel_event", "wheel")}}, kích hoạt khi người dùng xoay bánh xe chuột hoặc thành phần giao diện người dùng tương tự như touchpad.

## Sự kiện

- {{domxref("Window.abort_event", "abort")}}
  - : Kích hoạt khi tải tài nguyên bị hủy bỏ (ví dụ, vì người dùng đã hủy).
- {{domxref("Element.auxclick_event", "auxclick")}}
  - : Kích hoạt khi người dùng nhấp nút con trỏ không phải nút chính.
- {{domxref("Element.beforeinput_event", "beforeinput")}}
  - : Kích hoạt ngay trước khi DOM sắp được cập nhật với một số đầu vào người dùng.
- {{domxref("Element.blur_event", "blur")}}
  - : Kích hoạt khi một phần tử mất focus.
- {{domxref("Element.click_event", "click")}}
  - : Kích hoạt khi người dùng nhấp nút con trỏ chính.
- {{domxref("Element.compositionend_event", "compositionend")}}
  - : Kích hoạt khi hệ thống soạn thảo văn bản (như bộ xử lý chuyển giọng nói thành văn bản) đã kết thúc phiên làm việc; ví dụ, vì người dùng đã đóng nó.
- {{domxref("Element.compositionstart_event", "compositionstart")}}
  - : Kích hoạt khi người dùng đã bắt đầu phiên làm việc mới với hệ thống soạn thảo văn bản.
- {{domxref("Element.compositionupdate_event", "compositionupdate")}}
  - : Kích hoạt khi hệ thống soạn thảo văn bản cập nhật văn bản của nó với ký tự mới, được phản ánh trong cập nhật thuộc tính `data` của {{domxref("CompositionEvent")}}.
- {{domxref("Element.contextmenu_event", "contextmenu")}}
  - : Kích hoạt ngay trước khi menu ngữ cảnh được gọi.
- {{domxref("Element.dblclick_event", "dblclick")}}
  - : Kích hoạt khi người dùng nhấp đôi nút con trỏ chính.
- {{domxref("HTMLElement/error_event", "error")}}
  - : Kích hoạt khi tài nguyên tải thất bại hoặc không thể được xử lý (ví dụ, nếu ảnh không hợp lệ hoặc script có lỗi).
- {{domxref("Element.focus_event", "focus")}}
  - : Kích hoạt khi một phần tử nhận focus.
- {{domxref("Element.focusin_event", "focusin")}}
  - : Kích hoạt khi một phần tử sắp nhận focus.
- {{domxref("Element.focusout_event", "focusout")}}
  - : Kích hoạt khi một phần tử sắp mất focus.
- {{domxref("Element.input_event", "input")}}
  - : Kích hoạt ngay sau khi DOM đã được cập nhật với một số đầu vào người dùng (ví dụ, một số văn bản đầu vào).
- {{domxref("Element.keydown_event", "keydown")}}
  - : Kích hoạt khi người dùng đã nhấn một phím.
- {{domxref("Element.keypress_event", "keypress")}} {{deprecated_inline}}
  - : Kích hoạt khi người dùng đã nhấn một phím, chỉ nếu phím tạo ra giá trị ký tự. Hãy sử dụng {{domxref("Element.keydown_event", "keydown")}} thay thế.
- {{domxref("Element.keyup_event", "keyup")}}
  - : Kích hoạt khi người dùng đã thả một phím.
- {{domxref("Window.load_event", "load")}}
  - : Kích hoạt khi toàn bộ trang đã tải, bao gồm tất cả các tài nguyên phụ thuộc như stylesheet và ảnh.
- {{domxref("Element.mousedown_event", "mousedown")}}
  - : Kích hoạt khi người dùng nhấn nút trên chuột hoặc thiết bị trỏ khác, trong khi con trỏ đang trên phần tử.
- {{domxref("Element.mouseenter_event", "mouseenter")}}
  - : Kích hoạt khi chuột hoặc thiết bị trỏ khác được di chuyển vào bên trong ranh giới của phần tử hoặc một trong các phần tử con của nó.
- {{domxref("Element.mouseleave_event", "mouseleave")}}
  - : Kích hoạt khi chuột hoặc thiết bị trỏ khác được di chuyển ra ngoài ranh giới của phần tử và tất cả các phần tử con của nó.
- {{domxref("Element.mousemove_event", "mousemove")}}
  - : Kích hoạt khi chuột hoặc thiết bị trỏ khác được di chuyển trong khi đang trên phần tử.
- {{domxref("Element.mouseout_event", "mouseout")}}
  - : Kích hoạt khi chuột hoặc thiết bị trỏ khác được di chuyển ra ngoài ranh giới của phần tử.
- {{domxref("Element.mouseover_event", "mouseover")}}
  - : Kích hoạt khi chuột hoặc thiết bị trỏ khác được di chuyển qua một phần tử.
- {{domxref("Element.mouseup_event", "mouseup")}}
  - : Kích hoạt khi người dùng thả nút trên chuột hoặc thiết bị trỏ khác, trong khi con trỏ đang trên phần tử.
- {{domxref("Window.unload_event", "unload")}}
  - : Kích hoạt khi tài liệu hoặc tài nguyên con đang được gỡ tải.
- {{domxref("Element.wheel_event", "wheel")}}
  - : Kích hoạt khi người dùng xoay bánh xe chuột hoặc thành phần giao diện người dùng tương tự như touchpad.

## Ví dụ

### Sự kiện chuột

Ví dụ này ghi lại các sự kiện chuột cùng với tọa độ X và Y tại điểm sự kiện được tạo ra. Hãy thử di chuyển chuột vào hình vuông vàng và đỏ, và nhấp hoặc nhấp đôi.

#### HTML

```html
<div id="outer">
  <div id="inner"></div>
</div>

<div id="log">
  <pre id="contents"></pre>
  <button id="clear">Clear log</button>
</div>
```

#### CSS

```css
body {
  display: flex;
  gap: 1rem;
}

#outer {
  height: 200px;
  width: 200px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: yellow;
}

#inner {
  height: 100px;
  width: 100px;
  background-color: red;
}

#contents {
  height: 150px;
  width: 250px;
  border: 1px solid black;
  padding: 0.5rem;
  overflow: scroll;
}
```

#### JavaScript

```js
const outer = document.querySelector("#outer");
const inner = document.querySelector("#inner");
const contents = document.querySelector("#contents");
const clear = document.querySelector("#clear");
let lines = 0;

outer.addEventListener("click", (event) => {
  log(event);
});

outer.addEventListener("dblclick", (event) => {
  log(event);
});

outer.addEventListener("mouseover", (event) => {
  log(event);
});

outer.addEventListener("mouseout", (event) => {
  log(event);
});

outer.addEventListener("mouseenter", (event) => {
  log(event);
});

outer.addEventListener("mouseleave", (event) => {
  log(event);
});

function log(event) {
  const prefix = `${String(lines++).padStart(3, "0")}: `;
  const line = `${event.type}(${event.clientX}, ${event.clientY})`;
  contents.textContent = `${contents.textContent}${prefix}${line}\n`;
  contents.scrollTop = contents.scrollHeight;
}

clear.addEventListener("click", () => {
  contents.textContent = "";
  lines = 0;
});
```

#### Kết quả

{{EmbedLiveSample("Mouse events", 0, 250)}}

### Sự kiện bàn phím và đầu vào

Ví dụ này ghi lại các sự kiện {{domxref("Element.keydown_event", "keydown")}}, {{domxref("Element.beforeinput_event", "beforeinput")}} và {{domxref("Element.input_event", "input")}}. Hãy thử nhập vào vùng văn bản. Lưu ý rằng các phím như <kbd>Shift</kbd> tạo ra sự kiện `keydown` nhưng không phải sự kiện `input`.

#### HTML

```html
<textarea id="story" rows="5" cols="33"></textarea>

<div id="log">
  <pre id="contents"></pre>
  <button id="clear">Clear log</button>
</div>
```

#### CSS

```css
body {
  display: flex;
  gap: 1rem;
}

#story {
  padding: 0.5rem;
}

#contents {
  height: 150px;
  width: 250px;
  border: 1px solid black;
  padding: 0.5rem;
  overflow: scroll;
}
```

#### JavaScript

```js
const story = document.querySelector("#story");
const contents = document.querySelector("#contents");
const clear = document.querySelector("#clear");
let lines = 0;

story.addEventListener("keydown", (event) => {
  log(`${event.type}(${event.key})`);
});

story.addEventListener("beforeinput", (event) => {
  log(`${event.type}(${event.data})`);
});

story.addEventListener("input", (event) => {
  log(`${event.type}(${event.data})`);
});

function log(line) {
  const prefix = `${String(lines++).padStart(3, "0")}: `;
  contents.textContent = `${contents.textContent}${prefix}${line}\n`;
  contents.scrollTop = contents.scrollHeight;
}

clear.addEventListener("click", () => {
  contents.textContent = "";
  lines = 0;
});
```

#### Kết quả

{{EmbedLiveSample("Keyboard and input events", 0, 250)}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Pointer Events API](/en-US/docs/Web/API/Pointer_events)
- [Touch Events](/en-US/docs/Web/API/Touch_events)
