---
title: Operator precedence
slug: Web/JavaScript/Reference/Operators/Operator_precedence
page-type: guide
sidebar: jssidebar
---

**Operator precedence** (thứ tự ưu tiên toán tử) xác định cách các toán tử được phân tích cú pháp so với nhau. Các toán tử có độ ưu tiên cao hơn trở thành toán hạng của các toán tử có độ ưu tiên thấp hơn.

{{InteractiveExample("JavaScript Demo: Expressions - Operator precedence")}}

```js interactive-example
console.log(3 + 4 * 5); // 3 + 20
// Expected output: 23

console.log(4 * 3 ** 2); // 4 * 9
// Expected output: 36

let a;
let b;

console.log((a = b = 5));
// Expected output: 5
```

## Độ ưu tiên và tính kết hợp

Xét một biểu thức có thể mô tả bằng biểu diễn dưới đây, trong đó cả `OP1` và `OP2` là các chỗ trống cho các toán tử.

```plain
a OP1 b OP2 c
```

Tổ hợp trên có hai cách diễn giải có thể:

```plain
(a OP1 b) OP2 c
a OP1 (b OP2 c)
```

Ngôn ngữ chọn cái nào phụ thuộc vào danh tính của `OP1` và `OP2`.

Nếu `OP1` và `OP2` có mức độ ưu tiên khác nhau (xem bảng bên dưới), toán tử có _độ ưu tiên_ cao hơn sẽ đi trước và tính kết hợp không quan trọng. Hãy quan sát cách nhân có độ ưu tiên cao hơn cộng và được thực thi trước, dù phép cộng được viết trước trong code.

```js-nolint
console.log(3 + 10 * 2); // 23
console.log(3 + (10 * 2)); // 23, because parentheses here are superfluous
console.log((3 + 10) * 2); // 26, because the parentheses change the order
```

Trong các toán tử có cùng độ ưu tiên, ngôn ngữ nhóm chúng theo _tính kết hợp_. _Tính kết hợp trái_ (trái sang phải) có nghĩa là nó được hiểu là `(a OP1 b) OP2 c`, trong khi _tính kết hợp phải_ (phải sang trái) có nghĩa là nó được hiểu là `a OP1 (b OP2 c)`. Các toán tử gán có tính kết hợp phải, nên bạn có thể viết:

```js
a = b = 5; // same as writing a = (b = 5);
```

với kết quả mong đợi là `a` và `b` đều nhận giá trị 5. Vì toán tử gán trả về giá trị được gán. Đầu tiên, `b` được đặt thành 5. Sau đó `a` cũng được đặt thành 5 — giá trị trả về của `b = 5`, tức là toán hạng bên phải của phép gán.

Ví dụ khác, toán tử lũy thừa duy nhất có tính kết hợp phải, trong khi các toán tử số học khác có tính kết hợp trái.

```js-nolint
const a = 4 ** 3 ** 2; // Same as 4 ** (3 ** 2); evaluates to 262144
const b = 4 / 3 / 2; // Same as (4 / 3) / 2; evaluates to 0.6666...
```

Các toán tử được nhóm đầu tiên theo độ ưu tiên, rồi đối với các toán tử kề nhau có cùng độ ưu tiên, theo tính kết hợp. Vì vậy, khi kết hợp phép chia và lũy thừa, lũy thừa luôn đến trước phép chia. Ví dụ, `2 ** 3 / 3 ** 2` cho kết quả 0.8888888888888888 vì nó tương đương với `(2 ** 3) / (3 ** 2)`.

Đối với các toán tử đơn nguyên tiền tố, giả sử chúng ta có mẫu sau:

```plain
OP1 a OP2 b
```

trong đó `OP1` là toán tử đơn nguyên tiền tố và `OP2` là toán tử nhị phân. Nếu `OP1` có độ ưu tiên cao hơn `OP2`, thì nó sẽ được nhóm thành `(OP1 a) OP2 b`; ngược lại, nó sẽ là `OP1 (a OP2 b)`.

```js
const a = 1;
const b = 2;
typeof a + b; // Equivalent to (typeof a) + b; result is "number2"
```

Nếu toán tử đơn nguyên nằm trên toán hạng thứ hai:

```plain
a OP2 OP1 b
```

