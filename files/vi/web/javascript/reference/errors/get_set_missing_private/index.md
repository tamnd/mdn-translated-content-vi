---
title: "TypeError: can't access/set private field or method: object is not the right class"
slug: Web/JavaScript/Reference/Errors/Get_set_missing_private
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "can't access private field or method: object is not the right class" hoặc "can't set private field: object is not the right class" xảy ra khi một trường hoặc phương thức private được get hoặc set trên một đối tượng không có [phần tử private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) đó được khai báo.

## Thông báo

```plain
TypeError: Cannot read private member #x from an object whose class did not declare it (V8-based)
TypeError: Cannot write private member #x to an object whose class did not declare it (V8-based)
TypeError: can't access private field or method: object is not the right class (Firefox)
TypeError: can't set private field: object is not the right class (Firefox)
TypeError: Cannot access invalid private field (evaluating 'this.#x') (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Bạn đang cố gắng get hoặc set một trường hoặc phương thức private trên một đối tượng, nhưng đối tượng đó không chứa phần tử private này. Các thuộc tính instance private chỉ có thể được truy cập trên các thực thể của lớp (bao gồm cả các lớp con) khai báo chúng; các thuộc tính static private chỉ có thể được truy cập trên chính lớp khai báo chúng, và không thể trên các lớp con.

Lỗi này xảy ra khi tên private tồn tại trong phạm vi của lớp nhưng đối tượng được truy cập trên đó không hợp lệ. Nếu tên private không tồn tại, bạn sẽ nhận được [lỗi cú pháp](/en-US/docs/Web/JavaScript/Reference/Errors/Undeclared_private_field_or_method) thay thế.

## Ví dụ

### Nhầm lẫn giữa trường static và instance

Bạn có thể đã khai báo trường là trường static, nhưng lại cố gắng truy cập nó trên một thực thể, hoặc ngược lại.

```js example-bad
class MyClass {
  static #x = 0;
  doSomething() {
    console.log(this.#x);
  }
}

const obj = new MyClass();
obj.doSomething();
// TypeError: can't access private field: object is not the right class
```

Để sửa lỗi này, hãy đổi trường thành trường instance, hoặc truy cập trường trên chính lớp đó, hoặc khai báo thêm một trường khác trên thực thể. Lưu ý rằng không gian tên private được dùng chung giữa thuộc tính static và instance, do đó bạn không thể có một phần tử private static và instance trùng tên.

```js example-good
class MyClass {
  #x = 0;
  doSomething() {
    console.log(this.#x);
  }
}

class MyClass2 {
  static #x = 0;
  doSomething() {
    console.log(MyClass2.#x);
  }
}
```

### Sử dụng sai đối tượng

Có thể bạn có một phương thức truy cập `this.#x`, nhưng nó được gọi với một giá trị `this` khác.

```js example-bad
class JSONReplacer {
  #count = 0;
  func(key, value) {
    if (typeof value === "object") {
      this.#count++;
    }
    return value;
  }
}

JSON.stringify({ a: 1, b: { c: 2 } }, new JSONReplacer().func);
// TypeError: can't access private field: object is not the right class
```

Nguyên nhân là do {{jsxref("JSON.stringify()")}} gọi hàm replacer với đối tượng chứa `value` làm `this`, vì vậy trường private không thể truy cập được. Để sửa lỗi này, bạn có thể bind phương thức vào đối tượng, hoặc sử dụng hàm mũi tên, để đảm bảo rằng `replacer.func` được gọi với giá trị `this` đúng.

```js example-good
const replacer = new JSONReplacer();
JSON.stringify({ a: 1, b: { c: 2 } }, replacer.func.bind(replacer));
JSON.stringify({ a: 1, b: { c: 2 } }, (...args) => replacer.func(...args));
```

Thông thường, nếu bạn vô tình hủy liên kết một phương thức, phương thức đó sẽ được gọi với `undefined` làm `this`, điều này sẽ dẫn đến một lỗi khác (TypeError: can't convert undefined to object). Lỗi này chỉ xảy ra khi phương thức được gọi với một đối tượng khác làm `this`, chẳng hạn bằng cách sử dụng {{jsxref("Function/call", "call()")}} hoặc {{jsxref("Function/apply", "apply()")}}, hoặc bằng cách truyền phương thức làm callback cho một hàm gọi nó với giá trị `this` khác.

Nếu bạn không chắc chắn rằng đối tượng có chứa phần tử private hay không, như trong đoạn code sau:

```js
class MyClass {
  #x = 0;
  static doSomething(obj) {
    console.log(obj.#x); // Throws if obj is not an instance of MyClass
  }
}
```

Bạn có thể dùng toán tử {{jsxref("Operators/in", "in")}} để thực hiện kiểm tra _branded check_ trước.

```js
class MyClass {
  #x = 0;
  static doSomething(obj) {
    if (!(#x in obj)) {
      return;
    }
    console.log(obj.#x);
  }
}
```

### Truy cập phần tử static trên lớp con

Nếu bạn có một [thuộc tính static private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements#private_static_fields), bạn chỉ có thể truy cập nó trên lớp khai báo nó, không phải trên các lớp con.

```js example-bad
class MyClass {
  static #x = 0;
  doSomething() {
    console.log(this.#x);
  }
}

class MySubClass extends MyClass {}

MySubClass.doSomething();
// TypeError: can't access private field: object is not the right class
```

Để sửa lỗi này, không bao giờ truy cập thuộc tính static private thông qua `this`. Thay vào đó, hãy luôn chỉ định rõ tên lớp.

```js example-good
class MyClass {
  static #x = 0;
  doSomething() {
    console.log(MyClass.#x);
  }
}
```

### Truy cập phần tử private trùng tên từ lớp khác

Khác với các thuộc tính string hay symbol thông thường, tên private không được chia sẻ giữa các lớp. Nếu bạn có một phần tử private cùng tên trong hai lớp, chúng vẫn không phải là cùng một phần tử, và bạn không thể truy cập phần tử private của lớp này từ lớp kia.

```js example-bad
class MyClass {
  #x = 0;
}

class MyOtherClass {
  #x = 1;
  doSomething(o) {
    console.log(o.#x);
  }
}

const obj = new MyClass();
new MyOtherClass().doSomething(obj);
// TypeError: can't access private field: object is not the right class
```

### Thêm phần tử private vào đối tượng không liên quan

Bạn không thể _thêm_ động các phần tử private vào các đối tượng không liên quan.

```js example-bad
class MyClass {
  #x = 0;
  static stamp(obj) {
    obj.#x = 1;
  }
}

MyClass.stamp({});
// TypeError: can't set private field: object is not the right class
```

Nếu bạn thực sự muốn làm điều này, hãy xem xét thủ thuật [return override](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements#returning_overriding_object). Tuy nhiên, nói chung, bạn có thể muốn dùng {{jsxref("WeakMap")}} thay thế.

```js example-good
class MyClass {
  static #objToX = new WeakMap();
  static stamp(obj) {
    MyClass.#objToX.set(obj, 1);
  }
}

MyClass.stamp({});
```

## Xem thêm

- [Lớp (Classes)](/en-US/docs/Web/JavaScript/Reference/Classes)
- [Phần tử private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements)
