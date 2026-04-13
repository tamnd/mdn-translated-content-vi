---
title: "WritableStreamDefaultController: thuộc tính signal"
short-title: signal
slug: Web/API/WritableStreamDefaultController/signal
page-type: web-api-instance-property
browser-compat: api.WritableStreamDefaultController.signal
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`signal`** của giao diện {{domxref("WritableStreamDefaultController")}} trả về {{domxref("AbortSignal")}} liên kết với bộ điều khiển.

## Giá trị

Một đối tượng {{domxref("AbortSignal")}}.

## Ví dụ

### Hủy bỏ một thao tác ghi dài

Trong ví dụ này, chúng ta mô phỏng một thao tác chậm bằng cách sử dụng một sink cục bộ: Chúng ta không làm gì khi một số dữ liệu được ghi ngoài việc chờ một giây. Điều này cho chúng ta đủ thời gian để gọi phương thức `writer.abort()` và từ chối promise ngay lập tức.

```js
const writingStream = new WritableStream({
  // Define the slow local sink to simulate a long operation
  write(chunk, controller) {
    return new Promise((resolve, reject) => {
      controller.signal.addEventListener("abort", () =>
        reject(controller.signal.reason),
      );

      // Do nothing but wait with the data: it is a local sink
      setTimeout(resolve, 1000); // Timeout to simulate a slow operation
    });
  },
});

// Perform the write
const writer = writingStream.getWriter();
writer.write("Lorem ipsum test data");

// Abort the write manually
await writer.abort("Manual abort!");
```

### Chuyển `AbortSignal` xuống lớp cơ bản

Trong ví dụ này, chúng ta sử dụng [Fetch API](/en-US/docs/Web/API/Fetch_API) để thực sự gửi thông điệp đến máy chủ. Fetch API cũng hỗ trợ {{domxref("AbortSignal")}}: Có thể sử dụng cùng một đối tượng cho cả phương thức `fetch` và {{domxref("WritableStreamDefaultController")}}.

```js
const endpoint = "https://www.example.com/api"; // Fake URL for example purpose
const writingStream = new WritableStream({
  async write(chunk, controller) {
    // Write to the server using the Fetch API
    const response = await fetch(endpoint, {
      signal: controller.signal, // We use the same object for both fetch and controller
      method: "POST",
      body: chunk,
    });
    await response.text();
  },
});

// Perform the write
const writer = writingStream.getWriter();
writer.write("Lorem ipsum test data");

// Abort the write manually
await writer.abort("Manual abort!");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
