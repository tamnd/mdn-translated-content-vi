---
title: "ServiceWorker: phương thức postMessage()"
short-title: postMessage()
slug: Web/API/ServiceWorker/postMessage
page-type: web-api-instance-method
browser-compat: api.ServiceWorker.postMessage
---

{{APIRef("Service Workers API")}}{{securecontext_header}}{{AvailableInWorkers}}

Phương thức **`postMessage()`** của giao diện {{domxref("ServiceWorker")}} gửi một thông điệp đến worker. Tham số đầu tiên là dữ liệu cần gửi đến worker. Dữ liệu có thể là bất kỳ đối tượng JavaScript nào có thể được xử lý bởi [thuật toán sao chép theo cấu trúc](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).

Service worker có thể gửi thông tin trở lại các client của nó bằng cách sử dụng phương thức {{domxref("Client.postMessage", "postMessage()")}}. Thông điệp sẽ không được gửi trở lại đối tượng `ServiceWorker` này mà đến {{domxref("ServiceWorkerContainer")}} được liên kết, khả dụng thông qua {{domxref("navigator.serviceWorker")}}.

## Cú pháp

```js-nolint
postMessage(message)
postMessage(message, transfer)
postMessage(message, options)
```

### Tham số

- `message`
  - : Đối tượng cần chuyển đến worker; đối tượng này sẽ nằm trong trường `data` của sự kiện được chuyển đến sự kiện {{domxref("ServiceWorkerGlobalScope.message_event", "message")}}. Đây có thể là bất kỳ đối tượng JavaScript nào được xử lý bởi [thuật toán sao chép theo cấu trúc](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).

    Tham số `message` là bắt buộc. Nếu dữ liệu cần truyền đến worker không quan trọng, phải truyền rõ ràng `null` hoặc `undefined`.

    > [!NOTE]
    > Service worker không nằm trong cùng [nhóm agent](/en-US/docs/Web/JavaScript/Reference/Execution_model#agent_clusters_and_memory_sharing) với client của nó, do đó không thể chia sẻ bộ nhớ. Các đối tượng {{jsxref("SharedArrayBuffer")}}, hoặc các buffer view được hỗ trợ bởi nó, không thể được đăng qua các nhóm agent. Việc cố gắng làm vậy sẽ tạo ra sự kiện {{domxref("BroadcastChannel/messageerror_event", "messageerror")}} chứa {{domxref("DOMException")}} `DataCloneError` ở đầu nhận.

- `transfer` {{optional_inline}}
  - : Một [mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) [các đối tượng có thể chuyển nhượng](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) tùy chọn để chuyển quyền sở hữu. Quyền sở hữu của các đối tượng này được chuyển cho phía đích và chúng không còn khả dụng ở phía gửi. Các đối tượng có thể chuyển nhượng này nên được đính kèm vào thông điệp; nếu không chúng sẽ được di chuyển nhưng thực sự không thể truy cập ở đầu nhận.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `transfer` {{optional_inline}}
      - : Có ý nghĩa giống như tham số `transfer`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : Được ném ra nếu tham số `message` không được cung cấp.

## Ví dụ

Trong ví dụ này, một {{domxref("ServiceWorker")}} được tạo và một thông điệp được gửi ngay lập tức:

```js
navigator.serviceWorker.register("service-worker.js");

navigator.serviceWorker.ready.then((registration) => {
  registration.active.postMessage(
    "Test message sent immediately after creation",
  );
});
```

Để nhận thông điệp, service worker, trong `service-worker.js`, phải lắng nghe sự kiện {{domxref("ServiceWorkerGlobalScope.message_event", "message")}} trên phạm vi toàn cục của nó.

```js
// Đoạn này phải nằm trong `service-worker.js`
addEventListener("message", (event) => {
  console.log(`Message received: ${event.data}`);
});
```

Lưu ý rằng service worker có thể gửi thông điệp trở lại luồng chính bằng cách sử dụng phương thức {{domxref("Client.postMessage()", "postMessage()")}}. Để nhận nó, luồng chính cần lắng nghe sự kiện {{domxref("ServiceWorkerContainer.message_event", "message")}} trên đối tượng {{domxref("ServiceWorkerContainer")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("ServiceWorker")}} mà nó thuộc về.
- Phương thức đối ứng {{domxref("Client.postMessage()", "postMessage()")}} mà service worker phải sử dụng để gửi thông điệp trở lại {{domxref("ServiceWorkerContainer")}} được liên kết.
