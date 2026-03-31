---
title: "TypeError: getting private setter-only property"
slug: Web/JavaScript/Reference/Errors/Private_setter_only
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "getting private setter-only property" xảy ra khi đọc giá trị của một [phần tử riêng tư](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) mà chỉ có [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set) được định nghĩa.

## Thông báo

```plain
TypeError: '#x' was defined without a getter (V8-based)
TypeError: getting private setter-only property (Firefox)
TypeError: Trying to access an undefined private getter (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Điều gì đã xảy ra?

Có một nỗ lực lấy giá trị của một phần tử riêng tư mà chỉ có [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set) được chỉ định. Không giống như các đối tượng thông thường, trong đó getter không được định nghĩa chỉ có nghĩa là thuộc tính sẽ luôn trả về undefined, đối với các phần tử riêng tư, đây là lỗi.

## Ví dụ

### Phần tử riêng tư không có getter

Ở đây, `#name` không có getter, vì vậy việc đọc nó bằng `this.#name` sẽ ném lỗi.

```js example-bad
class Person {
  set #name(value) {}

  get name() {
    return this.#name;
  }
}

const person = new Person();
console.log(person.name);
```

Thường không phổ biến khi một phần tử riêng tư có setter mà không có getter. Hãy thêm getter hoặc tái cấu trúc chương trình của bạn để setter cũng có thể được loại bỏ.

## Xem thêm

- [Phần tử riêng tư](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements)
- [`set`](/en-US/docs/Web/JavaScript/Reference/Functions/set)