Thì toán tử nhị phân `OP2` phải có độ ưu tiên thấp hơn toán tử đơn nguyên `OP1` để được nhóm thành `a OP2 (OP1 b)`. Ví dụ, đoạn sau là không hợp lệ:

```js-nolint example-bad
function* foo() {
  a + yield 1;
}
```

Vì `+` có độ ưu tiên cao hơn [`yield`](/en-US/docs/Web/JavaScript/Reference/Operators/yield), nó sẽ trở thành `(a + yield) 1` — nhưng vì `yield` là một [từ khóa dành riêng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#keywords) trong hàm generator, đây sẽ là lỗi cú pháp. May mắn thay, hầu hết các toán tử đơn nguyên có độ ưu tiên cao hơn các toán tử nhị phân và không gặp phải vấn đề này.

Nếu chúng ta có hai toán tử đơn nguyên tiền tố:

```plain
OP1 OP2 a
```

Thì toán tử đơn nguyên gần toán hạng hơn, `OP2`, phải có độ ưu tiên cao hơn `OP1` để được nhóm thành `OP1 (OP2 a)`. Cũng có thể xảy ra theo chiều ngược lại và kết thúc bằng `(OP1 OP2) a`:

```js-nolint example-bad
async function* foo() {
  await yield 1;
}
```

Vì [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await) có độ ưu tiên cao hơn [`yield`](/en-US/docs/Web/JavaScript/Reference/Operators/yield), nó sẽ trở thành `(await yield) 1`, đang chờ một định danh gọi là `yield`, và đây là lỗi cú pháp. Tương tự, nếu bạn có `new !A;`, vì `!` có độ ưu tiên thấp hơn `new`, nó sẽ trở thành `(new !) A`, điều này rõ ràng là không hợp lệ. (Code này trông vô nghĩa để viết, vì `!A` luôn tạo ra một boolean, không phải hàm constructor.)

Đối với các toán tử đơn nguyên hậu tố (cụ thể là `++` và `--`), các quy tắc tương tự áp dụng. May mắn thay, cả hai toán tử đều có độ ưu tiên cao hơn bất kỳ toán tử nhị phân nào, vì vậy nhóm luôn đúng như mong đợi. Hơn nữa, vì `++` trả về một _giá trị_, không phải _tham chiếu_, bạn không thể nối nhiều phép tăng liên tiếp nhau.

```js-nolint example-bad
let a = 1;
a++++; // SyntaxError: Invalid left-hand side in postfix operation.
```

Độ ưu tiên toán tử sẽ được xử lý _đệ quy_. Ví dụ, xét biểu thức này:

```js-nolint
1 + 2 ** 3 * 4 / 5 >> 6
```

Đầu tiên, chúng ta nhóm các toán tử có độ ưu tiên khác nhau theo các mức độ giảm dần.

1. Toán tử `**` có độ ưu tiên cao nhất, nên nó được nhóm trước.
2. Nhìn xung quanh biểu thức `**`, nó có `*` ở bên phải và `+` ở bên trái. `*` có độ ưu tiên cao hơn, nên nó được nhóm trước. `*` và `/` có cùng độ ưu tiên, nên chúng ta nhóm chúng lại với nhau.
3. Nhìn xung quanh biểu thức `*`/`/` được nhóm ở bước 2, vì `+` có độ ưu tiên cao hơn `>>`, cái trước được nhóm.

```js-nolint
   (1 + ( (2 ** 3) * 4 / 5) ) >> 6
// │    │ └─ 1. ─┘        │ │
// │    └────── 2. ───────┘ │
// └────────── 3. ──────────┘
```

Trong nhóm `*`/`/`, vì cả hai đều có tính kết hợp trái, toán hạng bên trái sẽ được nhóm.

```js-nolint
   (1 + ( ( (2 ** 3) * 4 ) / 5) ) >> 6
// │    │ │ └─ 1. ─┘     │    │ │
// │    └─│─────── 2. ───│────┘ │
// └──────│───── 3. ─────│──────┘
//        └───── 4. ─────┘
```

Lưu ý rằng độ ưu tiên toán tử và tính kết hợp chỉ ảnh hưởng đến thứ tự đánh giá của _toán tử_ (nhóm ngầm định), nhưng không ảnh hưởng đến thứ tự đánh giá của _toán hạng_. Các toán hạng luôn được đánh giá từ trái sang phải. Các biểu thức có độ ưu tiên cao hơn luôn được đánh giá trước, và kết quả của chúng được tổng hợp theo thứ tự độ ưu tiên toán tử.

```js-nolint
function echo(name, num) {
  console.log(`Evaluating the ${name} side`);
  return num;
}
// Exponentiation operator (**) is right-associative,
// but all call expressions (echo()), which have higher precedence,
// will be evaluated before ** does
console.log(echo("left", 4) ** echo("middle", 3) ** echo("right", 2));
// Evaluating the left side
// Evaluating the middle side
// Evaluating the right side
// 262144

// Exponentiation operator (**) has higher precedence than division (/),
// but evaluation always starts with the left operand
console.log(echo("left", 4) / echo("middle", 3) ** echo("right", 2));
// Evaluating the left side
// Evaluating the middle side
// Evaluating the right side
// 0.4444444444444444
```

Nếu bạn quen với cây nhị phân, hãy nghĩ đây là [duyệt theo thứ tự sau (post-order traversal)](https://en.wikipedia.org/wiki/Tree_traversal#Post-order,_LRN).

```plain
                /
       ┌────────┴────────┐
echo("left", 4)         **
                ┌────────┴────────┐
        echo("middle", 3)  echo("right", 2)
```

Sau khi tất cả các toán tử được nhóm đúng cách, các toán tử nhị phân sẽ tạo thành một cây nhị phân. Đánh giá bắt đầu từ nhóm ngoài cùng — đó là toán tử có độ ưu tiên thấp nhất (`/` trong trường hợp này). Toán hạng bên trái của toán tử này được đánh giá trước, có thể được tạo thành từ các toán tử có độ ưu tiên cao hơn (như biểu thức gọi `echo("left", 4)`). Sau khi toán hạng bên trái được đánh giá, toán hạng bên phải được đánh giá theo cách tương tự. Vì vậy, tất cả các nút lá — các lệnh gọi `echo()` — sẽ được thăm từ trái sang phải, bất kể độ ưu tiên của các toán tử kết nối chúng.

## Short-circuiting

Trong phần trước, chúng ta đã nói "các biểu thức có độ ưu tiên cao hơn luôn được đánh giá trước" — điều này thường đúng, nhưng cần được bổ sung với việc thừa nhận _short-circuiting_ (ngắn mạch đánh giá), trong đó trường hợp một toán hạng có thể hoàn toàn không được đánh giá.

Short-circuiting là thuật ngữ chuyên môn cho đánh giá có điều kiện. Ví dụ, trong biểu thức `a && (b + c)`, nếu `a` là {{Glossary("falsy")}}, thì biểu thức con `(b + c)` sẽ không được đánh giá, dù nó được nhóm và do đó có độ ưu tiên cao hơn `&&`. Chúng ta có thể nói rằng toán tử AND logic (`&&`) được "short-circuit". Cùng với AND logic, các toán tử short-circuit khác bao gồm OR logic (`||`), nullish coalescing (`??`), và optional chaining (`?.`).

```js-nolint
a || (b * c); // evaluate `a` first, then produce `a` if `a` is "truthy"
a && (b < c); // evaluate `a` first, then produce `a` if `a` is "falsy"
a ?? (b || c); // evaluate `a` first, then produce `a` if `a` is not `null` and not `undefined`
a?.b.c; // evaluate `a` first, then produce `undefined` if `a` is `null` or `undefined`
```

Khi đánh giá toán tử short-circuit, toán hạng bên trái luôn được đánh giá. Toán hạng bên phải chỉ được đánh giá nếu toán hạng bên trái không thể xác định kết quả của phép toán.

> [!NOTE]
> Hành vi của short-circuiting được tích hợp sẵn trong các toán tử này. Các toán tử khác sẽ _luôn_ đánh giá cả hai toán hạng, bất kể điều đó có thực sự hữu ích hay không — ví dụ, `NaN * foo()` sẽ luôn gọi `foo`, ngay cả khi kết quả sẽ không bao giờ là gì khác ngoài `NaN`.

Mô hình duyệt theo thứ tự sau trước đó vẫn đứng vững. Tuy nhiên, sau khi cây con bên trái của toán tử short-circuit được thăm, ngôn ngữ sẽ quyết định xem toán hạng bên phải có cần được đánh giá hay không. Nếu không (ví dụ, vì toán hạng bên trái của `||` đã là truthy), kết quả được trả về trực tiếp mà không cần thăm cây con bên phải.

Xét trường hợp này:

```js-nolint
function A() { console.log('called A'); return false; }
function B() { console.log('called B'); return false; }
function C() { console.log('called C'); return true; }

console.log(C() || B() && A());

// Logs:
// called C
// true
```

Chỉ `C()` được đánh giá, mặc dù `&&` có độ ưu tiên cao hơn. Điều này không có nghĩa là `||` có độ ưu tiên cao hơn trong trường hợp này — chính xác là _vì_ `(B() && A())` có độ ưu tiên cao hơn khiến nó bị bỏ qua toàn bộ. Nếu sắp xếp lại thành:

```js-nolint
console.log(A() && B() || C());
// Logs:
// called A
// called C
// true
```

Thì hiệu ứng short-circuiting của `&&` chỉ ngăn `B()` khỏi được đánh giá, nhưng vì `A() && B()` là `false`, `C()` vẫn sẽ được đánh giá.

Tuy nhiên, lưu ý rằng short-circuiting không thay đổi kết quả đánh giá cuối cùng. Nó chỉ ảnh hưởng đến việc đánh giá _toán hạng_, không phải cách _toán tử_ được nhóm — nếu việc đánh giá các toán hạng không có tác dụng phụ (ví dụ, in ra console, gán cho biến, ném lỗi), short-circuiting sẽ không quan sát được chút nào.

Các biến thể gán của các toán tử này ([`&&=`](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_AND_assignment), [`||=`](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_OR_assignment), [`??=`](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_assignment)) cũng được short-circuit. Chúng được short-circuit theo cách mà phép gán không xảy ra chút nào.

## Bảng

Bảng sau liệt kê các toán tử theo thứ tự từ độ ưu tiên cao nhất (18) đến thấp nhất (1).

Một số ghi chú chung về bảng:

1. Không phải tất cả cú pháp được bao gồm ở đây đều là "toán tử" theo nghĩa chặt chẽ. Ví dụ, spread `...` và mũi tên `=>` thường không được coi là toán tử. Tuy nhiên, chúng tôi vẫn đưa vào để cho thấy chúng liên kết chặt chẽ như thế nào so với các toán tử/biểu thức khác.
2. Một số toán tử có các toán hạng nhất định yêu cầu biểu thức hẹp hơn so với những gì các toán tử có độ ưu tiên cao hơn tạo ra. Ví dụ, vế phải của truy cập thành viên `.` (độ ưu tiên 17) phải là định danh thay vì biểu thức được nhóm. Vế trái của mũi tên `=>` (độ ưu tiên 2) phải là danh sách đối số hoặc một định danh đơn thay vì biểu thức bất kỳ.
3. Một số toán tử có các toán hạng nhất định chấp nhận biểu thức rộng hơn so với những gì các toán tử có độ ưu tiên cao hơn tạo ra. Ví dụ, biểu thức được đặt trong ngoặc vuông của ký hiệu ngoặc vuông `[ … ]` (độ ưu tiên 17) có thể là bất kỳ biểu thức nào, kể cả biểu thức nối bằng dấu phẩy (độ ưu tiên 1). Các toán tử này hoạt động như thể toán hạng đó được "tự động nhóm". Trong trường hợp này chúng tôi sẽ bỏ qua tính kết hợp.

<table class="fullwidth-table">
  <tbody>
    <tr>
      <th>Độ ưu tiên</th>
      <th>Tính kết hợp</th>
      <th>Toán tử riêng lẻ</th>
      <th>Ghi chú</th>
    </tr>
    <tr>
      <td>18: grouping</td>
      <td>n/a</td>
      <td>{{jsxref("Operators/Grouping", "Grouping", "", 1)}}<br><code>(x)</code></td>
      <td>[1]</td>
    </tr>
    <tr>
      <td rowspan="6">17: access and call</td>
      <td rowspan="2">
        left-to-right
      </td>
      <td>{{jsxref("Operators/Property_accessors", "Member access", "#dot_notation", 1)}}<br><code>x.y</code></td>
      <td rowspan="2">[2]</td>
    </tr>
    <tr>
      <td>{{jsxref("Operators/Optional_chaining", "Optional chaining", "", 1)}}<br><code>x?.y</code></td>
    </tr>
    <tr>
      <td rowspan="4">n/a</td>
      <td>
        {{jsxref("Operators/Property_accessors", "Computed member access", "#bracket_notation", 1)}}<br><code>x[y]</code>
      </td>
      <td>[3]</td>
    </tr>
    <tr>
      <td>{{jsxref("Operators/new", "new")}} with argument list<br><code>new x(y)</code></td>
      <td rowspan="3">[4]</td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Guide/Functions">Function call</a><br><code>x(y)</code>
      </td>
    </tr>
    <tr>
      <td>{{jsxref("Operators/import", "import(x)")}}</td>
    </tr>
    <tr>
      <td>16: new</td>
      <td>n/a</td>
      <td>{{jsxref("Operators/new", "new")}} without argument list<br><code>new x</code></td>
    </tr>
    <tr>
      <td rowspan="2">15: postfix operators</td>
      <td rowspan="2">n/a</td>
      <td>
        {{jsxref("Operators/Increment", "Postfix increment", "", 1)}}<br><code>x++</code>
      </td>
      <td rowspan="2">[5]</td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Decrement", "Postfix decrement", "", 1)}}<br><code>x--</code>
      </td>
    </tr>
    <tr>
      <td rowspan="10">14: prefix operators</td>
      <td rowspan="10">n/a</td>
      <td>
        {{jsxref("Operators/Increment", "Prefix increment", "", 1)}}<br><code>++x</code>
      </td>
      <td rowspan="2">[6]</td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Decrement", "Prefix decrement", "", 1)}}<br><code>--x</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Logical_NOT", "Logical NOT", "", 1)}}<br><code>!x</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Bitwise_NOT", "Bitwise NOT", "", 1)}}<br><code>~x</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Unary_plus", "Unary plus", "", 1)}}<br><code>+x</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Unary_negation", "Unary negation", "", 1)}}<br><code>-x</code>
      </td>
    </tr>
    <tr>
      <td>{{jsxref("Operators/typeof", "typeof x")}}</td>
    </tr>
    <tr>
      <td>{{jsxref("Operators/void", "void x")}}</td>
    </tr>
    <tr>
      <td>{{jsxref("Operators/delete", "delete x")}}</td>
      <td>[7]</td>
    </tr>
    <tr>
      <td>{{jsxref("Operators/await", "await x")}}</td>
    </tr>
    <tr>
      <td>13: exponentiation</td>
      <td>right-to-left</td>
      <td>
        {{jsxref("Operators/Exponentiation", "Exponentiation", "", 1)}}<br><code>x ** y</code>
      </td>
      <td>[8]</td>
    </tr>
    <tr>
      <td rowspan="3">12: multiplicative operators</td>
      <td rowspan="3">left-to-right</td>
      <td>
        {{jsxref("Operators/Multiplication", "Multiplication", "", 1)}}<br><code>x * y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Division", "Division", "", 1)}}<br><code>x / y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Remainder", "Remainder", "", 1)}}<br><code>x % y</code>
      </td>
    </tr>
    <tr>
      <td rowspan="2">11: additive operators</td>
      <td rowspan="2">left-to-right</td>
      <td>
        {{jsxref("Operators/Addition", "Addition", "", 1)}}<br><code>x + y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Subtraction", "Subtraction", "", 1)}}<br><code>x - y</code>
      </td>
    </tr>
    <tr>
      <td rowspan="3">10: bitwise shift</td>
      <td rowspan="3">left-to-right</td>
      <td>
        {{jsxref("Operators/Left_shift", "Left shift", "", 1)}}<br><code>x &#x3C;&#x3C; y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Right_shift", "Right shift", "", 1)}}<br><code>x >> y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Unsigned_right_shift", "Unsigned right shift", "", 1)}}<br><code>x >>> y</code>
      </td>
    </tr>
    <tr>
      <td rowspan="6">9: relational operators</td>
      <td rowspan="6">left-to-right</td>
      <td>
        {{jsxref("Operators/Less_than", "Less than", "", 1)}}<br><code>x &#x3C; y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Less_than_or_equal", "Less than or equal", "", 1)}}<br><code>x &#x3C;= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Greater_than", "Greater than", "", 1)}}<br><code>x > y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Greater_than_or_equal", "Greater than or equal", "", 1)}}<br><code>x >= y</code>
      </td>
    </tr>
    <tr>
      <td>{{jsxref("Operators/in", "x in y")}}</td>
    </tr>
    <tr>
      <td>{{jsxref("Operators/instanceof", "x instanceof y")}}</td>
    </tr>
    <tr>
      <td rowspan="4">8: equality operators</td>
      <td rowspan="4">left-to-right</td>
      <td>
        {{jsxref("Operators/Equality", "Equality", "", 1)}}<br><code>x == y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Inequality", "Inequality", "", 1)}}<br><code>x != y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Strict_equality", "Strict equality", "", 1)}}<br><code>x === y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Strict_inequality", "Strict inequality", "", 1)}}<br><code>x !== y</code>
      </td>
    </tr>
    <tr>
      <td>7: bitwise AND</td>
      <td>left-to-right</td>
      <td>
        {{jsxref("Operators/Bitwise_AND", "Bitwise AND", "", 1)}}<br><code>x &#x26; y</code>
      </td>
    </tr>
    <tr>
      <td>6: bitwise XOR</td>
      <td>left-to-right</td>
      <td>
        {{jsxref("Operators/Bitwise_XOR", "Bitwise XOR", "", 1)}}<br><code>x ^ y</code>
      </td>
    </tr>
    <tr>
      <td>5: bitwise OR</td>
      <td>left-to-right</td>
      <td>
        {{jsxref("Operators/Bitwise_OR", "Bitwise OR", "", 1)}}<br><code>x | y</code>
      </td>
    </tr>
    <tr>
      <td>4: logical AND</td>
      <td>left-to-right</td>
      <td>
        {{jsxref("Operators/Logical_AND", "Logical AND", "", 1)}}<br><code>x &#x26;&#x26; y</code>
      </td>
    </tr>
    <tr>
      <td rowspan="2">3: logical OR, nullish coalescing</td>
      <td rowspan="2">left-to-right</td>
      <td>
        {{jsxref("Operators/Logical_OR", "Logical OR", "", 1)}}<br><code>x || y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Nullish_coalescing", "Nullish coalescing operator", "", 1)}}<br><code>x ?? y</code>
      </td>
      <td>[9]</td>
    </tr>
    <tr>
      <td rowspan="21">2: assignment and miscellaneous</td>
      <td rowspan="16">right-to-left</td>
      <td>
        {{jsxref("Operators/Assignment", "Assignment", "", 1)}}<br><code>x = y</code>
      </td>
      <td rowspan="16">[10]</td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Addition_assignment", "Addition assignment", "", 1)}}<br><code>x += y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Subtraction_assignment", "Subtraction assignment", "", 1)}}<br><code>x -= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Exponentiation_assignment", "Exponentiation assignment", "", 1)}}<br><code>x **= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Multiplication_assignment", "Multiplication assignment", "", 1)}}<br><code>x *= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Division_assignment", "Division assignment", "", 1)}}<br><code>x /= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Remainder_assignment", "Remainder assignment", "", 1)}}<br><code>x %= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Left_shift_assignment", "Left shift assignment", "", 1)}}<br><code>x &#x3C;&#x3C;= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Right_shift_assignment", "Right shift assignment", "", 1)}}<br><code>x >>= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Unsigned_right_shift_assignment", "Unsigned right shift assignment", "", 1)}}<br><code>x >>>= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Bitwise_AND_assignment", "Bitwise AND assignment", "", 1)}}<br><code>x &#x26;= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Bitwise_XOR_assignment", "Bitwise XOR assignment", "", 1)}}<br><code>x ^= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Bitwise_OR_assignment", "Bitwise OR assignment", "", 1)}}<br><code>x |= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Logical_AND_assignment", "Logical AND assignment", "", 1)}}<br><code>x &#x26;&#x26;= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Logical_OR_assignment", "Logical OR assignment", "", 1)}}<br><code>x ||= y</code>
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Operators/Nullish_coalescing_assignment", "Nullish coalescing assignment", "", 1)}}<br><code>x ??= y</code>
      </td>
    </tr>
    <tr>
      <td>right-to-left</td>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator">Conditional (ternary) operator</a><br><code>x ? y : z</code>
      </td>
      <td>[11]</td>
    </tr>
    <tr>
      <td>right-to-left</td>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions">Arrow</a><br><code>x => y</code>
      </td>
      <td>[12]</td>
    </tr>
    <tr>
      <td rowspan="3">n/a</td>
      <td>{{jsxref("Operators/yield", "yield x")}}</td>
    </tr>
    <tr>
      <td>{{jsxref("Operators/yield*", "yield* x")}}</td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax">Spread</a><br><code>...x</code>
      </td>
      <td>[13]</td>
    </tr>
    <tr>
      <td>1: comma</td>
      <td>left-to-right</td>
      <td>
        {{jsxref("Operators/Comma_Operator", "Comma operator", "", 1)}}<br><code>x, y</code>
      </td>
    </tr>
  </tbody>
