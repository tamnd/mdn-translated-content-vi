---
title: Atomics.pause()
short-title: pause()
slug: Web/JavaScript/Reference/Global_Objects/Atomics/pause
page-type: javascript-static-method
browser-compat: javascript.builtins.Atomics.pause
sidebar: jsref
---

Phương thức tĩnh **`Atomics.pause()`** cung cấp một primitive chờ vi mô (micro-wait) gợi ý cho CPU rằng thread gọi đang xoay vòng trong khi chờ truy cập vào một tài nguyên chia sẻ. Điều này cho phép hệ thống giảm tài nguyên được phân bổ cho nhân (core) hoặc thread (như điện năng) mà không từ bỏ thread hiện tại.

`pause()` không có hành vi quan sát được ngoài thời gian. Hành vi chính xác phụ thuộc vào kiến trúc CPU và hệ điều hành. Ví dụ, trên Intel x86, nó có thể là lệnh `pause` theo [tài liệu tối ưu hóa của Intel](https://www.intel.com/content/www/us/en/content-details/671488/intel-64-and-ia-32-architectures-optimization-reference-manual-volume-1.html). Nó có thể là no-op trên một số nền tảng nhất định.

## Cú pháp

```js-nolint
Atomics.pause()
Atomics.pause(durationHint)
```

### Tham số

- `durationHint` {{optional_inline}}
  - : Một số nguyên mà implementation có thể sử dụng để xác định thời gian chờ. Với giá trị `n + 1`, một implementation chờ ít nhất lâu bằng thời gian nó chờ cho giá trị `n`. Con số chính xác không có ý nghĩa vật lý. Có thể có một giới hạn trên nội bộ về thời gian tối đa bị tạm dừng trong khoảng hàng chục đến hàng trăm nanosecond. Điều này có thể được sử dụng để thực hiện [chiến lược backoff](#backoff_strategies) bằng cách tăng `durationHint` được truyền vào. Không có đảm bảo rằng một implementation sẽ sử dụng gợi ý này.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `durationHint` không phải là số nguyên hoặc `undefined`.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng Atomics.pause()

Việc gọi {{jsxref("Atomics.wait()")}} hoặc {{jsxref("Atomics.waitAsync()")}} để chờ truy cập vào bộ nhớ chia sẻ khiến thread bị lên lịch ra khỏi nhân và sau đó trở lại sau khi chờ. Điều này hiệu quả trong thời gian tranh chấp cao, khi truy cập vào bộ nhớ chia sẻ có thể mất một thời gian. Khi tranh chấp thấp, thường hiệu quả hơn khi thăm dò khóa mà không từ bỏ thread: cách tiếp cận này được gọi là [busy waiting](https://en.wikipedia.org/wiki/Busy_waiting) hay [spinlocking](https://en.wikipedia.org/wiki/Spinlock). Phương thức `pause()` cho phép bạn spinlock hiệu quả hơn trong khi chờ, bằng cách cung cấp gợi ý cho CPU về những gì thread đang làm, và do đó nhu cầu tài nguyên thấp của nó.

Để phục vụ cả hai điều kiện, một cách tiếp cận phổ biến là đầu tiên spinlock với hy vọng tranh chấp thấp, sau đó chờ nếu khóa không được giành sau một thời gian ngắn. Nếu chúng ta đã giành được khóa thông qua spinlocking, thì lời gọi `wait()` sẽ là no-op.

Ví dụ dưới đây cho thấy cách tiếp cận này có thể được sử dụng với `Atomics.pause()` và `Atomics.wait()`.

> [!WARNING]
> Việc sử dụng spinlocking trên main thread không được khuyến nghị, vì nó sẽ đóng băng toàn bộ trang. Nói chung, trừ khi được thiết kế rất cẩn thận, spinlock thực ra có thể không hiệu quả hơn một lần chờ thông thường.

```js
// Imagine another thread also has access to this shared memory
const sab = new SharedArrayBuffer(1024);
const i32 = new Int32Array(sab);

// Fast path: spin the CPU for a short while
let spin = 0;
do {
  if (Atomics.compareExchange(i32, 0, 0, 1) === 0) {
    break;
  }
  Atomics.pause();
  spin++;
} while (spin < 10);

// Slow path: wait for the lock
// This can only be called in a worker thread,
// because the main thread cannot be blocked
Atomics.wait(i32, 0, 1);
```

### Chiến lược backoff

Tham số `durationHint` có thể được sử dụng để thực hiện chiến lược backoff. Ví dụ, một thread có thể bắt đầu với một gợi ý nhỏ và tăng nó theo cấp số nhân trong mỗi lần lặp. Điều này tốt hơn việc gọi `pause()` nhiều lần vì trong code chưa được JIT, bản thân các lời gọi hàm có chi phí cao.

> [!NOTE]
> Các implementation thực ra có thể không sử dụng `durationHint` chút nào và luôn chờ trong thời gian cố định.

```js
// Exponential backoff
for (let hint = 1; hint < 1000; hint *= 2) {
  Atomics.pause(hint);
}

// Linear backoff
for (let hint = 1; hint < 100; hint++) {
  Atomics.pause(hint);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Atomics")}}
- {{jsxref("Atomics.wait()")}}
- {{jsxref("Atomics.waitAsync()")}}
