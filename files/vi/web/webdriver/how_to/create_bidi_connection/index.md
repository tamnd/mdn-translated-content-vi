---
title: Create a WebDriver BiDi connection
short-title: Create a BiDi connection
slug: Web/WebDriver/How_to/Create_BiDi_connection
page-type: how-to
sidebar: webdriver
---

Client và browser giao tiếp bằng giao thức WebDriver BiDi qua một kết nối WebSocket. Có hai cách để client thiết lập kết nối này.

Trong một phương pháp, khi tạo một phiên WebDriver classic, client WebDriver đặt capability [`webSocketUrl`](/en-US/docs/Web/WebDriver/Reference/Capabilities/webSocketUrl) thành `true` để yêu cầu bật BiDi; sau đó client khởi động trình duyệt với cổng WebSocket đã mở.

Trong phương pháp còn lại, client WebDriver khởi động trình duyệt từ dòng lệnh bằng cách truyền cờ bắt buộc và cổng mong muốn. Phương pháp này hoạt động trực tiếp với Firefox; tuy nhiên, các trình duyệt dựa trên Chromium cần thêm gói Chromium BiDi wrapper. Các phần trong bài viết này sẽ hướng dẫn bạn phương pháp này bằng Firefox.

## Khởi chạy trình duyệt

Để dùng WebDriver BiDi, bạn cần bật nó trong trình duyệt bằng cách khởi chạy với cờ `--remote-debugging-port`. Trình duyệt sau đó sẽ lắng nghe các kết nối WebSocket đến trên cổng đã chỉ định. Cổng `9222` là giá trị mặc định phổ biến cho gỡ lỗi trình duyệt, nhưng bạn có thể dùng bất kỳ cổng nào khả dụng, hoặc chỉ định `0` để hệ thống tự động gán một cổng trống.

```bash
firefox --remote-debugging-port 9222
```

Trên macOS, `firefox` có thể không nằm trong PATH của bạn. Trong trường hợp đó, hãy dùng đường dẫn đầy đủ:

```bash
/Applications/Firefox.app/Contents/MacOS/firefox --remote-debugging-port 9222
```

## Lấy URL WebSocket

Firefox phơi bày WebSocket BiDi trực tiếp tại:

```plain
ws://127.0.0.1:PORT/session
```

Ví dụ, nếu bạn khởi chạy Firefox với `--remote-debugging-port 9222`, URL sẽ là `ws://127.0.0.1:9222/session`. Nếu bạn chỉ định cổng `0`, hãy kiểm tra đầu ra `stderr` để tìm thông báo như `WebDriver BiDi listening on ws://127.0.0.1:46249` để biết cổng được gán.

> [!NOTE]
> Firefox dùng `127.0.0.1` thay vì `localhost` cho điểm cuối WebSocket BiDi.

## Kết nối tới điểm cuối WebSocket

Với URL WebSocket, hãy dùng bất kỳ client WebSocket nào để mở kết nối. Các lựa chọn phổ biến gồm gói `ws` cho Node.js và gói `websockets` cho Python.

Khi đã kết nối, bạn có thể gửi các [lệnh](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules#commands) WebDriver BiDi dưới dạng thông điệp JSON và nhận phản hồi cùng [sự kiện](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules#events) từ trình duyệt. Xem [`session.new`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/new) để tạo một phiên BiDi sau khi kết nối.

## Xem thêm

- [WebDriver BiDi reference](/en-US/docs/Web/WebDriver/Reference/BiDi)
- Lệnh [`session.new`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/new)
- [WebSockets API](/en-US/docs/Web/API/WebSockets_API)
- [Chromium BiDi wrapper](https://github.com/GoogleChromeLabs/chromium-bidi)
- [WebDriver BiDi web client](https://firefox-dev.tools/bidi-web-client/web/)