</table>

Ghi chú:

1. Toán hạng có thể là bất kỳ biểu thức nào.
2. "Vế phải" phải là một định danh.
3. "Vế phải" có thể là bất kỳ biểu thức nào.
4. "Vế phải" là danh sách được phân tách bằng dấu phẩy của bất kỳ biểu thức nào với độ ưu tiên > 1 (tức là không phải biểu thức dấu phẩy). Constructor của biểu thức `new` không thể là một optional chain.
5. Toán hạng phải là đích gán hợp lệ (định danh hoặc truy cập thuộc tính). Độ ưu tiên của nó có nghĩa là `new Foo++` là `(new Foo)++` (lỗi cú pháp) chứ không phải `new (Foo++)` (TypeError: (Foo++) không phải là constructor).
6. Toán hạng phải là đích gán hợp lệ (định danh hoặc truy cập thuộc tính).
7. Toán hạng không thể là định danh hay truy cập [private element](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements).
8. Vế trái không thể có độ ưu tiên 14.
9. Các toán hạng không thể là toán tử OR logic `||` hoặc AND logic `&&` mà không được nhóm.
10. "Vế trái" phải là đích gán hợp lệ (định danh hoặc truy cập thuộc tính).
11. Tính kết hợp có nghĩa là hai biểu thức sau `?` được nhóm ngầm định.
12. "Vế trái" là một định danh đơn hoặc danh sách tham số được đặt trong ngoặc đơn.
13. Chỉ hợp lệ bên trong object literal, array literal, hoặc danh sách đối số.

