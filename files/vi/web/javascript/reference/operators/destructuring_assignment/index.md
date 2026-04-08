---
title: Destructuring
slug: Web/JavaScript/Reference/Operators/Destructuring
page-type: javascript-language-feature
browser-compat: javascript.operators.destructuring
sidebar: jssidebar
---

Cú pháp **destructuring** là một cú pháp JavaScript cho phép giải nén các giá trị từ mảng, hoặc các thuộc tính từ object, thành các biến riêng lẻ. Nó có thể được dùng ở những vị trí nhận dữ liệu (chẳng hạn như phía bên trái của một phép gán, hoặc bất kỳ nơi nào tạo ra các ràng buộc định danh mới).

{{InteractiveExample("JavaScript Demo: Destructuring", "taller")}}

```js interactive-example
let a, b, rest;
[a, b] = [10, 20];

console.log(a);
// Expected output: 10

console.log(b);
// Expected output: 20

[a, b, ...rest] = [10, 20, 30, 40, 50];

console.log(rest);
// Expected output: Array [30, 40, 50]
```

## Cú pháp

```js-nolint
const [a, b] = array;
const [a, , b] = array;
const [a = aDefault, b] = array;
const [a, b, ...rest] = array;
const [a, , b, ...rest] = array;
const [a, b, ...{ pop, push }] = array;
const [a, b, ...[c, d]] = array;

const { a, b } = obj;
const { a: a1, b: b1 } = obj;
const { a: a1 = aDefault, b = bDefault } = obj;
const { a, b, ...rest } = obj;
const { a: a1, b: b1, ...rest } = obj;
const { [key]: a } = obj;

let a, b, a1, b1, c, d, rest, pop, push;
[a, b] = array;
[a, , b] = array;
[a = aDefault, b] = array;
[a, b, ...rest] = array;
[a, , b, ...rest] = array;
[a, b, ...{ pop, push }] = array;
[a, b, ...[c, d]] = array;

({ a, b } = obj); // parentheses are required
({ a: a1, b: b1 } = obj);
({ a: a1 = aDefault, b = bDefault } = obj);
({ a, b, ...rest } = obj);
({ a: a1, b: b1, ...rest } = obj);
```

## Mô tả

Biểu thức literal mảng và object cung cấp một cách dễ dàng để tạo ra các gói dữ liệu tạm thời (_ad hoc_).

```js
const arr = [a, b, c];
```

Destructuring sử dụng cú pháp tương tự nhưng áp dụng ở phía bên trái của phép gán. Nó thực hiện thao tác ngược lại so với khai báo mảng, bằng cách khai báo từng phần tử trong tập hợp như một biến riêng lẻ.

```js
const arr = [1, 2, 3];
const [a, b, c] = arr;
// a = 1, b = 2, c = 3
```

Đối với object, hãy so sánh hai cặp dòng dưới đây và xem cách chúng tương ứng với nhau trong từng cặp.

```js
const obj = { a, b, c };
const { a, b, c } = obj;
// Equivalent to:
// const a = obj.a, b = obj.b, c = obj.c;

const obj = { prop1: x, prop2: y, prop3: z };
const { prop1: x, prop2: y, prop3: z } = obj;
// Equivalent to:
// const x = obj.prop1, y = obj.prop2, z = obj.prop3;
```

Khả năng này tương tự như các tính năng có trong các ngôn ngữ như Perl và Python.

