---
title: "WakeLock: phương thức request()"
short-title: request()
slug: Web/API/WakeLock/request
page-type: web-api-instance-method
browser-compat: api.WakeLock.request
---

{{APIRef("Screen Wake Lock API")}}{{SecureContext_Header}}

Phương thức **`request()`** của giao diện {{domxref("WakeLock")}} trả về một {{jsxref("Promise")}} được hoàn thành với một đối tượng {{domxref("WakeLockSentinel")}} nếu khóa wake màn hình của hệ thống được cấp phép.

Khóa wake màn hình ngăn màn hình thiết bị bị mờ hoặc khóa khi ứng dụng cần tiếp tục chạy.

## Cú pháp

```js-nolint
request(type)
```

### Tham số

- `type` {{optional_inline}}
  - : Một chuỗi xác định loại khóa wake màn hình, trong số các loại liệt kê sau:
    - `screen`
      - : Ngăn màn hình tắt.
        Chỉ các tài liệu hiển thị mới có thể yêu cầu khóa wake màn hình.

Nếu không có tham số `type` nào được chỉ định rõ ràng, phương thức `request()` mặc định sử dụng loại `screen`.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một đối tượng {{domxref("WakeLockSentinel")}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra khi khóa wake không khả dụng, điều này có thể xảy ra vì:
    - Việc sử dụng tính năng này bị chặn bởi [Chính sách Quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
    - Tài liệu không hoàn toàn hoạt động.
    - Trạng thái hiển thị của tài liệu là `hidden`.
    - {{Glossary("User Agent")}} không thể yêu cầu khóa wake của nền tảng. Ví dụ, điều này có thể xảy ra nếu thiết bị sắp hết pin.

## Ví dụ

Hàm bất đồng bộ sau yêu cầu một đối tượng {{domxref("WakeLockSentinel")}}.
Phương thức `request()` được bao bọc trong câu lệnh `try...catch` để xử lý các trường hợp trình duyệt từ chối yêu cầu vì bất kỳ lý do gì.

```js
const requestWakeLock = async () => {
  try {
    const wakeLock = await navigator.wakeLock.request("screen");
  } catch (err) {
    // The wake lock request fails - usually system-related, such as low battery.

    console.log(`${err.name}, ${err.message}`);
  }
};

requestWakeLock();
```

Khóa wake màn hình có thể bị thiết bị thu hồi sau khi đã được cấp.
{{domxref("WakeLockSentinel")}} được trả về có thể được dùng để kiểm tra trạng thái của khóa và/hoặc để hủy thủ công một khóa wake màn hình đang được giữ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Stay awake with the Screen Wake Lock API](https://developer.chrome.com/docs/capabilities/web-apis/wake-lock/)