Độ ưu tiên của các nhóm 17 và 16 có thể hơi mơ hồ. Dưới đây là một vài ví dụ để làm rõ.

- Optional chaining luôn có thể thay thế cho cú pháp tương ứng không có optionality (ngoại trừ một vài trường hợp đặc biệt mà optional chaining bị cấm). Ví dụ, bất kỳ nơi nào chấp nhận `a?.b` cũng chấp nhận `a.b` và ngược lại, tương tự cho `a?.()`, `a()`, v.v.
- Member expression và computed member expression luôn có thể thay thế nhau.
- Call expression và `import()` expression luôn có thể thay thế nhau.
- Điều này để lại bốn lớp biểu thức: truy cập thành viên, `new` với đối số, lời gọi hàm, và `new` không có đối số.
  - "Vế trái" của truy cập thành viên có thể là: truy cập thành viên (`a.b.c`), `new` với đối số (`new a().b`), và lời gọi hàm (`a().b`).
  - "Vế trái" của `new` với đối số có thể là: truy cập thành viên (`new a.b()`) và `new` với đối số (`new new a()()`).
  - "Vế trái" của lời gọi hàm có thể là: truy cập thành viên (`a.b()`), `new` với đối số (`new a()()`), và lời gọi hàm (`a()()`).
  - Toán hạng của `new` không có đối số có thể là: truy cập thành viên (`new a.b`), `new` với đối số (`new new a()`), và `new` không có đối số (`new new a`).