Để biết các tính năng riêng của destructuring mảng hay object, hãy tham khảo các [ví dụ](#ví-dụ) riêng lẻ dưới đây.

### Binding và assignment

Đối với cả destructuring object lẫn mảng, có hai loại mẫu destructuring: _mẫu {{Glossary("binding")}}_ và _mẫu assignment_, với các cú pháp hơi khác nhau.

Trong mẫu binding, mẫu bắt đầu bằng một từ khóa khai báo (`var`, `let`, hoặc `const`). Sau đó, mỗi thuộc tính riêng lẻ phải được gắn vào một biến hoặc được destructure thêm.

```js
const obj = { a: 1, b: { c: 2 } };
const {
  a,
  b: { c: d },
} = obj;
// Two variables are bound: `a` and `d`
```

Tất cả các biến dùng chung một khai báo, vì vậy nếu bạn muốn một số biến có thể gán lại còn một số thì chỉ đọc, bạn có thể phải destructure hai lần — một lần với `let`, một lần với `const`.

```js
const obj = { a: 1, b: { c: 2 } };
const { a } = obj; // a is constant
let {
  b: { c: d },
} = obj; // d is re-assignable
```

Trong nhiều cú pháp khác mà ngôn ngữ tự ràng buộc biến cho bạn, bạn có thể dùng mẫu destructuring binding. Bao gồm:

- Biến lặp của vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in), [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of), và [`for await...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of);
- Tham số [hàm](/en-US/docs/Web/JavaScript/Reference/Functions);
- Biến ràng buộc của khối [`catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch).

Trong mẫu assignment, mẫu không bắt đầu bằng từ khóa. Mỗi thuộc tính được destructure sẽ được gán cho một mục tiêu assignment — có thể đã được khai báo trước với `var` hoặc `let`, hoặc là thuộc tính của một object khác — nói chung là bất cứ thứ gì có thể xuất hiện ở phía bên trái của biểu thức gán.

```js
const numbers = [];
const obj = { a: 1, b: 2 };
({ a: numbers[0], b: numbers[1] } = obj);
// The properties `a` and `b` are assigned to properties of `numbers`
```

> [!NOTE]
> Các dấu ngoặc đơn `( ... )` xung quanh câu lệnh gán là bắt buộc khi sử dụng destructuring literal object mà không có khai báo.
>
> `{ a, b } = { a: 1, b: 2 }` không phải là cú pháp độc lập hợp lệ, vì `{ a, b }` ở phía bên trái được coi là một khối chứ không phải literal object theo quy tắc của [câu lệnh biểu thức](/en-US/docs/Web/JavaScript/Reference/Statements/Expression_statement). Tuy nhiên, `({ a, b } = { a: 1, b: 2 })` là hợp lệ, cũng như `const { a, b } = { a: 1, b: 2 }`.
>
> Nếu phong cách viết mã của bạn không bao gồm dấu chấm phẩy ở cuối, biểu thức `( ... )` cần được đặt trước bởi một dấu chấm phẩy, hoặc nó có thể được dùng để gọi một hàm trên dòng trước.

Lưu ý rằng _mẫu binding_ tương đương của đoạn mã trên không phải là cú pháp hợp lệ:

```js-nolint example-bad
const numbers = [];
const obj = { a: 1, b: 2 };
const { a: numbers[0], b: numbers[1] } = obj;

// This is equivalent to:
//   const numbers[0] = obj.a;
//   const numbers[1] = obj.b;
// Which definitely is not valid.
```

Bạn chỉ có thể dùng mẫu assignment làm phía bên trái của toán tử [gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment). Bạn không thể dùng chúng với các toán tử gán hợp chất như `+=` hay `*=`.

### Giá trị mặc định

Mỗi thuộc tính được destructure có thể có một _giá trị mặc định_. Giá trị mặc định được dùng khi thuộc tính không tồn tại, hoặc có giá trị là `undefined`. Nó không được dùng nếu thuộc tính có giá trị là `null`.

```js
const [a = 1] = []; // a is 1
const { b = 2 } = { b: undefined }; // b is 2
const { c = 2 } = { c: null }; // c is null
```

Giá trị mặc định có thể là bất kỳ biểu thức nào. Nó chỉ được đánh giá khi cần thiết.

```js
const { b = console.log("hey") } = { b: 2 };
// Does not log anything, because `b` is defined and there's no need
// to evaluate the default value.
```

### Rest properties và rest elements

