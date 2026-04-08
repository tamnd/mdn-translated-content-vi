---
title: AsyncGenerator.prototype.next()
short-title: next()
slug: Web/JavaScript/Reference/Global_Objects/AsyncGenerator/next
page-type: javascript-instance-method
browser-compat: javascript.builtins.AsyncGenerator.next
sidebar: jsref
---

Phương thức **`next()`** của các thực thể {{jsxref("AsyncGenerator")}} trả về giá trị tiếp theo trong dãy.

## Cú pháp

```js-nolint
next()
next(value)
```

### Tham số

- `value` {{optional_inline}}
  - : Giá trị tùy chọn dùng để sửa đổi trạng thái nội bộ của generator. Giá trị được truyền cho phương thức `next()` sẽ được nhận bởi `yield`.

### Giá trị trả về

Một {{jsxref("Promise")}} khi được giải quyết trả về một {{jsxref("Object")}} với hai thuộc tính:

- `done`
  - : Giá trị boolean:
    - `true` nếu generator đã vượt qua cuối luồng điều khiển của nó. Trong trường hợp này `value` chỉ định _giá trị trả về_ của generator (có thể là undefined).
    - `false` nếu generator có thể tạo thêm giá trị.
- `value`
  - : Bất kỳ giá trị JavaScript nào được yield hoặc trả về bởi generator.

## Ví dụ

### Sử dụng next()

Ví dụ sau cho thấy một generator và đối tượng mà phương thức `next` trả về:

```js
// Một tác vụ bất đồng bộ. Giả sử nó đang làm gì đó hữu ích hơn
// trong thực tế.
function delayedValue(time, value) {
  return new Promise((resolve, reject) => {
    setTimeout(() => resolve(value), time);
  });
}

async function* createAsyncGenerator() {
  yield delayedValue(500, 1);
  yield delayedValue(500, 2);
  yield delayedValue(500, 3);
}

const asyncGen = createAsyncGenerator();
asyncGen.next().then((res) => console.log(res)); // { value: 1, done: false }
asyncGen.next().then((res) => console.log(res)); // { value: 2, done: false }
asyncGen.next().then((res) => console.log(res)); // { value: 3, done: false }
asyncGen.next().then((res) => console.log(res)); // { value: undefined, done: true }
```

### Gửi giá trị tới generator

Trong ví dụ này, `next` được gọi với một giá trị.

> [!NOTE]
> Lần gọi đầu tiên không ghi nhật ký bất cứ điều gì, vì generator ban đầu không yield bất cứ thứ gì.

```js
// Một tác vụ bất đồng bộ. Giả sử nó đang làm gì đó hữu ích hơn
// trong thực tế.
function sleep(time) {
  return new Promise((resolve, reject) => {
    setTimeout(resolve, time);
  });
}

async function* createAsyncGenerator() {
  while (true) {
    await sleep(500);
    const value = yield;
    console.log(value);
  }
}

async function main() {
  const asyncGen = createAsyncGenerator();
  // Không có nhật ký ở bước này: giá trị đầu tiên được gửi qua `next` bị mất
  console.log(await asyncGen.next(1)); // { value: undefined, done: false }
  // Ghi nhật ký 2: giá trị được gửi qua `next`
  console.log(await asyncGen.next(2)); // { value: undefined, done: false }
}

main();
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/async_function*", "async function*")}}
- Hướng dẫn [Iterators và generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
