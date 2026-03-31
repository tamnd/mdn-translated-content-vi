---
title: Equality comparisons and sameness
slug: Web/JavaScript/Guide/Equality_comparisons_and_sameness
page-type: guide
sidebar: jssidebar
---

JavaScript cung cấp ba phép toán so sánh giá trị khác nhau:

- [`===`](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) — strict equality (ba dấu bằng)
- [`==`](/en-US/docs/Web/JavaScript/Reference/Operators/Equality) — loose equality (hai dấu bằng)
- [`Object.is()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is)

Phép toán nào bạn chọn phụ thuộc vào loại so sánh bạn muốn thực hiện. Tóm tắt:

- Double equals (`==`) sẽ thực hiện chuyển đổi kiểu khi so sánh hai giá trị, và xử lý `NaN`, `-0`, và `+0` theo cách đặc biệt để tuân thủ IEEE 754 (vì vậy `NaN != NaN`, và `-0 == +0`);
- Triple equals (`===`) thực hiện so sánh giống như double equals (bao gồm xử lý đặc biệt cho `NaN`, `-0`, và `+0`) nhưng không có chuyển đổi kiểu; nếu các kiểu khác nhau, `false` được trả về.
- `Object.is()` không thực hiện chuyển đổi kiểu và không xử lý đặc biệt cho `NaN`, `-0`, và `+0` (cho nó hành vi giống như `===` ngoại trừ những giá trị số đặc biệt đó).

Chúng tương ứng với ba trong bốn thuật toán so sánh bằng trong JavaScript:

- [IsLooselyEqual](https://tc39.es/ecma262/multipage/abstract-operations.html#sec-islooselyequal): `==`
- [IsStrictlyEqual](https://tc39.es/ecma262/multipage/abstract-operations.html#sec-isstrictlyequal): `===`
- [SameValue](https://tc39.es/ecma262/multipage/abstract-operations.html#sec-samevalue): `Object.is()`
- [SameValueZero](https://tc39.es/ecma262/multipage/abstract-operations.html#sec-samevaluezero): được sử dụng bởi nhiều thao tác tích hợp

Lưu ý rằng sự khác biệt giữa tất cả chúng liên quan đến cách xử lý các giá trị nguyên thủy (primitive); không phép nào so sánh xem các tham số có cấu trúc giống nhau về mặt khái niệm không. Đối với bất kỳ đối tượng không phải nguyên thủy `x` và `y` nào có cùng cấu trúc nhưng là các đối tượng riêng biệt, tất cả các hình thức trên sẽ trả về `false`.

## Strict equality sử dụng ===

Strict equality so sánh hai giá trị để kiểm tra bằng nhau. Không có giá trị nào bị chuyển đổi ngầm sang giá trị khác trước khi so sánh. Nếu các giá trị có kiểu khác nhau, chúng được coi là không bằng nhau. Nếu các giá trị có cùng kiểu, không phải là số, và có cùng giá trị, chúng được coi là bằng nhau. Cuối cùng, nếu cả hai giá trị đều là số, chúng được coi là bằng nhau nếu cả hai không phải `NaN` và có cùng giá trị, hoặc nếu một là `+0` và một là `-0`.

```js
const num = 0;
const obj = new String("0");
const str = "0";

console.log(num === num); // true
console.log(obj === obj); // true
console.log(str === str); // true

console.log(num === obj); // false
console.log(num === str); // false
console.log(obj === str); // false
console.log(null === undefined); // false
console.log(obj === null); // false
console.log(obj === undefined); // false
```

Strict equality gần như luôn là phép so sánh đúng để sử dụng. Đối với tất cả các giá trị trừ số, nó sử dụng ngữ nghĩa hiển nhiên: một giá trị chỉ bằng chính nó. Đối với số, nó sử dụng ngữ nghĩa hơi khác để bỏ qua hai trường hợp biên khác nhau. Trường hợp đầu tiên là số thực dấu phẩy động có thể có dấu dương hoặc âm. Điều này hữu ích trong việc biểu diễn một số nghiệm toán học, nhưng vì hầu hết các tình huống không quan tâm đến sự khác biệt giữa `+0` và `-0`, strict equality coi chúng là cùng một giá trị. Trường hợp thứ hai là dấu phẩy động bao gồm khái niệm về giá trị không phải là số, `NaN`, để biểu diễn nghiệm của một số bài toán toán học không xác định: ví dụ, âm vô cực cộng với dương vô cực. Strict equality coi `NaN` là không bằng bất kỳ giá trị nào khác — kể cả chính nó. (Trường hợp duy nhất mà `(x !== x)` là `true` là khi `x` là `NaN`.)

Ngoài `===`, strict equality cũng được sử dụng bởi các phương thức tìm kiếm chỉ mục mảng bao gồm [`Array.prototype.indexOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf), [`Array.prototype.lastIndexOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/lastIndexOf), [`TypedArray.prototype.indexOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/indexOf), [`TypedArray.prototype.lastIndexOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/lastIndexOf), và khớp [`case`](/en-US/docs/Web/JavaScript/Reference/Statements/switch). Điều này có nghĩa là bạn không thể dùng `indexOf(NaN)` để tìm chỉ mục của giá trị `NaN` trong mảng, hoặc dùng `NaN` làm giá trị `case` trong câu lệnh `switch` và khớp với bất kỳ thứ gì.

```js
console.log([NaN].indexOf(NaN)); // -1
switch (NaN) {
  case NaN:
    console.log("Surprise"); // Không có gì được ghi
}
```

## Loose equality sử dụng ==

Loose equality có tính _đối xứng_: `A == B` luôn có ngữ nghĩa giống hệt `B == A` với mọi giá trị của `A` và `B` (ngoại trừ thứ tự của các chuyển đổi được áp dụng). Hành vi thực hiện loose equality sử dụng `==` như sau:

1. Nếu các toán hạng có cùng kiểu, chúng được so sánh như sau:
   - Object: trả về `true` chỉ khi cả hai toán hạng tham chiếu đến cùng một đối tượng.
   - String: trả về `true` chỉ khi cả hai toán hạng có các ký tự giống nhau theo cùng thứ tự.
   - Number: trả về `true` chỉ khi cả hai toán hạng có cùng giá trị. `+0` và `-0` được coi là cùng giá trị. Nếu một trong các toán hạng là `NaN`, trả về `false`; vì vậy `NaN` không bao giờ bằng `NaN`.
   - Boolean: trả về `true` chỉ khi cả hai toán hạng đều là `true` hoặc đều là `false`.
   - BigInt: trả về `true` chỉ khi cả hai toán hạng có cùng giá trị.
   - Symbol: trả về `true` chỉ khi cả hai toán hạng tham chiếu đến cùng một symbol.
2. Nếu một trong các toán hạng là `null` hoặc `undefined`, toán hạng kia cũng phải là `null` hoặc `undefined` để trả về `true`. Ngược lại, trả về `false`.
3. Nếu một trong các toán hạng là object và toán hạng kia là primitive, [chuyển đổi object thành primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion).
4. Ở bước này, cả hai toán hạng được chuyển đổi thành primitive (một trong String, Number, Boolean, Symbol và BigInt). Phần còn lại của quá trình chuyển đổi được thực hiện theo từng trường hợp.
   - Nếu chúng cùng kiểu, so sánh theo bước 1.
   - Nếu một trong các toán hạng là Symbol nhưng toán hạng kia không phải, trả về `false`.
   - Nếu một trong các toán hạng là Boolean nhưng toán hạng kia không phải, [chuyển đổi boolean thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion): `true` được chuyển thành 1, và `false` được chuyển thành 0. Sau đó so sánh lỏng lẻo hai toán hạng một lần nữa.
   - Number so với String: [chuyển đổi chuỗi thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion). Chuyển đổi thất bại dẫn đến `NaN`, sẽ đảm bảo so sánh bằng là `false`.
   - Number so với BigInt: so sánh theo giá trị toán học. Nếu số là ±Infinity hoặc `NaN`, trả về `false`.
   - String so với BigInt: chuyển đổi chuỗi thành BigInt sử dụng cùng thuật toán như hàm dựng [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt). Nếu chuyển đổi thất bại, trả về `false`.

Theo truyền thống và theo ECMAScript, tất cả các primitive và object đều không bằng lỏng lẻo với `undefined` và `null`. Nhưng hầu hết các trình duyệt cho phép một lớp đối tượng rất hẹp (cụ thể là đối tượng `document.all` cho bất kỳ trang nào), trong một số ngữ cảnh, hoạt động như thể chúng _mô phỏng_ giá trị `undefined`. Loose equality là một trong những ngữ cảnh đó: `null == A` và `undefined == A` được đánh giá là true nếu, và chỉ nếu, A là một đối tượng _mô phỏng_ `undefined`. Trong tất cả các trường hợp khác, một đối tượng không bao giờ bằng lỏng lẻo với `undefined` hoặc `null`.

Trong hầu hết các trường hợp, việc sử dụng loose equality không được khuyến khích. Kết quả của so sánh sử dụng strict equality dễ dự đoán hơn và có thể được tính toán nhanh hơn do không có ép kiểu.

Ví dụ sau minh họa các so sánh loose equality liên quan đến số primitive `0`, bigint primitive `0n`, chuỗi primitive `'0'`, và một đối tượng có giá trị `toString()` là `'0'`.

```js
const num = 0;
const big = 0n;
const str = "0";
const obj = new String("0");

console.log(num == str); // true
console.log(big == num); // true
console.log(str == big); // true

console.log(num == obj); // true
console.log(big == obj); // true
console.log(str == obj); // true
```

Loose equality chỉ được sử dụng bởi toán tử `==`.

## Same-value equality sử dụng Object.is()

Same-value equality xác định liệu hai giá trị có _đồng nhất về mặt chức năng_ trong tất cả các ngữ cảnh hay không. (Trường hợp sử dụng này minh họa một ví dụ về [nguyên lý thay thế Liskov](https://en.wikipedia.org/wiki/Liskov_substitution_principle).) Một trường hợp xảy ra khi có sự cố gắng thay đổi một thuộc tính không thể thay đổi:

```js
// Add an immutable NEGATIVE_ZERO property to the Number constructor.
Object.defineProperty(Number, "NEGATIVE_ZERO", {
  value: -0,
  writable: false,
  configurable: false,
  enumerable: false,
});

function attemptMutation(v) {
  Object.defineProperty(Number, "NEGATIVE_ZERO", { value: v });
}
```

`Object.defineProperty` sẽ ném ra ngoại lệ khi cố gắng thay đổi thuộc tính không thể thay đổi, nhưng nó không làm gì nếu không có sự thay đổi thực sự nào được yêu cầu. Nếu `v` là `-0`, không có thay đổi nào được yêu cầu, và không có lỗi nào được ném ra. Bên trong, khi một thuộc tính không thể thay đổi được định nghĩa lại, giá trị mới được chỉ định sẽ được so sánh với giá trị hiện tại sử dụng same-value equality.

Same-value equality được cung cấp bởi phương thức {{jsxref("Object.is")}}. Nó được sử dụng ở hầu hết mọi nơi trong ngôn ngữ khi một giá trị có danh tính tương đương được mong đợi.

## Same-value-zero equality

Tương tự với same-value equality, nhưng +0 và -0 được coi là bằng nhau.

Same-value-zero equality không được hiển thị như một JavaScript API, nhưng có thể được triển khai bằng mã tùy chỉnh:

```js
function sameValueZero(x, y) {
  if (typeof x === "number" && typeof y === "number") {
    // x and y are equal (may be -0 and 0) or they are both NaN
    return x === y || (x !== x && y !== y);
  }
  return x === y;
}
```

SameValueZero chỉ khác với strict equality ở chỗ coi `NaN` là tương đương, và chỉ khác với same-value equality ở chỗ coi `-0` là tương đương với `0`. Điều này khiến nó thường có hành vi hợp lý nhất trong quá trình tìm kiếm, đặc biệt khi làm việc với `NaN`. Nó được sử dụng bởi [`Array.prototype.includes()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes), [`TypedArray.prototype.includes()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/includes), cũng như các phương thức [`Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) và [`Set`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) để so sánh bằng khóa.

