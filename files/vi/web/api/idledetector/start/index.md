---
title: "IdleDetector: start() method"
short-title: start()
slug: Web/API/IdleDetector/start
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.IdleDetector.start
---

{{securecontext_header}}{{APIRef("Idle Detection API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`start()`** của giao diện {{domxref("IdleDetector")}} trả về một {{jsxref("Promise")}} phân giải khi bộ phát hiện bắt đầu lắng nghe các thay đổi trong trạng thái rảnh rỗi của người dùng. Phương thức này nhận một đối tượng `options` tùy chọn với `threshold` tính bằng mili giây xác định thời gian không hoạt động cần báo cáo và `signal` cho `AbortSignal` để hủy bộ phát hiện rảnh rỗi.

## Cú pháp

```js-nolint
start()
start(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng với các thuộc tính sau:
    - `threshold`
      - : Số mili giây rảnh rỗi tối thiểu trước khi bắt đầu báo cáo.
    - `signal`
      - : Tham chiếu đến một phiên bản {{domxref('AbortSignal')}} cho phép hủy phát hiện rảnh rỗi.

### Giá trị trả về

Một {{jsxref("Promise")}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Việc sử dụng tính năng này bị chặn bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

## Ví dụ

Ví dụ dưới đây minh họa cách bắt đầu phát hiện rảnh rỗi bằng đối số `options`. Nó lấy một phiên bản `AbortSignal` từ phiên bản {{domxref("AbortController")}}.

```js
const controller = new AbortController();
const signal = controller.signal;

await idleDetector.start({
  threshold: 60_000,
  signal,
});
console.log("IdleDetector is active.");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
