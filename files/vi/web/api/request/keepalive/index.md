---
title: "Request: thuộc tính keepalive"
short-title: keepalive
slug: Web/API/Request/keepalive
page-type: web-api-instance-property
browser-compat: api.Request.keepalive
---

{{APIRef("Fetch API")}}

Thuộc tính chỉ đọc **`keepalive`** của giao diện {{domxref("Request")}} chứa thiết lập `keepalive` của request (`true` hoặc `false`), cho biết trình duyệt có giữ request liên quan này hoạt động hay không nếu trang khởi tạo nó bị tải dỡ trước khi request hoàn tất.

Điều này cho phép một request {{domxref('Window.fetch','fetch()')}}, chẳng hạn, gửi analytics ở cuối một phiên ngay cả khi người dùng rời khỏi trang hoặc đóng trang.
Điều này có một số lợi thế so với việc dùng {{domxref("Navigator.sendBeacon()")}} cho cùng mục đích, bao gồm cho phép dùng các phương thức HTTP khác ngoài [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST), tùy chỉnh các thuộc tính request, và truy cập response từ server thông qua promise của fetch.
Tính năng này cũng có sẵn trong [service workers](/en-US/docs/Web/API/Service_Worker_API).

## Giá trị

Một giá trị boolean cho biết trạng thái `keepalive` của request.

## Ví dụ

### Tạo Request với keepalive

Trong đoạn mã sau, chúng ta tạo một request mới bằng constructor {{domxref("Request.Request", "Request()")}} với `keepalive` được đặt là `true`, sau đó lưu giá trị `keepalive` của request vào một biến:

```js
const options = {
  keepalive: true,
};

const myRequest = new Request("flowers.jpg", options);
let myKeepAlive = myRequest.keepalive; // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
