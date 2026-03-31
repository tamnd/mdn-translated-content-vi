---
title: Atomics.notify()
short-title: notify()
slug: Web/JavaScript/Reference/Global_Objects/Atomics/notify
page-type: javascript-static-method
browser-compat: javascript.builtins.Atomics.notify
sidebar: jsref
---

Phương thức tĩnh **`Atomics.notify()`** thông báo cho một số tác nhân đang ngủ trong hàng đợi chờ.

> [!NOTE]
> Thao tác này chỉ hoạt động với {{jsxref("Int32Array")}} hoặc {{jsxref("BigInt64Array")}} xem một {{jsxref("SharedArrayBuffer")}}.
> Nó sẽ trả về `0` trên các đối tượng `ArrayBuffer` không chia sẻ.

## Cú pháp

```js-nolint
Atomics.notify(typedArray, index, count)
```

### Tham số

- `typedArray`
  - : Một {{jsxref("Int32Array")}} hoặc {{jsxref("BigInt64Array")}} xem một {{jsxref("SharedArrayBuffer")}}.
- `index`
  - : Vị trí trong `typedArray` để đánh thức.
- `count` {{optional_inline}}
  - : Số tác nhân đang ngủ cần thông báo. Mặc định là {{jsxref("Infinity")}}.

### Giá trị trả về

Trả về số tác nhân đã được đánh thức, hoặc `0` nếu `typedArray` là view trên một {{jsxref("ArrayBuffer")}} không chia sẻ.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `typedArray` không phải là {{jsxref("Int32Array")}} hoặc {{jsxref("BigInt64Array")}}.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `index` nằm ngoài giới hạn trong `typedArray`.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng Atomics.notify()

Cho một `Int32Array` được chia sẻ:

```js
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
- {{jsxref("Atomics.wait()")}}
- {{jsxref("Atomics.waitAsync()")}}
