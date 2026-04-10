---
title: "WebTransport: thuộc tính congestionControl"
short-title: congestionControl
slug: Web/API/WebTransport/congestionControl
page-type: web-api-instance-property
browser-compat: api.WebTransport.congestionControl
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`congestionControl`** của giao diện {{domxref("WebTransport")}} cho biết ưu tiên của ứng dụng đối với thông lượng cao hoặc độ trễ thấp khi gửi dữ liệu.

Giá trị này được đặt trong [`WebTransport()` constructor options](/en-US/docs/Web/API/WebTransport/WebTransport#congestioncontrol).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `default`
  - : Tinh chỉnh kiểm soát tắc nghẽn mặc định cho transport.
    Đây là giá trị mặc định.
- `throughput`
  - : Ứng dụng ưu tiên tinh chỉnh kiểm soát tắc nghẽn cho thông lượng.
- `low-latency`
  - : Ứng dụng ưu tiên tinh chỉnh kiểm soát tắc nghẽn cho độ trễ thấp.

## Ví dụ

Ví dụ này cho thấy cách lấy ưu tiên `congestionControl`.
Vì thuộc tính này không được đặt rõ trong constructor, kết quả là `default`.

```js
const url = "https://example.com:4999/wt";
const transport = new WebTransport(url);
console.log(transport.congestionControl); // default
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
