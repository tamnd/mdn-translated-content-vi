---
title: "WritableStream: phương thức abort()"
short-title: abort()
slug: Web/API/WritableStream/abort
page-type: web-api-instance-method
browser-compat: api.WritableStream.abort
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`abort()`** của giao diện {{domxref("WritableStream")}} hủy bỏ luồng, báo hiệu rằng nhà sản xuất không còn có thể ghi thành công vào luồng nữa và luồng đó sẽ ngay lập tức được chuyển sang trạng thái lỗi, mọi thao tác ghi trong hàng đợi sẽ bị loại bỏ.

## Cú pháp

```js-nolint
abort(reason)
```

### Parameters

- `reason`
  - : A string providing a human-readable reason for the abort.

### Return value

A {{jsxref("Promise")}}, which fulfills with `undefined`.

### Exceptions

- {{jsxref("TypeError")}}
  - : The stream you are trying to abort is not a {{domxref("WritableStream")}}, or it is locked.

## Examples

```js
const writableStream = new WritableStream(
  {
    write(chunk) {
      // …
    },
    close() {
      // …
    },
    abort(err) {
      // …
    },
  },
  queuingStrategy,
);

// …

// abort the stream later on, when required
writableStream.abort();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
