---
title: Atomics.waitAsync()
short-title: waitAsync()
slug: Web/JavaScript/Reference/Global_Objects/Atomics/waitAsync
page-type: javascript-static-method
browser-compat: javascript.builtins.Atomics.waitAsync
sidebar: jsref
---

Phương thức tĩnh **`Atomics.waitAsync()`** xác minh rằng một vị trí bộ nhớ chia sẻ chứa một giá trị đã cho, trả về ngay lập tức một đối tượng với thuộc tính `value` chứa chuỗi `"not-equal"` nếu vị trí bộ nhớ không khớp với giá trị đã cho, hoặc `"timed-out"` nếu thời gian chờ được đặt thành 0. Ngược lại phương thức trả về một đối tượng trong đó thuộc tính `value` là một {{jsxref("Promise")}} được thực hiện với `"ok"` khi {{jsxref("Atomics.notify()")}} được gọi, hoặc `"timed-out"` nếu hết thời gian chờ.

`Atomics.waitAsync()` và {{jsxref("Atomics.notify()")}} được sử dụng cùng nhau để cho phép đồng bộ hóa luồng dựa trên một giá trị trong bộ nhớ chia sẻ. Một luồng có thể tiến lên ngay lập tức nếu giá trị đồng bộ hóa đã thay đổi, hoặc nó có thể chờ thông báo từ một luồng khác khi đến điểm đồng bộ hóa.

Phương thức này chỉ hoạt động với {{jsxref("Int32Array")}} hoặc {{jsxref("BigInt64Array")}} xem một {{jsxref("SharedArrayBuffer")}}. Nó không chặn và, không giống {{jsxref("Atomics.wait()")}}, có thể được sử dụng trên luồng chính. Vì nó không chặn toàn bộ luồng, bạn vẫn cần cẩn thận không truy cập bộ nhớ chia sẻ trước khi promise được giải quyết.

## Cú pháp

```js-nolint
Atomics.waitAsync(typedArray, index, value)
Atomics.waitAsync(typedArray, index, value, timeout)
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

Một {{jsxref("Object")}} với các thuộc tính sau:

- `async`
  - : Một boolean chỉ ra liệu thuộc tính `value` có phải là {{jsxref("Promise")}} hay không.
- `value`
  - : Nếu `async` là `false`, nó sẽ là một chuỗi là `"not-equal"` hoặc `"timed-out"` (chỉ khi tham số `timeout` là `0`). Nếu `async` là `true`, nó sẽ là một {{jsxref("Promise")}} được thực hiện với giá trị chuỗi, hoặc `"ok"` hoặc `"timed-out"`. Promise không bao giờ bị từ chối.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `typedArray` không phải là {{jsxref("Int32Array")}} hoặc {{jsxref("BigInt64Array")}} xem một {{jsxref("SharedArrayBuffer")}}.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `index` nằm ngoài giới hạn trong `typedArray`.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng Atomics.waitAsync()

Cho một `Int32Array` được chia sẻ:

```js
// Create a SharedArrayBuffer with a size in bytes
const sab = new SharedArrayBuffer(1024);
const int32 = new Int32Array(sab);
```

Luồng đọc đang ngủ và chờ tại vị trí 0 mà giá trị kỳ vọng là 0.
`result.value` sẽ là một promise.

```js
const result = Atomics.waitAsync(int32, 0, 0, 1000);
// { async: true, value: Promise {<pending>} }
```

Trong luồng đọc hoặc trong một luồng khác, vị trí bộ nhớ 0 được gọi và promise có thể được giải quyết với `"ok"`.

```js
Atomics.notify(int32, 0);
// { async: true, value: Promise {<fulfilled>: 'ok'} }
```

Nếu nó không giải quyết thành `"ok"`, giá trị trong vị trí bộ nhớ chia sẻ không phải là giá trị kỳ vọng (`value` sẽ là `"not-equal"` thay vì một promise) hoặc thời gian chờ đã đến (promise sẽ giải quyết thành `"timed-out"`).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Atomics")}}
- {{jsxref("Atomics.wait()")}}
- {{jsxref("Atomics.notify()")}}
