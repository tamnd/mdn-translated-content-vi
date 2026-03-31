---
title: super
slug: Web/JavaScript/Reference/Operators/super
page-type: javascript-language-feature
browser-compat: javascript.operators.super
sidebar: jssidebar
---

Từ khóa **`super`** được dùng để truy cập các thuộc tính trên [[Prototype]] của một object literal hoặc class, hoặc gọi constructor của superclass.

Các biểu thức `super.prop` và `super[expr]` hợp lệ trong bất kỳ [định nghĩa phương thức](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions) nào trong cả [classes](/en-US/docs/Web/JavaScript/Reference/Classes) và [object literals](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer). Biểu thức `super(...args)` hợp lệ trong các class constructors.

{{InteractiveExample("JavaScript Demo: super expression", "taller")}}

```js interactive-example
class Foo {
  constructor(name) {
    this.name = name;
  }

  getNameSeparator() {
    return "-";
  }
}

class FooBar extends Foo {
  constructor(name, index) {
    super(name);
    this.index = index;
  }

  // Does not get called
  getNameSeparator() {
    return "/";
  }

  getFullName() {
    return this.name + super.getNameSeparator() + this.index;
  }
}

const firstFooBar = new FooBar("foo", 1);

console.log(firstFooBar.name);
// Expected output: "foo"

console.log(firstFooBar.getFullName());
// Expected output: "foo-1"
```

## Cú pháp

```js-nolint
super()
super(arg1)
super(arg1, arg2)
super(arg1, arg2, /* …, */ argN)

super.propertyOnParent
super[expression]
```

## Mô tả

Từ khóa `super` có thể được dùng theo hai cách: như "function call" (`super(...args)`), hoặc như "property lookup" (`super.prop` và `super[expr]`).

> [!NOTE]
> `super` là từ khóa và đây là các cấu trúc cú pháp đặc biệt. `super` không phải biến trỏ đến đối tượng prototype. Cố gắng đọc `super` chính nó sẽ là {{jsxref("SyntaxError")}}.
>
> ```js-nolint example-bad
> const child = {
>   myParent() {
>     console.log(super); // SyntaxError: 'super' keyword unexpected here
>   },
> };
> ```

Trong thân [constructor](/en-US/docs/Web/JavaScript/Reference/Classes/constructor) của derived class (với `extends`), từ khóa `super` có thể xuất hiện như "function call" (`super(...args)`), phải được gọi trước khi từ khóa `this` được dùng, và trước khi constructor return. Nó gọi constructor của parent class và bind các public fields của parent class, sau đó constructor của derived class có thể tiếp tục truy cập và sửa đổi `this`.

Dạng "property lookup" có thể được dùng để truy cập các phương thức và thuộc tính của [[Prototype]] của một object literal hoặc class. Trong thân class, tham chiếu của `super` có thể là constructor của superclass hoặc `prototype` của constructor, tùy thuộc vào ngữ cảnh thực thi là tạo instance hay khởi tạo class. Xem phần Ví dụ để biết chi tiết hơn.

Lưu ý rằng tham chiếu của `super` được xác định bởi class hoặc object literal mà `super` được khai báo trong đó, không phải đối tượng mà phương thức được gọi trên đó. Do đó, unbinding hoặc re-binding một phương thức không thay đổi tham chiếu của `super` trong nó (mặc dù chúng thay đổi tham chiếu của [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this)). Bạn có thể coi `super` như biến trong phạm vi class hoặc object literal mà các phương thức tạo closure trên đó. (Nhưng cũng cẩn thận rằng đây không thực sự là biến, như đã giải thích ở trên.)

Khi đặt thuộc tính thông qua `super`, thuộc tính được đặt trên `this` thay thế.

## Ví dụ

### Sử dụng super trong classes

