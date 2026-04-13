---
title: "EventSource: thuộc tính withCredentials"
short-title: withCredentials
slug: Web/API/EventSource/withCredentials
page-type: web-api-instance-property
browser-compat: api.EventSource.withCredentials
---

{{APIRef("Server Sent Events")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`withCredentials`** của giao diện {{domxref("EventSource")}} trả về một giá trị boolean cho biết đối tượng `EventSource` có được khởi tạo với bộ thông tin xác thực CORS hay không.

## Giá trị

Một giá trị boolean cho biết đối tượng `EventSource` có được khởi tạo với bộ thông tin xác thực CORS (`true`) hay không (`false`, mặc định).

## Ví dụ

```js
const evtSource = new EventSource("sse.php");
console.log(evtSource.withCredentials);
```

> [!NOTE]
> Bạn có thể tìm thấy một ví dụ đầy đủ trên GitHub, xem [Simple SSE demo using PHP](https://github.com/mdn/dom-examples/tree/main/server-sent-events).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("EventSource")}}
