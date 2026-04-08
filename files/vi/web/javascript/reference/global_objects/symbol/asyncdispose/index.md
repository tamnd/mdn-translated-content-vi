---
title: Symbol.asyncDispose
short-title: asyncDispose
slug: Web/JavaScript/Reference/Global_Objects/Symbol/asyncDispose
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.asyncDispose
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.asyncDispose`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.asyncDispose`. Khai báo {{jsxref("Statements/await_using", "await using")}} tra cứu symbol này trên bộ khởi tạo biến để lấy phương thức cần gọi khi biến ra khỏi phạm vi.

## Giá trị

Well-known symbol `Symbol.asyncDispose`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Một đối tượng là async disposable nếu nó có phương thức `[Symbol.asyncDispose]()`. Phương thức này dự kiến có các ngữ nghĩa sau:

- Gọi phương thức này thông báo cho đối tượng AsyncDisposable rằng người gọi không có ý định tiếp tục sử dụng đối tượng này. Phương thức này nên thực hiện bất kỳ logic cần thiết nào để giải phóng tài nguyên một cách tường minh, bao gồm nhưng không giới hạn ở: file system handle, stream, host object, v.v.
- Phương thức này có thể trả về một promise, sẽ được await trước khi tiếp tục.
- Khi có ngoại lệ được ném ra từ phương thức này, thông thường có nghĩa là tài nguyên không thể được giải phóng tường minh. Một đối tượng AsyncDisposable không được coi là "đã dispose" cho đến khi Promise kết quả được fulfilled.
- Nếu được gọi nhiều lần trên cùng một đối tượng, hàm không nên ném ra ngoại lệ. Tuy nhiên, yêu cầu này không được thực thi.

## Ví dụ

### Async disposable do người dùng định nghĩa

`[Symbol.asyncDispose]` cho phép tạo ra các async disposable tùy chỉnh. Xem tài liệu tham khảo `await using` để biết thêm thông tin.

```js
class Disposable {
  #fileHandle;
  #disposed;

  constructor(handle) {
    this.#disposed = false;
    this.#fileHandle = handle;
  }

  async [Symbol.asyncDispose]() {
    await this.#fileHandle.close();
    this.disposed = true;
  }

  get isDisposed() {
    return this.disposed;
  }
}

const resource = new Disposable(await fs.open("my-file.txt", "r"));
{
  await using resourceUsed = resource;
  console.log(resource.isDisposed); // false
}
console.log(resource.isDisposed); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Symbol.asyncDispose` in `core-js`](https://github.com/zloirock/core-js#explicit-resource-management)
- [JavaScript resource management](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("Symbol.dispose")}}
- {{jsxref("Statements/await_using", "await using")}}
- [`AsyncDisposableStack.prototype[Symbol.asyncDispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncDisposableStack/Symbol.asyncDispose)
- [`AsyncIterator.prototype[Symbol.asyncDispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncIterator/Symbol.asyncDispose)
