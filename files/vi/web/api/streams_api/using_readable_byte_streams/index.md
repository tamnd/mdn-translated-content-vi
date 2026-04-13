---
title: Sử dụng luồng byte có thể đọc
slug: Web/API/Streams_API/Using_readable_byte_streams
page-type: guide
---

{{DefaultAPISidebar("Streams")}}

Luồng _byte có thể đọc_ là [luồng có thể đọc được](/en-US/docs/Web/API/Streams_API/Using_readable_streams) có nguồn byte cơ bản là `type: "bytes"` và hỗ trợ truyền dữ liệu không sao chép hiệu quả từ nguồn cơ bản đến người tiêu dùng (bỏ qua hàng đợi nội bộ của luồng).
Chúng dành cho các trường hợp sử dụng trong đó dữ liệu có thể được cung cấp hoặc yêu cầu ở các khối có kích thước tùy ý và có thể rất lớn và do đó việc tránh tạo bản sao có thể cải thiện hiệu quả.

Bài viết này giải thích cách các luồng byte có thể đọc được so với các luồng "mặc định" thông thường cũng như cách bạn tạo và sử dụng chúng.

> [!LƯU Ý]
> Luồng byte có thể đọc được gần giống với luồng byte có thể đọc được "bình thường" và hầu hết tất cả các khái niệm đều giống nhau.
> Bài viết này giả định rằng bạn đã hiểu những khái niệm đó và sẽ chỉ đề cập đến chúng một cách hời hợt (nếu có).
> Nếu bạn không quen với các khái niệm liên quan, trước tiên hãy đọc: [Sử dụng luồng có thể đọc được](/en-US/docs/Web/API/Streams_API/Using_readable_streams), [Khái niệm về luồng và tổng quan về cách sử dụng](/en-US/docs/Web/API/Streams_API#concepts_and_usage) và [Khái niệm API luồng](/en-US/docs/Web/API/Streams_API/Concepts).

## Tổng quan

Các luồng có thể đọc được cung cấp một giao diện nhất quán để truyền dữ liệu từ một số nguồn cơ bản, chẳng hạn như tệp hoặc ổ cắm, đến người tiêu dùng, chẳng hạn như trình đọc, luồng chuyển đổi hoặc luồng có thể ghi.
Trong luồng có thể đọc được thông thường, dữ liệu từ nguồn cơ bản luôn được chuyển đến người tiêu dùng thông qua hàng đợi nội bộ.
Luồng byte có thể đọc được khác ở chỗ nếu hàng đợi bên trong trống, nguồn cơ bản có thể ghi trực tiếp vào người tiêu dùng (truyền không sao chép hiệu quả).

Luồng byte có thể đọc được được tạo bằng cách chỉ định `type: "bytes"` trong đối tượng `underlyingSource` có thể được chuyển làm tham số đầu tiên cho hàm tạo [`ReadableStream()`](/en-US/docs/Web/API/ReadableStream/ReadableStream).
Với giá trị này được đặt, luồng được tạo bằng {{domxref("ReadableByteStreamController")}} và đây là đối tượng được chuyển đến nguồn cơ bản khi các hàm gọi lại `start(controller)` và `pull(controller)` được gọi.

Sự khác biệt chính giữa {{domxref("ReadableByteStreamController")}} và bộ điều khiển mặc định ({{domxref("ReadableStreamDefaultController")}}) là nó có thuộc tính bổ sung {{domxref("ReadableByteStreamController.byobRequest")}} thuộc loại {{domxref("ReadableStreamBYOBRequest")}}.
Điều này thể hiện yêu cầu đọc đang chờ xử lý của người tiêu dùng sẽ được thực hiện dưới dạng chuyển không bản sao từ nguồn cơ bản.
Thuộc tính sẽ là `null` nếu không có yêu cầu nào đang chờ xử lý.

`byobRequest` chỉ khả dụng khi yêu cầu đọc được thực hiện trên luồng byte có thể đọc được và không có dữ liệu trong hàng đợi nội bộ của luồng (nếu có dữ liệu thì yêu cầu đó sẽ được đáp ứng từ các hàng đợi đó).

Nguồn byte cơ bản cần truyền dữ liệu phải kiểm tra thuộc tính `byobRequest` và nếu có, hãy sử dụng thuộc tính đó để truyền dữ liệu.
Nếu thuộc tính là `null` thì thay vào đó, dữ liệu đến phải được thêm vào hàng đợi nội bộ của luồng bằng cách sử dụng {{domxref("ReadableByteStreamController.enqueue()")}} (đây là cách duy nhất để truyền dữ liệu khi sử dụng luồng "mặc định").

{{domxref("ReadableStreamBYOBRequest")}} có thuộc tính {{domxref("ReadableStreamBYOBRequest.view","view")}}, là chế độ xem trên bộ đệm được phân bổ để truyền.
Dữ liệu từ nguồn cơ bản phải được ghi vào thuộc tính này và sau đó nguồn cơ bản phải gọi {{domxref("ReadableStreamBYOBRequest.respond()","respond()")}} cho biết số byte được ghi.
Điều này báo hiệu rằng dữ liệu sẽ được chuyển và yêu cầu đọc đang chờ xử lý của người tiêu dùng đã được giải quyết.
Sau khi gọi `respond()` `view` không thể ghi được nữa.

Ngoài ra còn có một phương thức bổ sung {{domxref("ReadableStreamBYOBRequest.respondWithNewView()")}} mà nguồn cơ bản có thể chuyển chế độ xem "mới" chứa dữ liệu sẽ được truyền.
Chế độ xem mới này phải nằm trên bộ đệm _same_ như bản gốc và có cùng độ lệch bắt đầu.
Phương pháp này có thể được sử dụng nếu nguồn byte cơ bản trước tiên cần chuyển chế độ xem sang luồng công việc để điền vào (ví dụ) và sau đó lấy lại trước khi phản hồi `byobRequest`.
Trong hầu hết các trường hợp, phương pháp này sẽ không cần thiết.

Các luồng byte có thể đọc được thường được đọc bằng cách sử dụng {{domxref("ReadableStreamBYOBReader")}}, có thể nhận được bằng cách gọi {{domxref("ReadableStream.getReader()")}} trên luồng, chỉ định `mode: "byob"` trong tham số tùy chọn.

Luồng byte có thể đọc cũng có thể được đọc bằng trình đọc mặc định ({{domxref("ReadableStreamDefaultReader")}}), nhưng trong trường hợp này, các đối tượng `byobRequest` chỉ được tạo khi bật phân bổ bộ đệm tự động cho luồng ([`autoAllocateChunkSize`](/en-US/docs/Web/API/ReadableStream/ReadableStream#autoallocatechunksize) được đặt cho `underlyingSource` của luồng).
Lưu ý rằng kích thước được chỉ định bởi `autoAllocateChunkSize` được sử dụng cho kích thước bộ đệm trong trường hợp này; đối với đầu đọc byte, bộ đệm được sử dụng do người tiêu dùng cung cấp.
Nếu thuộc tính không được chỉ định, trình đọc mặc định sẽ vẫn "hoạt động" nhưng nguồn cơ bản sẽ không bao giờ được cung cấp `byobRequest` và tất cả dữ liệu sẽ được truyền qua hàng đợi nội bộ của luồng.

Ngoài những khác biệt nêu trên, bộ điều khiển và nguồn cơ bản cho luồng byte rất giống với bộ điều khiển cho luồng mặc định, [và được sử dụng theo cách tương tự](/en-US/docs/Web/API/Streams_API/Using_readable_streams).

## Ví dụ

### Nguồn đẩy cơ bản bằng trình đọc byte

Ví dụ trực tiếp này cho thấy cách tạo luồng byte có thể đọc được bằng nguồn byte cơ bản _push_ và đọc nó bằng trình đọc byte.

Không giống như kéo nguồn byte cơ bản, dữ liệu có thể đến bất kỳ lúc nào.
Do đó, nguồn cơ bản phải sử dụng `controller.byobRequest` để truyền dữ liệu đến nếu có và nếu không thì xếp dữ liệu vào hàng đợi nội bộ của luồng.
Hơn nữa, vì dữ liệu có thể đến bất kỳ lúc nào nên hành vi giám sát được thiết lập trong hàm gọi lại `underlyingSource.start()`.

Ví dụ này bị ảnh hưởng nhiều bởi ví dụ nguồn byte đẩy trong đặc tả luồng.
Nó sử dụng nguồn "ổ cắm giả định" giả định để cung cấp dữ liệu có kích thước tùy ý.
Trình đọc được cố tình trì hoãn ở nhiều điểm khác nhau để cho phép nguồn cơ bản sử dụng cả truyền và xếp hàng để gửi dữ liệu đến luồng.
Hỗ trợ áp lực ngược không được chứng minh.

> [!LƯU Ý]
> Nguồn byte cơ bản cũng có thể được sử dụng với trình đọc mặc định.
> Nếu bật phân bổ bộ đệm tự động, bộ điều khiển sẽ cung cấp bộ đệm có kích thước cố định để truyền không bản sao khi có yêu cầu chưa xử lý từ đầu đọc và hàng đợi nội bộ của luồng trống.
> Nếu tính năng phân bổ bộ đệm tự động không được bật thì tất cả dữ liệu từ luồng byte sẽ luôn được đưa vào hàng đợi.
> Điều này tương tự như hành vi được hiển thị trong ví dụ "pull: nguồn byte cơ bản.

#### Nguồn socket cơ bản bị mô phỏng

Nguồn cơ bản bị mô phỏng có ba phương thức quan trọng:

- `select2()` thể hiện một yêu cầu chưa xử lý trên ổ cắm.
  Nó trả về một lời hứa được giải quyết khi có sẵn dữ liệu.
- `readInto()` đọc dữ liệu từ ổ cắm vào bộ đệm được cung cấp rồi xóa dữ liệu.
- `close()` đóng ổ cắm.

Việc thực hiện rất đơn giản.
Như được hiển thị bên dưới, `select2()` tạo bộ đệm dữ liệu ngẫu nhiên có kích thước ngẫu nhiên khi hết thời gian chờ.
Dữ liệu đã tạo được đọc vào bộ đệm rồi xóa trong `readInto()`.

```js
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

#### Creating a readable socket push byte stream

The following code shows how to define a readable socket "push" byte stream.

The `underlyingSource` object definition is passed as the first parameter to the [`ReadableStream()` constructor](/en-US/docs/Web/API/ReadableStream/ReadableStream).
To make this a readable "byte" stream, we specify `loại: "byte"` as a property of the object.
This ensures that the stream is handed a {{domxref("ReadableByteStreamController")}} (instead of the default controller ({{domxref("ReadableStreamDefaultController")}}))

Since data can arrive at the socket before the consumer is ready to handle it, everything about reading the underlying source is configured in the `start()` callback method (we don't wait on a pull to start handling data).
The implementation opens the "socket" and calls `select2()` to request data.
When the returned promise resolves the code checks if `controller.byobRequest` exists (is not `null`), and if so calls `socket.readInto()` to copy data into the request and transfer it.
If `byobRequest` does not exist there is no outstanding request from a consuming stream that can be satisfied as a zero-copy transfer.
In this case, `controller.enqueue()` used to copy data to the stream internal queues.

The `select2()` request for more data is reposted until a request is returned with no data.
A this point the controller is used to close the stream.

```js
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
            logSource(`byobRequest với ${bytesRead} byte`);
          } else {
            const buffer = new ArrayBuffer(DEFAULT_CHUNK_SIZE);
            bytesRead = socket.readInto(buffer, 0, DEFAULT_CHUNK_SIZE);
            if (bytesRead === 0) {
              controller.close();
            } else {
              controller.enqueue(new Uint8Array(buffer, 0, bytesRead));
            }
            logSource(`enqueue() ${bytesRead} byte (không có byobRequest)`);
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
      logSource(`cancel(): socket đã đóng`);
    },
  });
}
```

Note that `readRepeatedly()` returns a promise, and we use this to catch any errors from setting up or handling the read operation.
The errors are then passed to the controller as shown above (see `readRepeatedly().catch((e) => control.error(e));`).

A `cancel()` method is provided at the end to close the underlying source; the `pull()` callback is not needed, and is therefore not implemented.

#### Consuming the push byte stream

The following code creates a `ReadableStreamBYOBReader` for the socket byte stream and uses it read data into a buffer.
Note `processText()` is called recursively to read more data until the buffer is filled.
When the underlying source signals that it has no more data, the `reader.read()` will have `done` set to true, which in turn completes the read operation.

This code is almost exactly the same as for the [Underlying pull source with byte reader](#underlying_pull_source_with_byte_reader) example above.
The only difference is that the reader includes some code to slow down reading, so the log output can demonstrate that data will be enqueued if not read fast enough.

```js
const reader = stream.getReader({ mode: "byob" });
let buffer = new ArrayBuffer(4000);
readStream(reader);

