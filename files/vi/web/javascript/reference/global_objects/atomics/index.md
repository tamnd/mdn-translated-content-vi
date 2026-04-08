---
title: Atomics
slug: Web/JavaScript/Reference/Global_Objects/Atomics
page-type: javascript-namespace
browser-compat: javascript.builtins.Atomics
sidebar: jsref
---

Đối tượng không gian tên **`Atomics`** chứa các phương thức tĩnh để thực hiện các thao tác nguyên tử. Chúng được dùng với các đối tượng {{jsxref("SharedArrayBuffer")}} và {{jsxref("ArrayBuffer")}}.

## Mô tả

Không giống hầu hết các đối tượng toàn cục, `Atomics` không phải là constructor. Bạn không thể sử dụng nó với [toán tử `new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) hay gọi đối tượng `Atomics` như một hàm. Tất cả thuộc tính và phương thức của `Atomics` đều là tĩnh (giống như đối tượng {{jsxref("Math")}}).

### Thao tác nguyên tử

Khi bộ nhớ được chia sẻ, nhiều luồng có thể đọc và ghi cùng một dữ liệu trong bộ nhớ. Các thao tác nguyên tử đảm bảo rằng các giá trị có thể đoán trước được ghi và đọc, rằng các thao tác hoàn thành trước khi thao tác tiếp theo bắt đầu và rằng các thao tác không bị gián đoạn.

### Chờ và thông báo

Các phương thức `wait()` và `notify()` được mô phỏng theo Linux futex ("mutex không gian người dùng nhanh") và cung cấp các cách để chờ cho đến khi một điều kiện nhất định trở thành đúng và thường được sử dụng như các cấu trúc chặn.

## Thuộc tính tĩnh

- `Atomics[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Atomics"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức tĩnh

- {{jsxref("Atomics.add()")}}
  - : Thêm giá trị được cung cấp vào giá trị hiện có tại chỉ số được chỉ định của mảng. Trả về giá trị cũ tại chỉ số đó.
- {{jsxref("Atomics.and()")}}
  - : Tính AND theo bit trên giá trị tại chỉ số được chỉ định của mảng với giá trị được cung cấp. Trả về giá trị cũ tại chỉ số đó.
- {{jsxref("Atomics.compareExchange()")}}
  - : Lưu một giá trị tại chỉ số được chỉ định của mảng, nếu nó bằng một giá trị. Trả về giá trị cũ.
- {{jsxref("Atomics.exchange()")}}
  - : Lưu một giá trị tại chỉ số được chỉ định của mảng. Trả về giá trị cũ.
- {{jsxref("Atomics.isLockFree()")}}
  - : Một nguyên hàm tối ưu hóa có thể được sử dụng để xác định có nên sử dụng khóa hay thao tác nguyên tử hay không. Trả về `true` nếu thao tác nguyên tử trên mảng với kích thước phần tử đã cho sẽ được triển khai bằng thao tác nguyên tử phần cứng (thay vì khóa). Chỉ dành cho chuyên gia.
- {{jsxref("Atomics.load()")}}
  - : Trả về giá trị tại chỉ số được chỉ định của mảng.
- {{jsxref("Atomics.notify()")}}
  - : Thông báo cho các tác nhân đang chờ tại chỉ số được chỉ định của mảng. Trả về số lượng tác nhân đã được thông báo.
- {{jsxref("Atomics.or()")}}
  - : Tính OR theo bit trên giá trị tại chỉ số được chỉ định của mảng với giá trị được cung cấp. Trả về giá trị cũ tại chỉ số đó.
- {{jsxref("Atomics.pause()")}}
  - : Cung cấp nguyên hàm micro-wait gợi ý cho CPU rằng người gọi đang quay vòng trong khi chờ truy cập vào tài nguyên dùng chung. Điều này cho phép hệ thống giảm tài nguyên được phân bổ cho lõi (chẳng hạn như điện) hoặc luồng, mà không nhường luồng hiện tại.
- {{jsxref("Atomics.store()")}}
  - : Lưu một giá trị tại chỉ số được chỉ định của mảng. Trả về giá trị.
- {{jsxref("Atomics.sub()")}}
  - : Trừ một giá trị tại chỉ số được chỉ định của mảng. Trả về giá trị cũ tại chỉ số đó.
- {{jsxref("Atomics.wait()")}}
  - : Xác minh rằng chỉ số được chỉ định của mảng vẫn chứa một giá trị và ngủ chờ hoặc hết thời gian. Trả về `"ok"`, `"not-equal"`, hoặc `"timed-out"`. Nếu việc chờ không được phép trong tác nhân đang gọi thì sẽ ném ra ngoại lệ. (Hầu hết các trình duyệt sẽ không cho phép `wait()` trên luồng chính của trình duyệt.)
- {{jsxref("Atomics.waitAsync()")}}
  - : Chờ không đồng bộ (tức là không chặn, khác với `Atomics.wait`) trên một vị trí bộ nhớ dùng chung và trả về đối tượng biểu diễn kết quả của thao tác.
- {{jsxref("Atomics.xor()")}}
  - : Tính XOR theo bit trên giá trị tại chỉ số được chỉ định của mảng với giá trị được cung cấp. Trả về giá trị cũ tại chỉ số đó.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng Atomics

```js
const sab = new SharedArrayBuffer(1024);
const ta = new Uint8Array(sab);

ta[0]; // 0
ta[0] = 5; // 5

Atomics.add(ta, 0, 12); // 5
Atomics.load(ta, 0); // 17

Atomics.and(ta, 0, 1); // 17
Atomics.load(ta, 0); // 1

Atomics.compareExchange(ta, 0, 5, 12); // 1
Atomics.load(ta, 0); // 1

Atomics.exchange(ta, 0, 12); // 1
Atomics.load(ta, 0); // 12

Atomics.isLockFree(1); // true
Atomics.isLockFree(2); // true
Atomics.isLockFree(3); // false
Atomics.isLockFree(4); // true

Atomics.or(ta, 0, 1); // 12
Atomics.load(ta, 0); // 13

Atomics.store(ta, 0, 12); // 12

Atomics.sub(ta, 0, 2); // 12
Atomics.load(ta, 0); // 10

Atomics.xor(ta, 0, 1); // 10
Atomics.load(ta, 0); // 11
```

### Chờ và thông báo

Cho `Int32Array` dùng chung:

```js
const sab = new SharedArrayBuffer(1024);
const int32 = new Int32Array(sab);
```

Một luồng đọc đang ngủ và chờ tại vị trí 0 vì giá trị được cung cấp khớp với những gì được lưu trữ tại chỉ số được cung cấp. Luồng đọc sẽ không tiến tiếp cho đến khi luồng ghi đã gọi `Atomics.notify()` tại vị trí 0 của mảng được gõ kiểu được cung cấp. Lưu ý rằng nếu sau khi được đánh thức, giá trị tại vị trí 0 không được thay đổi bởi luồng ghi, luồng đọc sẽ **không** quay lại ngủ, mà sẽ tiếp tục.

```js
Atomics.wait(int32, 0, 0);
console.log(int32[0]); // 123
```

Luồng ghi lưu trữ giá trị mới và thông báo cho luồng đang chờ sau khi đã ghi:

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

- {{jsxref("ArrayBuffer")}}
- Hướng dẫn [JavaScript typed arrays](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- [Web Workers](/en-US/docs/Web/API/Web_Workers_API)
- [Shared Memory – a brief tutorial](https://github.com/tc39/proposal-ecmascript-sharedmem/blob/main/TUTORIAL.md) trong đề xuất TC39 ecmascript-sharedmem
- [A Taste of JavaScript's New Parallel Primitives](https://hacks.mozilla.org/2016/05/a-taste-of-javascripts-new-parallel-primitives/) trên hacks.mozilla.org (2016)
