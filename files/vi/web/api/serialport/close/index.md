---
title: "SerialPort: phương thức close()"
short-title: close()
slug: Web/API/SerialPort/close
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.SerialPort.close
---

{{APIRef("Web Serial API")}}{{SecureContext_Header}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`SerialPort.close()`** của giao diện {{domxref("SerialPort")}} trả về một {{jsxref("Promise")}} phân giải khi cổng đóng.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}}.

## Mô tả

`close()` đóng cổng nối tiếp nếu các thành viên {{domxref("SerialPort.readable")}} và {{domxref("SerialPort.writable")}} đã bị khóa trước đó được mở khóa, nghĩa là các phương thức `releaseLock()` đã được gọi cho trình đọc và trình ghi tương ứng của chúng.

Tuy nhiên, khi liên tục đọc dữ liệu từ một thiết bị nối tiếp bằng vòng lặp, [luồng có thể đọc](/en-US/docs/Web/API/ReadableStream) liên quan sẽ luôn bị khóa cho đến khi [trình đọc](/en-US/docs/Web/API/ReadableStreamDefaultReader) gặp lỗi. Trong trường hợp này, gọi [`reader.cancel()`](/en-US/docs/Web/API/ReadableStreamDefaultReader/cancel) sẽ buộc [`reader.read()`](/en-US/docs/Web/API/ReadableStreamDefaultReader/read) phân giải ngay lập tức với `{ value: undefined, done: true }` cho phép vòng lặp gọi [`reader.releaseLock()`](/en-US/docs/Web/API/ReadableStreamDefaultReader/releaseLock).

```js
// Without transform streams.

let keepReading = true;
let reader;

async function readUntilClosed() {
  while (port.readable && keepReading) {
    reader = port.readable.getReader();
    try {
      while (true) {
        const { value, done } = await reader.read();
        if (done) {
          // reader.cancel() has been called.
          break;
        }
        // value is a Uint8Array.
        console.log(value);
      }
    } catch (error) {
      // Handle error...
    } finally {
      // Allow the serial port to be closed later.
      reader.releaseLock();
    }
  }

  await port.close();
}

const closedPromise = readUntilClosed();

document.querySelector("button").addEventListener("click", async () => {
  // User clicked a button to close the serial port.
  keepReading = false;
  // Force reader.read() to resolve immediately and subsequently
  // call reader.releaseLock() in the loop example above.
  reader.cancel();
  await closedPromise;
});
```

Đóng một cổng nối tiếp phức tạp hơn khi sử dụng [transform streams](/en-US/docs/Web/API/TransformStream). Xem [Close a serial port](https://developer.chrome.com/docs/capabilities/serial#close-port) để được hướng dẫn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
