---
title: AsyncGenerator.prototype.throw()
short-title: throw()
slug: Web/JavaScript/Reference/Global_Objects/AsyncGenerator/throw
page-type: javascript-instance-method
browser-compat: javascript.builtins.AsyncGenerator.throw
sidebar: jsref
---

Phương thức **`throw()`** của các thực thể {{jsxref("AsyncGenerator")}} hoạt động như thể câu lệnh `throw` được chèn vào thân generator tại vị trí bị tạm dừng hiện tại, thông báo cho generator về một điều kiện lỗi và cho phép nó xử lý lỗi hoặc thực hiện dọn dẹp và đóng lại.

## Cú pháp

```js-nolint
asyncGeneratorInstance.throw(exception)
```

### Tham số

- `exception`
  - : Ngoại lệ cần ném ra. Để mục đích gỡ lỗi, nó hữu ích khi là `instanceof` {{jsxref("Error")}}.

### Giá trị trả về

Nếu lỗi được ném ra không bị bắt, nó sẽ trả về một {{jsxref("Promise")}} bị từ chối với ngoại lệ được truyền vào.

Nếu ngoại lệ bị bắt bởi [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) và generator tiếp tục để yield thêm giá trị, nó sẽ trả về một {{jsxref("Promise")}} được giải quyết với một {{jsxref("Object")}} có hai thuộc tính:

- `done`
  - : Giá trị boolean:
    - `true` nếu luồng điều khiển của hàm generator đã đến cuối.
    - `false` nếu hàm generator có thể tạo thêm giá trị.
- `value`
  - : Giá trị được yield từ biểu thức `yield` tiếp theo.

## Ví dụ

### Sử dụng throw()

Ví dụ sau cho thấy một generator và một lỗi được ném ra bằng phương thức `throw`. Lỗi có thể bị bắt bởi khối {{jsxref("Statements/try...catch", "try...catch")}} như thông thường.

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
    try {
      await sleep(500);
      yield 42;
    } catch (e) {
      console.error(e);
    }
  }
}

const asyncGen = createAsyncGenerator();
asyncGen.next(1).then((res) => console.log(res)); // { value: 42, done: false }
asyncGen
  .throw(new Error("Something went wrong")) // Error: Something went wrong
  .then((res) => console.log(res)); // { value: 42, done: false }
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/async_function*", "async function*")}}
- Hướng dẫn [Iterators và generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