function readStream(reader) {
  let bytesReceived = 0;
  let offset = 0;

  while (offset < buffer.byteLength) {
    // read() returns a promise that resolves when a value has been received
    reader
      .read(new Uint8Array(buffer, offset, buffer.byteLength - offset))
      .then(async function processText({ done, value }) {
        // Result objects contain two properties:
        // done  - true if the stream has already given all its data.
        // value - some data. Always undefined when done is true.

        if (done) {
          logConsumer(`readStream() hoàn tất. Tổng số byte: ${bytesReceived_`);
          return;
        }

        buffer = value.buffer;
        offset += value.byteLength;
        bytesReceived += value.byteLength;

        // logConsumer(`Read ${bytesReceived} byte: ${value`);
        logConsumer(`Read ${bytesReceived} bytes`);
        result += value;

        // Add delay to emulate when data can't be read and data is enqueued
        if (bytesReceived > 300 && bytesReceived < 600) {
          logConsumer(`Đang trì hoãn đọc để mô phỏng luồng chậm đọc`);
          const delay = (ms) =>
            new Promise((resolve) => {
              setTimeout(resolve, ms);
            });
          await delay(1000);
        }

        // Read some more, and call this function again
        return reader
          .read(new Uint8Array(buffer, offset, buffer.byteLength - offset))
          .then(processText);
      });
  }
}
```

#### Cancelling the stream using the reader

We can use {{domxref("ReadableStreamBYOBReader.cancel()")}} to cancel the stream.
For this example we call the method if a button is clicked with a reason "user choice" (other HTML and code for the button not shown).
We also log when the cancel operation completes.

```js
button.addEventListener("click", () => {
  reader
    .cancel("user choice")
    .then(() => logConsumer("reader.cancel complete"));
});
```

{{domxref("ReadableStreamBYOBReader.releaseLock()")}} can be used to release the reader without cancelling the stream.
Note however that any outstanding read requests will immediately be rejected.
A new reader can be acquired later on to read the remaining chunks.

#### Monitoring for stream for close/error

The {{domxref("ReadableStreamBYOBReader.closed")}} property returns a promise that will resolve when the stream is closed, and reject if there is an error.
While no errors are expected in this case, the following code should log the completion case.

`__ MDNPH98__`

#### Result

The logging from the underlying push source (left) and consumer (right) are shown below.
Not the period in the middle where data is enqueued rather than transferred as a zero-copy operation.

{{EmbedLiveSample("Underlying push source with default reader","100%","500px")}}

### Underlying pull source with byte reader

This live example shows how data might be read from an "pull" underlying byte source, such as a file, and transferred by a stream as a zero-copy transfer to a {{domxref("ReadableStreamBYOBReader")}}.

#### Mocked underlying file source

For the underlying pull source we use the following class to (_very_ superficially) mock a nodejs [`FileHandle`](https://nodejs.org/api/fs.html#class-filehandle), and in particular the [`read()`](https://nodejs.org/api/fs.html#filehandlereadbuffer-offset-length-position) method.
The class generates random data to represent a file.
The `read()` method reads a "semi-random" sized block of random data into a provided buffer from the specified position.
The `close()` method does nothing: it is only provided to show where you might close the source when defining the constructor for the stream.

> [!NOTE]
> A similar class is used for all the "pull source" examples.
> It is shown here for information only (so that it is obvious that it is a mock).

`__MD NPH104__`

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

#### Creating a readable file byte stream

The following code shows how to define a readable file byte stream.

Just as for the previous example, the `underlyingSource` object definition is passed as the first parameter to the [`ReadableStream()` constructor](/en-US/docs/Web/API/ReadableStream/ReadableStream).
To make this a readable "byte" stream, we specify `type: "byte"` as a property of the object.
This ensures that the stream is handed a {{domxref("ReadableByteStreamController")}}.

The `start()` function simply opens the file handle, which is then closed in the `cancel()` callback.
`cancel()` is provided to clean up any resources if {{domxref("ReadableStream.cancel()")}} or {{domxref("ReadableStreamDefaultController.close()")}} are called.

Most of the interesting code is in the `pull()` callback.
This copies data from the file into the pending read request ({{domxref("ReadableByteStreamController.byobRequest")}}) and then calls {{domxref("ReadableStreamBYOBRequest.respond()","respond()")}} to indicate how much data is in the buffer and transfer it.
If 0 bytes were transferred from the file then we know it has all been copied, and call {{domxref("ReadableStreamDefaultController.close()","close()")}} on the controller, which in turn will result in `cancel()` being called on the underlying source.

```js
const stream = makeReadableByteFileStream("dummy file.txt");