## So sánh các phương thức kiểm tra bằng

Mọi người thường so sánh double equals và triple equals bằng cách nói một cái là phiên bản "nâng cao" của cái kia. Ví dụ, double equals có thể được gọi là phiên bản mở rộng của triple equals, vì phép đầu làm mọi thứ mà phép sau làm, nhưng với chuyển đổi kiểu trên các toán hạng — ví dụ, `6 == "6"`. Hoặc, có thể lập luận rằng double equals là cơ sở, và triple equals là phiên bản nâng cao, vì nó yêu cầu hai toán hạng phải cùng kiểu, do đó thêm một ràng buộc bổ sung.

Tuy nhiên, cách suy nghĩ này ngụ ý rằng các so sánh bằng tạo thành một "phổ" một chiều trong đó "hoàn toàn nghiêm ngặt" nằm ở một đầu và "hoàn toàn lỏng lẻo" nằm ở đầu kia. Mô hình này không đúng với {{jsxref("Object.is")}}, vì nó không "lỏng lẻo hơn" so với double equals hay "nghiêm ngặt hơn" so với triple equals, cũng không phù hợp ở đâu đó ở giữa (tức là, vừa nghiêm ngặt hơn double equals, nhưng lỏng lẻo hơn triple equals). Chúng ta có thể thấy từ bảng so sánh bên dưới rằng điều này là do cách {{jsxref("Object.is")}} xử lý {{jsxref("NaN")}}. Lưu ý rằng nếu `Object.is(NaN, NaN)` được đánh giá là `false`, chúng ta _có thể_ nói rằng nó phù hợp trên phổ lỏng/chặt như một dạng nghiêm ngặt hơn của triple equals, phân biệt giữa `-0` và `+0`. Tuy nhiên, cách xử lý {{jsxref("NaN")}} khiến điều này không đúng. Thật không may, {{jsxref("Object.is")}} phải được hiểu theo các đặc điểm cụ thể của nó, thay vì độ lỏng hay chặt liên quan đến các toán tử so sánh.

