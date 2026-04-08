---
title: for...in
slug: Web/JavaScript/Reference/Statements/for...in
page-type: javascript-statement
browser-compat: javascript.statements.for_in
sidebar: jssidebar
---

Câu lệnh **`for...in`** lặp lại trên tất cả [thuộc tính chuỗi có thể đếm được](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties) của một đối tượng (bỏ qua các thuộc tính được đánh dấu bằng [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol)), bao gồm các thuộc tính có thể đếm được kế thừa.

{{InteractiveExample("JavaScript Demo: for...in statement")}}

```js interactive-example
const object = { a: 1, b: 2, c: 3 };

for (const property in object) {
  console.log(`${property}: ${object[property]}`);
}

// Expected output:
// "a: 1"
// "b: 2"
// "c: 3"
```

## Cú pháp

```js-nolint
for (variable in object)
  statement
```

### Tham số

- `variable`
  - : Nhận tên thuộc tính chuỗi trong mỗi lần lặp. Có thể là khai báo với [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const), [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), hoặc [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var), hoặc đích [gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment) (ví dụ: biến đã khai báo trước đó, thuộc tính đối tượng, hoặc [mẫu destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring)). Các biến được khai báo bằng `var` không cục bộ với vòng lặp, tức là chúng nằm trong cùng phạm vi với vòng lặp `for...in`.
- `object`
  - : Đối tượng có các thuộc tính chuỗi có thể đếm được không phải symbol được lặp qua.
- `statement`
  - : Câu lệnh được thực thi trong mỗi lần lặp. Có thể tham chiếu đến `variable`. Bạn có thể sử dụng [câu lệnh block](/en-US/docs/Web/JavaScript/Reference/Statements/block) để thực thi nhiều câu lệnh.

## Mô tả

Vòng lặp sẽ lặp qua tất cả các thuộc tính có thể đếm được của chính đối tượng và những thuộc tính mà đối tượng kế thừa từ chuỗi prototype của nó (các thuộc tính của prototype gần hơn có ưu tiên hơn các prototype xa hơn).