function makeReadableByteFileStream(filename) {
  let fileHandle;
  let position = 0;
  return new ReadableStream({
    type: "bytes", // An underlying byte stream!
    start(controller) {
      // Called to initialize the underlying source.
      // For a file source open a file handle (here we just create the mocked object).
      fileHandle = new MockUnderlyingFileHandle();
      logSource(
        `start(): ${controller.constructor.name}.byobRequest = ${controller.byobRequest_`,
      );
    },
    async pull(controller) {
      // Called when there is a pull request for data
      const theView = controller.byobRequest.view;
      const { bytesRead, buffer } = await fileHandle.read(
        theView.buffer,
        theView.byteOffset,
        theView.byteLength,
        position,
      );
      if (bytesRead === 0) {
        await fileHandle.close();
        controller.close();
        controller.byobRequest.respond(0);
        logSource(
          `pull() với byobRequest. Đóng bộ điều khiển (đọc byte: ${bytesRead})`,
        );
      } else {
        position += bytesRead;
        controller.byobRequest.respond(bytesRead);
        logSource(`pull() bằng byobRequest. Chuyển ${bytesRead} byte`);
      }
    },
    cancel(reason) {
      // This is called if the stream is cancelled (via reader or controller).
      // Clean up any resources
      fileHandle.close();
      logSource(`cancel() với lý do: ${reason_`);
    },
  });
}
```

#### Consuming the byte stream

The following code creates a `ReadableStreamBYOBReader` for the file byte stream and uses it read data into a buffer.
Note `processText()` is called recursively to read more data until the buffer is filled.
When the underlying source signals that it has no more data, the `reader.read()` will have `done` set to true, which in turn completes the read operation.

```js
const reader = stream.getReader({ mode: "byob" });
let buffer = new ArrayBuffer(200);
readStream(reader);

