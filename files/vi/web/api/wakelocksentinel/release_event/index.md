---
title: "WakeLockSentinel: release event"
short-title: release
slug: Web/API/WakeLockSentinel/release_event
page-type: web-api-event
browser-compat: api.WakeLockSentinel.release_event
---

{{APIRef("Screen Wake Lock API")}}{{SecureContext_Header}}

Sự kiện **`release`** của giao diện {{domxref("WakeLockSentinel")}} được kích hoạt khi handle của đối tượng sentinel đã được giải phóng.

Một {{domxref("WakeLockSentinel")}} có thể được giải phóng thủ công qua phương thức `release()`, hoặc tự động qua khóa thức nền tảng. Điều này có thể xảy ra nếu tài liệu trở nên không hoạt động hoặc mất tầm nhìn, nếu thiết bị yếu pin hoặc người dùng bật chế độ tiết kiệm điện.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("release", (event) => { })

onrelease = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Ví dụ này cập nhật UI nếu khóa thức được giải phóng.

```js
wakeLock.addEventListener("release", () => {
  // if wake lock is released alter the UI accordingly
  statusElement.textContent = "Wake Lock has been released";
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Stay awake with the Screen Wake Lock API](https://developer.chrome.com/docs/capabilities/web-apis/wake-lock/)