Giống như các câu lệnh vòng lặp khác, bạn có thể sử dụng [câu lệnh điều khiển luồng](/en-US/docs/Web/JavaScript/Reference/Statements#control_flow) trong `statement`:

- {{jsxref("Statements/break", "break")}} dừng thực thi `statement` và đến câu lệnh đầu tiên sau vòng lặp.
- {{jsxref("Statements/continue", "continue")}} dừng thực thi `statement` và đến lần lặp tiếp theo của vòng lặp.

Vòng lặp `for...in` chỉ lặp qua các thuộc tính có thể đếm được, không phải symbol. Các đối tượng được tạo từ các constructor tích hợp như `Array` và `Object` có các thuộc tính không thể đếm được kế thừa từ `Array.prototype` và `Object.prototype`, chẳng hạn như phương thức {{jsxref("Array/indexOf", "indexOf()")}} của {{jsxref("Array")}} hoặc phương thức {{jsxref("Object/toString", "toString()")}} của {{jsxref("Object")}}, những thuộc tính này sẽ không được truy cập trong vòng lặp `for...in`.

Thứ tự duyệt, theo đặc tả ECMAScript hiện đại, được xác định rõ ràng và nhất quán giữa các implementation. Trong mỗi thành phần của chuỗi prototype, tất cả các khóa số nguyên không âm (những khóa có thể là chỉ số mảng) sẽ được duyệt trước theo thứ tự tăng dần theo giá trị, sau đó các khóa chuỗi khác theo thứ tự thời gian tăng dần của việc tạo thuộc tính.

Phần `variable` của `for...in` chấp nhận bất cứ thứ gì có thể đứng trước toán tử `=`. Bạn có thể dùng {{jsxref("Statements/const", "const")}} để khai báo biến miễn là nó không được tái gán trong thân vòng lặp (nó có thể thay đổi giữa các lần lặp, vì đó là hai biến riêng biệt). Nếu không, bạn có thể dùng {{jsxref("Statements/let", "let")}}. Bạn có thể dùng [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) để gán nhiều biến cục bộ, hoặc dùng accessor thuộc tính như `for (x.y in iterable)` để gán giá trị cho thuộc tính đối tượng. Tuy nhiên, {{jsxref("Statements/using", "using")}} và {{jsxref("Statements/await_using", "await using")}} không được phép, vì biến luôn là chuỗi hoặc symbol trong khi các khai báo này yêu cầu đối tượng disposable.

Một [cú pháp kế thừa](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#statements) cho phép khai báo `var` của biến vòng lặp có trình khởi tạo. Điều này ném ra [lỗi cú pháp](/en-US/docs/Web/JavaScript/Reference/Errors/Invalid_for-in_initializer) trong strict mode và bị bỏ qua trong non-strict mode.

### Thuộc tính bị xóa, thêm, hoặc thay đổi

`for...in` truy cập các khóa thuộc tính theo cách sau:

1. Trước tiên, nó lấy tất cả các khóa chuỗi riêng của đối tượng hiện tại, theo cách tương tự như {{jsxref("Object.getOwnPropertyNames()")}}.
2. Với mỗi khóa, nếu không có chuỗi nào có cùng giá trị đã được truy cập, [property descriptor sẽ được lấy](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Reflect/getOwnPropertyDescriptor) và thuộc tính chỉ được truy cập nếu nó có thể đếm được. Tuy nhiên, chuỗi thuộc tính này sẽ được đánh dấu là đã truy cập ngay cả khi nó không thể đếm được.
3. Sau đó, đối tượng hiện tại được thay thế bằng prototype của nó, và quá trình được lặp lại.

Điều này có nghĩa:

- Bất kỳ thuộc tính nào được thêm vào đối tượng đang được truy cập trong quá trình lặp sẽ không được truy cập, vì tất cả các thuộc tính riêng của đối tượng hiện tại đã được lưu trước đó.
- Nếu nhiều đối tượng trong chuỗi prototype có thuộc tính cùng tên, chỉ có cái đầu tiên mới được xem xét, và nó chỉ được truy cập nếu nó có thể đếm được. Nếu nó không thể đếm được, không có thuộc tính nào khác cùng tên cao hơn trong chuỗi prototype sẽ được truy cập, ngay cả khi chúng có thể đếm được.

Nhìn chung, tốt nhất là không nên thêm, sửa đổi, hoặc xóa thuộc tính khỏi đối tượng trong quá trình lặp, ngoại trừ thuộc tính đang được truy cập. Đặc tả cho phép implementation không tuân theo thuật toán trên trong một trong các trường hợp sau:

- Chuỗi prototype của đối tượng bị sửa đổi trong quá trình lặp.
- Một thuộc tính bị xóa khỏi đối tượng hoặc chuỗi prototype của nó trong quá trình lặp.
- Một thuộc tính được thêm vào chuỗi prototype của đối tượng trong quá trình lặp.
- Tính có thể đếm được của một thuộc tính bị thay đổi trong quá trình lặp.

Trong những trường hợp này, các implementation có thể hoạt động khác với những gì bạn mong đợi, hoặc thậm chí khác nhau giữa chúng.

### Lặp mảng và for...in

Các chỉ số mảng chỉ là các thuộc tính có thể đếm được với tên số nguyên và về mặt khác giống hệt các thuộc tính đối tượng thông thường. Vòng lặp `for...in` sẽ duyệt qua tất cả các khóa số nguyên trước khi duyệt các khóa khác, và theo thứ tự tăng dần nghiêm ngặt, làm cho hành vi của `for...in` gần với lặp mảng thông thường. Tuy nhiên, vòng lặp `for...in` sẽ trả về tất cả các thuộc tính có thể đếm được, kể cả những thuộc tính có tên không phải số nguyên và những thuộc tính được kế thừa. Không giống như `for...of`, `for...in` dùng enumeration thuộc tính thay vì iterator của mảng. Trong [sparse arrays](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), `for...of` sẽ truy cập các slot rỗng, nhưng `for...in` thì không.

Tốt hơn là nên sử dụng vòng lặp {{jsxref("Statements/for", "for")}} với chỉ số số, {{jsxref("Array.prototype.forEach()")}}, hoặc vòng lặp {{jsxref("Statements/for...of", "for...of")}}, vì chúng sẽ trả về chỉ số dưới dạng số thay vì chuỗi, và cũng tránh các thuộc tính không phải chỉ số.

### Chỉ lặp qua thuộc tính riêng

Nếu bạn chỉ muốn xem xét các thuộc tính gắn liền với chính đối tượng, chứ không phải prototype của nó, bạn có thể sử dụng một trong các kỹ thuật sau:

- {{jsxref("Object.keys()")}}
- {{jsxref("Object.getOwnPropertyNames()")}}

`Object.keys` sẽ trả về danh sách các thuộc tính chuỗi có thể đếm được riêng, trong khi `Object.getOwnPropertyNames` cũng sẽ chứa cả các thuộc tính không thể đếm được.

Nhiều hướng dẫn phong cách JavaScript và các linter khuyến nghị không nên sử dụng `for...in`, vì nó lặp qua toàn bộ chuỗi prototype, điều này hiếm khi là những gì người ta muốn, và có thể gây nhầm lẫn với vòng lặp `for...of` được sử dụng phổ biến hơn. `for...in` thực tế nhất là được sử dụng cho mục đích debug, là một cách dễ dàng để kiểm tra các thuộc tính của một đối tượng (bằng cách xuất ra console hoặc cách khác). Trong các tình huống mà đối tượng được sử dụng như các cặp key-value tạm thời, `for...in` cho phép bạn kiểm tra xem có khóa nào trong số đó chứa một giá trị cụ thể không.

## Ví dụ

### Sử dụng for...in

Vòng lặp `for...in` dưới đây lặp qua tất cả các thuộc tính có thể đếm được, không phải symbol của đối tượng và in ra một chuỗi tên thuộc tính và giá trị của chúng.

```js
const obj = { a: 1, b: 2, c: 3 };

for (const prop in obj) {
  console.log(`obj.${prop} = ${obj[prop]}`);
}

// Logs:
// "obj.a = 1"
// "obj.b = 2"
// "obj.c = 3"
```

### Lặp qua thuộc tính riêng

Hàm sau minh họa việc sử dụng {{jsxref("Object.hasOwn()")}}: các thuộc tính kế thừa không được hiển thị.

```js
const triangle = { a: 1, b: 2, c: 3 };

function ColoredTriangle() {
  this.color = "red";
}

ColoredTriangle.prototype = triangle;

const obj = new ColoredTriangle();

for (const prop in obj) {
  if (Object.hasOwn(obj, prop)) {
    console.log(`obj.${prop} = ${obj[prop]}`);
  }
}

// Logs:
// "obj.color = red"
```

### Sửa đổi đồng thời

> [!WARNING]
> Bạn không nên tự viết code như thế này. Nó chỉ được đưa vào đây để minh họa hành vi của `for...in` trong một số trường hợp đặc biệt.

Các thuộc tính được thêm vào đối tượng hiện tại trong quá trình lặp sẽ không bao giờ được truy cập:

```js
const obj = { a: 1, b: 2 };

for (const prop in obj) {
  console.log(`obj.${prop} = ${obj[prop]}`);
  obj.c = 3;
}

// Logs:
// obj.a = 1
// obj.b = 2
```

Các thuộc tính bị che khuất chỉ được truy cập một lần:

```js
const proto = { a: 1 };
const obj = { __proto__: proto, a: 2 };

for (const prop in obj) {
  console.log(`obj.${prop} = ${obj[prop]}`);
}

// Logs:
// obj.a = 2

Object.defineProperty(obj, "a", { enumerable: false });

for (const prop in obj) {
  console.log(`obj.${prop} = ${obj[prop]}`);
}
// Logs nothing, because the first "a" property visited is non-enumerable.
```

Ngoài ra, hãy xem xét các trường hợp sau, trong đó hành vi không được xác định và các implementation có xu hướng khác nhau so với thuật toán được chỉ định:

Thay đổi prototype trong quá trình lặp:

```js
const obj = { a: 1, b: 2 };

for (const prop in obj) {
  console.log(`obj.${prop} = ${obj[prop]}`);
  Object.setPrototypeOf(obj, { c: 3 });
}
```

Xóa thuộc tính trong quá trình lặp:

```js
const obj = { a: 1, b: 2, c: 3 };

// Deleting a property before it is visited
for (const prop in obj) {
  console.log(`obj.${prop} = ${obj[prop]}`);
  delete obj.c;
}

const obj2 = { a: 1, b: 2, c: 3 };

// Deleting a property after it is visited
for (const prop in obj2) {
  console.log(`obj2.${prop} = ${obj2[prop]}`);
  delete obj2.a;
}
```

Các thuộc tính có thể đếm được được thêm vào prototype trong quá trình lặp:

```js
const proto = {};
const obj = { __proto__: proto, a: 1, b: 2 };

for (const prop in obj) {
  console.log(`obj.${prop} = ${obj[prop]}`);
  proto.c = 3;
}
```

Thay đổi tính có thể đếm được của thuộc tính trong quá trình lặp:

```js
const obj = { a: 1, b: 2, c: 3 };

for (const prop in obj) {
  console.log(`obj.${prop} = ${obj[prop]}`);
  Object.defineProperty(obj, "c", { enumerable: false });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/for...of", "for...of")}}
- {{jsxref("Statements/for", "for")}}
- [Tính có thể đếm được và quyền sở hữu thuộc tính](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
- {{jsxref("Object.getOwnPropertyNames()")}}
- {{jsxref("Object.hasOwn()")}}
- {{jsxref("Array.prototype.forEach()")}}