| x                   | y                   | `==`       | `===`      | `Object.is` | `SameValueZero` |
| ------------------- | ------------------- | ---------- | ---------- | ----------- | --------------- |
| `undefined`         | `undefined`         | `✅ true`  | `✅ true`  | `✅ true`   | `✅ true`       |
| `null`              | `null`              | `✅ true`  | `✅ true`  | `✅ true`   | `✅ true`       |
| `true`              | `true`              | `✅ true`  | `✅ true`  | `✅ true`   | `✅ true`       |
| `false`             | `false`             | `✅ true`  | `✅ true`  | `✅ true`   | `✅ true`       |
| `'foo'`             | `'foo'`             | `✅ true`  | `✅ true`  | `✅ true`   | `✅ true`       |
| `0`                 | `0`                 | `✅ true`  | `✅ true`  | `✅ true`   | `✅ true`       |
| `+0`                | `-0`                | `✅ true`  | `✅ true`  | `❌ false`  | `✅ true`       |
| `+0`                | `0`                 | `✅ true`  | `✅ true`  | `✅ true`   | `✅ true`       |
| `-0`                | `0`                 | `✅ true`  | `✅ true`  | `❌ false`  | `✅ true`       |
| `0n`                | `-0n`               | `✅ true`  | `✅ true`  | `✅ true`   | `✅ true`       |
| `0`                 | `false`             | `✅ true`  | `❌ false` | `❌ false`  | `❌ false`      |
| `""`                | `false`             | `✅ true`  | `❌ false` | `❌ false`  | `❌ false`      |
| `""`                | `0`                 | `✅ true`  | `❌ false` | `❌ false`  | `❌ false`      |
| `'0'`               | `0`                 | `✅ true`  | `❌ false` | `❌ false`  | `❌ false`      |
| `'17'`              | `17`                | `✅ true`  | `❌ false` | `❌ false`  | `❌ false`      |
| `[1, 2]`            | `'1,2'`             | `✅ true`  | `❌ false` | `❌ false`  | `❌ false`      |
| `new String('foo')` | `'foo'`             | `✅ true`  | `❌ false` | `❌ false`  | `❌ false`      |
| `null`              | `undefined`         | `✅ true`  | `❌ false` | `❌ false`  | `❌ false`      |
| `null`              | `false`             | `❌ false` | `❌ false` | `❌ false`  | `❌ false`      |
| `undefined`         | `false`             | `❌ false` | `❌ false` | `❌ false`  | `❌ false`      |
| `{ foo: 'bar' }`    | `{ foo: 'bar' }`    | `❌ false` | `❌ false` | `❌ false`  | `❌ false`      |
| `new String('foo')` | `new String('foo')` | `❌ false` | `❌ false` | `❌ false`  | `❌ false`      |
| `0`                 | `null`              | `❌ false` | `❌ false` | `❌ false`  | `❌ false`      |
| `0`                 | `NaN`               | `❌ false` | `❌ false` | `❌ false`  | `❌ false`      |
| `'foo'`             | `NaN`               | `❌ false` | `❌ false` | `❌ false`  | `❌ false`      |
| `NaN`               | `NaN`               | `❌ false` | `❌ false` | `✅ true`   | `✅ true`       |