function readStream(reader) {
  let bytesReceived = 0;
  let offset = 0;

  // read() returns a promise that resolves when a value has been received
  reader
    .read(new Uint8Array(buffer, offset, buffer.byteLength - offset))
    .then(function processText({ done, value }) {
      // Result objects contain two properties:
      // done  - true if the stream has already given all its data.
      // value - some data. Always undefined when done is true.

      if (done) {
        logConsumer(`readStream() hoàn tất. Tổng số byte: ${bytesReceived_`);
        return;
      }

      buffer = value.buffer;
      offset += value.byteLength;
      bytesReceived += value.byteLength;

      logConsumer(
        `Read ${value.byteLength} (${bytesReceived}) byte: ${value_`,
      );
      result += value;

      // Read some more, and call this function again
      return reader
        .read(new Uint8Array(buffer, offset, buffer.byteLength - offset))
        .then(processText);
    });
}
```

Lastly, we add a handler that will cancel the stream if a button is clicked (other HTML and code for the button not shown).

```js
button.addEventListener("click", () => {
  reader.cancel("user choice").then(() => {
    logConsumer(`reader.cancel hoàn thành`);
  });
});
```

#### Result

The logging from the underlying pull source (left) and consumer (right) are shown below.
Of particular note are that the:

- `start()` function is passed a `ReadableByteStreamController`
- the buffer passed to the reader is large enough to encompass the whole "file".
  The underlying data source supplies the data in random-sized chunks.

{{EmbedLiveSample("Underlying pull source","100%","500px")}}

### Underlying pull source with default reader

This live example shows how the same data might be read as a zero-copy transfer using a default reader ({{domxref("ReadableStreamDefaultReader")}}).
This uses the same [mocked underlying file source](#mocked_underlying_file_source) as in the preceding example.

```js hidden
class MockUnderlyingFileHandle {
  constructor() {
    this.maxdata = 100; // "file size"
    this.maxReadChunk = 25; // "max read chunk size"
    this.minReadChunk = 13; // "min read chunk size"
    this.filedata = this.randomByteArray(this.maxdata);
    this.position = 0;
  }

