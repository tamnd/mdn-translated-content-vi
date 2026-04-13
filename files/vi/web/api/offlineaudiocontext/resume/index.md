---
title: "OfflineAudioContext: phương thức resume()"
short-title: resume()
slug: Web/API/OfflineAudioContext/resume
page-type: web-api-instance-method
browser-compat: api.OfflineAudioContext.resume
---

{{ APIRef("Web Audio API") }}

Phương thức **`resume()`** của giao diện {{domxref("OfflineAudioContext")}} tiếp tục tiến trình thời gian trong một audio context đã bị tạm dừng. Promise được giải quyết ngay lập tức vì `OfflineAudioContext` không yêu cầu phần cứng âm thanh.

## Cú pháp

```js-nolint
resume()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết thành {{jsxref('undefined')}}.

### Ngoại lệ

Promise bị từ chối khi gặp ngoại lệ.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu context hiện tại không bị tạm dừng hoặc quá trình render chưa bắt đầu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