Bạn có thể kết thúc một mẫu destructuring bằng rest property `...rest`. Đối với destructuring mảng, nó thu thập các phần tử còn lại của iterable vào một mảng mới gọi là `rest` (hoặc bất kỳ tên nào bạn đặt). Đối với destructuring object, nó sao chép tất cả các thuộc tính own có thể liệt kê của object mà chưa được chọn bởi mẫu destructuring vào một object mới gọi là `rest`.

Chính xác hơn, cú pháp `...rest` được gọi là "rest elements" trong destructuring mảng và "rest properties" trong destructuring object, nhưng chúng ta thường gọi chung là "rest property".

```js
const { a, ...others } = { a: 1, b: 2, c: 3 };
console.log(others); // { b: 2, c: 3 }

const [first, ...others2] = [1, 2, 3];
console.log(others2); // [2, 3]
```

Rest property phải là phần tử cuối cùng trong mẫu, và không được có dấu phẩy ở cuối.

```js-nolint example-bad
const [a, ...b,] = [1, 2, 3];

// SyntaxError: rest element may not have a trailing comma
// Always consider using rest operator as the last element
```

## Ví dụ

### Destructuring mảng

#### Gán biến cơ bản

```js
const foo = ["one", "two", "three"];

const [red, yellow, green] = foo;
console.log(red); // "one"
console.log(yellow); // "two"
console.log(green); // "three"
```

#### Destructuring với nhiều phần tử hơn nguồn

Trong destructuring mảng từ một mảng có độ dài _N_ được chỉ định ở phía bên phải của phép gán, nếu số biến được chỉ định ở phía bên trái lớn hơn _N_, chỉ _N_ biến đầu tiên được gán giá trị. Giá trị của các biến còn lại sẽ là undefined.

```js
const foo = ["one", "two"];

const [red, yellow, green, blue] = foo;
console.log(red); // "one"
console.log(yellow); // "two"
console.log(green); // undefined
console.log(blue); // undefined
```

#### Hoán đổi biến

Giá trị của hai biến có thể được hoán đổi trong một biểu thức destructuring duy nhất.

