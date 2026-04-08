---
title: Symbol.dispose
short-title: dispose
slug: Web/JavaScript/Reference/Global_Objects/Symbol/dispose
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.dispose
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.dispose`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.dispose`. Khai báo {{jsxref("Statements/using", "using")}} tra cứu symbol này trên bộ khởi tạo biến để lấy phương thức cần gọi khi biến ra khỏi phạm vi.

## Giá trị

Well-known symbol `Symbol.dispose`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Một đối tượng là disposable nếu nó có phương thức `[Symbol.dispose]()`. Phương thức này dự kiến có các ngữ nghĩa sau:

- Gọi phương thức này thông báo cho đối tượng Disposable rằng người gọi không có ý định tiếp tục sử dụng đối tượng này. Phương thức này nên thực hiện bất kỳ logic cần thiết nào để giải phóng tài nguyên một cách tường minh, bao gồm nhưng không giới hạn ở: file system handle, stream, host object, v.v.
- Khi có ngoại lệ được ném ra từ phương thức này, thông thường có nghĩa là tài nguyên không thể được giải phóng tường minh.
- Nếu được gọi nhiều lần trên cùng một đối tượng, hàm không nên ném ra ngoại lệ. Tuy nhiên, yêu cầu này không được thực thi.

Phương thức này không nên trả về một promise, vì promise được trả về bởi `[Symbol.dispose]()` sẽ không được await bởi {{jsxref("Statements/await_using", "await using")}}. Để khai báo async disposable, hãy sử dụng {{jsxref("Symbol.asyncDispose")}}.

## Ví dụ

### Disposable do người dùng định nghĩa

`[Symbol.dispose]` cho phép tạo ra các disposable tùy chỉnh. Xem tài liệu tham khảo {{jsxref("Statements/using", "using")}} để biết thêm thông tin.

```js
class Disposable {
  constructor() {
    this.disposed = false;
  }

  [Symbol.dispose]() {
    this.disposed = true;
  }

  get isDisposed() {
    return this.disposed;
  }
}

const resource = new Disposable();
{
  using resourceUsed = resource;
  console.log(resource.isDisposed); // false
}
console.log(resource.isDisposed); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Symbol.dispose` in `core-js`](https://github.com/zloirock/core-js#explicit-resource-management)
- [JavaScript resource management](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("Symbol.asyncDispose")}}
- {{jsxref("Statements/using", "using")}}
- [`DisposableStack.prototype[Symbol.dispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/DisposableStack/Symbol.dispose)
- [`Iterator.prototype[Symbol.dispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator/Symbol.dispose)
