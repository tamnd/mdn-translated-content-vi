---
title: Server-sent events
slug: Web/API/Server-sent_events
page-type: web-api-overview
spec-urls: https://html.spec.whatwg.org/multipage/server-sent-events.html#server-sent-events
---

{{DefaultAPISidebar("Server Sent Events")}}{{AvailableInWorkers}}

Theo truyền thống, một trang web phải gửi yêu cầu đến server để nhận dữ liệu mới; tức là, trang yêu cầu dữ liệu từ server. Với server-sent events, server có thể gửi dữ liệu mới đến trang web bất cứ lúc nào, bằng cách đẩy thông điệp đến trang web. Các thông điệp đến này có thể được xử lý như _[Sự kiện](/en-US/docs/Web/API/Event) + dữ liệu_ bên trong trang web.

## Khái niệm và cách sử dụng

Để tìm hiểu cách sử dụng server-sent events, xem bài viết [Using server-sent events](/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events).

## Giao diện

- {{domxref("EventSource")}}
  - : Xác định tất cả các tính năng xử lý kết nối đến server, nhận sự kiện/dữ liệu, lỗi, đóng kết nối, v.v.

## Ví dụ

- [Simple SSE demo using PHP](https://github.com/mdn/dom-examples/tree/main/server-sent-events)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

### Công cụ

- [Mercure: a real-time communication protocol (publish-subscribe) built on top of SSE](https://mercure.rocks/)
- [Transmit: a native opinionated Server-Sent-Event (SSE) module built for AdonisJS](https://docs.adonisjs.com/guides/digging-deeper/server-sent-events)
- [EventSource polyfill for Node.js](https://github.com/EventSource/eventsource)
- Remy Sharp's [EventSource polyfill](https://github.com/remy/polyfills/blob/master/EventSource.js)
- Yaffle's [EventSource polyfill](https://github.com/Yaffle/EventSource)
- Rick Waldron's [jquery plugin](https://github.com/rwaldron/jquery.eventsource)
- intercooler.js [declarative SSE support](https://intercoolerjs.org/docs.html#sse)

### Chủ đề liên quan

- [Learn: Making network requests with JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Network_requests)
- [JavaScript](/en-US/docs/Web/JavaScript)
- [WebSockets](/en-US/docs/Web/API/WebSockets_API)

### Tài nguyên khác

- [Creating a wall/feed social application](https://hacks.mozilla.org/2011/06/a-wall-powered-by-eventsource-and-server-sent-events/) được hỗ trợ bởi server-sent events và [mã nguồn trên GitHub](https://github.com/mozilla/webowonder-demos/tree/master/demos/friends%20timeline).
