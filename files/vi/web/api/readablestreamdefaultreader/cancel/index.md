---
title: "ReadableStreamDefaultReader: cancel() method"
short-title: cancel()
slug: Web/API/ReadableStreamDefaultReader/cancel
page-type: web-api-instance-method
browser-compat: api.ReadableStreamDefaultReader.cancel
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`cancel()`** của giao diện {{domxref("ReadableStreamDefaultReader")}} trả về một {{jsxref("Promise")}} được giải quyết khi luồng bị hủy. Gọi phương thức này báo hiệu rằng phía tiêu thụ không còn quan tâm đến luồng nữa.

`Cancel` được dùng khi bạn đã hoàn toàn xong với luồng và không cần thêm dữ liệu nào từ nó nữa, ngay cả khi vẫn còn các khối dữ liệu đã được xếp hàng chờ đọc. Dữ liệu đó sẽ bị mất sau khi gọi `cancel()`, và luồng sẽ không còn có thể đọc được nữa. Để vẫn đọc các khối đó mà không xóa bỏ hoàn toàn luồng, bạn sẽ dùng {{domxref("ReadableStreamDefaultController.close()")}}.

> [!NOTE]
> Nếu trình đọc đang hoạt động, phương thức `cancel()`
> sẽ hoạt động giống như trên luồng liên kết
> ({{domxref("ReadableStream.cancel()")}}).

## Cú pháp

```js-nolint
cancel()
cancel(reason)
```

### Tham số

- `reason` {{optional_inline}}
  - : Lý do hủy ở dạng dễ đọc cho con người. Giá trị này có thể được dùng hoặc không.

### Giá trị trả về

Một {{jsxref("Promise")}}, được hoàn tất với giá trị được cung cấp trong tham số `reason`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Đối tượng nguồn không phải là `ReadableStreamDefaultReader`, hoặc luồng
    không có chủ sở hữu.

## Ví dụ

Trong ví dụ đơn giản sau, một {{domxref("ReadableStream")}} tùy biến đã được tạo trước đó
được đọc bằng một {{domxref("ReadableStreamDefaultReader")}} được tạo bằng `getReader()`.
(mã này dựa trên [ví dụ stream ngẫu nhiên đơn giản](https://mdn.github.io/dom-examples/streams/simple-random-stream/) của chúng tôi). Mỗi khối dữ liệu được đọc tuần tự và xuất ra giao diện người dùng, cho đến khi luồng đọc xong, tại thời điểm đó chúng ta thoát khỏi hàm đệ quy và in toàn bộ luồng sang một phần khác của giao diện người dùng.

Khi luồng hoàn tất (`if (done)`), chúng ta chạy `reader.cancel()`
để hủy luồng, báo hiệu rằng chúng ta không cần dùng nó nữa.

```js
function fetchStream() {
  const reader = stream.getReader();
  let charsReceived = 0;

  // read() returns a promise that resolves
  // when a value has been received
  reader.read().then(function processText({ done, value }) {
    // Result objects contain two properties:
    // done  - true if the stream has already given you all its data.
    // value - some data. Always undefined when done is true.
    if (done) {
      console.log("Stream complete");
      reader.cancel();
      para.textContent = result;
      return;
    }

    // value for fetch streams is a Uint8Array
    charsReceived += value.length;
    const chunk = value;
    let listItem = document.createElement("li");
    listItem.textContent = `Received ${charsReceived} characters so far. Current chunk = ${chunk}`;
    list2.appendChild(listItem);

    result += chunk;

    // Read some more, and call this function again
    return reader.read().then(processText);
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ReadableStreamDefaultReader.ReadableStreamDefaultReader", "ReadableStreamDefaultReader()")}} bộ khởi tạo
- [Sử dụng các luồng có thể đọc](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
