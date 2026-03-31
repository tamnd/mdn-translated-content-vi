---
title: Iterator() constructor
short-title: Iterator()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/Iterator
page-type: javascript-constructor
browser-compat: javascript.builtins.Iterator.Iterator
sidebar: jsref
---

Hàm tạo **`Iterator()`** được thiết kế để sử dụng như [lớp cha](/en-US/docs/Web/JavaScript/Reference/Classes/extends) của các lớp khác tạo ra các iterator. Nó ném ra lỗi khi được khởi tạo trực tiếp.

## Cú pháp

```js-nolint
new Iterator()
```

> [!NOTE]
> `Iterator()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}. Ngoài ra, `Iterator()` thực sự không thể được khởi tạo trực tiếp — nó thường được khởi tạo ngầm qua các lời gọi [`super()`](/en-US/docs/Web/JavaScript/Reference/Operators/super) bên trong hàm tạo của lớp con.

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("Iterator")}} mới.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Khi [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) chính là hàm `Iterator`, tức là khi hàm tạo `Iterator` tự khởi tạo.

## Mô tả

`Iterator` đại diện cho một _lớp trừu tượng_ — một lớp cung cấp các tiện ích chung cho các lớp con, nhưng không được thiết kế để khởi tạo trực tiếp. Nó là lớp cha của tất cả các lớp iterator khác và được sử dụng để tạo các lớp con triển khai các thuật toán lặp cụ thể — cụ thể là, tất cả các lớp con của `Iterator` phải triển khai phương thức `next()` theo yêu cầu của [giao thức iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol). Vì `Iterator` thực sự không cung cấp phương thức `next()`, nên không có ý nghĩa khi khởi tạo `Iterator` trực tiếp.

Bạn cũng có thể sử dụng {{jsxref("Iterator.from()")}} để tạo một thực thể `Iterator` từ một đối tượng iterable hoặc iterator hiện có.

## Ví dụ

### Kế thừa Iterator

Ví dụ sau định nghĩa một cấu trúc dữ liệu tùy chỉnh, `Range`, cho phép lặp. Để làm cho một đối tượng có thể lặp, chúng ta có thể cung cấp phương thức [`[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/iterator) dưới dạng hàm generator:

```js
class Range {
  #start;
  #end;
  #step;

  constructor(start, end, step = 1) {
    this.#start = start;
    this.#end = end;
    this.#step = step;
  }

  *[Symbol.iterator]() {
    for (let value = this.#start; value <= this.#end; value += this.#step) {
      yield value;
    }
  }
}

const range = new Range(1, 5);
for (const num of range) {
  console.log(num);
}
```

Điều này hoạt động, nhưng không đẹp như cách các iterator tích hợp hoạt động. Có hai vấn đề:

- Iterator được trả về kế thừa từ {{jsxref("Generator")}}, điều đó có nghĩa là các sửa đổi đối với `Generator.prototype` sẽ ảnh hưởng đến iterator được trả về, đây là sự rò rỉ trừu tượng.
- Iterator được trả về không kế thừa từ prototype tùy chỉnh, điều này khó hơn nếu chúng ta có ý định thêm các phương thức bổ sung cho iterator.

Chúng ta có thể mô phỏng cách triển khai của các iterator tích hợp, chẳng hạn như [map iterators](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Symbol.iterator), bằng cách kế thừa từ `Iterator`. Điều này cho phép chúng ta định nghĩa các thuộc tính bổ sung, chẳng hạn như [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag), trong khi làm cho các phương thức iterator helper có sẵn trên iterator được trả về.

```js
class Range {
  #start;
  #end;
  #step;

  constructor(start, end, step = 1) {
    this.#start = start;
    this.#end = end;
    this.#step = step;
  }

  static #RangeIterator = class extends Iterator {
    #cur;
    #s;
    #e;
    constructor(range) {
      super();
      this.#cur = range.#start;
      this.#s = range.#step;
      this.#e = range.#end;
    }
    static {
      Object.defineProperty(this.prototype, Symbol.toStringTag, {
        value: "Range Iterator",
        configurable: true,
        enumerable: false,
        writable: false,
      });

      // Tránh #RangeIterator bị truy cập từ bên ngoài
      delete this.prototype.constructor;
    }
    next() {
      if (this.#cur > this.#e) {
        return { value: undefined, done: true };
      }
      const res = { value: this.#cur, done: false };
      this.#cur += this.#s;
      return res;
    }
  };

  [Symbol.iterator]() {
    return new Range.#RangeIterator(this);
  }
}

const range = new Range(1, 5);
for (const num of range) {
  console.log(num);
}
```

Mẫu kế thừa hữu ích nếu bạn muốn tạo nhiều iterator tùy chỉnh. Nếu bạn có một đối tượng iterable hoặc iterator hiện có không kế thừa từ `Iterator`, và bạn chỉ muốn gọi các phương thức iterator helper trên nó, bạn có thể sử dụng {{jsxref("Iterator.from()")}} để tạo một thực thể `Iterator` một lần.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator` và các helper liên quan](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.from()")}}
