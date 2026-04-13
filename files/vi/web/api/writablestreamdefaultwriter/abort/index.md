---
title: "WritableStreamDefaultWriter: abort() method"
short-title: abort()
slug: Web/API/WritableStreamDefaultWriter/abort
page-type: web-api-instance-method
browser-compat: api.WritableStreamDefaultWriter.abort
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`abort()`** của giao diện {{domxref("WritableStreamDefaultWriter")}} hủy luồng, báo hiệu rằng bộ sinh dữ liệu không còn có thể ghi thành công vào luồng nữa và luồng sẽ ngay lập tức được chuyển sang trạng thái lỗi, với mọi thao tác ghi đang chờ sẽ bị loại bỏ.

Nếu trình ghi đang hoạt động, phương thức `abort()` sẽ hoạt động giống như trên luồng liên kết
({{domxref("WritableStream.abort()")}}). Nếu không, nó trả về một promise bị từ chối.

## Cú pháp

```js-nolint
abort()
abort(reason)
```

### Tham số

- `reason` {{optional_inline}}
  - : Một chuỗi biểu thị lý do hủy theo cách dễ đọc cho con người.

### Giá trị trả về

Một {{jsxref("Promise")}}, được hoàn tất với `undefined` khi luồng bị hủy, hoặc
bị từ chối với lỗi nếu trình ghi không hoạt động hoặc luồng nhận không hợp lệ.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Luồng bạn đang cố hủy không phải là {{domxref("WritableStream")}}, hoặc nó đang
    bị khóa.

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

// abort the stream when desired
await writer.abort("WritableStream aborted. Reason: ...");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
