---
title: "WritableStreamDefaultWriter: closed property"
short-title: closed
slug: Web/API/WritableStreamDefaultWriter/closed
page-type: web-api-instance-property
browser-compat: api.WritableStreamDefaultWriter.closed
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`closed`** là thuộc tính chỉ đọc của giao diện
{{domxref("WritableStreamDefaultWriter")}} trả về một
{{jsxref("Promise")}} được hoàn tất nếu luồng được đóng, hoặc bị từ chối nếu
luồng phát sinh lỗi hoặc khóa của trình ghi bị giải phóng.

## Giá trị

Một {{jsxref("Promise")}}.

## Ví dụ

```js
const writableStream = new WritableStream(
  {
    start(controller) {},
    write(chunk, controller) {
      // …
    },
    close(controller) {
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

// ..

// check if the stream is closed
writer.closed.then(() => {
  console.log("writer closed");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
