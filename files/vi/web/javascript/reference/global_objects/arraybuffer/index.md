---
title: ArrayBuffer
slug: Web/JavaScript/Reference/Global_Objects/ArrayBuffer
page-type: javascript-class
browser-compat: javascript.builtins.ArrayBuffer
sidebar: jsref
---

Đối tượng **`ArrayBuffer`** được sử dụng để biểu diễn bộ đệm dữ liệu nhị phân thô chung.

Đây là mảng byte, thường được gọi trong các ngôn ngữ khác là "mảng byte". Bạn không thể thao tác trực tiếp với nội dung của `ArrayBuffer`; thay vào đó, bạn tạo một trong các [đối tượng mảng được gõ kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray) hoặc đối tượng {{jsxref("DataView")}} biểu diễn bộ đệm ở định dạng cụ thể, và dùng nó để đọc và ghi nội dung của bộ đệm.

Constructor [`ArrayBuffer()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer/ArrayBuffer) tạo `ArrayBuffer` mới có độ dài tính bằng byte được chỉ định. Bạn cũng có thể lấy bộ đệm mảng từ dữ liệu hiện có, chẳng hạn từ chuỗi [Base64](/en-US/docs/Glossary/Base64) hoặc [từ tệp cục bộ](/en-US/docs/Web/API/FileReader/readAsArrayBuffer).

`ArrayBuffer` là [đối tượng có thể chuyển giao](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

## Mô tả

### Thay đổi kích thước ArrayBuffer

Đối tượng `ArrayBuffer` có thể được làm cho có thể thay đổi kích thước bằng cách bao gồm tùy chọn `maxByteLength` khi gọi constructor {{jsxref("ArrayBuffer/ArrayBuffer", "ArrayBuffer()")}}. Bạn có thể truy vấn xem `ArrayBuffer` có thể thay đổi kích thước và kích thước tối đa của nó là bao nhiêu bằng cách truy cập các thuộc tính {{jsxref("ArrayBuffer/resizable", "resizable")}} và {{jsxref("ArrayBuffer/maxByteLength", "maxByteLength")}} tương ứng. Bạn có thể gán kích thước mới cho `ArrayBuffer` có thể thay đổi kích thước bằng lệnh gọi {{jsxref("ArrayBuffer/resize", "resize()")}}. Các byte mới được khởi tạo bằng 0.

Các tính năng này làm cho việc thay đổi kích thước `ArrayBuffer` hiệu quả hơn — nếu không, bạn phải tạo bản sao của bộ đệm với kích thước mới. Nó cũng cung cấp cho JavaScript tính tương đương với WebAssembly trong vấn đề này (bộ nhớ tuyến tính Wasm có thể được thay đổi kích thước với [`WebAssembly.Memory.prototype.grow()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/grow)).

### Chuyển giao ArrayBuffer

Đối tượng `ArrayBuffer` có thể được chuyển giao giữa các ngữ cảnh thực thi khác nhau, như [Web Workers](/en-US/docs/Web/API/Web_Workers_API) hay [Service Workers](/en-US/docs/Web/API/Service_Worker_API), sử dụng [thuật toán sao chép có cấu trúc](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm). Điều này được thực hiện bằng cách truyền `ArrayBuffer` như [đối tượng có thể chuyển giao](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) trong lệnh gọi đến {{domxref("Worker.postMessage()")}} hay {{domxref("ServiceWorker.postMessage()")}}. Trong JavaScript thuần túy, bạn cũng có thể chuyển quyền sở hữu bộ nhớ từ `ArrayBuffer` này sang `ArrayBuffer` khác bằng cách sử dụng phương thức {{jsxref("ArrayBuffer/transfer", "transfer()")}} hay {{jsxref("ArrayBuffer/transferToFixedLength", "transferToFixedLength()")}} của nó.

Khi một `ArrayBuffer` được chuyển giao, bản sao gốc của nó trở thành _bị tách rời_ — điều này có nghĩa là nó không còn có thể sử dụng được. Tại bất kỳ thời điểm nào, sẽ chỉ có một bản sao của `ArrayBuffer` thực sự có quyền truy cập vào bộ nhớ cơ bản. Các bộ đệm bị tách rời có các hành vi sau:

