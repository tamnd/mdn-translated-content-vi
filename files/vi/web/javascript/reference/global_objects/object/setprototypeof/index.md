---
title: Object.setPrototypeOf()
short-title: setPrototypeOf()
slug: Web/JavaScript/Reference/Global_Objects/Object/setPrototypeOf
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.setPrototypeOf
sidebar: jsref
---

Phương thức tĩnh **`Object.setPrototypeOf()`** đặt prototype (tức là thuộc tính nội tại `[[Prototype]]`) của một đối tượng được chỉ định thành một đối tượng khác hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

> [!WARNING]
> Việc thay đổi `[[Prototype]]` của một đối tượng, do bản chất của cách các JavaScript engine hiện đại tối ưu hóa việc truy cập thuộc tính, hiện tại là một phép toán rất chậm trong mọi trình duyệt và JavaScript engine. Ngoài ra, tác động của việc thay đổi kế thừa là tinh tế và lan rộng, và không chỉ giới hạn ở thời gian thực hiện câu lệnh `Object.setPrototypeOf(...)`, mà có thể mở rộng đến **_bất kỳ_** code nào có quyền truy cập vào bất kỳ đối tượng nào có `[[Prototype]]` bị thay đổi. Bạn có thể đọc thêm tại [JavaScript engine fundamentals: optimizing prototypes](https://mathiasbynens.be/notes/prototypes).
>
> Vì tính năng này là một phần của ngôn ngữ, nó vẫn là trách nhiệm của các nhà phát triển engine để triển khai tính năng đó một cách hiệu quả (lý tưởng nhất). Cho đến khi các nhà phát triển engine giải quyết vấn đề này, nếu bạn quan tâm đến hiệu suất, bạn nên tránh đặt `[[Prototype]]` của đối tượng. Thay vào đó, hãy tạo đối tượng mới với `[[Prototype]]` mong muốn bằng {{jsxref("Object.create()")}}.

{{InteractiveExample("JavaScript Demo: Object.setPrototypeOf()")}}

```js interactive-example
const obj = {};
const parent = { foo: "bar" };

console.log(obj.foo);
// Expected output: undefined

Object.setPrototypeOf(obj, parent);

console.log(obj.foo);
// Expected output: "bar"
```

## Cú pháp

```js-nolint
Object.setPrototypeOf(obj, prototype)
```

### Tham số

- `obj`
  - : Đối tượng cần được đặt prototype.
- `prototype`
  - : Prototype mới của đối tượng (một đối tượng hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null)).

### Giá trị trả về

