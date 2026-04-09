---
title: "BroadcastChannel: sự kiện message"
short-title: message
slug: Web/API/BroadcastChannel/message_event
page-type: web-api-event
browser-compat: api.BroadcastChannel.message_event
---

{{APIRef("BroadCastChannel API")}}{{AvailableInWorkers}}

Sự kiện **`message`** của giao diện {{domxref("BroadcastChannel")}} được kích hoạt khi một thông điệp đến trên kênh đó.

## Cú pháp

Dùng tên sự kiện này trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("message", (event) => { })

onmessage = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MessageEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, còn có các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("MessageEvent.data", "data")}} {{ReadOnlyInline}}
  - : Dữ liệu được bộ phát thông điệp gửi đi.
- {{domxref("MessageEvent.origin", "origin")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn nguồn gốc của bộ phát thông điệp.
- {{domxref("MessageEvent.lastEventId", "lastEventId")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn mã nhận dạng duy nhất của sự kiện.
- {{domxref("MessageEvent.source", "source")}} {{ReadOnlyInline}}
  - : Một _nguồn sự kiện thông điệp_, là một đối tượng {{glossary("WindowProxy")}}, {{domxref("MessagePort")}} hoặc {{domxref("ServiceWorker")}} biểu diễn bộ phát thông điệp.
- {{domxref("MessageEvent.ports", "ports")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("MessagePort")}} biểu diễn các cổng gắn với kênh mà thông điệp đang được gửi qua (khi phù hợp, ví dụ trong channel messaging hoặc khi gửi thông điệp tới shared worker).

## Ví dụ

Trong ví dụ này có một {{HTMLElement("iframe")}} "sender" phát đi nội dung của một {{HTMLElement("textarea")}} khi người dùng nhấn nút. Có hai iframe "receiver" lắng nghe thông điệp quảng bá và ghi kết quả vào một phần tử {{HTMLElement("div")}}.

### Sender

```html hidden
<h1>Sender</h1>
<label for="message">Type a message to broadcast:</label><br />
<textarea id="message" name="message" rows="1" cols="40">Hello</textarea>
<button id="broadcast-message" type="button">Broadcast message</button>
```

```css hidden
body {
  border: 1px solid black;
  padding: 0.5rem;
  height: 150px;
  font-family: "Fira Sans", sans-serif;
}

h1 {
  font:
    1.6em "Fira Sans",
    sans-serif;
  margin-bottom: 1rem;
}

textarea {
  padding: 0.2rem;
}

label,
br {
  margin: 0.5rem 0;
}

button {
  vertical-align: top;
  height: 1.5rem;
}
```

```js
const channel = new BroadcastChannel("example-channel");
const messageControl = document.querySelector("#message");
const broadcastMessageButton = document.querySelector("#broadcast-message");

broadcastMessageButton.addEventListener("click", () => {
  channel.postMessage(messageControl.value);
});
```

### Receiver 1

```html hidden
<h1>Receiver 1</h1>
<div id="received"></div>
```

```css hidden
body {
  border: 1px solid black;
  padding: 0.5rem;
  height: 100px;
  font-family: "Fira Sans", sans-serif;
}

h1 {
  font:
    1.6em "Fira Sans",
    sans-serif;
  margin-bottom: 1rem;
}
```

```js
const channel = new BroadcastChannel("example-channel");
channel.addEventListener("message", (event) => {
  received.textContent = event.data;
});
```

### Receiver 2

```html hidden
<h1>Receiver 2</h1>
<div id="received"></div>
```

```css hidden
body {
  border: 1px solid black;
  padding: 0.5rem;
  height: 100px;
  font-family: "Fira Sans", sans-serif;
}

h1 {
  font:
    1.6em "Fira Sans",
    sans-serif;
  margin-bottom: 1rem;
}
```

```js
const channel = new BroadcastChannel("example-channel");
channel.addEventListener("message", (event) => {
  received.textContent = event.data;
});
```

### Kết quả

{{ EmbedLiveSample('Sender', '100%', 220) }}

{{ EmbedLiveSample('Receiver_1', '100%', 160) }}

{{ EmbedLiveSample('Receiver_2', '100%', 160) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện liên quan: {{domxref("BroadcastChannel/messageerror_event", "messageerror")}}.