  // Read data from "file" at position/length into specified buffer offset
  read(buffer, offset, length, position) {
    // Object used to resolve promise
    const resultObj = {};
    resultObj["buffer"] = buffer;
    resultObj["bytesRead"] = 0;

    return new Promise((resolve /*, reject */) => {
      if (position >= this.maxdata) {
        // Out of data
        resolve(resultObj);
        return;
      }

      // Simulate a file read that returns random numbers of bytes
      // Read minimum of bytes requested and random bytes that can be returned
      let readLength =
        Math.floor(
          Math.random() * (this.maxReadChunk - this.minReadChunk + 1),
        ) + this.minReadChunk;
      readLength = length > readLength ? readLength : length;

      // Read random data into supplied buffer
      const myView = new Uint8Array(buffer, offset, readLength);
      // Write the length of data specified
      for (let i = 0; i < readLength; i++) {
        myView[i] = this.filedata[position + i];
        resultObj["bytesRead"] = i + 1;
        if (position + i + 1 >= this.maxdata) {
          break;
        }
      }
      // Emulate slow read of data
      setTimeout(() => {
        resolve(resultObj);
      }, 1000);
    });
  }

  // Dummy close function
  close() {}

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

  // Return random Uint8Array of bytes
  randomByteArray(bytes = 8) {
    const textEncoder = new TextEncoder();
    return textEncoder.encode(this.randomChars(bytes));
  }
}
```

<!-- The following html and js sets up reporting. Hidden because it is not useful for readers -->

````css hidden
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
````

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

#### Creating a readable file byte stream with automatic buffer allocation

The only difference in our underlying source is that we must specify `autoAllocateChunkSize`, and that the size will be used as the view buffer size for `controller.byobRequest`, rather than one supplied by the consumer.

```js
const DEFAULT_CHUNK_SIZE = 20;
const stream = makeReadableByteFileStream("dummy file.txt");

