---
title: "WebSocketStream: phương thức close()"
short-title: close()
slug: Web/API/WebSocketStream/close
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.WebSocketStream.close
---

{{APIRef("WebSockets API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`close()`** của giao diện {{domxref("WebSocketStream")}} đóng kết nối WebSocket. Phương thức này tùy chọn nhận một đối tượng chứa mã đóng và/hoặc lý do tùy chỉnh để chỉ ra vì sao kết nối bị đóng.

## Cú pháp

```js-nolint
close()
close(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `closeCode` {{optional_inline}}
      - : Một số biểu thị mã đóng (xem danh sách đầy đủ [`CloseEvent` status codes](/en-US/docs/Web/API/CloseEvent/code#value)).
    - `reason` {{optional_inline}}
      - : Một chuỗi biểu thị mô tả dễ đọc về lý do socket connection bị đóng. Độ dài tối đa cho chuỗi `reason` là 123 byte. Chuỗi sẽ được mã hóa tự động thành UTF-8 khi hàm được gọi.

> [!NOTE]
> Tùy theo cấu hình máy chủ và mã trạng thái bạn dùng, máy chủ có thể bỏ qua mã tùy chỉnh và thay bằng một mã hợp lệ phù hợp với lý do đóng. Các mã hợp lệ là 1000, và mọi mã trong khoảng 3000 đến 4999, bao gồm cả hai đầu.

### Giá trị trả về

Không có (`undefined`).

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu `reason` được cung cấp dài hơn độ dài tối đa cho phép là 123 byte.

## Ví dụ

```js
const wsURL = "wss://127.0.0.1/";
const wss = new WebSocketStream(wsURL);

setTimeout(() => {
  wss.close({
    closeCode: 1000,
    reason: "That's all folks",
  });
}, 10000);
```

## Thông số kỹ thuật

Hiện chưa thuộc bất kỳ đặc tả nào. Xem https://github.com/whatwg/websockets/pull/48 để theo dõi tiến trình chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebSocketStream: tích hợp streams với WebSocket API](https://developer.chrome.com/docs/capabilities/web-apis/websocketstream), developer.chrome.com (2020)
