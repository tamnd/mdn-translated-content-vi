---
title: "Response: thuộc tính type"
short-title: type
slug: Web/API/Response/type
page-type: web-api-instance-property
browser-compat: api.Response.type
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("Response")}} chứa kiểu của phản hồi. Kiểu này quyết định việc script có thể truy cập body và headers của phản hồi hay không.

## Giá trị

Một chuỗi, có thể là một trong các giá trị sau:

- `basic`
  - : Áp dụng trong một trong các trường hợp sau:
    - Yêu cầu là same-origin.
    - URL được yêu cầu có scheme là [`data:`](/en-US/docs/Web/URI/Reference/Schemes/data).
    - {{domxref("Request.mode", "mode")}} của yêu cầu là `navigate` hoặc `websocket`.

    Với kiểu này, tất cả header phản hồi đều được lộ ra ngoại trừ {{httpheader("Set-Cookie")}}.

- `cors`
  - : Yêu cầu là cross-origin và đã được xử lý thành công bằng [CORS](/en-US/docs/Web/HTTP/Guides/CORS). Với kiểu này, chỉ các {{glossary("CORS-safelisted response header", "CORS-safelisted response headers")}} được lộ ra.
- `error`
  - : Đã xảy ra lỗi mạng. Thuộc tính {{domxref("Response.status", "status")}} được đặt thành `0`, {{domxref("Response.body", "body")}} là `null`, headers rỗng và immutable.

    Đây là kiểu phản hồi được trả về bởi {{domxref("Response.error_static", "Response.error()")}}. Kiểu phản hồi này không được trả về bởi lời gọi {{domxref("Window.fetch", "fetch()")}}, vì nếu xảy ra lỗi mạng, promise sẽ bị reject.

- `opaque`
  - : Phản hồi cho một yêu cầu cross-origin có {{domxref("Request.mode", "mode")}} được đặt thành `no-cors`. Thuộc tính {{domxref("Response.status", "status")}} được đặt thành `0`, {{domxref("Response.body", "body")}} là `null`, headers rỗng và immutable.
- `opaqueredirect`
  - : Phản hồi cho một yêu cầu có tùy chọn {{domxref("Request.redirect", "redirect")}} được đặt thành `manual`, và yêu cầu đó đã bị server chuyển hướng. Thuộc tính {{domxref("Response.status", "status")}} được đặt thành `0`, {{domxref("Response.body", "body")}} là `null`, headers rỗng và immutable.

## Ví dụ

### Một phản hồi cơ bản

Yêu cầu same-origin sau sẽ trả về phản hồi `basic`:

```js
const response = await fetch("flowers.jpg");

console.log(response.type); // "basic"
```

### Phản hồi CORS

Giả sử `https://example.org` không phải là origin của bên gửi yêu cầu, và server trả về các CORS headers phù hợp, yêu cầu này sẽ trả về phản hồi `cors`:

```js
const response = await fetch("https://example.org/flowers.jpg");

console.log(response.type); // "cors"
```

### Phản hồi opaque

Yêu cầu sau được thực hiện với tùy chọn [`no-cors`](/en-US/docs/Web/API/Request/mode#no-cors), nên nó trả về phản hồi `opaque`:

```js
const response = await fetch("https://example.org/flowers.jpg", {
  mode: "no-cors",
});

console.log(response.type); // "opaque"
console.log(response.body); // null
console.log(response.status); // 0
```

### Phản hồi lỗi

Đoạn mã sau dùng {{domxref("Response.error_static", "Response.error()")}} để tạo phản hồi `error`:

```js
const response = Response.error();

console.log(response.type); // "error"
console.log(response.body); // null
console.log(response.status); // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