function makeReadableByteFileStream(filename) {
  let fileHandle;
  let position = 0;
  return new ReadableStream({
    type: "bytes", // An underlying byte stream!
    start(controller) {
      // Called to initialize the underlying source.
      // For a file source open a file handle (here we just create the mocked object).
      fileHandle = new MockUnderlyingFileHandle();
      logSource(
        `start(): ${controller.constructor.name}.byobRequest = ${controller.byobRequest`,
      );
    },
    async pull(controller) {
      // Called when there is a pull request for data
      const theView = controller.byobRequest.view;
      const { bytesRead, buffer } = await fileHandle.read(
        theView.buffer,
        theView.byteOffset,
        theView.byteLength,
        position,
      );
      if (bytesRead === 0) {
        await fileHandle.close();
        controller.close();
        controller.byobRequest.respond(0);
        logSource(
          `pull() với byobRequest. Đóng bộ điều khiển (đọc byte: ${bytesRead})`,
        );
      } else {
        position += bytesRead;
        controller.byobRequest.respond(bytesRead);
        logSource(`pull() bằng byobRequest. Chuyển ${bytesRead} byte`);
      }
    },
    cancel(reason) {
      // This is called if the stream is cancelled (via reader or controller).
      // Clean up any resources
      fileHandle.close();
      logSource(`cancel() với lý do: ${reason_`);
    },
    autoAllocateChunkSize: DEFAULT_CHUNK_SIZE, // Only relevant if using a default reader
  });
}
```

#### Consuming the byte stream with default reader

The following code creates a {{domxref("ReadableStreamDefaultReader")}} for the file byte stream by calling `stream.getReader();` without specifying the mode, and uses it read data into a buffer.
The operation of the code is the same as the previous example except that the buffer is supplied by the stream rather than the consumer.

```js
const reader = stream.getReader();
readStream(reader);

