---
title: "WritableStream: thuộc tính locked"
short-title: locked
slug: Web/API/WritableStream/locked
page-type: web-api-instance-property
browser-compat: api.WritableStream.locked
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính **`locked`** chỉ đọc của giao diện {{domxref("WritableStream")}} trả về một boolean cho biết liệu `WritableStream` có bị khóa đối với người ghi hay không.

## Giá trị

Giá trị boolean cho biết luồng có thể ghi có bị khóa hay không.

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

writableStream.locked;
// should return true, as the stream has been locked to a writer
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
