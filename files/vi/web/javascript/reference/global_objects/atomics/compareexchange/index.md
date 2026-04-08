---
title: Atomics.compareExchange()
short-title: compareExchange()
slug: Web/JavaScript/Reference/Global_Objects/Atomics/compareExchange
page-type: javascript-static-method
browser-compat: javascript.builtins.Atomics.compareExchange
sidebar: jsref
---

Phương thức tĩnh **`Atomics.compareExchange()`** trao đổi một giá trị thay thế đã cho tại một vị trí đã cho trong mảng, nếu một giá trị kỳ vọng đã cho bằng với giá trị cũ. Nó trả về giá trị cũ tại vị trí đó dù nó có bằng với giá trị kỳ vọng hay không. Thao tác nguyên tử này đảm bảo rằng không có lần ghi nào khác xảy ra cho đến khi giá trị đã sửa đổi được ghi lại.

## Cú pháp

```js-nolint
Atomics.compareExchange(typedArray, index, expectedValue, replacementValue)
```

### Tham số

- `typedArray`
  - : Một mảng được gõ kiểu số nguyên. Một trong {{jsxref("Int8Array")}}, {{jsxref("Uint8Array")}}, {{jsxref("Int16Array")}}, {{jsxref("Uint16Array")}}, {{jsxref("Int32Array")}}, {{jsxref("Uint32Array")}}, {{jsxref("BigInt64Array")}}, hoặc {{jsxref("BigUint64Array")}}.
- `index`
  - : Vị trí trong `typedArray` để trao đổi `replacementValue`.
- `expectedValue`
  - : Giá trị cần kiểm tra sự bằng nhau.
- `replacementValue`
  - : Số cần trao đổi.

### Giá trị trả về

Giá trị cũ tại vị trí đã cho (`typedArray[index]`). Nếu giá trị trả về bằng với `expectedValue`, thì việc trao đổi thành công; ngược lại, trao đổi thất bại.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `typedArray` không phải là một trong các kiểu số nguyên được cho phép.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `index` nằm ngoài giới hạn trong `typedArray`.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng Atomics.compareExchange()

```js
// Create a SharedArrayBuffer with a size in bytes
const sab = new SharedArrayBuffer(1024);
// Create a view and set the value of the 0 index
const ta = new Uint8Array(sab);
ta[0] = 7;

console.log(Atomics.compareExchange(ta, 0, 7, 12)); // 7, the old value
console.log(Atomics.load(ta, 0)); // 12, the new/current value
```

### Kiểm tra giá trị trả về

[Compare-and-swap](https://en.wikipedia.org/wiki/Compare-and-swap) đảm bảo rằng giá trị mới được tính toán dựa trên thông tin cập nhật; nếu giá trị đã được cập nhật bởi một luồng khác trong thời gian đó, việc ghi sẽ thất bại. Do đó, bạn nên kiểm tra giá trị trả về của `compareExchange()` để xem liệu nó có thất bại hay không, và thử lại nếu cần thiết.

Đây là một ví dụ về một bộ cộng nguyên tử (cùng chức năng như {{jsxref("Atomics.add()")}}), được điều chỉnh từ bài viết Wikipedia được liên kết:

```js
function add(mem, index, a) {
  let done = false;
  while (!done) {
    const value = Atomics.load(mem, index);
    done = Atomics.compareExchange(mem, index, value, value + a) === value;
  }
  return value + a;
}
```

Đầu tiên nó đọc giá trị tại chỉ số đã cho, sau đó cố gắng cập nhật nó với giá trị mới. Nó tiếp tục thử lại cho đến khi cập nhật thành công.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Atomics")}}
- {{jsxref("Atomics.exchange()")}}
