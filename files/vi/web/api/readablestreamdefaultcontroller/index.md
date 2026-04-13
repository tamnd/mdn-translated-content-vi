---
title: ReadableStreamDefaultController
slug: Web/API/ReadableStreamDefaultController
page-type: web-api-interface
browser-compat: api.ReadableStreamDefaultController
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện **`ReadableStreamDefaultController`** của [Streams API](/en-US/docs/Web/API/Streams_API) đại diện cho một bộ điều khiển cho phép kiểm soát trạng thái và hàng đợi nội bộ của {{domxref("ReadableStream")}}. Các bộ điều khiển mặc định dành cho các luồng không phải là luồng byte.

## Hàm khởi tạo

Không có. Các phiên bản `ReadableStreamDefaultController` được tạo tự động trong quá trình khởi tạo `ReadableStream`.

## Thuộc tính phiên bản

- {{domxref("ReadableStreamDefaultController.desiredSize")}} {{ReadOnlyInline}}
  - : Trả về kích thước mong muốn cần thiết để lấp đầy hàng đợi nội bộ của luồng.

## Phương thức phiên bản

- {{domxref("ReadableStreamDefaultController.close()")}}
  - : Đóng luồng liên kết.
- {{domxref("ReadableStreamDefaultController.enqueue()")}}
  - : Đưa một chunk nhất định vào hàng đợi của luồng liên kết.
- {{domxref("ReadableStreamDefaultController.error()")}}
  - : Gây ra lỗi cho mọi tương tác tương lai với luồng liên kết.

## Ví dụ

Trong ví dụ đơn giản sau, một `ReadableStream` tùy chỉnh được tạo bằng hàm khởi tạo (xem [ví dụ luồng ngẫu nhiên đơn giản](https://mdn.github.io/dom-examples/streams/simple-random-stream/) để xem mã đầy đủ). Hàm `start()` tạo ra một chuỗi văn bản ngẫu nhiên mỗi giây và đưa vào luồng. Một hàm `cancel()` cũng được cung cấp để dừng việc tạo nếu {{domxref("ReadableStream.cancel()")}} được gọi vì bất kỳ lý do nào.

Lưu ý rằng một đối tượng `ReadableStreamDefaultController` được cung cấp làm tham số của các hàm `start()` và `pull()`.

Khi một nút được nhấn, quá trình tạo sẽ dừng, luồng được đóng bằng {{domxref("ReadableStreamDefaultController.close()")}}, và một hàm khác được chạy để đọc lại dữ liệu từ luồng.

```js
let interval;
const stream = new ReadableStream({
  start(controller) {
    interval = setInterval(() => {
      let string = randomChars();

      // Add the string to the stream
      controller.enqueue(string);

      // show it on the screen
      let listItem = document.createElement("li");
      listItem.textContent = string;
      list1.appendChild(listItem);
    }, 1000);

    button.addEventListener("click", () => {
      clearInterval(interval);
      fetchStream();
      controller.close();
    });
  },
  pull(controller) {
    // We don't really need a pull in this example
  },
  cancel() {
    // This is called if the reader cancels,
    // so we should stop generating strings
    clearInterval(interval);
  },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Khái niệm Streams API](/en-US/docs/Web/API/Streams_API)
- [Sử dụng các luồng có thể đọc](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
- {{domxref("ReadableStream")}}
- [Web-streams-polyfill](https://github.com/MattiasBuelens/web-streams-polyfill)
