---
title: "WakeLockSentinel: released property"
short-title: released
slug: Web/API/WakeLockSentinel/released
page-type: web-api-instance-property
browser-compat: api.WakeLockSentinel.released
---

{{APIRef("Screen Wake Lock API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`released`** của giao diện {{domxref("WakeLockSentinel")}} trả về giá trị boolean cho biết liệu {{domxref("WakeLockSentinel")}} đã được giải phóng chưa.

`WakeLockSentinel` được giải phóng khi khóa thức màn hình nền tảng liên quan bị thu hồi; sau đó `released` sẽ luôn trả về `true`. Nếu cần khóa thức màn hình tiếp theo, ứng dụng sẽ cần yêu cầu một khóa thức màn hình mới (không thể tái sử dụng `WakeLockSentinel` hiện tại).

## Giá trị

Giá trị boolean là `false` cho đến khi {{domxref("WakeLockSentinel")}} được giải phóng (qua lần gọi {{domxref("WakeLockSentinel.release()")}} hoặc vì khóa đã được giải phóng tự động) và sự kiện {{domxref("WakeLockSentinel/release_event", "release")}} đã được phát ra, sau đó nó trở thành `true` và không còn thay đổi nữa.

## Ví dụ

Ví dụ này cho thấy cách giá trị của thuộc tính `released` thay đổi trong vòng đời của `WakeLockSentinel`.

```js
const sentinel = await navigator.wakeLock.request("screen");
console.log(sentinel.released); // Logs "false"

sentinel.onrelease = () => {
  console.log(sentinel.released); // Logs "true"
};

await sentinel.release();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Stay awake with the Screen Wake Lock API](https://developer.chrome.com/docs/capabilities/web-apis/wake-lock/)
