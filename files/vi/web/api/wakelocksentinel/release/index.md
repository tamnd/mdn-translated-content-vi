---
title: "WakeLockSentinel: release() method"
short-title: release()
slug: Web/API/WakeLockSentinel/release
page-type: web-api-instance-method
browser-compat: api.WakeLockSentinel.release
---

{{APIRef("Screen Wake Lock API")}}{{SecureContext_Header}}

Phương thức **`release()`** của giao diện {{domxref("WakeLockSentinel")}} giải phóng {{domxref("WakeLockSentinel")}}, trả về một {{jsxref("Promise")}} được giải quyết sau khi sentinel đã được giải phóng thành công.

## Cú pháp

```js-nolint
release()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref("Promise")}} được giải quyết với `undefined`.

### Ngoại lệ

Không có ngoại lệ nào được ném ra. Bạn nên luôn lắng nghe sự kiện {{domxref("WakeLockSentinel/release_event", "release")}} để kiểm tra xem khóa thức có được giải phóng chưa.

## Ví dụ

Trong ví dụ này, khi người dùng nhấp vào nút, {{domxref("WakeLockSentinel")}} được giải phóng.

```js
wakeLockOffButton.addEventListener("click", () => {
  WakeLockSentinel.release();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Stay awake with the Screen Wake Lock API](https://developer.chrome.com/docs/capabilities/web-apis/wake-lock/)
