---
title: Atomics.wait()
short-title: wait()
slug: Web/JavaScript/Reference/Global_Objects/Atomics/wait
page-type: javascript-static-method
browser-compat: javascript.builtins.Atomics.wait
sidebar: jsref
---

Phương thức tĩnh **`Atomics.wait()`** xác minh rằng một vị trí bộ nhớ chia sẻ chứa một giá trị đã cho và nếu vậy thì ngủ, chờ thông báo đánh thức hoặc hết thời gian chờ. Nó trả về một chuỗi là `"not-equal"` nếu vị trí bộ nhớ không khớp với giá trị đã cho, `"ok"` nếu được đánh thức bởi {{jsxref("Atomics.notify()")}}, hoặc `"timed-out"` nếu hết thời gian chờ.

`Atomics.wait()` và {{jsxref("Atomics.notify()")}} được sử dụng cùng nhau để cho phép đồng bộ hóa luồng dựa trên một giá trị trong bộ nhớ chia sẻ. Một luồng có thể tiến lên ngay lập tức nếu giá trị đồng bộ hóa đã thay đổi, hoặc nó có thể chờ thông báo từ một luồng khác khi đến điểm đồng bộ hóa.

Phương thức này chỉ hoạt động với {{jsxref("Int32Array")}} hoặc {{jsxref("BigInt64Array")}} xem một {{jsxref("SharedArrayBuffer")}}. Nó chặn và không thể được sử dụng trong luồng chính. Để có phiên bản không chặn, bất đồng bộ của phương thức này, hãy xem {{jsxref("Atomics.waitAsync()")}}.

## Cú pháp

```js-nolint
Atomics.wait(typedArray, index, value)
Atomics.wait(typedArray, index, value, timeout)
```

### Tham số

- `typedArray`
  - : Một {{jsxref("Int32Array")}} hoặc {{jsxref("BigInt64Array")}} xem một {{jsxref("SharedArrayBuffer")}}.
- `index`
  - : Vị trí trong `typedArray` để chờ.
- `value`
  - : Giá trị kỳ vọng cần kiểm tra.
- `timeout` {{optional_inline}}
  - : Thời gian chờ tính bằng mili giây. {{jsxref("NaN")}} (và các giá trị được chuyển đổi thành `NaN`, chẳng hạn như `undefined`) trở thành {{jsxref("Infinity")}}. Các giá trị âm trở thành `0`.

### Giá trị trả về

Một chuỗi là `"not-equal"`, `"ok"`, hoặc `"timed-out"`.

- `"not-equal"` được trả về ngay lập tức nếu `value` ban đầu không bằng với những gì được lưu tại `index`.
- `"ok"` được trả về nếu được đánh thức bởi lời gọi `Atomics.notify()`, **bất kể liệu giá trị kỳ vọng có thay đổi hay không**.
- `"timed-out"` được trả về nếu một lần chờ ngủ vượt quá `timeout` được chỉ định mà không được đánh thức bởi `Atomics.notify()`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Nếu `typedArray` không phải là {{jsxref("Int32Array")}} hoặc {{jsxref("BigInt64Array")}} xem một {{jsxref("SharedArrayBuffer")}}.
    - Nếu luồng hiện tại không thể bị chặn (ví dụ, vì nó là luồng chính).
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `index` nằm ngoài giới hạn trong `typedArray`.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng Atomics.wait()

Cho một `Int32Array` được chia sẻ:

```js
// Create a SharedArrayBuffer with a size in bytes
const sab = new SharedArrayBuffer(1024);
const int32 = new Int32Array(sab);
```

Luồng đọc đang ngủ và chờ tại vị trí 0 vì `value` được cung cấp khớp với những gì được lưu tại `index` được cung cấp.
Luồng đọc sẽ không tiến lên cho đến khi luồng ghi đã gọi `Atomics.notify()` tại vị trí 0 của `typedArray` được cung cấp.
Lưu ý rằng nếu, sau khi được đánh thức, giá trị tại vị trí 0 không được thay đổi bởi luồng ghi, luồng đọc sẽ **không** quay lại ngủ, mà sẽ tiếp tục.

```js
Atomics.wait(int32, 0, 0);
console.log(int32[0]); // 123
```

Luồng ghi lưu một giá trị mới và thông báo cho luồng đang chờ một khi đã ghi:

```js
console.log(int32[0]); // 0;
Atomics.store(int32, 0, 123);
Atomics.notify(int32, 0, 1);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Atomics")}}
- {{jsxref("Atomics.waitAsync()")}}
- {{jsxref("Atomics.notify()")}}
