---
title: "ReadableStreamBYOBReader: phương thức read()"
short-title: read()
slug: Web/API/ReadableStreamBYOBReader/read
page-type: web-api-instance-method
browser-compat: api.ReadableStreamBYOBReader.read
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`read()`** của giao diện {{domxref("ReadableStreamBYOBReader")}} được dùng để đọc dữ liệu vào một view trên buffer do người dùng cung cấp từ [readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams) liên quan.
Yêu cầu dữ liệu sẽ được đáp ứng từ các hàng đợi nội bộ của stream nếu có dữ liệu.
Nếu các hàng đợi stream rỗng, yêu cầu có thể được cung cấp dưới dạng truyền zero-copy từ nguồn byte bên dưới.

Phương thức nhận một view trên buffer mà dữ liệu được đọc vào làm đối số, và trả về một {{jsxref("Promise")}}.
Promise hoàn thành với đối tượng có thuộc tính `value` và `done` khi dữ liệu có sẵn, hoặc khi stream bị hủy. Nếu stream gặp lỗi, promise sẽ bị từ chối với đối tượng lỗi liên quan.

Khi một chunk dữ liệu được cung cấp, thuộc tính `value` sẽ chứa một view mới.
View này sẽ có cùng buffer/bộ nhớ backing (và cùng loại) như `view` gốc được truyền vào phương thức `read()`, nay chứa chunk dữ liệu mới.
Lưu ý rằng sau khi promise hoàn thành, `view` gốc được truyền vào phương thức sẽ bị tách ra và không còn sử dụng được.
Promise sẽ hoàn thành với `value: undefined` nếu stream đã bị hủy.
Trong trường hợp này, vùng bộ nhớ backing của `view` bị loại bỏ và không được trả lại cho caller (tất cả dữ liệu đã đọc trước đó trong buffer của view bị mất).

Thuộc tính `done` cho biết có còn dữ liệu nào được mong đợi không.
Giá trị được đặt là `true` nếu stream đã đóng hoặc bị hủy, và `false` trong các trường hợp khác.

Phương thức cũng có tham số tùy chọn `options.min` có thể dùng để chỉ định số phần tử tối thiểu phải có sẵn trước khi promise hoàn thành, trong khi stream đang hoạt động.
View được trả về trong thuộc tính `value` sẽ luôn có ít nhất số phần tử này, trừ khi stream đóng lại.

## Cú pháp

```js-nolint
read(view)
read(view, options)
```

### Tham số

- `view`
  - : View để đọc dữ liệu vào.
- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `min`
      - : Số phần tử tối thiểu để đọc trước khi promise hoàn thành trong khi stream đang hoạt động.
        Nếu không được cung cấp, promise sẽ giải quyết với ít nhất một phần tử, tối đa kích thước của view.
        Con số này không được lớn hơn view đang được đọc vào.

### Giá trị trả về

Một {{jsxref("Promise")}}, hoàn thành/bị từ chối với kết quả tùy thuộc vào trạng thái của stream. Đối tượng kết quả chứa hai thuộc tính, `value` và `done`.

Các trường hợp có thể xảy ra:

- Nếu một chunk có sẵn và stream vẫn đang hoạt động, `done` của kết quả là `false`, và `value` là một view chứa dữ liệu mới.
  View này có cùng loại và cùng bộ nhớ backing như `view` được truyền vào phương thức `read()`.
  `view` gốc sẽ bị tách ra và không còn sử dụng được.

- Nếu stream đã đóng, `done` của kết quả là `true`, và `value` có các thuộc tính giống như trên.

- Nếu stream bị hủy, `done` của kết quả là `true`, và `value` là `undefined`.
  Trong trường hợp này, bộ nhớ backing bị loại bỏ.

- Nếu stream phát sinh lỗi, promise bị từ chối với lỗi liên quan.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Đối tượng nguồn không phải là `ReadableStreamBYOBReader`, stream không có chủ, view không phải là đối tượng hoặc đã bị tách ra, độ dài view là 0, `options.min` là 0, hoặc {{domxref("ReadableStreamBYOBReader.releaseLock()")}} được gọi (khi có yêu cầu đọc đang chờ).
- {{jsxref("RangeError")}}
  - : Giá trị `options.min` lớn hơn view đang được ghi vào.

## Ví dụ

### Đọc vào một view

