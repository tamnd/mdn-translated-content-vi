---
title: "EventSource: constructor EventSource()"
short-title: EventSource()
slug: Web/API/EventSource/EventSource
page-type: web-api-constructor
browser-compat: api.EventSource.EventSource
---

{{APIRef("Server Sent Events")}}{{AvailableInWorkers}}

Constructor **`EventSource()`** trả về một {{domxref("EventSource")}} mới được tạo, đại diện cho một tài nguyên từ xa.

## Cú pháp

```js-nolint
new EventSource(url)
new EventSource(url, options)
```

### Tham số

- `url`
  - : Một chuỗi biểu thị vị trí của tài nguyên từ xa đang phục vụ các sự kiện/thông điệp.
- `options` {{optional_inline}}
  - : Cung cấp các tùy chọn để cấu hình kết nối mới. Các mục có thể có là:
    - `withCredentials` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`, cho biết CORS có nên được đặt để bao gồm thông tin xác thực hay không.

## Ví dụ

```js
const evtSource = new EventSource("sse.php");
const eventList = document.querySelector("ul");

evtSource.onmessage = (e) => {
  const newElement = document.createElement("li");

  newElement.textContent = `message: ${e.data}`;
  eventList.appendChild(newElement);
};
```

> [!NOTE]
> Bạn có thể tìm thấy một ví dụ đầy đủ trên GitHub, xem [Simple SSE demo using PHP](https://github.com/mdn/dom-examples/tree/main/server-sent-events).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("EventSource")}}
