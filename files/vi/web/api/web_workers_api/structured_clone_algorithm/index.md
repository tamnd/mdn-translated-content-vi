---
title: Thuật toán structured clone
slug: Web/API/Web_Workers_API/Structured_clone_algorithm
page-type: guide
---

{{DefaultAPISidebar("Web Workers API") }}

**Thuật toán structured clone** sao chép các đối tượng JavaScript phức tạp.
Nó được sử dụng nội bộ khi gọi {{DOMxRef("WorkerGlobalScope.structuredClone", "structuredClone()")}}, để truyền dữ liệu giữa các [Workers](/en-US/docs/Web/API/Worker) thông qua {{domxref("Worker.postMessage()", "postMessage()")}}, lưu trữ các đối tượng với [IndexedDB](/en-US/docs/Glossary/IndexedDB), hoặc sao chép các đối tượng cho [các APIs khác](#see_also).

Nó sao chép bằng cách đệ quy qua đối tượng đầu vào trong khi duy trì một bản đồ của các tham chiếu đã truy cập trước đó, để tránh việc duyệt vô hạn các cycles.

## Những thứ không hoạt động với structured clone

- Các đối tượng {{jsxref("Function")}} không thể được sao chép bởi thuật toán structured clone; việc cố gắng sẽ ném ra ngoại lệ `DataCloneError`.
- Việc sao chép các DOM nodes cũng ném ra ngoại lệ `DataCloneError`.
- Một số thuộc tính đối tượng không được bảo toàn:
  - Thuộc tính `lastIndex` của các đối tượng {{jsxref("RegExp")}} không được bảo toàn.
  - Property descriptors, setters, getters, và các tính năng tương tự metadata không được sao chép.
    Ví dụ: nếu một đối tượng được đánh dấu readonly với một [property descriptor](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyDescriptor), nó sẽ là read/write trong bản sao, vì đó là mặc định.
  - Prototype chain không được duyệt hoặc sao chép.
  - [Class private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) không được sao chép. (Mặc dù các trường nội bộ của các built-in types có thể.)

## Các kiểu được hỗ trợ

### Các kiểu JavaScript

- {{jsxref("Array")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("Boolean")}}
- {{jsxref("DataView")}}
- {{jsxref("Date")}}
- Các kiểu {{jsxref("Error")}} (nhưng xem [Các kiểu Error](#error_types) bên dưới).
- {{jsxref("Map")}}
- {{jsxref("Number")}}
- Các đối tượng {{jsxref("Object")}}: nhưng chỉ các đối tượng đơn giản (ví dụ: từ object literals).
- [Primitive types](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_values), trừ `symbol`.
- {{jsxref("RegExp")}}: nhưng lưu ý rằng `lastIndex` không được bảo toàn.
- {{jsxref("Set")}}
- {{jsxref("String")}}
- {{jsxref("TypedArray")}}

#### Các kiểu Error

Đối với các kiểu `Error`, tên lỗi phải là một trong: {{jsxref("Error")}}, {{JSxRef("EvalError")}}, {{JSxRef("RangeError")}}, {{JSxRef("ReferenceError")}}, {{JSxRef("SyntaxError")}}, {{JSxRef("TypeError")}}, {{JSxRef("URIError")}} (hoặc sẽ được đặt thành "Error").

Các trình duyệt phải tuần tự hóa các thuộc tính `name` và `message`, và dự kiến sẽ tuần tự hóa các thuộc tính "thú vị" khác của các lỗi như `stack`, `cause`, v.v.

{{JSxRef("AggregateError")}} dự kiến sẽ được thêm vào đặc tả kỹ thuật trong [whatwg/html#5749](https://github.com/whatwg/html/pull/5749) (và đã được hỗ trợ trong một số trình duyệt).

### Các kiểu Web/API

- {{domxref("AudioData")}}
- {{domxref("Blob")}}
- {{domxref("CropTarget")}}
- {{domxref("CryptoKey")}}
- {{domxref("DOMException")}}: các trình duyệt phải tuần tự hóa các thuộc tính {{domxref("DOMException.name","name")}} và {{domxref("DOMException.message","message")}}. Các thuộc tính khác cũng có thể được tuần tự hóa/sao chép.
- {{domxref("DOMMatrix")}}
- {{domxref("DOMMatrixReadOnly")}}
- {{domxref("DOMPoint")}}
- {{domxref("DOMPointReadOnly")}}
- {{domxref("DOMQuad")}}
- {{domxref("DOMRect")}}
- {{domxref("DOMRectReadOnly")}}
- {{domxref("EncodedAudioChunk")}}
- {{domxref("EncodedVideoChunk")}}
- {{domxref("FencedFrameConfig")}}
- {{domxref("File")}}
- {{domxref("FileList")}}
- {{domxref("FileSystemDirectoryHandle")}}
- {{domxref("FileSystemFileHandle")}}
- {{domxref("FileSystemHandle")}}
- {{domxref("GPUCompilationInfo")}}
- {{domxref("GPUCompilationMessage")}}
- {{domxref("GPUPipelineError")}}
- {{domxref("ImageBitmap")}}
- {{domxref("ImageData")}}
- {{domxref("RTCCertificate")}}
- {{domxref("RTCEncodedAudioFrame")}}
- {{domxref("RTCEncodedVideoFrame")}}
- {{domxref("VideoFrame")}}
- {{domxref("WebTransportError")}}

> [!NOTE]
> Các đối tượng có thể tuần tự hóa được đánh dấu trong [các tệp Web IDL](https://github.com/w3c/webref/tree/main/ed/idl) với thuộc tính `[Serializable]`.

## Xem thêm

- [Đặc tả HTML: Truyền an toàn dữ liệu có cấu trúc](https://html.spec.whatwg.org/multipage/infrastructure.html#safe-passing-of-structured-data)
- [Transferable objects](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects)
- {{DOMxRef("Window.structuredClone()")}}
- {{DOMxRef("WorkerGlobalScope.structuredClone()")}}
- {{domxref("window.postMessage()")}}
- [Web Workers](/en-US/docs/Web/API/Web_Workers_API)
- [IndexedDB](/en-US/docs/Web/API/IndexedDB_API)
