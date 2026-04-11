---
title: "SerialPort: phương thức forget()"
short-title: forget()
slug: Web/API/SerialPort/forget
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.SerialPort.forget
---

{{securecontext_header}}{{APIRef("Web Serial API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`SerialPort.forget()`** của giao diện {{domxref("SerialPort")}} trả về một {{jsxref("Promise")}} phân giải khi quyền truy cập vào cổng nối tiếp bị thu hồi.

## Mô tả

Một trang web có thể dọn dẹp quyền truy cập vào một cổng nối tiếp mà nó không còn muốn giữ lại bằng cách gọi `SerialPort.forget()`. Gọi phương thức này sẽ "quên" thiết bị, đặt lại mọi quyền đã được thiết lập trước đó để trang gọi không còn có thể giao tiếp với cổng nữa.

Ví dụ, đối với một ứng dụng web giáo dục được sử dụng trên máy tính chia sẻ với nhiều thiết bị, một số lượng lớn quyền do người dùng tạo ra tích lũy sẽ tạo ra trải nghiệm người dùng kém.

## Cú pháp

```js-nolint
forget()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải với `undefined` khi kết nối bị thu hồi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
