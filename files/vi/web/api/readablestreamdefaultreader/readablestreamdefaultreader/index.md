---
title: "ReadableStreamDefaultReader: ReadableStreamDefaultReader() constructor"
short-title: ReadableStreamDefaultReader()
slug: Web/API/ReadableStreamDefaultReader/ReadableStreamDefaultReader
page-type: web-api-constructor
browser-compat: api.ReadableStreamDefaultReader.ReadableStreamDefaultReader
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`ReadableStreamDefaultReader()`**
bộ khởi tạo tạo và trả về một thể hiện đối tượng `ReadableStreamDefaultReader`.

> [!NOTE]
> Thông thường bạn sẽ không dùng bộ khởi tạo này trực tiếp; thay vào đó,
> bạn sẽ dùng phương thức {{domxref("ReadableStream.getReader()")}}.

## Cú pháp

```js-nolint
new ReadableStreamDefaultReader(stream)
```

### Tham số

- `stream`
  - : {{domxref("ReadableStream")}} sẽ được đọc.

### Giá trị trả về

Một thể hiện của đối tượng {{domxref("ReadableStreamDefaultReader")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu tham số `stream` được cung cấp không phải là {{domxref("ReadableStream")}},
    hoặc nó đã bị khóa để đọc bởi một trình đọc khác.

## Ví dụ

Trong ví dụ đơn giản sau, một {{domxref("ReadableStream")}} tùy biến đã được tạo trước đó
được đọc bằng một {{domxref("ReadableStreamDefaultReader")}} được tạo bằng `getReader()`.
(xem [ví dụ stream ngẫu nhiên đơn giản](https://mdn.github.io/dom-examples/streams/simple-random-stream/) của chúng tôi để biết mã đầy đủ). Mỗi khối dữ liệu được đọc tuần tự và xuất ra giao diện người dùng,
cho đến khi luồng đọc xong, tại thời điểm đó chúng ta thoát khỏi hàm đệ quy và in toàn bộ
luồng sang một phần khác của giao diện người dùng.

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

- [Khái niệm API Streams](/en-US/docs/Web/API/Streams_API)
- [Sử dụng các luồng có thể đọc](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
- {{domxref("ReadableStream")}}
- {{domxref("ReadableStreamDefaultController")}}