Mã ví dụ ở đây được lấy từ các ví dụ trực tiếp trong [Sử dụng readable byte streams](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams#examples).

Đầu tiên chúng ta tạo reader bằng cách dùng {{domxref("ReadableStream.getReader()")}} trên stream, truyền `mode: "byob"` trong tham số tùy chọn.
Chúng ta cũng cần tạo một `ArrayBuffer`, là "bộ nhớ backing" của các view mà chúng ta sẽ ghi vào.

```js
const reader = stream.getReader({ mode: "byob" });
let buffer = new ArrayBuffer(4000);
```

Hàm sử dụng reader được hiển thị bên dưới.
Hàm này gọi đệ quy phương thức `read()` để đọc dữ liệu vào buffer.
Phương thức nhận một [`Uint8Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array) [typed array](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray) là view trên phần của array buffer gốc chưa được ghi vào.
Các tham số của view được tính từ dữ liệu nhận được trong các lần gọi trước, xác định offset vào array buffer gốc.

```js
readStream(reader);

function readStream(reader) {
  let bytesReceived = 0;
  let offset = 0;

  while (offset < buffer.byteLength) {
    // read() returns a promise that fulfills when a value has been received
    reader
      .read(new Uint8Array(buffer, offset, buffer.byteLength - offset))
      .then(function processBytes({ done, value }) {
        // Result objects contain two properties:
        // done  - true if the stream has already given all its data.
        // value - some data. 'undefined' if the reader is canceled.

        if (done) {
          // There is no more data in the stream
          return;
        }

        buffer = value.buffer;
        offset += value.byteLength;
        bytesReceived += value.byteLength;

        // Read some more, and call this function again
        // Note that here we create a new view over the original buffer.
        return reader
          .read(new Uint8Array(buffer, offset, buffer.byteLength - offset))
          .then(processBytes);
      });
  }
}
```

Khi không còn dữ liệu trong stream, phương thức `read()` hoàn thành với đối tượng có thuộc tính `done` được đặt là `true`, và hàm trả về.

### Đọc số phần tử tối thiểu

Ví dụ này gần giống với ví dụ trước, ngoại trừ chúng ta đã sửa đổi mã để đọc tối thiểu 101 phần tử trong mỗi lần lặp.

Chúng ta cũng đã biến nó thành ví dụ trực tiếp.
Lưu ý rằng hầu hết mã không liên quan đến ví dụ và do đó bị ẩn.
Để biết thêm thông tin, xem [Sử dụng readable byte streams](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams#examples).

<!-- Below here is hidden live implementation -->

```js hidden
class MockHypotheticalSocket {
  constructor() {
    this.max_data = 800; // total amount of data to stream from "socket"
    this.max_per_read = 100; // max data per read
    this.min_per_read = 40; // min data per read
    this.data_read = 0; // total data read so far (capped is maxdata)
    this.socketData = null;
  }

  // Method returning promise when this socket is readable.
  select2() {
    // Object used to resolve promise
    const resultObj = {};
    resultObj["bytesRead"] = 0;

    return new Promise((resolve /*, reject */) => {
      if (this.data_read >= this.max_data) {
        // Out of data
        resolve(resultObj);
        return;
      }

      // Emulate slow read of data
      setTimeout(() => {
        const numberBytesReceived = this.getNumberRandomBytesSocket();
        this.data_read += numberBytesReceived;
        this.socketData = this.randomByteArray(numberBytesReceived);
        resultObj["bytesRead"] = numberBytesReceived;
        resolve(resultObj);
      }, 500);
    });
  }

  /* Read data into specified buffer offset */
  readInto(buffer, offset, length) {
    let dataLength = 0;
    if (this.socketData) {
      dataLength = this.socketData.length;
      const myView = new Uint8Array(buffer, offset, length);
      // Write the length of data specified into buffer
      // Code assumes buffer always bigger than incoming data
      for (let i = 0; i < dataLength; i++) {
        myView[i] = this.socketData[i];
      }
      this.socketData = null; // Clear "socket" data after reading
    }
    return dataLength;
  }

  // Dummy close function
  close() {}

  // Return random number bytes in this call of socket
  getNumberRandomBytesSocket() {
    // Capped to remaining data and the max min return-per-read range
    const remainingData = this.max_data - this.data_read;
    const numberBytesReceived =
      remainingData < this.min_per_read
        ? remainingData
        : this.getRandomIntInclusive(
            this.min_per_read,
            Math.min(this.max_per_read, remainingData),
          );
    return numberBytesReceived;
  }

  // Return random number between two values
  getRandomIntInclusive(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1) + min);
  }

  // Return random character string
  randomChars(length = 8) {
    let string = "";
    let choices =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";

    for (let i = 0; i < length; i++) {
      string += choices.charAt(Math.floor(Math.random() * choices.length));
    }
    return string;
  }

  /* Return random Uint8Array of bytes */
  randomByteArray(bytes = 8) {
    const textEncoder = new TextEncoder();
    return textEncoder.encode(this.randomChars(bytes));
  }
}
```

<!-- The following html and js sets up reporting. Hidden because it is not useful for readers -->

```css hidden
.input {
  float: left;
  width: 50%;
}
.output {
  float: right;
  width: 50%;
  overflow-wrap: break-word;
}
button {
  display: block;
}
```

```html hidden
<button>Cancel stream</button>
<div class="input">
  <h2>Underlying source</h2>
  <ul></ul>
