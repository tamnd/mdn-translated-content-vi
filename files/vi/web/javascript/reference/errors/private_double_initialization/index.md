---
title: "TypeError: Initializing an object twice is an error with private fields/methods"
slug: Web/JavaScript/Reference/Errors/Private_double_initialization
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "Initializing an object twice is an error with private fields/methods" xảy ra khi một đối tượng được tạo thông qua hàm tạo của lớp đi qua quá trình xây dựng lớp một lần nữa, và lớp đó chứa một [phần tử riêng tư](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements). Điều này thường được gây ra bởi thủ thuật [ghi đè giá trị trả về](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements#returning_overriding_object).

## Thông báo

```plain
TypeError: Cannot initialize #x twice on the same object (V8-based)
TypeError: Initializing an object twice is an error with private fields (Firefox)
TypeError: Cannot redefine existing private field (evaluating 'super(o)') (Safari)

TypeError: Cannot initialize private methods of class X twice on the same object (V8-based)
TypeError: Initializing an object twice is an error with private methods (Firefox)
TypeError: Cannot install same private methods on object more than once (evaluating 'super(o)') (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Điều gì đã xảy ra?

Đối với bất kỳ đối tượng nào, nếu nó đã chứa một trường hoặc phương thức riêng tư, việc cài đặt lại cùng trường đó sẽ là lỗi. Các phần tử riêng tư được cài đặt trên giá trị của `this` khi hàm tạo lớp được gọi, vì vậy lỗi này có thể xảy ra nếu giá trị `this` là một thực thể đã được xây dựng của lớp này.

Thông thường, `this` trong hàm tạo là một đối tượng mới được tạo ra không có thuộc tính nào trước đó. Tuy nhiên, nó có thể bị ghi đè bởi giá trị trả về của lớp cơ sở. Nếu lớp cơ sở trả về một đối tượng khác, đối tượng đó sẽ thay thế đối tượng hiện tại làm giá trị của `this`:

```js
class Base {
  constructor(o) {
    // Đối tượng này sẽ trở thành giá trị this của bất kỳ lớp con nào
    return o;
  }
}

class Derived extends Base {
  #x = 0;
}
```

Nếu bạn gọi `new Derived(anyObject)`, trong đó `anyObject` không phải là một thực thể của `Derived`, hàm tạo `Derived` sẽ được gọi với `anyObject` làm giá trị `this`, và do đó cài đặt trường riêng tư `#x` trên `anyObject`. Đây là thủ thuật "ghi đè giá trị trả về", cho phép bạn định nghĩa thông tin tùy ý trên các đối tượng không liên quan. Tuy nhiên, nếu bạn gọi `new Derived(new Derived())`, hoặc gọi `new Derived(anyObject)` một lần nữa, hàm tạo `Derived` sẽ cố gắng cài đặt lại trường riêng tư `#x` trên một đối tượng đã có trường riêng tư `#x`, gây ra lỗi này.

## Xem thêm

- [Lớp](/en-US/docs/Web/JavaScript/Reference/Classes)
- [Phần tử riêng tư](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements)
