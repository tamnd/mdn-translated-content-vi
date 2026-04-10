---
title: "ReadableStreamDefaultReader: read() method"
short-title: read()
slug: Web/API/ReadableStreamDefaultReader/read
page-type: web-api-instance-method
browser-compat: api.ReadableStreamDefaultReader.read
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`read()`** của {{domxref("ReadableStreamDefaultReader")}} trả về một {{jsxref("Promise")}} cung cấp quyền truy cập tới khối dữ liệu tiếp theo trong hàng đợi nội bộ của luồng.

## Cú pháp

```js-nolint
read()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}}, được hoàn tất/bị từ chối tùy theo trạng thái của luồng.
Các khả năng khác nhau như sau:

- Nếu có sẵn một khối dữ liệu, promise sẽ được hoàn tất với một đối tượng có dạng `{ value: theChunk, done: false }`.
- Nếu luồng được đóng, promise sẽ được hoàn tất với một đối tượng có dạng `{ value: undefined, done: true }`.
- Nếu luồng phát sinh lỗi, promise sẽ bị từ chối với lỗi tương ứng.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Đối tượng nguồn không phải là `ReadableStreamDefaultReader`, luồng không có chủ sở hữu, hoặc {{domxref("ReadableStreamDefaultReader.releaseLock()")}} được gọi khi vẫn còn một yêu cầu đọc đang chờ.

## Ví dụ

### Ví dụ 1 - ví dụ đơn giản

Ví dụ này cho thấy cách dùng API cơ bản, nhưng không xử lý các phức tạp như
việc các khối dữ liệu của luồng không kết thúc đúng ở ranh giới dòng, chẳng hạn.

Trong ví dụ này, `stream` là một {{domxref("ReadableStream")}} tùy biến đã được tạo trước đó.
Nó được đọc bằng một {{domxref("ReadableStreamDefaultReader")}} được tạo bằng `getReader()`.
(xem [ví dụ stream ngẫu nhiên đơn giản](https://mdn.github.io/dom-examples/streams/simple-random-stream/) của chúng tôi để biết mã đầy đủ).
Mỗi khối dữ liệu được đọc tuần tự và xuất ra giao diện người dùng dưới dạng một mảng byte UTF-8, cho đến khi luồng đọc xong, tại thời điểm đó chúng ta thoát khỏi hàm đệ quy và in toàn bộ luồng sang một phần khác của giao diện người dùng.

```js
function fetchStream() {
  const reader = stream.getReader();
  let charsReceived = 0;

  // read() returns a promise that fulfills
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

### Ví dụ 2 - xử lý văn bản theo từng dòng

Ví dụ này cho thấy cách bạn có thể tìm nạp một tệp văn bản và xử lý nó như một luồng
các dòng văn bản. Nó xử lý trường hợp các khối dữ liệu của luồng không kết thúc ở ranh giới dòng, và việc chuyển đổi từ `Uint8Array` sang chuỗi.

```js
async function* makeTextFileLineIterator(fileURL) {
  const utf8Decoder = new TextDecoder("utf-8");
  let response = await fetch(fileURL);
  let reader = response.body.getReader();
  let { value: chunk, done: readerDone } = await reader.read();
  chunk = chunk ? utf8Decoder.decode(chunk, { stream: true }) : "";

  let re = /\r?\n/g;
  let startIndex = 0;

  for (;;) {
    let result = re.exec(chunk);
    if (!result) {
      if (readerDone) {
        break;
      }
      let remainder = chunk.substring(startIndex);
      ({ value: chunk, done: readerDone } = await reader.read());
      chunk =
        remainder + (chunk ? utf8Decoder.decode(chunk, { stream: true }) : "");
      startIndex = re.lastIndex = 0;
      continue;
    }
    yield chunk.substring(startIndex, result.index);
    startIndex = re.lastIndex;
  }
  if (startIndex < chunk.length) {
    // last line didn't end in a newline char
    yield chunk.substring(startIndex);
  }
}

for await (let line of makeTextFileLineIterator(urlOfFile)) {
  processLine(line);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ReadableStreamDefaultReader.ReadableStreamDefaultReader", "ReadableStreamDefaultReader()")}} bộ khởi tạo
- [Sử dụng các luồng có thể đọc](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
