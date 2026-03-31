---
title: Uint8Array.prototype.setFromBase64()
short-title: setFromBase64()
slug: Web/JavaScript/Reference/Global_Objects/Uint8Array/setFromBase64
page-type: javascript-instance-method
browser-compat: javascript.builtins.Uint8Array.setFromBase64
sidebar: jsref
---

Phương thức **`setFromBase64()`** của các instance {{jsxref("Uint8Array")}} điền vào đối tượng `Uint8Array` này các byte từ một chuỗi được mã hóa [base64](/en-US/docs/Glossary/Base64), trả về một đối tượng cho biết có bao nhiêu byte đã được đọc và ghi.

Phương thức này phù hợp nhất để điền vào một array buffer đã được cấp phát trước. Nếu bạn chỉ muốn tạo một đối tượng `Uint8Array` mới từ một chuỗi mã hóa base64, hãy dùng phương thức tĩnh {{jsxref("Uint8Array.fromBase64()")}} thay thế.

## Cú pháp

```js-nolint
setFromBase64(string)
setFromBase64(string, options)
```

### Tham số

- `string`
  - : Một chuỗi base64 mã hóa các byte cần ghi vào `Uint8Array`. Có các yêu cầu giống như [tham số `string` của `Uint8Array.fromBase64()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/fromBase64#string). Lưu ý rằng chuỗi chỉ được đọc đến điểm mà mảng đã đầy, vì vậy bất kỳ cú pháp base64 không hợp lệ nào sau điểm đó đều bị bỏ qua.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chỉnh quá trình giải mã chuỗi base64. Có các yêu cầu giống như [tham số `options` của `Uint8Array.fromBase64()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/fromBase64#options).

### Giá trị trả về

Một đối tượng chứa các thuộc tính sau:

- `read`
  - : Số ký tự base64 đã đọc từ chuỗi đầu vào. Nếu dữ liệu đã giải mã vừa với mảng, đây là độ dài của chuỗi đầu vào (bao gồm phần đệm); ngược lại, đây là độ dài đến đoạn 4 ký tự hoàn chỉnh cuối cùng vừa với mảng. Các đoạn sẽ không bao giờ bị tách (vì các bit còn lại không thể được "đưa trở lại" một phần vào base64 mà không cần mã hóa lại hoàn toàn); nếu đoạn tiếp theo không vừa với phần còn lại của mảng, nó sẽ hoàn toàn không được đọc, dẫn đến một hoặc hai byte cuối của mảng không được ghi.
- `written`
  - : Số byte đã ghi vào `Uint8Array`. Sẽ không bao giờ lớn hơn {{jsxref("TypedArray/byteLength", "byteLength")}} của `Uint8Array` này.

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : Ném ra nếu chuỗi đầu vào chứa các ký tự ngoài bảng chữ cái được chỉ định, hoặc nếu đoạn cuối không thỏa mãn tùy chọn `lastChunkHandling`.
- {{jsxref("TypeError")}}
  - : Ném ra trong một trong các trường hợp sau:
    - Chuỗi đầu vào không phải là chuỗi.
    - Đối tượng `options` không phải là object hoặc `undefined`.
    - Các tùy chọn không có giá trị mong đợi hoặc `undefined`.

## Ví dụ

### Giải mã một chuỗi base64

Ví dụ này sử dụng các tùy chọn `alphabet` và `lastChunkHandling` mặc định để giải mã một chuỗi base64 vào một `Uint8Array` đã có.

```js
const uint8Array = new Uint8Array(16);
const result = uint8Array.setFromBase64("PGI+ TURO PC9i Pg==");
console.log(result); // { read: 19, written: 10 }
console.log(uint8Array);
// Uint8Array(16) [60, 98, 62, 77, 68, 78, 60, 47, 98, 62, 0, 0, 0, 0, 0, 0]
```

### Giải mã một chuỗi lớn vào một mảng nhỏ

Nếu chuỗi chứa nhiều dữ liệu hơn mảng có thể chứa, phương thức sẽ chỉ ghi số byte mà mảng có thể chứa, mà không loại bỏ bất kỳ bit nào.

```js
const uint8Array = new Uint8Array(8);
const result = uint8Array.setFromBase64("PGI+ TURO PC9i Pg==");
console.log(result); // { read: 9, written: 6 }
console.log(uint8Array);
// Uint8Array(8) [60, 98, 62, 77, 68, 78, 0, 0]
```

Lưu ý rằng hai byte cuối của mảng không được ghi. Để giải mã hai byte này, chúng ta cần đọc ít nhất ba ký tự base64 nữa, đại diện cho 18 bit. Chúng không thể vừa với hai byte còn lại của mảng, vì vậy chúng ta chỉ có thể ghi 2 đoạn, hay 6 byte.

### Đặt dữ liệu tại một offset cụ thể

Phương thức `setFromBase64()` luôn bắt đầu ghi từ đầu `Uint8Array`. Nếu bạn muốn ghi vào giữa mảng, bạn có thể ghi vào một {{jsxref("TypedArray.prototype.subarray()")}} thay thế.

```js
const uint8Array = new Uint8Array(16);
// Bắt đầu ghi tại offset 2
const result = uint8Array.subarray(2).setFromBase64("PGI+ TURO PC9i Pg==");
console.log(result); // { read: 19, written: 10 }
console.log(uint8Array);
// Uint8Array(16) [0, 0, 60, 98, 62, 77, 68, 78, 60, 47, 98, 62, 0, 0, 0, 0]
```

### Giải mã luồng

Ví dụ này được chuyển thể từ [đề xuất gốc](https://github.com/tc39/proposal-arraybuffer-base64/blob/main/stream.mjs). Nó mô phỏng API {{domxref("TextDecoder")}} với tùy chọn `stream`. Lưu ý cách dùng `lastChunkHandling: "stop-before-partial"` để xử lý các đoạn chưa hoàn chỉnh.

```js
class Base64Decoder {
  #extra = "";

  decode(chunk = "", options = {}) {
    const opts = { ...options };
    // match TextEncoder API
    if (opts.stream) {
      opts.lastChunkHandling = "stop-before-partial";
    }
    chunk = this.#extra + chunk;
    this.#extra = "";
    // For simplicity, allocate new memory every time
    // the calculation below is guaranteed to be enough,
    // but may be too much if there is whitespace
    // if you're really concerned about memory, a TextDecoder style API is a bad choice
    let buffer = new Uint8Array(Math.ceil((chunk.length * 3) / 4));
    const { read, written } = buffer.setFromBase64(chunk, opts);
    buffer = buffer.subarray(0, written);
    this.#extra = chunk.slice(read);
    return buffer;
  }
}

const decoder = new Base64Decoder();

console.log(decoder.decode("SG Vsb ", { stream: true }));
// Uint8Array(3) [72, 101, 108]
console.log(decoder.decode("G8gV29ybGR ", { stream: true }));
// Uint8Array(6) [108, 111, 32, 87, 111, 114]
console.log(decoder.decode(""));
// Uint8Array(2) [108, 100]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint8Array.prototype.setFromBase64` trong `core-js`](https://github.com/zloirock/core-js#uint8array-to--from-base64-and-hex)
- [es-shims polyfill của `Uint8Array.prototype.setFromBase64`](https://www.npmjs.com/package/es-arraybuffer-base64)
- {{jsxref("Uint8Array")}}
- {{jsxref("Uint8Array.fromBase64()")}}
- {{jsxref("Uint8Array.prototype.toBase64()")}}
- {{domxref("Window.atob()")}}
