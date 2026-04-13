---
title: "Client: phương thức postMessage()"
short-title: postMessage()
slug: Web/API/Client/postMessage
page-type: web-api-instance-method
browser-compat: api.Client.postMessage
---

{{APIRef("Service Worker API")}}{{AvailableInWorkers("service")}}

Phương thức **`postMessage()`** của giao diện {{domxref("Client")}} cho phép service worker gửi một thông điệp tới client ({{domxref("Window")}}, {{domxref("Worker")}} hoặc {{domxref("SharedWorker")}}). Thông điệp được nhận trong sự kiện `message` trên {{domxref("ServiceWorkerContainer", "navigator.serviceWorker")}}.

## Cú pháp

```js-nolint
postMessage(message)
postMessage(message, transfer)
postMessage(message, options)
```

### Tham số

- `message`
  - : Thông điệp sẽ được gửi tới client. Đây có thể là bất kỳ [kiểu có thể nhân bản theo structured clone](/vi/docs/Web/API/Web_Workers_API/Structured_clone_algorithm) nào.

    > [!NOTE]
    > Service worker không nằm trong cùng [cụm agent](/vi/docs/Web/JavaScript/Reference/Execution_model#agent_clusters_and_memory_sharing) với client của nó, vì vậy chúng không thể chia sẻ bộ nhớ. Các đối tượng {{jsxref("SharedArrayBuffer")}} hoặc các buffer view dựa trên chúng không thể được gửi qua các cụm agent. Nếu cố làm vậy, phía nhận sẽ phát sinh sự kiện {{domxref("BroadcastChannel/messageerror_event", "messageerror")}} chứa một {{domxref("DOMException")}} `DataCloneError`.

- `transfer` {{optional_inline}}
  - : Một [mảng](/vi/docs/Web/JavaScript/Reference/Global_Objects/Array) tùy chọn gồm các [đối tượng có thể chuyển giao](/vi/docs/Web/API/Web_Workers_API/Transferable_objects) để chuyển quyền sở hữu. Quyền sở hữu các đối tượng này được chuyển cho phía đích và chúng không còn sử dụng được ở phía gửi. Các đối tượng có thể chuyển giao này nên được đính kèm vào thông điệp; nếu không, chúng sẽ bị chuyển đi nhưng thực tế không thể truy cập được ở phía nhận.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `transfer` {{optional_inline}}
      - : Có cùng ý nghĩa với tham số `transfer`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Đoạn mã dưới đây gửi một thông điệp từ service worker tới client. Client được lấy bằng phương thức {{domxref("Clients.get()", "get()")}} trên {{domxref("ServiceWorkerGlobalScope.clients", "clients")}}, vốn là một biến toàn cục trong phạm vi service worker.

```js
addEventListener("fetch", (event) => {
  event.waitUntil(
    (async () => {
      // Thoát sớm nếu không thể truy cập client.
      // Ví dụ: nếu khác nguồn gốc.
      if (!event.clientId) return;

      // Lấy client.
      const client = await self.clients.get(event.clientId);
      // Thoát sớm nếu không lấy được client.
      // Ví dụ: nếu nó đã đóng.
      if (!client) return;

      // Gửi một thông điệp tới client.
      client.postMessage({
        msg: "Hey I just got a fetch from you!",
        url: event.request.url,
      });
    })(),
  );
});
```

Nhận thông điệp đó:

```js
navigator.serviceWorker.addEventListener("message", (event) => {
  console.log(event.data.msg, event.data.url);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
