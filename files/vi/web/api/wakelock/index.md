---
title: WakeLock
slug: Web/API/WakeLock
page-type: web-api-interface
browser-compat: api.WakeLock
---

{{APIRef("Screen Wake Lock API")}}{{SecureContext_Header}}

Giao diện **`WakeLock`** của [Screen Wake Lock API](/en-US/docs/Web/API/Screen_Wake_Lock_API) có thể được dùng để yêu cầu một khóa ngăn màn hình thiết bị bị mờ hoặc khóa khi ứng dụng cần tiếp tục chạy.

Giao diện này, và do đó cả khóa wake của hệ thống, được truy cập thông qua thuộc tính {{domxref("Navigator.wakeLock")}}.

## Phương thức phiên bản

- {{domxref("WakeLock.request", "request()")}}
  - : Trả về một {{jsxref("Promise")}} được hoàn thành với một đối tượng {{domxref("WakeLockSentinel")}} nếu khóa wake màn hình được cấp phép.

## Ví dụ

Đoạn mã sau `await` yêu cầu một đối tượng {{domxref("WakeLockSentinel")}} và tiếp tục nếu yêu cầu được chấp thuận.

Phương thức {{domxref("WakeLock.request", "WakeLock.request()")}} được bao bọc trong câu lệnh `try...catch` để bắt [các trường hợp khi promise có thể bị từ chối](/en-US/docs/Web/API/WakeLock/request#exceptions), chẳng hạn do mức pin thiết bị thấp.

```js
try {
  const wakeLock = await navigator.wakeLock.request("screen");
} catch (err) {
  // the wake lock request fails - usually system related, such being low on battery
  console.log(`${err.name}, ${err.message}`);
}
```

Lưu ý rằng khóa wake màn hình có thể bị thiết bị thu hồi sau khi đã được cấp.
{{domxref("WakeLockSentinel")}} được trả về có thể được dùng để kiểm tra trạng thái của khóa và/hoặc để hủy thủ công một khóa wake màn hình đang được giữ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Stay awake with the Screen Wake Lock API](https://developer.chrome.com/docs/capabilities/web-apis/wake-lock/)
