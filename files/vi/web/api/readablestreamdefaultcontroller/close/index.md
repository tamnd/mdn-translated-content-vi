---
title: "ReadableStreamDefaultController: close() method"
short-title: close()
slug: Web/API/ReadableStreamDefaultController/close
page-type: web-api-instance-method
browser-compat: api.ReadableStreamDefaultController.close
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`close()`** của giao diện {{domxref("ReadableStreamDefaultController")}} đóng luồng liên kết.

Người đọc vẫn có thể đọc bất kỳ chunk nào đã được đưa vào hàng đợi trước đó từ luồng, nhưng một khi chúng đã được đọc, luồng sẽ trở nên đóng. Nếu bạn muốn loại bỏ hoàn toàn luồng và bỏ qua bất kỳ chunk nào trong hàng đợi, bạn sẽ dùng {{domxref("ReadableStream.cancel()")}} hoặc {{domxref("ReadableStreamDefaultReader.cancel()")}}.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `close()` được gọi khi luồng không thể đọc được, vì nó đã đóng, bị hủy, hoặc bị lỗi, hoặc vì nguồn cơ bản đã yêu cầu đóng nhưng vẫn chưa thực hiện vì còn có các chunk trong hàng đợi để đọc.

## Ví dụ

Trong ví dụ đơn giản sau, một `ReadableStream` tùy chỉnh được tạo bằng hàm khởi tạo (xem [ví dụ luồng ngẫu nhiên đơn giản](https://mdn.github.io/dom-examples/streams/simple-random-stream/) để xem mã đầy đủ). Hàm `start()` tạo ra một chuỗi văn bản ngẫu nhiên mỗi giây và đưa vào luồng. Một hàm `cancel()` cũng được cung cấp để dừng việc tạo nếu {{domxref("ReadableStream.cancel()")}} được gọi vì bất kỳ lý do nào.

Khi một nút được nhấn, quá trình tạo sẽ dừng, luồng được đóng bằng `close()`, và một hàm khác được chạy để đọc lại dữ liệu từ luồng.

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

- [Sử dụng các luồng có thể đọc](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
- {{domxref("ReadableStreamDefaultController")}}
