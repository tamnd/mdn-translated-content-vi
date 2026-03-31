---
title: Iterator.prototype.flatMap()
short-title: flatMap()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/flatMap
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.flatMap
sidebar: jsref
---

Phương thức **`flatMap()`** của các thực thể {{jsxref("Iterator")}} trả về một [đối tượng iterator helper](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#iterator_helper_objects) mới lấy mỗi phần tử trong iterator gốc, chạy qua hàm ánh xạ và yield các phần tử do hàm ánh xạ trả về (chứa trong một iterator hoặc iterable khác).

## Cú pháp

```js-nolint
flatMap(callbackFn)
```

### Tham số

- `callbackFn`
  - : Hàm thực thi cho mỗi phần tử do iterator tạo ra. Nó nên trả về một iterator hoặc iterable yield các phần tử để được yield bởi `flatMap()`. Lưu ý rằng không giống như {{jsxref("Array.prototype.flatMap()")}}, bạn không thể trả về các giá trị đơn lẻ không phải iterator/iterable. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.

### Giá trị trả về

Một [đối tượng iterator helper](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#iterator_helper_objects) mới. Lần đầu tiên phương thức `next()` của iterator helper được gọi, nó gọi `callbackFn` trên phần tử đầu tiên do iterator nền tạo ra, và giá trị trả về, phải là một iterator hoặc iterable, được yield từng cái một bởi iterator helper (giống như {{jsxref("Operators/yield*", "yield*")}}). Phần tử tiếp theo được lấy từ iterator nền khi phần tử trước đó do `callbackFn` trả về đã hoàn thành. Khi iterator nền hoàn thành, iterator helper cũng hoàn thành (phương thức `next()` tạo ra `{ value: undefined, done: true }`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `callbackFn` trả về giá trị không phải iterator/iterable hoặc chuỗi nguyên thủy.

## Mô tả

`flatMap` chấp nhận hai loại giá trị trả về từ `callbackFn`: một iterator hoặc iterable. Chúng được xử lý theo cùng cách như {{jsxref("Iterator.from()")}}: nếu giá trị trả về là iterable, phương thức `[Symbol.iterator]()` được gọi và giá trị trả về được sử dụng; ngược lại, giá trị trả về được coi là iterator và phương thức `next()` của nó được gọi.

```js
[1, 2, 3]
  .values()
  .flatMap((x) => {
    let itDone = false;
    const it = {
      next() {
        if (itDone) {
          return { value: undefined, done: true };
        }
        itDone = true;
        return { value: x, done: false };
      },
    };
    switch (x) {
      case 1:
        // Một iterable không phải iterator
        return { [Symbol.iterator]: () => it };
      case 2:
        // Một iterator không phải iterable
        return it;
      case 3:
        // Một iterable iterator được coi là iterable
        return {
          ...it,
          [Symbol.iterator]() {
            console.log("Symbol.iterator called");
            return it;
          },
        };
      default:
        return undefined;
    }
  })
  .toArray();
// In ra "Symbol.iterator called"
// Trả về [1, 2, 3]
```

## Ví dụ

### Gộp các map

Ví dụ sau gộp hai đối tượng {{jsxref("Map")}} thành một:

```js
const map1 = new Map([
  ["a", 1],
  ["b", 2],
  ["c", 3],
]);
const map2 = new Map([
  ["d", 4],
  ["e", 5],
  ["f", 6],
]);

const merged = new Map([map1, map2].values().flatMap((x) => x));
console.log(merged.get("a")); // 1
console.log(merged.get("e")); // 5
```

Điều này tránh tạo bất kỳ bản sao tạm thời nào của nội dung map. Lưu ý rằng mảng `[map1, map2]` trước tiên phải được chuyển đổi thành iterator (sử dụng {{jsxref("Array.prototype.values()")}}), vì {{jsxref("Array.prototype.flatMap()")}} chỉ làm phẳng mảng, không phải iterables.

```js
new Map([map1, map2].flatMap((x) => x)); // Map(1) {undefined => undefined}
```

### Trả về chuỗi

Chuỗi là iterable, nhưng `flatMap()` đặc biệt từ chối các chuỗi nguyên thủy được trả về từ `callbackFn`, vì hành vi lặp qua các code point thường không phải là điều bạn muốn.

```js example-bad
[1, 2, 3]
  .values()
  .flatMap((x) => String(x))
  .toArray(); // TypeError: Iterator.prototype.flatMap called on non-object
```

Bạn có thể muốn bọc nó trong một mảng thay thế để toàn bộ chuỗi được yield như một:

```js
[1, 2, 3]
  .values()
  .flatMap((x) => [String(x)])
  .toArray(); // ['1', '2', '3']
```

Hoặc, nếu hành vi lặp qua các code point là dự kiến, bạn có thể sử dụng {{jsxref("Iterator.from()")}} để chuyển đổi nó thành iterator thích hợp:

```js
[1, 2, 3]
  .values()
  .flatMap((x) => Iterator.from(String(x * 10)))
  .toArray();
// ['1', '0', '2', '0', '3', '0']
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.prototype.flatMap` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator.prototype.flatMap`](https://www.npmjs.com/package/es-iterator-helpers)