Đối tượng được chỉ định.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - Tham số `obj` là `undefined` hoặc `null`.
    - Tham số `obj` là [không thể mở rộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isExtensible), hoặc là [đối tượng exotic có prototype bất biến](https://tc39.es/ecma262/multipage/ordinary-and-exotic-objects-behaviours.html#sec-immutable-prototype-exotic-objects), chẳng hạn như `Object.prototype` hoặc [`window`](/en-US/docs/Web/API/Window). Tuy nhiên, lỗi không được ném nếu prototype mới cùng giá trị với prototype ban đầu của `obj`.
    - Tham số `prototype` không phải là đối tượng hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

## Mô tả

`Object.setPrototypeOf()` thường được coi là cách đúng đắn để đặt prototype của đối tượng. Bạn nên luôn sử dụng nó thay cho accessor đã lỗi thời [`Object.prototype.__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto).

Nếu tham số `obj` không phải là đối tượng (ví dụ: số, chuỗi, v.v.), phương thức này không làm gì cả — không ép kiểu thành đối tượng hay cố đặt prototype của nó — và trả về trực tiếp `obj` như một giá trị nguyên thủy. Nếu `prototype` là cùng giá trị với prototype của `obj`, thì `obj` được trả về trực tiếp, không gây `TypeError` ngay cả khi `obj` có prototype bất biến.

Vì lo ngại về bảo mật, có một số đối tượng dựng sẵn được thiết kế để có _prototype bất biến_. Điều này ngăn [các cuộc tấn công ô nhiễm prototype](/en-US/docs/Web/Security/Attacks/Prototype_pollution), đặc biệt là [những cuộc tấn công liên quan đến proxy](https://github.com/tc39/ecma262/issues/272). Ngôn ngữ cốt lõi chỉ chỉ định `Object.prototype` là đối tượng exotic có prototype bất biến, với prototype luôn là `null`. Trong trình duyệt, [`window`](/en-US/docs/Web/API/Window) và [`location`](/en-US/docs/Web/API/Window/location) là hai ví dụ phổ biến khác.

```js
Object.isExtensible(Object.prototype); // true; bạn có thể thêm thuộc tính
Object.setPrototypeOf(Object.prototype, {}); // TypeError: Immutable prototype object '#<Object>' cannot have their prototype set
Object.setPrototypeOf(Object.prototype, null); // Không có lỗi; prototype của `Object.prototype` đã là `null`
```

## Ví dụ

### Kế thừa giả cổ điển sử dụng Object.setPrototypeOf()

Kế thừa trong JS sử dụng class.

```js
class Human {}
class SuperHero extends Human {}

const superMan = new SuperHero();
```

Tuy nhiên, nếu chúng ta muốn triển khai subclass mà không sử dụng `class`, chúng ta có thể làm như sau:

```js
function Human(name, level) {
  this.name = name;
  this.level = level;
}

function SuperHero(name, level) {
  Human.call(this, name, level);
}

Object.setPrototypeOf(SuperHero.prototype, Human.prototype);

// Đặt `[[Prototype]]` của `SuperHero.prototype`
// thành `Human.prototype`
// Để thiết lập chuỗi kế thừa prototype

Human.prototype.speak = function () {
  return `${this.name} says hello.`;
};

SuperHero.prototype.fly = function () {
  return `${this.name} is flying.`;
};

const superMan = new SuperHero("Clark Kent", 1);

console.log(superMan.fly());
console.log(superMan.speak());
```

Sự tương đồng giữa kế thừa cổ điển (với class) và kế thừa giả cổ điển (với thuộc tính `prototype` của constructor) như ở trên được đề cập trong [Inheritance chains](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain#building_longer_inheritance_chains).

Vì thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype) của constructor hàm có thể ghi, bạn có thể gán lại nó thành đối tượng mới được tạo bằng [`Object.create()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create#classical_inheritance_with_object.create) để đạt được cùng chuỗi kế thừa. Có những lưu ý cần chú ý khi dùng `create()`, chẳng hạn như nhớ thêm lại thuộc tính [`constructor`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/constructor).

Trong ví dụ bên dưới, cũng dùng class, `SuperHero` được kế thừa từ `Human` mà không dùng `extends` bằng cách dùng `setPrototypeOf()` thay thế.

> [!WARNING]
> Không nên dùng `setPrototypeOf()` thay cho `extends` vì lý do hiệu suất và khả năng đọc hiểu.

```js
class Human {}
class SuperHero {}

// Đặt các thuộc tính instance
Object.setPrototypeOf(SuperHero.prototype, Human.prototype);

// Kết nối các thuộc tính static
Object.setPrototypeOf(SuperHero, Human);

const superMan = new SuperHero();
```

Subclassing mà không dùng `extends` được đề cập trong [ES-6 subclassing](https://hacks.mozilla.org/2015/08/es6-in-depth-subclassing/).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Object.setPrototypeOf` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- {{jsxref("Reflect.setPrototypeOf()")}}
- {{jsxref("Object.prototype.isPrototypeOf()")}}
- {{jsxref("Object.getPrototypeOf()")}}
- [`Object.prototype.__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto)
- [Inheritance chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain#building_longer_inheritance_chains)
- [ES6 In Depth: Subclassing](https://hacks.mozilla.org/2015/08/es6-in-depth-subclassing/) on hacks.mozilla.org (2015)
