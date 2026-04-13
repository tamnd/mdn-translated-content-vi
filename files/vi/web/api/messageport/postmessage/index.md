---
title: "MessagePort: phương thức postMessage()"
short-title: postMessage()
slug: Web/API/MessagePort/postMessage
page-type: web-api-instance-method
browser-compat: api.MessagePort.postMessage
---

{{APIRef("Channel Messaging API")}} {{AvailableInWorkers}}

Phương thức **`postMessage()`** của giao diện {{domxref("MessagePort")}} gửi một tin nhắn từ cổng và tùy chọn, chuyển quyền sở hữu các đối tượng sang các browsing context khác.

## Cú pháp

```js-nolint
postMessage(message)
postMessage(message, transfer)
postMessage(message, options)
```

### Tham số

- `message`
  - : Tin nhắn bạn muốn gửi qua channel. Có thể là bất kỳ kiểu dữ liệu cơ bản nào. Nhiều mục dữ liệu có thể được gửi dưới dạng mảng.

    > [!NOTE]
    > Các execution context có thể gửi tin nhắn cho nhau có thể không cùng [agent cluster](/en-US/docs/Web/JavaScript/Reference/Execution_model#agent_clusters_and_memory_sharing) và do đó không thể chia sẻ bộ nhớ. Các đối tượng {{jsxref("SharedArrayBuffer")}}, hoặc buffer view dựa trên một đối tượng như vậy, không thể được gửi qua các agent cluster. Cố gắng làm vậy sẽ tạo ra sự kiện {{domxref("BroadcastChannel/messageerror_event", "messageerror")}} chứa `DataCloneError` {{domxref("DOMException")}} ở phía nhận.

- `transfer` {{optional_inline}}
  - : Một [mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) tùy chọn các [transferable object](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) để chuyển quyền sở hữu. Quyền sở hữu của các đối tượng này được trao cho phía đích và chúng không còn có thể sử dụng ở phía gửi. Các transferable object này phải được đính kèm vào tin nhắn; nếu không chúng sẽ được di chuyển nhưng thực tế không thể truy cập ở phía nhận.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `transfer` {{optional_inline}}
      - : Có cùng ý nghĩa với tham số `transfer`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong đoạn mã dưới đây, bạn có thể thấy một channel mới được tạo bằng hàm khởi tạo {{domxref("MessageChannel.MessageChannel", "MessageChannel()")}}. Khi IFrame đã tải, chúng ta chuyển {{domxref("MessageChannel.port2")}} đến IFrame bằng {{domxref("window.postMessage")}} cùng với một tin nhắn. IFrame nhận tin nhắn và gửi tin nhắn trở lại trên `MessageChannel` bằng `postMessage()`. Hàm xử lý `handleMessage` sau đó phản hồi tin nhắn được gửi từ iframe bằng `onmessage`, hiển thị vào đoạn văn. {{domxref("MessageChannel.port1")}} được lắng nghe để kiểm tra khi tin nhắn đến.

```js
const channel = new MessageChannel();
const para = document.querySelector("p");

const ifr = document.querySelector("iframe");
const otherWindow = ifr.contentWindow;

ifr.addEventListener("load", iframeLoaded);

function iframeLoaded() {
  otherWindow.postMessage("Transferring message port", "*", [channel.port2]);
}

channel.port1.onmessage = handleMessage;
function handleMessage(e) {
  para.innerHTML = e.data;
}

// in the iframe…

window.addEventListener("message", (event) => {
  const messagePort = event.ports?.[0];
  messagePort.postMessage("Hello from the iframe!");
});
```

Để xem ví dụ đầy đủ đang hoạt động, hãy xem [channel messaging basic demo](https://github.com/mdn/dom-examples/tree/main/channel-messaging-basic) trên GitHub ([chạy trực tiếp](https://mdn.github.io/dom-examples/channel-messaging-basic/)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng channel messaging](/en-US/docs/Web/API/Channel_Messaging_API/Using_channel_messaging)
