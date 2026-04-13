---
title: "Summarizer: phương thức destroy()"
short-title: destroy()
slug: Web/API/Summarizer/destroy
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Summarizer.destroy
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`destroy()`** của giao diện {{domxref("Summarizer")}} giải phóng các tài nguyên được gán cho thực thể `Summarizer` được gọi và dừng mọi hoạt động tiếp theo trên đó. Điều này có nghĩa là mọi lần gọi phương thức đang diễn ra và tiếp theo trên `Summarizer` sẽ bị từ chối với một `AbortError`.

Nên hủy bỏ các đối tượng `Summarizer` khi chúng không còn được sử dụng, vì chúng chiếm đáng kể tài nguyên trong quá trình xử lý.

## Cú pháp

```js-nolint
destroy()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng cơ bản `destroy()`

```js
const summarizer = await Summarizer.create({
  sharedContext:
    "A general summary to help a user decide if the text is worth reading",
  type: "tldr",
  length: "short",
});

// ...

summarizer.destroy();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
