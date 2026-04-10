---
title: "EventSource: thuộc tính readyState"
short-title: readyState
slug: Web/API/EventSource/readyState
page-type: web-api-instance-property
browser-compat: api.EventSource.readyState
---

{{APIRef("Server Sent Events")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`readyState`** của giao diện {{domxref("EventSource")}} trả về một số biểu thị trạng thái của kết nối.

## Giá trị

Một số thuộc một trong ba hằng số trạng thái được định nghĩa trên giao diện {{domxref("EventSource")}}:

- `EventSource.CONNECTING` (0)
  - : Kết nối chưa mở.
- `EventSource.OPEN` (1)
  - : Kết nối đang mở và sẵn sàng giao tiếp.
- `EventSource.CLOSED` (2)
  - : Kết nối đã đóng hoặc không thể mở được.

## Ví dụ

```js
const evtSource = new EventSource("sse.php");
console.log(evtSource.readyState);
```

> [!NOTE]
> Bạn có thể tìm thấy một ví dụ đầy đủ trên GitHub, xem [Simple SSE demo using PHP](https://github.com/mdn/dom-examples/tree/main/server-sent-events).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("EventSource")}}
