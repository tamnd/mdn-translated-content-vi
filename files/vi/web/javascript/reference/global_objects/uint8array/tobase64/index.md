---
title: Uint8Array.prototype.toBase64()
short-title: toBase64()
slug: Web/JavaScript/Reference/Global_Objects/Uint8Array/toBase64
page-type: javascript-instance-method
browser-compat: javascript.builtins.Uint8Array.toBase64
sidebar: jsref
---

Phương thức **`toBase64()`** của các instance {{jsxref("Uint8Array")}} trả về một chuỗi được mã hóa [base64](/en-US/docs/Glossary/Base64) dựa trên dữ liệu trong đối tượng `Uint8Array` này.

Nên ưu tiên dùng phương thức này thay vì {{domxref("Window.btoa()")}}, đặc biệt khi bạn đã có một `Uint8Array` chứa đối tượng, vì bạn không cần chuyển đổi nó thành chuỗi trước.

## Cú pháp

```js-nolint
toBase64()
toBase64(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chỉnh định dạng chuỗi base64. Có thể chứa các thuộc tính sau:
    - `alphabet` {{optional_inline}}
      - : Một chuỗi chỉ định bảng chữ cái base64 sử dụng. Có thể là một trong các giá trị sau:
        - `"base64"` (mặc định)
          - : Mã hóa đầu vào bằng bảng chữ cái base64 tiêu chuẩn, sử dụng `+` và `/`.
        - `"base64url"`
          - : Mã hóa đầu vào bằng bảng chữ cái base64 an toàn cho URL, sử dụng `-` và `_`.
    - `omitPadding` {{optional_inline}}
      - : Một boolean chỉ định có bỏ qua các ký tự đệm (`=`) ở cuối chuỗi base64 hay không. Mặc định là `false`.

### Giá trị trả về

Một chuỗi mã hóa base64 đại diện cho dữ liệu trong `Uint8Array`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra trong một trong các trường hợp sau:
    - Đối tượng `options` không phải là object hoặc `undefined`.
    - `options.alphabet` không có giá trị mong đợi hoặc `undefined`.

## Ví dụ

### Mã hóa dữ liệu nhị phân

Ví dụ này sử dụng các tùy chọn `alphabet` và `omitPadding` mặc định để mã hóa dữ liệu từ `Uint8Array` thành chuỗi base64.

```js
const uint8Array = new Uint8Array([29, 233, 101, 161]);
console.log(uint8Array.toBase64()); // "HelloQ=="
```

### Mã hóa dữ liệu không có phần đệm

```js
const uint8Array = new Uint8Array([29, 233, 101, 161]);
console.log(uint8Array.toBase64({ omitPadding: true })); // "HelloQ"
```

### Mã hóa dữ liệu với bảng chữ cái an toàn cho URL

Ví dụ này điền vào một đối tượng {{domxref("URLSearchParams")}} một chuỗi mã hóa base64 dùng bảng chữ cái an toàn cho URL.

```js
const uint8Array = new Uint8Array([46, 139, 222, 255, 42, 46]);
const base64 = uint8Array.toBase64({ alphabet: "base64url" });
const params = new URLSearchParams();
params.set("data", base64);
console.log(params.toString()); // "data=Love_you"
```

### Mã hóa luồng

Ví dụ này được chuyển thể từ [đề xuất gốc](https://github.com/tc39/proposal-arraybuffer-base64/blob/main/stream.mjs), trình bày cách triển khai streaming trong userland. Nó mô phỏng API {{domxref("TextEncoder")}} với tùy chọn `stream`.

```js
class Base64Encoder {
  #extra;
  #extraLength;
  constructor() {
    this.#extra = new Uint8Array(3);
    this.#extraLength = 0;
  }

  // Partly derived from https://github.com/lucacasonato/base64_streams/blob/main/src/iterator/encoder.ts
  encode(chunk = Uint8Array.of(), options = {}) {
    const stream = options.stream ?? false;

    if (this.#extraLength > 0) {
      const bytesNeeded = 3 - this.#extraLength;
      const bytesAvailable = Math.min(bytesNeeded, chunk.length);
      this.#extra.set(chunk.subarray(0, bytesAvailable), this.#extraLength);
      chunk = chunk.subarray(bytesAvailable);
      this.#extraLength += bytesAvailable;
    }

    if (!stream) {
      // assert: this.#extraLength.length === 0 || this.#extraLength === 3 || chunk.length === 0
      const prefix = this.#extra.subarray(0, this.#extraLength).toBase64();
      this.#extraLength = 0;
      return prefix + chunk.toBase64();
    }

    let extraReturn = "";

    if (this.#extraLength === 3) {
      extraReturn = this.#extra.toBase64();
      this.#extraLength = 0;
    }

    const remainder = chunk.length % 3;
    if (remainder > 0) {
      this.#extra.set(chunk.subarray(chunk.length - remainder));
      this.#extraLength = remainder;
      chunk = chunk.subarray(0, chunk.length - remainder);
    }

    return extraReturn + chunk.toBase64();
  }
}

const encoder = new Base64Encoder();

console.log(
  encoder.encode(Uint8Array.of(72, 101, 108, 108, 111), { stream: true }),
);
// "SGVs"
console.log(
  encoder.encode(Uint8Array.of(32, 87, 111, 114, 108, 100), { stream: true }),
);
// "bG8gV29y"
console.log(encoder.encode());
// "bGQ="
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint8Array.prototype.toBase64` trong `core-js`](https://github.com/zloirock/core-js#uint8array-to--from-base64-and-hex)
- [es-shims polyfill của `Uint8Array.prototype.toBase64`](https://www.npmjs.com/package/es-arraybuffer-base64)
- {{jsxref("Uint8Array")}}
- {{jsxref("Uint8Array.fromBase64()")}}
- {{jsxref("Uint8Array.prototype.setFromBase64()")}}
- {{domxref("Window.btoa()")}}