</div>
<div class="output">
  <h2>Consumer</h2>
  <ul></ul>
</div>
```

```js hidden
// Store reference to lists, paragraph and button
const list1 = document.querySelector(".input ul");
const list2 = document.querySelector(".output ul");
const button = document.querySelector("button");

// Create empty string in which to store final result
let result = "";

// Function to log data from underlying source
function logSource(result) {
  const listItem = document.createElement("li");
  listItem.textContent = result;
  list1.appendChild(listItem);
}

// Function to log data from consumer
function logConsumer(result) {
  const listItem = document.createElement("li");
  listItem.textContent = result;
  list2.appendChild(listItem);
}
```

```js hidden
const stream = makeSocketStream("dummy host", "dummy port");

const DEFAULT_CHUNK_SIZE = 400;

function makeSocketStream(host, port) {
  const socket = new MockHypotheticalSocket();

  return new ReadableStream({
    type: "bytes",

    start(controller) {
      readRepeatedly().catch((e) => controller.error(e));
      function readRepeatedly() {
        return socket.select2().then(() => {
          // Since the socket can become readable even when there's
          // no pending BYOB requests, we need to handle both cases.
          let bytesRead;
          if (controller.byobRequest) {
            const v = controller.byobRequest.view;
            bytesRead = socket.readInto(v.buffer, v.byteOffset, v.byteLength);
            if (bytesRead === 0) {
              controller.close();
            }
            controller.byobRequest.respond(bytesRead);
            logSource(`byobRequest with ${bytesRead} bytes`);
          } else {
            const buffer = new ArrayBuffer(DEFAULT_CHUNK_SIZE);
            bytesRead = socket.readInto(buffer, 0, DEFAULT_CHUNK_SIZE);
            if (bytesRead === 0) {
              controller.close();
            } else {
              controller.enqueue(new Uint8Array(buffer, 0, bytesRead));
            }
            logSource(`enqueue() ${bytesRead} bytes (no byobRequest)`);
          }

          if (bytesRead === 0) {
            return;
            // no more bytes in source
          }
          return readRepeatedly();
        });
      }
    },

    cancel() {
      socket.close();
      logSource(`cancel(): socket closed`);
    },
  });
}

const reader = stream.getReader({ mode: "byob" });
let buffer = new ArrayBuffer(4000);
readStream(reader);
```

#### JavaScript

```js
function readStream(reader) {
  let bytesReceived = 0;
  let offset = 0;

  while (offset < buffer.byteLength) {
    // read() returns a promise that resolves when a value has been received
    reader
      .read(new Uint8Array(buffer, offset, buffer.byteLength - offset), {
        min: 101,
      })
      .then(async function processText({ done, value }) {
        // Result objects contain two properties:
        // done  - true if the stream has already given all its data.
        // value - some data. Always undefined when done is true.

        if (done) {
          logConsumer(
            `readStream() complete. Read ${value.byteLength} bytes (total: ${bytesReceived})`,
          );
          return;
        }

        buffer = value.buffer;
        offset += value.byteLength;
        bytesReceived += value.byteLength;

        // logConsumer(`Read ${bytesReceived} bytes: ${value}`);
        logConsumer(`Read ${value.byteLength} bytes (total: ${bytesReceived})`);
        result += value;

        // Read some more, and call this function again
        return reader
          .read(new Uint8Array(buffer, offset, buffer.byteLength - offset), {
            min: 101,
          })
          .then(processText);
      });
  }
}
```

```js hidden
button.addEventListener("click", () => {
  reader
    .cancel("user choice")
    .then(() => logConsumer("reader.cancel complete"));
});

reader.closed
  .then(() => {
    logConsumer("ReadableStreamBYOBReader.closed: resolved");
  })
  .catch(() => {
    logConsumer("ReadableStreamBYOBReader.closed: rejected:");
  });
```

#### Kết quả

Nhật ký từ nguồn push bên dưới (trái) và consumer (phải) được hiển thị bên dưới.
Lưu ý rằng nếu trình duyệt hỗ trợ đối số `options.min` thì ít nhất 101 phần tử được trả về mỗi lần (và thường nhiều hơn), trừ khi stream đóng lại.

{{EmbedLiveSample("Reading a minimum number of elements","100%","500px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hàm khởi tạo {{domxref("ReadableStreamBYOBReader.ReadableStreamBYOBReader", "ReadableStreamBYOBReader()")}}
- [Sử dụng readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