Không có destructuring, việc hoán đổi hai giá trị cần một biến tạm thời (hoặc, trong một số ngôn ngữ cấp thấp, dùng [thủ thuật XOR-swap](https://en.wikipedia.org/wiki/XOR_swap_algorithm)).

```js
let a = 1;
let b = 3;

[a, b] = [b, a];
console.log(a); // 3
console.log(b); // 1

const arr = [1, 2, 3];
[arr[2], arr[1]] = [arr[1], arr[2]];
console.log(arr); // [1, 3, 2]
```

#### Phân tích mảng được trả về từ hàm

Luôn có thể trả về một mảng từ hàm. Destructuring có thể làm cho việc làm việc với giá trị trả về là mảng trở nên súc tích hơn.

Trong ví dụ này, `f()` trả về các giá trị `[1, 2]` làm đầu ra, có thể được phân tích trong một dòng với destructuring.

```js
function f() {
  return [1, 2];
}

const [a, b] = f();
console.log(a); // 1
console.log(b); // 2
```

#### Bỏ qua một số giá trị được trả về

Bạn có thể bỏ qua các giá trị trả về mà bạn không quan tâm:

```js
function f() {
  return [1, 2, 3];
}

const [a, , b] = f();
console.log(a); // 1
console.log(b); // 3

const [c] = f();
console.log(c); // 1
```

Bạn cũng có thể bỏ qua tất cả các giá trị được trả về:

```js
[, ,] = f();
```

Dù vậy, trong trường hợp này, có lẽ sẽ rõ ràng hơn nếu chỉ gọi hàm mà không dùng destructuring. Bạn không cần phải sử dụng giá trị trả về.

#### Dùng mẫu binding làm rest property

Rest property của destructuring mảng có thể là một mẫu binding mảng hoặc object khác. Destructuring bên trong sẽ destructure từ mảng được tạo ra sau khi thu thập các phần tử rest, vì vậy bạn không thể truy cập bất kỳ thuộc tính nào có trong iterable gốc theo cách này.

```js
const [a, b, ...{ length }] = [1, 2, 3];
console.log(a, b, length); // 1 2 1
```

```js
const [a, b, ...[c, d]] = [1, 2, 3, 4];
console.log(a, b, c, d); // 1 2 3 4
```

Các mẫu binding này thậm chí có thể lồng nhau, miễn là mỗi rest property là phần tử cuối cùng trong danh sách.

```js
const [a, b, ...[c, d, ...[e, f]]] = [1, 2, 3, 4, 5, 6];
console.log(a, b, c, d, e, f); // 1 2 3 4 5 6
```

Mặt khác, destructuring object chỉ có thể có một định danh làm rest property.

```js-nolint example-bad
const { a, ...{ b } } = { a: 1, b: 2 };
// SyntaxError: `...` must be followed by an identifier in declaration contexts

let a, b;
({ a, ...{ b } } = { a: 1, b: 2 });
// SyntaxError: `...` must be followed by an assignable reference in assignment contexts
```

#### Giải nén giá trị từ kết quả khớp regular expression

Khi phương thức [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) của regular expression tìm thấy một kết quả khớp, nó trả về một mảng chứa đầu tiên là toàn bộ phần khớp của chuỗi, rồi sau đó là các phần của chuỗi khớp với mỗi nhóm có dấu ngoặc trong regular expression. Destructuring cho phép bạn giải nén các phần từ mảng này một cách dễ dàng, bỏ qua kết quả khớp đầy đủ nếu không cần.

```js
function parseProtocol(url) {
  const parsedURL = /^(\w+):\/\/([^/]+)\/(.*)$/.exec(url);
  if (!parsedURL) {
    return false;
  }
  console.log(parsedURL);
  // ["https://developer.mozilla.org/en-US/docs/Web/JavaScript",
  // "https", "developer.mozilla.org", "en-US/docs/Web/JavaScript"]

  const [, protocol, fullHost, fullPath] = parsedURL;
  return protocol;
}

console.log(
  parseProtocol("https://developer.mozilla.org/en-US/docs/Web/JavaScript"),
);
// "https"
```

#### Dùng destructuring mảng trên bất kỳ iterable nào

Destructuring mảng gọi [giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) của phía bên phải. Do đó, bất kỳ iterable nào, không nhất thiết phải là mảng, đều có thể được destructure.

```js
const [a, b] = new Map([
  [1, 2],
  [3, 4],
]);
console.log(a, b); // [1, 2] [3, 4]
```

Các giá trị không phải iterable không thể được destructure như mảng.

```js example-bad
const obj = { 0: "a", 1: "b", length: 2 };
const [a, b] = obj;
// TypeError: obj is not iterable
```

Các iterable chỉ được duyệt cho đến khi tất cả các binding được gán.

```js
const obj = {
  *[Symbol.iterator]() {
    for (const v of [0, 1, 2, 3]) {
      console.log(v);
      yield v;
    }
  },
};
const [a, b] = obj; // Only logs 0 and 1
```

Rest binding được đánh giá sớm (eagerly) và tạo ra một mảng mới, thay vì dùng lại iterable cũ.

```js
const obj = {
  *[Symbol.iterator]() {
    for (const v of [0, 1, 2, 3]) {
      console.log(v);
      yield v;
    }
  },
};
const [a, b, ...rest] = obj; // Logs 0 1 2 3
console.log(rest); // [2, 3] (an array)
```

### Destructuring object

#### Gán cơ bản

```js
const user = {
  id: 42,
  isVerified: true,
};

const { id, isVerified } = user;

console.log(id); // 42
console.log(isVerified); // true
```

#### Gán vào tên biến mới

Một thuộc tính có thể được giải nén từ object và gán cho một biến với tên khác so với tên thuộc tính của object.

```js
const o = { p: 42, q: true };
const { p: foo, q: bar } = o;

console.log(foo); // 42
console.log(bar); // true
```

Ở đây, ví dụ, `const { p: foo } = o` lấy từ object `o` thuộc tính có tên `p` và gán nó cho một biến cục bộ có tên `foo`.

#### Gán vào tên biến mới và cung cấp giá trị mặc định

Một thuộc tính có thể đồng thời:

- Được giải nén từ object và gán cho một biến với tên khác.
- Được gán một giá trị mặc định trong trường hợp giá trị được giải nén là `undefined`.

```js
const { a: aa = 10, b: bb = 5 } = { a: 3 };

console.log(aa); // 3
console.log(bb); // 5
```

#### Giải nén thuộc tính từ object được truyền làm tham số hàm

Các object được truyền vào tham số hàm cũng có thể được giải nén thành các biến, sau đó có thể được truy cập trong thân hàm.
Giống như với gán object, cú pháp destructuring cho phép biến mới có cùng tên hoặc tên khác so với thuộc tính gốc, và cho phép gán giá trị mặc định cho trường hợp object gốc không định nghĩa thuộc tính đó.

Xem xét object này, chứa thông tin về một người dùng.

```js
const user = {
  id: 42,
  displayName: "jdoe",
  fullName: {
    firstName: "Jane",
    lastName: "Doe",
  },
};
```

Ở đây chúng ta cho thấy cách giải nén một thuộc tính của object được truyền vào thành một biến có cùng tên.
Giá trị tham số `{ id }` chỉ ra rằng thuộc tính `id` của object được truyền vào hàm sẽ được giải nén thành một biến có cùng tên, và có thể được sử dụng bên trong hàm.

```js
function userId({ id }) {
  return id;
}

console.log(userId(user)); // 42
```

Bạn có thể định nghĩa tên của biến được giải nén.
Ở đây chúng ta giải nén thuộc tính có tên `displayName`, và đổi tên nó thành `dname` để dùng trong thân hàm.

```js
function userDisplayName({ displayName: dname }) {
  return dname;
}

console.log(userDisplayName(user)); // "jdoe"
```

Các object lồng nhau cũng có thể được giải nén.
Ví dụ dưới đây cho thấy thuộc tính `fullname.firstName` được giải nén thành một biến có tên `name`.

```js
function whois({ displayName, fullName: { firstName: name } }) {
  return `${displayName} is ${name}`;
}

console.log(whois(user)); // "jdoe is Jane"
```

#### Đặt giá trị mặc định cho tham số hàm

Giá trị mặc định có thể được chỉ định bằng `=`, và sẽ được dùng làm giá trị biến nếu thuộc tính được chỉ định không tồn tại trong object được truyền vào.

Dưới đây là hàm với kích thước mặc định là `'big'`, tọa độ mặc định là `x: 0, y: 0` và bán kính mặc định là 25.

```js
function drawChart({
  size = "big",
  coords = { x: 0, y: 0 },
  radius = 25,
} = {}) {
  console.log(size, coords, radius);
  // do some chart drawing
}

drawChart({
  coords: { x: 18, y: 30 },
  radius: 30,
});
```

Trong chữ ký hàm `drawChart` ở trên, phía bên trái được destructure có giá trị mặc định là một object rỗng `= {}`.

Bạn cũng có thể viết hàm mà không có giá trị mặc định đó. Tuy nhiên, nếu bạn bỏ giá trị mặc định đó, hàm sẽ yêu cầu ít nhất một đối số được cung cấp khi gọi, trong khi với dạng hiện tại, bạn có thể gọi `drawChart()` mà không cần cung cấp tham số nào. Nếu không, bạn cần cung cấp ít nhất một object literal rỗng.

Để biết thêm thông tin, xem [Tham số mặc định > Tham số destructured với gán giá trị mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters#destructured_parameter_with_default_value_assignment).

#### Destructuring object và mảng lồng nhau

```js
const metadata = {
  title: "Scratchpad",
  translations: [
    {
      locale: "de",
      localizationTags: [],
      lastEdit: "2014-04-14T08:43:37",
      url: "/de/docs/Tools/Scratchpad",
      title: "JavaScript-Umgebung",
    },
  ],
  url: "/en-US/docs/Tools/Scratchpad",
};

const {
  title: englishTitle, // rename
  translations: [
    {
      title: localeTitle, // rename
    },
  ],
} = metadata;

console.log(englishTitle); // "Scratchpad"
console.log(localeTitle); // "JavaScript-Umgebung"
```

#### Vòng lặp for...of và destructuring

```js
const people = [
  {
    name: "Mike Smith",
    family: {
      mother: "Jane Smith",
      father: "Harry Smith",
      sister: "Samantha Smith",
    },
    age: 35,
  },
  {
    name: "Tom Jones",
    family: {
      mother: "Norah Jones",
      father: "Richard Jones",
      brother: "Howard Jones",
    },
    age: 25,
  },
];

for (const {
  name: n,
  family: { father: f },
} of people) {
  console.log(`Name: ${n}, Father: ${f}`);
}

// "Name: Mike Smith, Father: Harry Smith"
// "Name: Tom Jones, Father: Richard Jones"
```

#### Tên thuộc tính object được tính toán và destructuring

Tên thuộc tính được tính toán, như trong [literal object](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#computed_property_names), có thể được dùng với destructuring.

```js
const key = "z";
const { [key]: foo } = { z: "bar" };

console.log(foo); // "bar"
```

#### Định danh JavaScript không hợp lệ làm tên thuộc tính

Destructuring có thể được dùng với các tên thuộc tính không phải là {{Glossary("Identifier", "định danh")}} JavaScript hợp lệ bằng cách cung cấp một định danh thay thế hợp lệ.

```js
const foo = { "fizz-buzz": true };
const { "fizz-buzz": fizzBuzz } = foo;

console.log(fizzBuzz); // true
```

### Destructuring các giá trị kiểu nguyên thủy

Destructuring object gần tương đương với [truy cập thuộc tính](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors). Điều này có nghĩa là nếu bạn cố gắng destructure một giá trị kiểu nguyên thủy, giá trị sẽ được bọc vào object wrapper tương ứng và thuộc tính được truy cập trên object wrapper đó.

```js
const { a, toFixed } = 1;
console.log(a, toFixed); // undefined ƒ toFixed() { [native code] }
```

Giống như truy cập thuộc tính, destructuring `null` hoặc `undefined` sẽ ném ra {{jsxref("TypeError")}}.

```js example-bad
const { a } = undefined; // TypeError: Cannot destructure property 'a' of 'undefined' as it is undefined.
const { b } = null; // TypeError: Cannot destructure property 'b' of 'null' as it is null.
```

Điều này xảy ra ngay cả khi mẫu rỗng.

```js example-bad
const {} = null; // TypeError: Cannot destructure 'null' as it is null.
```

#### Kết hợp destructuring mảng và object

Destructuring mảng và object có thể kết hợp với nhau. Giả sử bạn muốn lấy phần tử thứ ba trong mảng `props` bên dưới, rồi lấy thuộc tính `name` trong object, bạn có thể làm như sau:

```js
const props = [
  { id: 1, name: "Fizz" },
  { id: 2, name: "Buzz" },
  { id: 3, name: "FizzBuzz" },
];

const [, , { name }] = props;

console.log(name); // "FizzBuzz"
```

#### Chuỗi prototype được tra cứu khi object bị destructure

Khi destructure một object, nếu một thuộc tính không được tìm thấy trực tiếp trên object, việc tra cứu sẽ tiếp tục dọc theo chuỗi prototype.

```js
const obj = {
  self: "123",
  __proto__: {
    prot: "456",
  },
};
const { self, prot } = obj;

console.log(self); // "123"
console.log(prot); // "456"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Toán tử gán](/en-US/docs/Web/JavaScript/Reference/Operators#assignment_operators)
- [ES6 in Depth: Destructuring](https://hacks.mozilla.org/2015/05/es6-in-depth-destructuring/) trên hacks.mozilla.org (2015)