Đoạn code này được lấy từ [classes sample](https://github.com/GoogleChrome/samples/blob/gh-pages/classes-es6/index.html) ([live demo](https://googlechrome.github.io/samples/classes-es6/index.html)). Ở đây `super()` được gọi để tránh lặp lại các phần constructor chung giữa `Rectangle` và `Square`.

```js
class Rectangle {
  constructor(height, width) {
    this.name = "Rectangle";
    this.height = height;
    this.width = width;
  }
  sayName() {
    console.log(`Hi, I am a ${this.name}.`);
  }
  get area() {
    return this.height * this.width;
  }
  set area(value) {
    this._area = value;
  }
}

class Square extends Rectangle {
  constructor(length) {
    // Here, it calls the parent class's constructor with lengths
    // provided for the Rectangle's width and height
    super(length, length);

    // Note: In derived classes, super() must be called before you
    // can use 'this'. Moving this to the top causes a ReferenceError.
    this.name = "Square";
  }
}
```

### Gọi static methods bằng super

Bạn cũng có thể gọi super trên các phương thức [static](/en-US/docs/Web/JavaScript/Reference/Classes/static).

```js
class Rectangle {
  static logNbSides() {
    return "I have 4 sides";
  }
}

class Square extends Rectangle {
  static logDescription() {
    return `${super.logNbSides()} which are all equal`;
  }
}
Square.logDescription(); // 'I have 4 sides which are all equal'
```

### Truy cập super trong khai báo class field

`super` cũng có thể được truy cập trong quá trình khởi tạo class field. Tham chiếu của `super` phụ thuộc vào field hiện tại là instance field hay static field.

```js
class Base {
  static baseStaticField = 90;
  baseMethod() {
    return 10;
  }
}

class Extended extends Base {
  extendedField = super.baseMethod(); // 10
  static extendedStaticField = super.baseStaticField; // 90
}
```

Lưu ý rằng instance fields được đặt trên instance thay vì `prototype` của constructor, vì vậy bạn không thể dùng `super` để truy cập instance field của superclass.

```js example-bad
class Base {
  baseField = 10;
}

class Extended extends Base {
  extendedField = super.baseField; // undefined
}
```

Ở đây, `extendedField` là `undefined` thay vì 10, vì `baseField` được định nghĩa như thuộc tính riêng của instance `Base`, thay vì `Base.prototype`. `super`, trong ngữ cảnh này, chỉ tra cứu các thuộc tính trên `Base.prototype`, vì đó là [[Prototype]] của `Extended.prototype`.

### Xóa super properties sẽ ném ra lỗi

Bạn không thể dùng [toán tử `delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete) và `super.prop` hoặc `super[expr]` để xóa thuộc tính của parent class — nó sẽ ném ra {{jsxref("ReferenceError")}}.

```js
class Base {
  foo() {}
}
class Derived extends Base {
  delete() {
    delete super.foo; // this is bad
  }
}

new Derived().delete(); // ReferenceError: invalid delete involving 'super'.
```

### Sử dụng super.prop trong object literals

Super cũng có thể được dùng trong ký hiệu [object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer). Trong ví dụ này, hai đối tượng định nghĩa một phương thức. Trong đối tượng thứ hai, `super` gọi phương thức của đối tượng thứ nhất. Điều này hoạt động với sự hỗ trợ của {{jsxref("Object.setPrototypeOf()")}} với đó chúng ta có thể đặt prototype của `obj2` thành `obj1`, để `super` có thể tìm thấy `method1` trên `obj1`.

```js
const obj1 = {
  method1() {
    console.log("method 1");
  },
};

const obj2 = {
  method2() {
    super.method1();
  },
};

Object.setPrototypeOf(obj2, obj1);
obj2.method2(); // Logs "method 1"
```

### Các phương thức đọc super.prop không hoạt động khác khi được bind với các đối tượng khác

Truy cập `super.x` hoạt động như `Reflect.get(Object.getPrototypeOf(objectLiteral), "x", this)`, có nghĩa là thuộc tính luôn được tìm kiếm trên prototype của object literal/class declaration, và unbinding và re-binding một phương thức không thay đổi tham chiếu của `super`.

```js
class Base {
  baseGetX() {
    return 1;
  }
}
class Extended extends Base {
  getX() {
    return super.baseGetX();
  }
}

const e = new Extended();
console.log(e.getX()); // 1
const { getX } = e;
console.log(getX()); // 1
```

Điều tương tự xảy ra trong object literals.

```js
const parent1 = { prop: 1 };
const parent2 = { prop: 2 };

const child = {
  myParent() {
    console.log(super.prop);
  },
};

Object.setPrototypeOf(child, parent1);
child.myParent(); // Logs "1"

const myParent = child.myParent;
myParent(); // Still logs "1"

const anotherChild = { __proto__: parent2, myParent };
anotherChild.myParent(); // Still logs "1"
```

Chỉ reset toàn bộ chuỗi kế thừa mới thay đổi tham chiếu của `super`.

```js
class Base {
  baseGetX() {
    return 1;
  }
  static staticBaseGetX() {
    return 3;
  }
}
class AnotherBase {
  baseGetX() {
    return 2;
  }
  static staticBaseGetX() {
    return 4;
  }
}
class Extended extends Base {
  getX() {
    return super.baseGetX();
  }
  static staticGetX() {
    return super.staticBaseGetX();
  }
}

const e = new Extended();
// Reset instance inheritance
Object.setPrototypeOf(Extended.prototype, AnotherBase.prototype);
console.log(e.getX()); // Logs "2" instead of "1", because the prototype chain has changed
console.log(Extended.staticGetX()); // Still logs "3", because we haven't modified the static part yet
// Reset static inheritance
Object.setPrototypeOf(Extended, AnotherBase);
console.log(Extended.staticGetX()); // Now logs "4"
```

### Gọi phương thức từ super

Khi gọi `super.prop` như hàm, giá trị `this` bên trong hàm `prop` là `this` hiện tại, không phải đối tượng mà `super` trỏ đến. Ví dụ, lời gọi `super.getName()` log `"Extended"`, mặc dù code trông như thể tương đương với `Base.getName()`.

```js
class Base {
  static getName() {
    console.log(this.name);
  }
}

class Extended extends Base {
  static getName() {
    super.getName();
  }
}

Extended.getName(); // Logs "Extended"
```

Điều này đặc biệt quan trọng khi tương tác với [static private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements#private_static_fields).

### Đặt super.prop sẽ đặt thuộc tính trên this thay thế

Đặt thuộc tính của `super`, chẳng hạn như `super.x = 1`, hoạt động như `Reflect.set(Object.getPrototypeOf(objectLiteral), "x", 1, this)`. Đây là một trong những trường hợp mà hiểu `super` đơn giản là "tham chiếu của đối tượng prototype" không đủ, vì nó thực sự đặt thuộc tính trên `this` thay thế.

```js
class A {}
class B extends A {
  setX() {
    super.x = 1;
  }
}

const b = new B();
b.setX();
console.log(b); // B { x: 1 }
console.log(Object.hasOwn(b, "x")); // true
```

`super.x = 1` sẽ tra cứu property descriptor của `x` trên `A.prototype` (và gọi các setters được định nghĩa ở đó), nhưng giá trị `this` sẽ được đặt thành `this`, đó là `b` trong ngữ cảnh này. Bạn có thể đọc [`Reflect.set`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Reflect/set) để biết thêm chi tiết về trường hợp `target` và `receiver` khác nhau.

Điều này có nghĩa là trong khi các phương thức _lấy_ `super.prop` thường không bị ảnh hưởng bởi thay đổi trong ngữ cảnh `this`, những phương thức _đặt_ `super.prop` thì có.

```js example-bad
/* Reusing same declarations as above */

const b2 = new B();
b2.setX.call(null); // TypeError: Cannot assign to read only property 'x' of object 'null'
```

Tuy nhiên, `super.x = 1` vẫn tham khảo property descriptor của đối tượng prototype, có nghĩa là bạn không thể ghi đè các thuộc tính non-writable, và setters sẽ được gọi.

```js
class X {
  constructor() {
    // Create a non-writable property
    Object.defineProperty(this, "prop", {
      configurable: true,
      writable: false,
      value: 1,
    });
  }
}

class Y extends X {
  constructor() {
    super();
  }
  foo() {
    super.prop = 2; // Cannot overwrite the value.
  }
}

const y = new Y();
y.foo(); // TypeError: "prop" is read-only
console.log(y.prop); // 1
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
