---
title: Object.create()
short-title: create()
slug: Web/JavaScript/Reference/Global_Objects/Object/create
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.create
sidebar: jsref
---

Phương thức tĩnh **`Object.create()`** tạo một đối tượng mới, sử dụng một đối tượng hiện có làm prototype của đối tượng mới được tạo.

{{InteractiveExample("JavaScript Demo: Object.create()", "taller")}}

```js interactive-example
const person = {
  isHuman: false,
  printIntroduction() {
    console.log(`My name is ${this.name}. Am I human? ${this.isHuman}`);
  },
};

const me = Object.create(person);

me.name = "Matthew"; // "name" là thuộc tính được đặt trên "me", nhưng không phải trên "person"
me.isHuman = true; // Các thuộc tính kế thừa có thể bị ghi đè

me.printIntroduction();
// Expected output: "My name is Matthew. Am I human? true"
```

## Cú pháp

```js-nolint
Object.create(proto)
Object.create(proto, propertiesObject)
```

### Tham số

- `proto`
  - : Đối tượng sẽ trở thành prototype của đối tượng mới được tạo.
- `propertiesObject` {{optional_inline}}
  - : Nếu được chỉ định và không phải {{jsxref("undefined")}}, một đối tượng có [các thuộc tính riêng có thể đếm](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties) chỉ định các property descriptor để thêm vào đối tượng mới được tạo, với các tên thuộc tính tương ứng. Các thuộc tính này tương ứng với tham số thứ hai của {{jsxref("Object.defineProperties()")}}.

### Giá trị trả về

Một đối tượng mới với đối tượng prototype và các thuộc tính đã chỉ định.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `proto` không phải là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) cũng không phải là một {{jsxref("Object")}}.

## Ví dụ

### Kế thừa kiểu cổ điển với Object.create()

Dưới đây là ví dụ về cách sử dụng `Object.create()` để thực hiện kế thừa kiểu cổ điển. Đây là kế thừa đơn, là tất cả những gì JavaScript hỗ trợ.

```js
// Shape - lớp cha
function Shape() {
  this.x = 0;
  this.y = 0;
}

// phương thức của lớp cha
Shape.prototype.move = function (x, y) {
  this.x += x;
  this.y += y;
  console.info("Shape moved.");
};

// Rectangle - lớp con
function Rectangle() {
  Shape.call(this); // gọi hàm tạo lớp cha.
}

// lớp con kế thừa lớp cha
Rectangle.prototype = Object.create(Shape.prototype, {
  // Nếu bạn không đặt Rectangle.prototype.constructor thành Rectangle,
  // nó sẽ lấy prototype.constructor của Shape (lớp cha).
  // Để tránh điều đó, chúng ta đặt prototype.constructor thành Rectangle (lớp con).
  constructor: {
    value: Rectangle,
    enumerable: false,
    writable: true,
    configurable: true,
  },
});

const rect = new Rectangle();

console.log("Is rect an instance of Rectangle?", rect instanceof Rectangle); // true
console.log("Is rect an instance of Shape?", rect instanceof Shape); // true
rect.move(1, 1); // In ra 'Shape moved.'
```

Lưu ý rằng có những điểm cần chú ý khi sử dụng `create()`, chẳng hạn như việc thêm lại thuộc tính [`constructor`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/constructor) để đảm bảo ngữ nghĩa đúng. Mặc dù `Object.create()` được cho là có hiệu năng tốt hơn so với việc thay đổi prototype bằng {{jsxref("Object.setPrototypeOf()")}}, sự khác biệt thực tế không đáng kể nếu không có instance nào được tạo và các truy cập thuộc tính chưa được tối ưu hóa. Trong code hiện đại, cú pháp [class](/en-US/docs/Web/JavaScript/Reference/Classes) nên được ưu tiên sử dụng trong mọi trường hợp.

### Sử dụng đối số propertiesObject với Object.create()

`Object.create()` cho phép kiểm soát chi tiết quá trình tạo đối tượng. [Cú pháp object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) thực ra là cú pháp rút gọn của `Object.create()`. Với `Object.create()`, chúng ta có thể tạo các đối tượng với prototype được chỉ định và một số thuộc tính. Lưu ý rằng tham số thứ hai ánh xạ các khóa đến _property descriptor_ — điều này có nghĩa là bạn cũng có thể kiểm soát khả năng đếm, cấu hình, v.v. của mỗi thuộc tính, điều mà bạn không thể làm trong object initializer.

```js
o = {};
// Tương đương với:
o = Object.create(Object.prototype);

o = Object.create(Object.prototype, {
  // foo là thuộc tính dữ liệu thông thường
  foo: {
    writable: true,
    configurable: true,
    value: "hello",
  },
  // bar là thuộc tính accessor
  bar: {
    configurable: false,
    get() {
      return 10;
    },
    set(value) {
      console.log("Setting `o.bar` to", value);
    },
  },
});

// Tạo một đối tượng mới có prototype là một đối tượng
// mới, rỗng và thêm một thuộc tính duy nhất 'p', có giá trị 42.
o = Object.create({}, { p: { value: 42 } });
```

Với `Object.create()`, chúng ta có thể tạo một đối tượng [với `null` làm prototype](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects). Cú pháp tương đương trong object initializer sẽ là khóa [`__proto__`](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#prototype_setter).

```js
o = Object.create(null);
// Tương đương với:
o = { __proto__: null };
```

Theo mặc định, các thuộc tính _không_ có thể ghi, đếm hoặc cấu hình.

```js
o.p = 24; // ném lỗi trong strict mode
o.p; // 42

o.q = 12;
for (const prop in o) {
  console.log(prop);
}
// 'q'

delete o.p;
// false; ném lỗi trong strict mode
```

Để chỉ định một thuộc tính với các thuộc tính giống như trong initializer, hãy chỉ định rõ ràng `writable`, `enumerable` và `configurable`.

```js
o2 = Object.create(
  {},
  {
    p: {
      value: 42,
      writable: true,
      enumerable: true,
      configurable: true,
    },
  },
);
// Không tương đương với:
// o2 = Object.create({ p: 42 })
// cái này sẽ tạo một đối tượng với prototype { p: 42 }
```

Bạn có thể sử dụng `Object.create()` để mô phỏng hành vi của toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new).

```js
function Constructor() {}
o = new Constructor();
// Tương đương với:
o = Object.create(Constructor.prototype);
```

Tất nhiên, nếu có code khởi tạo thực sự trong hàm `Constructor`, phương thức `Object.create()` không thể phản ánh điều đó.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.create` in `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- {{jsxref("Object.defineProperty()")}}
- {{jsxref("Object.defineProperties()")}}
- {{jsxref("Object.prototype.isPrototypeOf()")}}
- {{jsxref("Reflect.construct()")}}
- [Object.getPrototypeOf](https://johnresig.com/blog/objectgetprototypeof/) by John Resig (2008)
