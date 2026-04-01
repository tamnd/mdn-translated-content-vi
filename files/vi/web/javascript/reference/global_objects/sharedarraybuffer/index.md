---
title: SharedArrayBuffer
slug: Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer
page-type: javascript-class
browser-compat: javascript.builtins.SharedArrayBuffer
sidebar: jsref
---

Đối tượng **`SharedArrayBuffer`** được dùng để biểu diễn bộ đệm dữ liệu nhị phân thô chung, tương tự như đối tượng {{jsxref("ArrayBuffer")}}, nhưng theo cách có thể được dùng để tạo khung nhìn trên bộ nhớ dùng chung. `SharedArrayBuffer` không phải là [đối tượng có thể chuyển giao](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects), không giống như `ArrayBuffer` là có thể chuyển giao.

## Mô tả

Để chia sẻ bộ nhớ sử dụng đối tượng `SharedArrayBuffer` từ một tác nhân trong cụm đến tác nhân khác (một tác nhân là chương trình chính của trang web hoặc một trong các web worker của nó), [`postMessage`](/en-US/docs/Web/API/Worker/postMessage) và [sao chép có cấu trúc](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm) được sử dụng.

Thuật toán sao chép có cấu trúc chấp nhận đối tượng `SharedArrayBuffer` và mảng được gõ kiểu được ánh xạ lên đối tượng `SharedArrayBuffer`. Trong cả hai trường hợp, đối tượng `SharedArrayBuffer` được truyền đến bộ nhận tạo ra đối tượng `SharedArrayBuffer` riêng tư mới trong tác nhân nhận (giống như đối với {{jsxref("ArrayBuffer")}}). Tuy nhiên, khối dữ liệu dùng chung được tham chiếu bởi hai đối tượng `SharedArrayBuffer` là cùng một khối dữ liệu, và tác dụng phụ lên khối trong một tác nhân cuối cùng sẽ hiển thị trong tác nhân kia.

```js
const sab = new SharedArrayBuffer(1024);
worker.postMessage(sab);
```

Bộ nhớ dùng chung có thể được tạo và cập nhật đồng thời trong các worker hoặc luồng chính. Tùy thuộc vào hệ thống (CPU, hệ điều hành, trình duyệt), có thể mất một lúc để thay đổi được lan truyền đến tất cả các ngữ cảnh. Để đồng bộ hóa, cần các thao tác {{jsxref("Atomics", "nguyên tử", "", 1)}}.

Đối tượng `SharedArrayBuffer` được sử dụng bởi một số API web, chẳng hạn như:

- [`WebGLRenderingContext.bufferData()`](/en-US/docs/Web/API/WebGLRenderingContext/bufferData)
- [`WebGLRenderingContext.bufferSubData()`](/en-US/docs/Web/API/WebGLRenderingContext/bufferSubData)
- [`WebGL2RenderingContext.getBufferSubData()`](/en-US/docs/Web/API/WebGL2RenderingContext/getBufferSubData)

### Yêu cầu bảo mật