function readStream(reader) {
  let bytesReceived = 0;
  let result = "";

  // read() returns a promise that resolves
  // when a value has been received
  reader.read().then(function processText({ done, value }) {
    // Result objects contain two properties:
    // done  - true if the stream has already given you all its data.
    // value - some data. Always undefined when done is true.
    if (done) {
      logConsumer(`readStream() hoàn tất. Tổng số byte: ${bytesReceived_`);
      return;
    }

    bytesReceived += value.length;
    logConsumer(
      `Read ${value.length} (${bytesReceived}). Byte hiện tại = ${value_`,
    );
    result += value;

    // Read some more, and call this function again
    return reader.read().then(processText);
  });
}
```

Lastly, we add a handler that will cancel the stream if a button is clicked (other HTML and code for the button not shown).

```js
button.addEventListener("click", () => {
  reader.cancel("user choice").then(() => {
    logConsumer(`reader.cancel hoàn thành`);
  });
});
```

#### Result

The logging from the underlying byte pull source (left) and consumer (right) are shown below.

Note that the chunks are now _at most_ 20-byte wide, as this is the size of the auto allocated buffer specified in the underlying byte source (`autoAllocateChunkSize`).
These are made as zero-copy transfers.

{{EmbedLiveSample("Underlying pull source with default reader","100%","500px")}}

### Underlying pull source with default reader and no allocation

For completeness, we can also use a default reader with a byte source that does not support automatic buffer allocation.

```js hidden
class MockUnderlyingFileHandle {
  constructor() {
    this.maxdata = 100; // "file size"
    this.maxReadChunk = 25; // "max read chunk size"
    this.minReadChunk = 13; // "min read chunk size"
    this.filedata = this.randomByteArray(this.maxdata);
    this.position = 0;
  }

  // Read data from "file" at position/length into specified buffer offset
  read(buffer, offset, length, position) {
    // Object used to resolve promise
    const resultObj = {};
    resultObj["buffer"] = buffer;
    resultObj["bytesRead"] = 0;

    return new Promise((resolve /*, reject */) => {
      if (position >= this.maxdata) {
        // Out of data
        resolve(resultObj);
        return;
      }

      // Simulate a file read that returns random numbers of bytes
      // Read minimum of bytes requested and random bytes that can be returned
      let readLength =
        Math.floor(
          Math.random() * (this.maxReadChunk - this.minReadChunk + 1),
        ) + this.minReadChunk;
      readLength = length > readLength ? readLength : length;

      // Read random data into supplied buffer
      const myView = new Uint8Array(buffer, offset, readLength);
      // Write the length of data specified
      for (let i = 0; i < readLength; i++) {
        myView[i] = this.filedata[position + i];
        resultObj["bytesRead"] = i + 1;
        if (position + i + 1 >= this.maxdata) {
          break;
        }
      }
      // Emulate slow read of data
      setTimeout(() => {
        resolve(resultObj);
      }, 1000);
    });
  }

  // Dummy close function
  close() {}

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

