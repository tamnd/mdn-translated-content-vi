---
title: "EventSource: thuộc tính url"
short-title: url
slug: Web/API/EventSource/url
page-type: web-api-instance-property
browser-compat: api.EventSource.url
---

{{APIRef("Server Sent Events")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`url`** của giao diện {{domxref("EventSource")}} trả về một chuỗi biểu thị URL của nguồn.

## Giá trị

Một chuỗi biểu thị URL của nguồn.

## Ví dụ

```js
const evtSource = new EventSource("sse.php");
console.log(evtSource.url);
```

> [!NOTE]
> Bạn có thể tìm thấy một ví dụ đầy đủ trên GitHub, xem [Simple SSE demo using PHP](https://github.com/mdn/dom-examples/tree/main/server-sent-events).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("EventSource")}}
