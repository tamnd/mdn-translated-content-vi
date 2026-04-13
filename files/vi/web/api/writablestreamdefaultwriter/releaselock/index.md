---
title: "WritableStreamDefaultWriter: releaseLock() method"
short-title: releaseLock()
slug: Web/API/WritableStreamDefaultWriter/releaseLock
page-type: web-api-instance-method
browser-compat: api.WritableStreamDefaultWriter.releaseLock
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`releaseLock()`** của giao diện {{domxref("WritableStreamDefaultWriter")}} giải phóng khóa của trình ghi trên luồng tương ứng. Sau khi khóa được giải phóng, trình ghi không còn hoạt động nữa. Nếu luồng liên kết đang ở trạng thái lỗi khi khóa được giải phóng, trình ghi sẽ xuất hiện ở trạng thái lỗi tương tự kể từ lúc đó; nếu không, trình ghi sẽ xuất hiện là đã đóng.

## Cú pháp

```js-nolint
releaseLock()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

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

const writer = writableStream.getWriter();

// …

// release writer's lock on the stream when desired
writer.releaseLock();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