### Khi nào nên dùng Object.is() so với triple equals

Nhìn chung, thời điểm duy nhất mà hành vi đặc biệt của {{jsxref("Object.is")}} đối với số không có khả năng được quan tâm là trong việc theo đuổi một số sơ đồ lập trình meta, đặc biệt liên quan đến các bộ mô tả thuộc tính, khi mong muốn công việc của bạn phản ánh một số đặc điểm của {{jsxref("Object.defineProperty")}}. Nếu trường hợp sử dụng của bạn không yêu cầu điều này, bạn nên tránh {{jsxref("Object.is")}} và sử dụng [`===`](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) thay thế. Ngay cả khi yêu cầu của bạn liên quan đến việc so sánh giữa hai giá trị {{jsxref("NaN")}} cho kết quả là `true`, nhìn chung việc xử lý đặc biệt {{jsxref("NaN")}} (sử dụng phương thức {{jsxref("isNaN")}} có sẵn từ các phiên bản ECMAScript trước) sẽ dễ hơn là xác định cách các phép tính xung quanh có thể ảnh hưởng đến dấu của bất kỳ số không nào bạn gặp trong so sánh.

Dưới đây là danh sách không đầy đủ các phương thức và toán tử tích hợp có thể khiến sự phân biệt giữa `-0` và `+0` xuất hiện trong mã của bạn:

- [`-` (phủ định đơn nguyên)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_negation)
  - : Xem ví dụ sau:

    ```js
    const stoppingForce = obj.mass * -obj.velocity;
    ```

    Nếu `obj.velocity` là `0` (hoặc tính ra là `0`), `-0` được đưa vào ở đó và lan ra vào `stoppingForce`.

- {{jsxref("Math.atan2")}}, {{jsxref("Math.ceil")}}, {{jsxref("Math.pow")}}, {{jsxref("Math.round")}}
  - : Trong một số trường hợp, `-0` có thể được đưa vào một biểu thức như giá trị trả về của các phương thức này ngay cả khi không có `-0` nào là một trong các tham số. Ví dụ, dùng {{jsxref("Math.pow")}} để nâng {{jsxref("Infinity", "-Infinity")}} lên lũy thừa của bất kỳ số mũ âm lẻ nào cho kết quả là `-0`. Tham khảo tài liệu cho từng phương thức.
- {{jsxref("Math.floor")}}, {{jsxref("Math.max")}}, {{jsxref("Math.min")}}, {{jsxref("Math.sin")}}, {{jsxref("Math.sqrt")}}, {{jsxref("Math.tan")}}
  - : Có thể nhận được giá trị trả về `-0` từ các phương thức này trong một số trường hợp khi `-0` là một trong các tham số. Ví dụ, `Math.min(-0, +0)` cho kết quả là `-0`. Tham khảo tài liệu cho từng phương thức.
- [`~`](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_NOT), [`<<`](/en-US/docs/Web/JavaScript/Reference/Operators/Left_shift), [`>>`](/en-US/docs/Web/JavaScript/Reference/Operators/Right_shift)
  - : Mỗi toán tử này sử dụng thuật toán ToInt32 bên trong. Vì chỉ có một biểu diễn cho 0 trong kiểu số nguyên 32-bit bên trong, `-0` sẽ không tồn tại qua một vòng quay sau khi thực hiện phép toán nghịch. Ví dụ, cả `Object.is(~~(-0), -0)` và `Object.is(-0 << 2 >> 2, -0)` đều cho kết quả là `false`.

Dựa vào {{jsxref("Object.is")}} khi dấu của số không không được tính đến có thể gây nguy hiểm. Tất nhiên, khi mục đích là phân biệt giữa `-0` và `+0`, nó thực hiện chính xác những gì mong muốn.

### Lưu ý: Object.is() và NaN

Đặc tả {{jsxref("Object.is")}} coi tất cả các trường hợp của {{jsxref("NaN")}} là cùng một đối tượng. Tuy nhiên, vì [typed arrays](/en-US/docs/Web/JavaScript/Guide/Typed_arrays) có sẵn, chúng ta có thể có các biểu diễn dấu phẩy động khác nhau của `NaN` không hoạt động giống nhau trong tất cả các ngữ cảnh. Ví dụ:

```js
const f2b = (x) => new Uint8Array(new Float64Array([x]).buffer);
const b2f = (x) => new Float64Array(x.buffer)[0];
// Get a byte representation of NaN
const n = f2b(NaN);
// Change the first bit, which is the sign bit and doesn't matter for NaN
n[0] = 1;
const nan2 = b2f(n);
console.log(nan2); // NaN
console.log(Object.is(nan2, NaN)); // true
console.log(f2b(NaN)); // Uint8Array(8) [0, 0, 0, 0, 0, 0, 248, 127]
console.log(f2b(nan2)); // Uint8Array(8) [1, 0, 0, 0, 0, 0, 248, 127]
```

## Xem thêm

- [JS Comparison Table](https://dorey.github.io/JavaScript-Equality-Table/) bởi [dorey](https://github.com/dorey)