Bộ nhớ dùng chung và bộ đếm thời gian độ phân giải cao đã bị [vô hiệu hóa vào đầu năm 2018](https://blog.mozilla.org/security/2018/01/03/mitigations-landing-new-class-timing-attack/) do lỗ hổng [Spectre](<https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)>). Năm 2020, một cách tiếp cận mới, an toàn đã được chuẩn hóa để bật lại bộ nhớ dùng chung.

Để sử dụng bộ nhớ dùng chung, tài liệu của bạn phải ở trong [ngữ cảnh an toàn](/en-US/docs/Web/Security/Defenses/Secure_Contexts) và {{domxref("Window.crossOriginIsolated","cách ly cross-origin","","nocode")}}. Bạn có thể sử dụng các thuộc tính {{domxref("Window.crossOriginIsolated")}} và {{domxref("WorkerGlobalScope.crossOriginIsolated")}} để kiểm tra xem tài liệu có được cách ly cross-origin hay không:

```js
const myWorker = new Worker("worker.js");

if (crossOriginIsolated) {
  const buffer = new SharedArrayBuffer(16);
  myWorker.postMessage(buffer);
} else {
  const buffer = new ArrayBuffer(16);
  myWorker.postMessage(buffer);
}
```

Khi được cách ly cross-origin, `postMessage()` không còn ném lỗi với đối tượng `SharedArrayBuffer`, và do đó bộ nhớ dùng chung giữa các luồng có sẵn.

### Tính khả dụng của API

Tùy thuộc vào việc các biện pháp bảo mật nêu trên được thực hiện hay không, các API chia sẻ bộ nhớ khác nhau có tính khả dụng khác nhau:

- Đối tượng `Atomics` luôn khả dụng.
- Đối tượng `SharedArrayBuffer` về nguyên tắc luôn khả dụng, nhưng thật không may, constructor trên đối tượng toàn cục bị ẩn, trừ khi hai header được đề cập ở trên được thiết lập, vì lý do tương thích với nội dung web. Có hy vọng rằng hạn chế này có thể được loại bỏ trong tương lai. [`WebAssembly.Memory`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory) vẫn có thể được sử dụng để lấy instance.
- Trừ khi hai header được đề cập ở trên được thiết lập, các API `postMessage()` khác nhau sẽ ném lỗi với đối tượng `SharedArrayBuffer`. Nếu chúng được thiết lập, `postMessage()` trên đối tượng `Window` và các worker chuyên dụng sẽ hoạt động và cho phép chia sẻ bộ nhớ.

### Bộ nhớ dùng chung WebAssembly

Đối tượng [`WebAssembly.Memory`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory) có thể được tạo với cờ constructor [`shared`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/Memory#shared). Khi cờ này được đặt thành `true`, đối tượng `Memory` được xây dựng có thể được chia sẻ giữa các worker thông qua `postMessage()`, giống như `SharedArrayBuffer`, và [`buffer`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/buffer) của đối tượng `Memory` là `SharedArrayBuffer`. Do đó, các yêu cầu được liệt kê ở trên để chia sẻ `SharedArrayBuffer` giữa các worker cũng áp dụng để chia sẻ `WebAssembly.Memory`.

Đề xuất Luồng WebAssembly cũng định nghĩa một tập hợp mới các lệnh [atomic](https://github.com/WebAssembly/threads/blob/main/proposals/threads/Overview.md#atomic-memory-accesses). Giống như `SharedArrayBuffer` và các phương thức của nó được bật vô điều kiện (và chỉ việc chia sẻ giữa các luồng bị kiểm soát bởi các header mới), các lệnh atomic WebAssembly cũng được phép vô điều kiện.

### Tăng trưởng SharedArrayBuffer

Đối tượng `SharedArrayBuffer` có thể được làm cho có thể tăng trưởng bằng cách bao gồm tùy chọn `maxByteLength` khi gọi constructor {{jsxref("SharedArrayBuffer/SharedArrayBuffer", "SharedArrayBuffer()")}}. Bạn có thể truy vấn xem `SharedArrayBuffer` có thể tăng trưởng và kích thước tối đa của nó là bao nhiêu bằng cách truy cập các thuộc tính {{jsxref("SharedArrayBuffer/growable", "growable")}} và {{jsxref("SharedArrayBuffer/maxByteLength", "maxByteLength")}} tương ứng. Bạn có thể gán kích thước mới cho `SharedArrayBuffer` có thể tăng trưởng bằng lệnh gọi {{jsxref("SharedArrayBuffer/grow", "grow()")}}. Các byte mới được khởi tạo bằng 0.

Các tính năng này làm cho việc tăng trưởng `SharedArrayBuffer` hiệu quả hơn — nếu không, bạn phải tạo bản sao của bộ đệm với kích thước mới. Nó cũng cung cấp cho JavaScript tính tương đương với WebAssembly trong vấn đề này (bộ nhớ tuyến tính Wasm có thể được thay đổi kích thước với [`WebAssembly.Memory.prototype.grow()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/grow)).

Vì lý do bảo mật, `SharedArrayBuffer` không thể giảm kích thước, chỉ có thể tăng.

## Constructor

- {{jsxref("SharedArrayBuffer/SharedArrayBuffer", "SharedArrayBuffer()")}}
  - : Tạo đối tượng `SharedArrayBuffer` mới.

## Thuộc tính tĩnh

- [`SharedArrayBuffer[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer/Symbol.species)
  - : Trả về constructor được sử dụng để xây dựng các giá trị trả về từ các phương thức `SharedArrayBuffer`.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `SharedArrayBuffer.prototype` và được chia sẻ bởi tất cả các instance `SharedArrayBuffer`.

- {{jsxref("SharedArrayBuffer.prototype.byteLength")}}
  - : Kích thước, tính bằng byte, của mảng. Được thiết lập khi mảng được xây dựng và chỉ có thể thay đổi bằng phương thức {{jsxref("SharedArrayBuffer.prototype.grow()")}} nếu `SharedArrayBuffer` có thể tăng trưởng.
- {{jsxref("Object/constructor", "SharedArrayBuffer.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `SharedArrayBuffer`, giá trị khởi tạo là constructor {{jsxref("SharedArrayBuffer/SharedArrayBuffer", "SharedArrayBuffer")}}.
- {{jsxref("SharedArrayBuffer.prototype.growable")}}
  - : Chỉ đọc. Trả về `true` nếu `SharedArrayBuffer` có thể tăng trưởng, hoặc `false` nếu không thể.
- {{jsxref("SharedArrayBuffer.prototype.maxByteLength")}}
  - : Độ dài tối đa chỉ đọc, tính bằng byte, mà `SharedArrayBuffer` có thể tăng trưởng đến. Được thiết lập khi mảng được xây dựng và không thể thay đổi.
- `SharedArrayBuffer.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"SharedArrayBuffer"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("SharedArrayBuffer.prototype.grow()")}}
  - : Tăng trưởng `SharedArrayBuffer` đến kích thước được chỉ định, tính bằng byte.
- {{jsxref("SharedArrayBuffer.prototype.slice()")}}
  - : Trả về `SharedArrayBuffer` mới có nội dung là bản sao các byte của `SharedArrayBuffer` này từ `begin` (bao gồm) đến `end` (không bao gồm). Nếu `begin` hoặc `end` âm, nó tham chiếu đến chỉ số tính từ cuối mảng, thay vì từ đầu.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi [yêu cầu bảo mật](#security_requirements) của nó được đáp ứng.

### Tạo SharedArrayBuffer mới

```js
const sab = new SharedArrayBuffer(1024);
```

### Cắt SharedArrayBuffer

```js
sab.slice(); // SharedArrayBuffer { byteLength: 1024 }
sab.slice(2); // SharedArrayBuffer { byteLength: 1022 }
sab.slice(-2); // SharedArrayBuffer { byteLength: 2 }
sab.slice(0, 1); // SharedArrayBuffer { byteLength: 1 }
```

### Sử dụng trong bộ đệm WebGL

```js
const canvas = document.querySelector("canvas");
const gl = canvas.getContext("webgl");
const buffer = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
gl.bufferData(gl.ARRAY_BUFFER, sab, gl.STATIC_DRAW);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Atomics")}}
- {{jsxref("ArrayBuffer")}}
- Hướng dẫn [JavaScript typed arrays](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- [Web Workers](/en-US/docs/Web/API/Web_Workers_API)
- [Shared Memory – a brief tutorial](https://github.com/tc39/proposal-ecmascript-sharedmem/blob/main/TUTORIAL.md) trong đề xuất TC39 ecmascript-sharedmem
- [A Taste of JavaScript's New Parallel Primitives](https://hacks.mozilla.org/2016/05/a-taste-of-javascripts-new-parallel-primitives/) trên hacks.mozilla.org (2016)
- [COOP and COEP explained](https://docs.google.com/document/d/1zDlfvfTJ_9e8Jdc8ehuV4zMEu9ySMCiTGMS9y0GU92k/edit) bởi nhóm Chrome (2020)
- {{HTTPHeader("Cross-Origin-Opener-Policy")}}
- {{HTTPHeader("Cross-Origin-Embedder-Policy")}}
- {{HTTPHeader("Cross-Origin-Resource-Policy")}}
- {{domxref("Window.crossOriginIsolated")}} và {{domxref("WorkerGlobalScope.crossOriginIsolated")}}
- [SharedArrayBuffer updates in Android Chrome 88 and Desktop Chrome 92](https://developer.chrome.com/blog/enabling-shared-array-buffer/) trên developer.chrome.com (2021)