  // Return random Uint8Array of bytes
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

`__ MDNPH1 68__`

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

However in this case the controller will not supply a `byobRequest` for the underlying source to write into.
Instead the underlying source would have to enqueue the data.
Note below that to support this case, in `pull()` we need to check if the `byobRequest` exists.

```js
const stream = makeReadableByteFileStream("dummy file.txt");
const DEFAULT_CHUNK_SIZE = 40;

function makeReadableByteFileStream(filename) {
  let fileHandle;
  let position = 0;
  return new ReadableStream({
    type: "bytes", // An underlying byte stream!
    start(controller) {
      // Called to initialize the underlying source.
      // For a file source open a file handle (here we just create the mocked object).
      fileHandle = new MockUnderlyingFileHandle();
      logSource(
        `start(): ${controller.constructor.name}.byobRequest = ${controller.byobRequest`,
      );
    },
    async pull(controller) {
      // Called when there is a pull request for data
      if (controller.byobRequest) {
        const theView = controller.byobRequest.view;
        const { bytesRead, buffer } = await fileHandle.read(
          theView.buffer,
          theView.byteOffset,
          theView.byteLength,
          position,
        );
        if (bytesRead === 0) {
          await fileHandle.close();
          controller.close();
          controller.byobRequest.respond(0);
          logSource(
            `pull() với byobRequest. Đóng bộ điều khiển (đọc byte: ${bytesRead})`,
          );
        } else {
          position += bytesRead;
          controller.byobRequest.respond(bytesRead);
          logSource(`pull() bằng byobRequest. Chuyển ${bytesRead} byte`);
        }
      } else {
        // No BYOBRequest so enqueue data to stream
        // NOTE, this branch would only execute for a default reader if autoAllocateChunkSize is not defined.
        const myNewBuffer = new Uint8Array(DEFAULT_CHUNK_SIZE);
        const { bytesRead, buffer } = await fileHandle.read(
          myNewBuffer.buffer,
          myNewBuffer.byteOffset,
          myNewBuffer.byteLength,
          position,
        );
        if (bytesRead === 0) {
          await fileHandle.close();
          controller.close();
          controller.enqueue(myNewBuffer);
          logSource(
            `pull() mà không cần byobRequest. Đóng bộ điều khiển (đọc byte: ${bytesRead})`,
          );
        } else {
          position += bytesRead;
          controller.enqueue(myNewBuffer);
          logSource(`pull() mà không có byobRequest. enqueue() ${bytesRead} bytes`);
        }
      }
    },
    cancel(reason) {
      // This is called if the stream is cancelled (via reader or controller).
      // Clean up any resources
      fileHandle.close();
      logSource(`cancel() với lý do: ${reason_`);
    },
  });
}
```

```js hidden
const reader = stream.getReader();

readStream(reader);

function readStream(reader) {
  let bytesReceived = 0;
  let result = "";

  // read() returns a promise that resolves
  // when a value has been received
  reader.read().then(function processText({ done, value }) {
    // Result objects contain two properties:
    // done  - true if the stream has already given you all its data.
    // value - some data. Always undefined when done is true.
    if (done) {
      logConsumer(`readStream() hoàn tất. Tổng số byte: ${bytesReceived_`);
      return;
    }

    bytesReceived += value.length;
    logConsumer(`Read ${bytesReceived} byte cho đến nay. Byte hiện tại = ${value_`);
    result += value;

    // Read some more, and call this function again
    return reader.read().then(processText);
  });
}
```

```js hidden
button.addEventListener("click", () => {
  reader.cancel("user choice").then(() => {
    logConsumer(`reader.cancel Complete`);
  });
});
```

#### Kết quả

Việc ghi nhật ký từ nguồn kéo cơ bản (trái) và người tiêu dùng (phải) được hiển thị bên dưới.
Lưu ý rằng phía nguồn cơ bản cho thấy rằng dữ liệu đã được xếp vào hàng đợi thay vì được truyền 0 byte.

{{EmbedLiveSample("Underlying pull source with default reader and no allocation","100%","500px")}}

## Xem thêm

- [Khái niệm API luồng](/en-US/docs/Web/API/Streams_API/Concepts)
- [Khái niệm về luồng và tổng quan về cách sử dụng](/en-US/docs/Web/API/Streams_API#concepts_and_usage)
- [Sử dụng các luồng có thể đọc được](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
