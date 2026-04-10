---
title: Transferable objects
slug: Web/API/Web_Workers_API/Transferable_objects
page-type: guide
---

{{DefaultAPISidebar("Web Workers API")}}

**Transferable objects** là các đối tượng sở hữu các tài nguyên có thể được _chuyển_ từ một ngữ cảnh sang ngữ cảnh khác, đảm bảo rằng các tài nguyên chỉ khả dụng trong một ngữ cảnh tại một thời điểm.
Sau khi chuyển, đối tượng ban đầu không còn khả dụng; nó không còn trỏ tới tài nguyên đã chuyển, và bất kỳ cố gắng đọc hoặc ghi đối tượng nào sẽ ném ra một ngoại lệ.

_Transferable objects_ thường được sử dụng để chia sẻ các tài nguyên chỉ có thể được expon an toàn cho một JavaScript thread tại một thời điểm.
Ví dụ: một {{jsxref("ArrayBuffer")}} là một transferable object sở hữu một khối bộ nhớ.
Khi một buffer như vậy được chuyển giữa các threads, tài nguyên bộ nhớ liên quan được tách ra khỏi buffer ban đầu và gắn vào đối tượng buffer được tạo trong thread mới.
Đối tượng buffer trong thread ban đầu không còn khả dụng vì nó không còn sở hữu tài nguyên bộ nhớ.

Việc chuyển cũng có thể được sử dụng khi tạo các bản sao sâu của các đối tượng với {{DOMxRef("WorkerGlobalScope.structuredClone", "structuredClone()")}}.
Sau hoạt động sao chép, các tài nguyên được chuyển được di chuyển thay vì sao chép sang đối tượng được sao chép.

Cho cả `postMessage()` và `structuredClone()`, các tài nguyên được chuyển phải được gắn vào đối tượng dữ liệu, nếu không chúng sẽ không khả dụng ở đầu nhận, vì mảng transferable chỉ chỉ định cách một số tài nguyên nhất định nên được gửi, nhưng thực sự không gửi chúng (mặc dù chúng sẽ luôn được tách ra).

Cơ chế được sử dụng để chuyển tài nguyên của một đối tượng phụ thuộc vào đối tượng.
Ví dụ: khi một {{jsxref("ArrayBuffer")}} được chuyển giữa các threads, tài nguyên bộ nhớ mà nó trỏ tới được _theo nghĩa đen_ di chuyển giữa các ngữ cảnh trong một hoạt động zero-copy nhanh chóng và hiệu quả.
Các đối tượng khác có thể được chuyển bằng cách sao chép tài nguyên liên quan và sau đó xóa nó khỏi ngữ cảnh cũ.

Không phải tất cả các đối tượng đều có thể chuyển được.
Một danh sách các đối tượng có thể chuyển được [cung cấp bên dưới](#supported_objects).

## Chuyển các đối tượng giữa các threads

Đoạn mã dưới đây minh họa cách việc chuyển hoạt động khi gửi một thông điệp từ một main thread tới một {{domxref("Web Workers API", "web worker thread","","true")}}.
{{jsxref("Uint8Array")}} được sao chép (nhân bản) trong worker trong khi buffer của nó được chuyển.
Sau khi chuyển, bất kỳ cố gắng đọc hoặc ghi `uInt8Array` từ main thread nào sẽ ném ra, nhưng bạn vẫn có thể kiểm tra `byteLength` để xác nhận nó bây giờ là không.

```js
// Tạo một "tệp" 8MB và điền vào. 8MB = 1024 * 1024 * 8 B
const uInt8Array = new Uint8Array(1024 * 1024 * 8).map((v, i) => i);
console.log(uInt8Array.byteLength); // 8388608

// Chuyển buffer cơ bản tới một worker
worker.postMessage(uInt8Array, [uInt8Array.buffer]);
console.log(uInt8Array.byteLength); // 0
```

> [!NOTE]
> [Typed arrays](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray) như {{jsxref("Int32Array")}} và {{jsxref("Uint8Array")}}, là {{Glossary("serializable object","serializable")}}, nhưng không phải transferable.
> Tuy nhiên, buffer cơ bản của chúng là một {{jsxref("ArrayBuffer")}}, là một transferable object.
> Chúng ta có thể đã gửi `uInt8Array.buffer` trong tham số data, nhưng không phải `uInt8Array` trong mảng transfer.

## Chuyển trong quá trình sao chép

Đoạn mã dưới đây hiển thị một hoạt động `structuredClone()` trong đó buffer cơ bản được sao chép từ đối tượng ban đầu sang bản sao.

```js
const original = new Uint8Array(1024);
const clone = structuredClone(original);
console.log(original.byteLength); // 1024
console.log(clone.byteLength); // 1024

original[0] = 1;
console.log(clone[0]); // 0

// Chuyển Uint8Array sẽ ném ra một ngoại lệ vì nó không phải là một đối tượng transferable
// const transferred = structuredClone(original, {transfer: [original]});

// Chúng ta có thể chuyển Uint8Array.buffer.
const transferred = structuredClone(original, { transfer: [original.buffer] });
console.log(transferred.byteLength); // 1024
console.log(transferred[0]); // 1

// Sau khi chuyển Uint8Array.buffer không thể được sử dụng.
console.log(original.byteLength); // 0
```

## Các đối tượng được hỗ trợ

Các giao diện có thể được chuyển nên bao gồm thông tin này trong phần giới thiệu của chúng.

Một số mục mà các đặc tả kỹ thuật chỉ định có thể được _chuyển_ được liệt kê bên dưới (danh sách này có thể không đầy đủ!):

- {{jsxref("ArrayBuffer")}}
- {{domxref("AudioData")}}
- {{domxref("ImageBitmap")}}
- {{domxref("MediaSourceHandle")}}
- {{domxref("MediaStreamTrack")}}
- {{domxref("MessagePort")}}
- {{domxref("MIDIAccess")}}
- {{domxref("OffscreenCanvas")}}
- {{domxref("ReadableStream")}}
- {{domxref("RTCDataChannel")}}
- {{domxref("TransformStream")}}
- {{domxref("VideoFrame")}}
- {{domxref("WebTransportReceiveStream")}}
- {{domxref("WebTransportSendStream")}}
- {{domxref("WritableStream")}}

> [!NOTE]
> Các transferable objects được đánh dấu trong [các tệp Web IDL](https://github.com/w3c/webref/tree/main/ed/idl) với thuộc tính `[Transferable]`.
> Hỗ trợ trình duyệt có thể được chỉ định trong thông tin tương thích của đối tượng tương ứng bằng subfeature `transferable` (xem [`RTCDataChannel`](/en-US/docs/Web/API/RTCDataChannel#browser_compatibility) để biết ví dụ).

## Xem thêm

- [Transferable Objects: Lightning Fast!](https://developer.chrome.com/blog/transferable-objects-lightning-fast/)
- [Sử dụng Web Workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
- [Transferable objects trong đặc tả HTML](https://html.spec.whatwg.org/multipage/structured-data.html#transferable-objects)
- {{domxref("DedicatedWorkerGlobalScope.postMessage()")}}
