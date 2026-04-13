---
title: "QuotaExceededError: QuotaExceededError() constructor"
short-title: QuotaExceededError()
slug: Web/API/QuotaExceededError/QuotaExceededError
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.QuotaExceededError.QuotaExceededError
---

{{APIRef("DOM")}}{{SeeCompatTable}}

Hàm khởi tạo **`QuotaExceededError()`** tạo một đối tượng `QuotaExceededError` mới.

## Cú pháp

```js-nolint
new QuotaExceededError()
new QuotaExceededError(message)
new QuotaExceededError(message, options)
```

### Tham số

- `message` {{optional_inline}}
  - : {{domxref("DOMException.message", "Thông báo")}}. Mặc định là `""`.
- `options` {{optional_inline}}
  - : Một đối tượng có thể có các thuộc tính sau:
    - `quota` {{optional_inline}}
      - : Một số đại diện cho hạn mức lưu trữ do hệ thống định nghĩa (tính bằng byte) đã bị vượt quá, hoặc `undefined` nếu thông tin không có sẵn. Tương ứng với {{domxref("QuotaExceededError.quota")}}.
    - `requested` {{optional_inline}}
      - : Một số đại diện cho lượng lưu trữ (tính bằng byte) đã được yêu cầu trong thao tác, hoặc `undefined` nếu thông tin không có sẵn. Tương ứng với {{domxref("QuotaExceededError.requested")}}.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu `option.quota` hoặc `options.requested` là âm, hoặc nếu `option.requested < option.quota`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMException/DOMException", "DOMException()")}}
- {{domxref("QuotaExceededError")}}