- {{jsxref("ArrayBuffer/byteLength", "byteLength")}} trở thành 0 (trong cả bộ đệm và các khung nhìn mảng được gõ kiểu liên quan).
- Các phương thức, chẳng hạn như {{jsxref("ArrayBuffer/resize", "resize()")}} và {{jsxref("ArrayBuffer/slice", "slice()")}}, ném ra {{jsxref("TypeError")}} khi được gọi. Các phương thức của các khung nhìn mảng được gõ kiểu liên quan cũng ném `TypeError`.

Bạn có thể kiểm tra xem `ArrayBuffer` có bị tách rời hay không bằng thuộc tính {{jsxref("ArrayBuffer/detached", "detached")}} của nó.

## Constructor

- {{jsxref("ArrayBuffer/ArrayBuffer", "ArrayBuffer()")}}
  - : Tạo đối tượng `ArrayBuffer` mới.

## Thuộc tính tĩnh

- [`ArrayBuffer[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer/Symbol.species)
  - : Hàm constructor được sử dụng để tạo các đối tượng dẫn xuất.

## Phương thức tĩnh

- {{jsxref("ArrayBuffer.isView()")}}
  - : Trả về `true` nếu `arg` là một trong các khung nhìn ArrayBuffer, chẳng hạn như [đối tượng mảng được gõ kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray) hay {{jsxref("DataView")}}. Trả về `false` nếu không phải.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `ArrayBuffer.prototype` và được chia sẻ bởi tất cả các instance `ArrayBuffer`.

- {{jsxref("ArrayBuffer.prototype.byteLength")}}
  - : Kích thước, tính bằng byte, của `ArrayBuffer`. Được thiết lập khi mảng được xây dựng và chỉ có thể thay đổi bằng phương thức {{jsxref("ArrayBuffer.prototype.resize()")}} nếu `ArrayBuffer` có thể thay đổi kích thước.
- {{jsxref("Object/constructor", "ArrayBuffer.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `ArrayBuffer`, giá trị khởi tạo là constructor {{jsxref("ArrayBuffer/ArrayBuffer", "ArrayBuffer")}}.
- {{jsxref("ArrayBuffer.prototype.detached")}}
  - : Chỉ đọc. Trả về `true` nếu `ArrayBuffer` đã bị tách rời (chuyển giao), hoặc `false` nếu chưa.
- {{jsxref("ArrayBuffer.prototype.maxByteLength")}}
  - : Độ dài tối đa chỉ đọc, tính bằng byte, mà `ArrayBuffer` có thể được thay đổi kích thước đến. Được thiết lập khi mảng được xây dựng và không thể thay đổi.
- {{jsxref("ArrayBuffer.prototype.resizable")}}
  - : Chỉ đọc. Trả về `true` nếu `ArrayBuffer` có thể thay đổi kích thước, hoặc `false` nếu không thể.
- `ArrayBuffer.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"ArrayBuffer"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("ArrayBuffer.prototype.resize()")}}
  - : Thay đổi kích thước `ArrayBuffer` thành kích thước được chỉ định, tính bằng byte.
- {{jsxref("ArrayBuffer.prototype.slice()")}}
  - : Trả về `ArrayBuffer` mới có nội dung là bản sao các byte của `ArrayBuffer` này từ `begin` (bao gồm) đến `end` (không bao gồm). Nếu `begin` hoặc `end` âm, nó tham chiếu đến chỉ số tính từ cuối mảng, thay vì từ đầu.
- {{jsxref("ArrayBuffer.prototype.transfer()")}}
  - : Tạo `ArrayBuffer` mới có cùng nội dung byte như bộ đệm này, sau đó tách rời bộ đệm này.
- {{jsxref("ArrayBuffer.prototype.transferToFixedLength()")}}
  - : Tạo `ArrayBuffer` không thể thay đổi kích thước mới có cùng nội dung byte như bộ đệm này, sau đó tách rời bộ đệm này.

## Ví dụ

### Tạo ArrayBuffer

Trong ví dụ này, chúng ta tạo bộ đệm 8 byte với khung nhìn {{jsxref("Int32Array")}} tham chiếu đến bộ đệm:

```js
const buffer = new ArrayBuffer(8);
const view = new Int32Array(buffer);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `ArrayBuffer` in `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [JavaScript typed arrays](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("SharedArrayBuffer")}}
- [RangeError: invalid array length](/en-US/docs/Web/JavaScript/Reference/Errors/Invalid_array_length)
