---
title: "OverconstrainedError: hàm khởi tạo OverconstrainedError()"
short-title: OverconstrainedError()
slug: Web/API/OverconstrainedError/OverconstrainedError
page-type: web-api-constructor
browser-compat: api.OverconstrainedError.OverconstrainedError
---

{{APIRef("Media Capture and Streams")}}

Hàm khởi tạo **`OverconstrainedError()`** tạo một đối tượng {{domxref("OverconstrainedError")}} mới chỉ ra rằng tập hợp các khả năng mong muốn cho {{domxref("MediaStreamTrack")}} hiện tại không thể đáp ứng được hiện tại. Khi sự kiện này được ném trên một `MediaStreamTrack`, nó bị tắt tiếng cho đến khi các ràng buộc hiện tại có thể được thiết lập hoặc cho đến khi các ràng buộc thỏa mãn được áp dụng.

## Cú pháp

```js-nolint
new OverconstrainedError()
```

### Tham số

- `constraint`
  - : Ràng buộc không được thỏa mãn.
- `message` {{optional_inline}}
  - : Văn bản cho thuộc tính `message` của lỗi. Mặc định là một chuỗi rỗng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
