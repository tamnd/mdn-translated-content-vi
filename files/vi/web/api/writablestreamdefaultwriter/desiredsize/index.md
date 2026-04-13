---
title: "WritableStreamDefaultWriter: desiredSize property"
short-title: desiredSize
slug: Web/API/WritableStreamDefaultWriter/desiredSize
page-type: web-api-instance-property
browser-compat: api.WritableStreamDefaultWriter.desiredSize
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`desiredSize`** là thuộc tính chỉ đọc của giao diện
{{domxref("WritableStreamDefaultWriter")}} trả về kích thước mong muốn cần
để lấp đầy hàng đợi nội bộ của luồng.

## Giá trị

Một số nguyên. Lưu ý rằng giá trị này có thể âm nếu hàng đợi bị đầy quá mức.

Giá trị sẽ là `null` nếu luồng không thể được ghi thành công
(do đang ở trạng thái lỗi, hoặc đã có một thao tác hủy được xếp hàng), và bằng 0 nếu luồng
đã đóng.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Khóa của trình ghi đã bị giải phóng.

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

// return stream's desired size
const size = writer.desiredSize;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
