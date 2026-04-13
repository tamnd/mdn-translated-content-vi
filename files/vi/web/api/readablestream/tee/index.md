---
title: "ReadableStream: phương thức tee()"
short-title: tee()
slug: Web/API/ReadableStream/tee
page-type: web-api-instance-method
browser-compat: api.ReadableStream.tee
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương pháp **`tee()`** của
{{domxref("ReadableStream")}} giao diện [tees](https://streams.spec.whatwg.org/#tee-a-readable-stream) luồng có thể đọc được hiện tại, trả về một
mảng hai phần tử chứa hai nhánh kết quả là
phiên bản {{domxref("ReadableStream")}} mới.

Điều này rất hữu ích khi cho phép hai đầu đọc đọc một luồng tuần tự hoặc đồng thời,
có lẽ ở tốc độ khác nhau.
Ví dụ: bạn có thể thực hiện việc này trong ServiceWorker nếu bạn muốn tìm nạp
một phản hồi từ máy chủ và truyền nó tới trình duyệt, nhưng cũng truyền nó tới
Bộ nhớ đệm của ServiceWorker. Vì nội dung phản hồi không thể được sử dụng nhiều lần nên bạn cần
hai bản sao để làm điều này.

Luồng teed sẽ báo hiệu một phần áp suất ngược theo tốc độ của người tiêu dùng _faster_
của hai nhánh `ReadableStream`,
và dữ liệu chưa đọc được xếp hàng nội bộ trên `ReadableStream` được tiêu thụ chậm hơn
không có bất kỳ giới hạn hoặc áp lực ngược.
Nghĩa là, khi các nhánh _both_ có phần tử chưa đọc trong hàng đợi nội bộ của chúng,
thì hàng đợi nội bộ của bộ điều khiển `ReadableStream` ban đầu sẽ bắt đầu đầy,
và một khi {{domxref("ReadableStreamDefaultController.desiredSize", "desiredSize")}} 0
hoặc bộ điều khiển luồng byte {{domxref("ReadableByteStreamController.desiredSize", "desiredSize")}} 0,
thì bộ điều khiển sẽ ngừng gọi `pull(controller)` trên
nguồn cơ bản được chuyển đến {{domxref("ReadableStream.ReadableStream", "ReadableStream()")}}.
Nếu chỉ tiêu thụ một nhánh thì toàn bộ cơ thể sẽ được ghi nhớ trong trí nhớ.
Do đó, bạn không nên sử dụng `tee()` tích hợp sẵn để đọc các luồng rất lớn
song song với tốc độ khác nhau.
Thay vào đó, hãy tìm kiếm một cách triển khai hoàn toàn gây áp lực ngược
theo tốc độ của nhánh tiêu thụ _slow_.

Để hủy luồng, bạn cần hủy cả hai nhánh kết quả. Phát một luồng
nói chung sẽ khóa nó trong một thời gian, ngăn không cho người đọc khác khóa nó.

## Cú pháp

```js-nolint
tee()
```

### Parameters

None.

### Return value

An {{jsxref("Array")}} containing two {{domxref("ReadableStream")}} instances.

### Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the source stream is not a `ReadableStream`.

## Examples

In the following simple example, a previously-created stream is teed, then both
resulting streams (contained in two members of a generated array) are passed to a
function that reads the data out of the two streams and prints each stream's chunks
sequentially to a different part of the UI. See [Simple tee example](https://mdn.github.io/dom-examples/streams/simple-tee-example/) for the full code.

```js
function teeStream() {
  const teedOff = stream.tee();
  fetchStream(teedOff[0], list2);
  fetchStream(teedOff[1], list3);
}

function fetchStream(stream, list) {
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
      return;
    }

    // value for fetch streams is a Uint8Array
    charsReceived += value.length;
    const chunk = value;
    let listItem = document.createElement("li");
    listItem.textContent = `Read ${charsReceived} ký tự cho đến nay. Đoạn hiện tại = ${chunk`;
    list.appendChild(listItem);

    // Read some more, and call this function again
    return reader.read().then(processText);
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- hàm tạo {{domxref("ReadableStream.ReadableStream", "ReadableStream()")}}

- [Phát trực tiếp](/en-US/docs/Web/API/Streams_API/Using_readable_streams#teeing_a_stream)
