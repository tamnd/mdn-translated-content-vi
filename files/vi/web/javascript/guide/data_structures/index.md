---
title: JavaScript data types and data structures
slug: Web/JavaScript/Guide/Data_structures
page-type: guide
sidebar: jssidebar
---

Tất cả ngôn ngữ lập trình đều có các cấu trúc dữ liệu có sẵn, nhưng chúng thường khác nhau giữa các ngôn ngữ. Bài viết này cố gắng liệt kê các cấu trúc dữ liệu có sẵn trong JavaScript và các thuộc tính của chúng. Chúng có thể được dùng để xây dựng các cấu trúc dữ liệu khác.

[Tổng quan về ngôn ngữ](/en-US/docs/Web/JavaScript/Guide/Language_overview) cũng cung cấp tổng kết tương tự về các kiểu dữ liệu phổ biến, nhưng có nhiều so sánh hơn với các ngôn ngữ khác.

## Kiểu động và kiểu yếu

JavaScript là ngôn ngữ [động](https://en.wikipedia.org/wiki/Dynamic_programming_language) với [kiểu động](https://en.wikipedia.org/wiki/Type_system#DYNAMIC). Các biến trong JavaScript không liên kết trực tiếp với bất kỳ kiểu giá trị cụ thể nào, và bất kỳ biến nào cũng có thể được gán (và gán lại) giá trị của tất cả các kiểu:

```js
let foo = 42; // foo is now a number
foo = "bar"; // foo is now a string
foo = true; // foo is now a boolean
```

JavaScript cũng là ngôn ngữ [kiểu yếu](https://en.wikipedia.org/wiki/Strong_and_weak_typing), nghĩa là nó cho phép chuyển đổi kiểu ngầm định khi một thao tác liên quan đến các kiểu không khớp, thay vì ném lỗi kiểu.

```js
const foo = 42; // foo is a number
const result = foo + "1"; // JavaScript coerces foo to a string, so it can be concatenated with the other operand
console.log(result); // 421
```

Chuyển đổi ngầm định rất tiện lợi, nhưng có thể tạo ra các lỗi tinh vi khi chuyển đổi xảy ra ở nơi không mong đợi, hoặc ở hướng ngược lại (ví dụ, chuỗi thành số thay vì số thành chuỗi). Đối với [symbol](#symbol_type) và [BigInt](#bigint_type), JavaScript đã cố tình không cho phép một số chuyển đổi kiểu ngầm định.

## Giá trị nguyên thủy

Tất cả các kiểu ngoại trừ [Object](#objects) đều định nghĩa các giá trị [bất biến](/en-US/docs/Glossary/Immutable) được biểu diễn trực tiếp ở mức thấp nhất của ngôn ngữ. Chúng ta gọi các giá trị thuộc kiểu này là _giá trị nguyên thủy_ (primitive value).

Tất cả kiểu nguyên thủy, ngoại trừ [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), có thể được kiểm tra bằng toán tử [`typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof). `typeof null` trả về `"object"`, vì vậy cần dùng `=== null` để kiểm tra `null`.

Tất cả kiểu nguyên thủy, ngoại trừ [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) và [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined), đều có kiểu object wrapper tương ứng, cung cấp các method hữu ích để làm việc với giá trị nguyên thủy. Ví dụ, object [`Number`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number) cung cấp các method như [`toExponential()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential). Khi một thuộc tính được truy cập trên giá trị nguyên thủy, JavaScript tự động bọc giá trị vào object wrapper tương ứng và truy cập thuộc tính trên object đó. Tuy nhiên, truy cập thuộc tính trên `null` hoặc `undefined` ném ra `TypeError`, đòi hỏi giới thiệu toán tử [optional chaining](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining).

| Kiểu                         | Giá trị trả về của `typeof` | Object wrapper        |
| ---------------------------- | --------------------------- | --------------------- |
| [Null](#null_type)           | `"object"`                  | N/A                   |
| [Undefined](#undefined_type) | `"undefined"`               | N/A                   |
| [Boolean](#boolean_type)     | `"boolean"`                 | {{jsxref("Boolean")}} |
| [Number](#number_type)       | `"number"`                  | {{jsxref("Number")}}  |
| [BigInt](#bigint_type)       | `"bigint"`                  | {{jsxref("BigInt")}}  |
| [String](#string_type)       | `"string"`                  | {{jsxref("String")}}  |
| [Symbol](#symbol_type)       | `"symbol"`                  | {{jsxref("Symbol")}}  |

Các trang tham khảo của các class object wrapper chứa thêm thông tin về các method và thuộc tính có sẵn cho mỗi kiểu, cũng như mô tả chi tiết về ngữ nghĩa của các kiểu nguyên thủy.

### Kiểu Null

Kiểu Null chỉ có đúng một giá trị: [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

### Kiểu Undefined

Kiểu Undefined chỉ có đúng một giá trị: [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined).

Về mặt khái niệm, `undefined` biểu thị sự vắng mặt của một _giá trị_, trong khi `null` biểu thị sự vắng mặt của một _object_ (điều này cũng có thể giải thích cho [`typeof null === "object"`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof#typeof_null)). Ngôn ngữ thường mặc định là `undefined` khi một thứ gì đó không có giá trị:

- Câu lệnh [`return`](/en-US/docs/Web/JavaScript/Reference/Statements/return) không có giá trị (`return;`) ngầm định trả về `undefined`.
- Truy cập thuộc tính [object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object) không tồn tại (`obj.iDontExist`) trả về `undefined`.
- Khai báo biến không có khởi tạo (`let x;`) ngầm định khởi tạo biến thành `undefined`.
- Nhiều method như {{jsxref("Array.prototype.find()")}} và {{jsxref("Map.prototype.get()")}} trả về `undefined` khi không tìm thấy phần tử.

`null` được dùng ít thường xuyên hơn trong ngôn ngữ lõi. Nơi quan trọng nhất là cuối [chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) — theo đó, các method tương tác với prototype, như {{jsxref("Object.getPrototypeOf()")}}, {{jsxref("Object.create()")}}, v.v., chấp nhận hoặc trả về `null` thay vì `undefined`.

`null` là [từ khóa](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#keywords), nhưng `undefined` là [định danh](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) thông thường xảy ra là một thuộc tính toàn cục. Trong thực tế, sự khác biệt là nhỏ, vì `undefined` không nên được định nghĩa lại hoặc shadow.

### Kiểu Boolean

Kiểu {{jsxref("Boolean")}} đại diện cho một thực thể logic và có hai giá trị: `true` và `false`.

Giá trị Boolean thường được dùng cho các thao tác điều kiện, bao gồm [toán tử ternary](/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator), [`if...else`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else), [`while`](/en-US/docs/Web/JavaScript/Reference/Statements/while), v.v.

### Kiểu Number

Kiểu {{jsxref("Number")}} là [giá trị IEEE 754 định dạng dấu phẩy động 64-bit độ chính xác kép](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_encoding). Nó có thể lưu trữ các số thực dương từ 2<sup>-1074</sup> ({{jsxref("Number.MIN_VALUE")}}) đến 2<sup>1023</sup> × (2 - 2<sup>-52</sup>) ({{jsxref("Number.MAX_VALUE")}}) cũng như các số thực âm có cùng độ lớn, nhưng chỉ có thể lưu trữ an toàn các số nguyên trong phạm vi -(2<sup>53</sup> − 1) ({{jsxref("Number.MIN_SAFE_INTEGER")}}) đến 2<sup>53</sup> − 1 ({{jsxref("Number.MAX_SAFE_INTEGER")}}). Ngoài phạm vi này, JavaScript không còn có thể biểu diễn số nguyên một cách an toàn; thay vào đó chúng sẽ được biểu diễn bằng giá trị xấp xỉ dấu phẩy động độ chính xác kép. Bạn có thể kiểm tra xem một số có nằm trong phạm vi số nguyên an toàn bằng {{jsxref("Number.isSafeInteger()")}}.

Các giá trị ngoài phạm vi biểu diễn được tự động chuyển đổi:

- Các giá trị dương lớn hơn {{jsxref("Number.MAX_VALUE")}} được chuyển đổi thành `Infinity`.
- Các giá trị dương nhỏ hơn {{jsxref("Number.MIN_VALUE")}} được chuyển đổi thành `0`.
- Các giá trị âm nhỏ hơn -{{jsxref("Number.MAX_VALUE")}} được chuyển đổi thành `-Infinity`.
- Các giá trị âm lớn hơn -{{jsxref("Number.MIN_VALUE")}} được chuyển đổi thành `-0`.

`Infinity` và `-Infinity` hoạt động tương tự như vô cực toán học, nhưng có một số khác biệt nhỏ; xem {{jsxref("Number.POSITIVE_INFINITY")}} và {{jsxref("Number.NEGATIVE_INFINITY")}} để biết chi tiết.

Kiểu Number chỉ có một giá trị với nhiều biểu diễn: `0` được biểu diễn là cả `-0` và `+0` (trong đó `0` là bí danh cho `+0`). Trong thực tế, hầu như không có sự khác biệt giữa các biểu diễn khác nhau; ví dụ, `+0 === -0` là `true`. Tuy nhiên, bạn có thể nhận thấy điều này khi chia cho số 0:

```js
console.log(42 / +0); // Infinity
console.log(42 / -0); // -Infinity
```

{{jsxref("NaN")}} ("**N**ot **a** **N**umber") là loại giá trị số đặc biệt thường gặp khi kết quả của một phép toán không thể được biểu diễn dưới dạng số. Đây cũng là giá trị duy nhất trong JavaScript không bằng chính nó.

Mặc dù về mặt khái niệm một số là "giá trị toán học" và luôn được mã hóa dấu phẩy động ngầm định, JavaScript cung cấp [toán tử bitwise](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#bitwise_operators). Khi áp dụng toán tử bitwise, số đầu tiên được chuyển đổi thành số nguyên 32-bit.

> [!NOTE]
> Mặc dù toán tử bitwise _có thể_ dùng để đại diện cho nhiều giá trị Boolean trong một số bằng [bit masking](https://en.wikipedia.org/wiki/Mask_%28computing%29), đây thường được coi là thực hành tệ. JavaScript cung cấp các phương tiện khác để đại diện cho tập hợp các Boolean (như mảng Boolean, hoặc object với các giá trị Boolean được gán cho các thuộc tính đặt tên). Bit masking cũng có xu hướng làm code khó đọc, hiểu và bảo trì.

Có thể cần dùng các kỹ thuật như vậy trong môi trường rất bị hạn chế, như khi cố gắng đối phó với giới hạn local storage, hoặc trong các trường hợp cực đoan (như khi mỗi bit truyền qua mạng đều quan trọng). Kỹ thuật này chỉ nên được xem xét khi đó là biện pháp cuối cùng có thể thực hiện để tối ưu hóa kích thước.

### Kiểu BigInt

Kiểu {{jsxref("BigInt")}} là kiểu nguyên thủy số trong JavaScript có thể biểu diễn các số nguyên có độ lớn tùy ý. Với BigInt, bạn có thể lưu trữ và thao tác an toàn các số nguyên lớn ngay cả vượt giới hạn số nguyên an toàn ({{jsxref("Number.MAX_SAFE_INTEGER")}}) của Number.

BigInt được tạo bằng cách thêm `n` vào cuối số nguyên hoặc bằng cách gọi hàm [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt).

Ví dụ này minh họa nơi việc tăng {{jsxref("Number.MAX_SAFE_INTEGER")}} trả về kết quả mong đợi:

```js
// BigInt
const x = BigInt(Number.MAX_SAFE_INTEGER); // 9007199254740991n
x + 1n === x + 2n; // false because 9007199254740992n and 9007199254740993n are unequal

// Number
Number.MAX_SAFE_INTEGER + 1 === Number.MAX_SAFE_INTEGER + 2; // true because both are 9007199254740992
```

Bạn có thể dùng hầu hết toán tử để làm việc với BigInt, bao gồm `+`, `*`, `-`, `**`, và `%` — toán tử duy nhất bị cấm là [`>>>`](/en-US/docs/Web/JavaScript/Reference/Operators/Unsigned_right_shift). BigInt không [bằng nhau nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) với Number có cùng giá trị toán học, nhưng [bằng nhau lỏng](/en-US/docs/Web/JavaScript/Reference/Operators/Equality).

Giá trị BigInt không luôn chính xác hơn hay kém chính xác hơn so với number, vì BigInt không thể biểu diễn số phân số nhưng có thể biểu diễn số nguyên lớn chính xác hơn. Không kiểu nào bao gồm kiểu kia, và chúng không thể thay thế lẫn nhau. `TypeError` được ném ra nếu giá trị BigInt được trộn lẫn với number thông thường trong biểu thức số học, hoặc nếu chúng [được chuyển đổi ngầm định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) sang nhau.

### Kiểu String

Kiểu {{jsxref("String")}} biểu diễn dữ liệu văn bản và được mã hóa dưới dạng chuỗi các giá trị số nguyên không dấu 16-bit đại diện cho [code unit UTF-16](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters). Mỗi phần tử trong chuỗi chiếm một vị trí trong chuỗi. Phần tử đầu tiên ở index `0`, tiếp theo ở index `1`, và cứ tiếp tục. [Độ dài](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length) của chuỗi là số lượng code unit UTF-16 trong đó, có thể không tương ứng với số ký tự Unicode thực tế; xem trang tham khảo [`String`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters) để biết thêm chi tiết.

Chuỗi JavaScript là bất biến. Điều này có nghĩa là một khi chuỗi được tạo, không thể sửa đổi nó. Các method chuỗi tạo ra chuỗi mới dựa trên nội dung của chuỗi hiện tại — ví dụ:

- Chuỗi con của bản gốc dùng [`substring()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substring).
- Nối hai chuỗi dùng toán tử nối (`+`) hoặc [`concat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat).

#### Hãy cẩn thận với việc "stringly-typing" code của bạn!

Có thể bị cám dỗ dùng chuỗi để biểu diễn dữ liệu phức tạp. Điều này có những lợi ích ngắn hạn:

- Dễ xây dựng chuỗi phức tạp bằng cách nối.
- Chuỗi dễ debug (những gì bạn thấy in ra luôn là những gì có trong chuỗi).
- Chuỗi là mẫu số chung của nhiều API ([trường input](/en-US/docs/Web/API/HTMLInputElement), giá trị [local storage](/en-US/docs/Web/API/Web_Storage_API), phản hồi [`fetch()`](/en-US/docs/Web/API/Window/fetch) khi dùng {{domxref("Response.text()")}}, v.v.) và có thể cám dỗ bạn chỉ làm việc với chuỗi.

Với các quy ước, có thể biểu diễn bất kỳ cấu trúc dữ liệu nào trong chuỗi. Nhưng điều này không có nghĩa là ý tưởng tốt. Ví dụ, với dấu phân cách, người ta có thể mô phỏng danh sách (trong khi mảng JavaScript sẽ phù hợp hơn). Thật không may, khi dấu phân cách được dùng trong một trong các phần tử "danh sách", danh sách bị hỏng. Có thể chọn ký tự thoát, v.v. Tất cả điều này đòi hỏi quy ước và tạo gánh nặng bảo trì không cần thiết.

Hãy dùng chuỗi cho dữ liệu văn bản. Khi biểu diễn dữ liệu phức tạp, _phân tích_ chuỗi và dùng sự trừu tượng hóa phù hợp.

### Kiểu Symbol

{{jsxref("Symbol")}} là giá trị nguyên thủy **duy nhất** và **bất biến** và có thể được dùng làm key của thuộc tính Object (xem bên dưới). Trong một số ngôn ngữ lập trình, Symbol được gọi là "atoms". Mục đích của symbol là tạo ra các key thuộc tính duy nhất được đảm bảo không xung đột với key từ code khác.

## Object

Trong khoa học máy tính, object là một giá trị trong bộ nhớ có thể được tham chiếu bởi một [định danh](/en-US/docs/Glossary/Identifier). Trong JavaScript, object là các giá trị [có thể thay đổi](/en-US/docs/Glossary/Mutable) duy nhất. [Hàm](/en-US/docs/Web/JavaScript/Reference/Functions) thực ra cũng là object với khả năng bổ sung là có thể _gọi được_.

### Thuộc tính

Trong JavaScript, object có thể được xem như một tập hợp các thuộc tính. Với [cú pháp object literal](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#object_literals), một tập hợp thuộc tính hạn chế được khởi tạo; sau đó các thuộc tính có thể được thêm và xóa. Thuộc tính object tương đương với các cặp key-value. Key thuộc tính là [chuỗi](#string_type) hoặc [symbol](#symbol_type). Khi các kiểu khác (như số) được dùng để lập index object, các giá trị được chuyển đổi ngầm định thành chuỗi. Giá trị thuộc tính có thể là giá trị của bất kỳ kiểu nào, bao gồm cả object khác, cho phép xây dựng các cấu trúc dữ liệu phức tạp.

Có hai loại thuộc tính object: [thuộc tính _data_](#data_property) và [thuộc tính _accessor_](#accessor_property). Mỗi thuộc tính có các _attribute_ tương ứng. Mỗi attribute được truy cập nội bộ bởi engine JavaScript, nhưng bạn có thể đặt chúng thông qua {{jsxref("Object.defineProperty()")}}, hoặc đọc chúng thông qua {{jsxref("Object.getOwnPropertyDescriptor()")}}. Bạn có thể đọc thêm về các sắc thái khác nhau trên trang {{jsxref("Object.defineProperty()")}}.

#### Thuộc tính data

Thuộc tính data liên kết một key với một giá trị. Nó có thể được mô tả bởi các attribute sau:

- `value`
  - : Giá trị được lấy khi truy cập get thuộc tính. Có thể là bất kỳ giá trị JavaScript nào.
- `writable`
  - : Giá trị boolean cho biết liệu thuộc tính có thể được thay đổi bằng lệnh gán không.
- `enumerable`
  - : Giá trị boolean cho biết liệu thuộc tính có thể được liệt kê bằng vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in) không. Xem thêm [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties) để biết cách enumerability tương tác với các hàm và cú pháp khác.
- `configurable`
  - : Giá trị boolean cho biết liệu thuộc tính có thể bị xóa, có thể chuyển đổi thành thuộc tính accessor, và có thể thay đổi attribute của nó không.

#### Thuộc tính accessor

Liên kết một key với một trong hai hàm accessor (`get` và `set`) để lấy hoặc lưu giá trị.

> [!NOTE]
> Điều quan trọng là nhận ra đây là _thuộc tính_ accessor — không phải _method_ accessor. Chúng ta có thể cung cấp cho JavaScript object các accessor giống class bằng cách dùng hàm làm giá trị — nhưng điều đó không làm object trở thành class.

Thuộc tính accessor có các attribute sau:

- `get`
  - : Hàm được gọi với danh sách tham số rỗng để lấy giá trị thuộc tính bất cứ khi nào có truy cập get vào giá trị. Xem thêm [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get). Có thể là `undefined`.
- `set`
  - : Hàm được gọi với tham số chứa giá trị được gán. Được thực thi bất cứ khi nào thuộc tính được chỉ định cố gắng thay đổi. Xem thêm [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set). Có thể là `undefined`.
- `enumerable`
  - : Giá trị boolean cho biết liệu thuộc tính có thể được liệt kê bằng vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in) không. Xem thêm [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties) để biết cách enumerability tương tác với các hàm và cú pháp khác.
- `configurable`
  - : Giá trị boolean cho biết liệu thuộc tính có thể bị xóa, có thể chuyển đổi thành thuộc tính data, và có thể thay đổi attribute của nó không.

[Prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) của một object trỏ đến object khác hoặc `null` — nó về mặt khái niệm là thuộc tính ẩn của object, thường được biểu diễn là `[[Prototype]]`. Các thuộc tính của `[[Prototype]]` của object cũng có thể được truy cập trên object đó.

Object là các cặp key-value đặc biệt, vì vậy chúng thường được dùng như map. Tuy nhiên, có thể có các vấn đề về tính tiện dụng, bảo mật và hiệu suất. Hãy dùng {{jsxref("Map")}} để lưu trữ dữ liệu tùy ý thay thế. [Tham khảo `Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map#objects_vs._maps) chứa thảo luận chi tiết hơn về ưu và nhược điểm giữa plain object và map để lưu trữ các liên kết key-value.

### Ngày giờ

JavaScript cung cấp hai tập API để biểu diễn ngày giờ: object {{jsxref("Date")}} legacy và object {{jsxref("Temporal")}} hiện đại. `Date` có nhiều lựa chọn thiết kế không mong muốn và nên tránh trong code mới nếu có thể.

### Tập hợp có chỉ mục: Array và Typed Array

[Array](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) là các object thông thường có mối quan hệ đặc biệt giữa các thuộc tính có key là số nguyên và thuộc tính `length`.

Ngoài ra, array kế thừa từ `Array.prototype`, cung cấp một số method tiện lợi để thao tác mảng. Ví dụ, [`indexOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) tìm kiếm giá trị trong mảng và [`push()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) thêm một phần tử vào mảng. Điều này làm Array trở thành ứng viên hoàn hảo để biểu diễn danh sách có thứ tự.

[Typed Array](/en-US/docs/Web/JavaScript/Guide/Typed_arrays) trình bày view giống mảng của một data buffer nhị phân cơ bản và cung cấp nhiều method có ngữ nghĩa tương tự với các đối ứng của mảng. "Typed array" là thuật ngữ bao gồm cho một loạt các cấu trúc dữ liệu, bao gồm `Int8Array`, `Float32Array`, v.v. Kiểm tra trang [typed array](/en-US/docs/Web/JavaScript/Guide/Typed_arrays) để biết thêm thông tin. Typed array thường được dùng kết hợp với {{jsxref("ArrayBuffer")}} và {{jsxref("DataView")}}.

### Tập hợp có key: Map, Set, WeakMap, WeakSet

Các cấu trúc dữ liệu này lấy tham chiếu object làm key. {{jsxref("Set")}} và {{jsxref("WeakSet")}} đại diện cho tập hợp các giá trị duy nhất, trong khi {{jsxref("Map")}} và {{jsxref("WeakMap")}} đại diện cho tập hợp các liên kết key-value.

Bạn có thể tự triển khai `Map` và `Set`. Tuy nhiên, vì object không thể so sánh (theo nghĩa `<` "nhỏ hơn", chẳng hạn), và engine không lộ ra hàm hash của nó cho object, hiệu suất tìm kiếm sẽ nhất thiết là tuyến tính. Các triển khai gốc của chúng (bao gồm `WeakMap`) có thể có hiệu suất tìm kiếm gần như logarithmic đến hằng số.

Thường, để bind dữ liệu vào DOM node, người ta có thể đặt thuộc tính trực tiếp trên object, hoặc dùng thuộc tính `data-*`. Nhược điểm là dữ liệu có sẵn cho bất kỳ script nào chạy trong cùng context. `Map` và `WeakMap` giúp dễ dàng _riêng tư_ bind dữ liệu vào object.

`WeakMap` và `WeakSet` chỉ cho phép các giá trị có thể thu gom rác (garbage-collectable) làm key, là object hoặc [symbol không đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry), và các key có thể được thu gom ngay cả khi chúng còn trong tập hợp. Chúng được dùng cụ thể cho [tối ưu hóa sử dụng bộ nhớ](/en-US/docs/Web/JavaScript/Guide/Memory_management#data_structures_aiding_memory_management).

### Dữ liệu có cấu trúc: JSON

JSON (**J**ava**S**cript **O**bject **N**otation) là định dạng trao đổi dữ liệu nhẹ, bắt nguồn từ JavaScript, nhưng được dùng bởi nhiều ngôn ngữ lập trình. JSON xây dựng các cấu trúc dữ liệu phổ quát có thể được truyền giữa các môi trường khác nhau và thậm chí giữa các ngôn ngữ. Xem {{jsxref("JSON")}} để biết thêm chi tiết.

### Thêm object trong thư viện chuẩn

JavaScript có thư viện chuẩn gồm các object có sẵn. Đọc [tài liệu tham khảo](/en-US/docs/Web/JavaScript/Reference/Global_Objects) để tìm hiểu thêm về các object có sẵn.

## Chuyển đổi kiểu

Như đã đề cập ở trên, JavaScript là ngôn ngữ [kiểu yếu](#dynamic_and_weak_typing). Điều này có nghĩa là bạn thường có thể dùng giá trị của một kiểu ở nơi mong đợi kiểu khác, và ngôn ngữ sẽ chuyển đổi nó thành kiểu đúng cho bạn. Để làm vậy, JavaScript định nghĩa một số quy tắc chuyển đổi.

### Chuyển đổi nguyên thủy

Quá trình [chuyển đổi nguyên thủy](https://tc39.es/ecma262/multipage/abstract-operations.html#sec-toprimitive) được dùng khi mong đợi giá trị nguyên thủy, nhưng không có ưu tiên mạnh về kiểu thực tế nên là gì. Điều này thường xảy ra khi [chuỗi](#string_type), [số](#number_type), hoặc [BigInt](#bigint_type) đều có thể chấp nhận được. Ví dụ:

- Constructor [`Date()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/Date), khi nhận một tham số không phải instance `Date` — chuỗi đại diện cho chuỗi ngày, trong khi số đại diện cho timestamp.
- Toán tử [`+`](/en-US/docs/Web/JavaScript/Reference/Operators/Addition) — nếu một toán hạng là chuỗi, nối chuỗi được thực hiện; nếu không, cộng số được thực hiện.
- Toán tử [`==`](/en-US/docs/Web/JavaScript/Reference/Operators/Equality) — nếu một toán hạng là nguyên thủy và cái kia là object, object được chuyển đổi thành giá trị nguyên thủy không có kiểu ưu tiên.

Thao tác này không thực hiện bất kỳ chuyển đổi nào nếu giá trị đã là nguyên thủy. Object được chuyển đổi thành nguyên thủy bằng cách gọi [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive) (với `"default"` làm gợi ý), `valueOf()`, và `toString()`, theo thứ tự đó. Lưu ý rằng chuyển đổi nguyên thủy gọi `valueOf()` trước `toString()`, tương tự như hành vi của [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) nhưng khác với [chuyển đổi chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion).

Method `[Symbol.toPrimitive]()`, nếu có, phải trả về nguyên thủy — trả về object dẫn đến {{jsxref("TypeError")}}. Đối với `valueOf()` và `toString()`, nếu một cái trả về object, giá trị trả về bị bỏ qua và giá trị trả về của cái kia được dùng thay thế; nếu không có cái nào, hoặc không có cái nào trả về nguyên thủy, `TypeError` được ném. Ví dụ, trong code sau:

```js
console.log({} + []); // "[object Object]"
```

Cả `{}` và `[]` đều không có method `[Symbol.toPrimitive]()`. Cả `{}` và `[]` đều kế thừa `valueOf()` từ {{jsxref("Object.prototype.valueOf")}}, trả về chính object. Vì giá trị trả về là object, nên bị bỏ qua. Do đó, `toString()` được gọi thay thế. [`{}.toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString) trả về `"[object Object]"`, trong khi [`[].toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toString) trả về `""`, vì vậy kết quả là phép nối của chúng: `"[object Object]"`.

Method `[Symbol.toPrimitive]()` luôn ưu tiên khi chuyển đổi sang bất kỳ kiểu nguyên thủy nào. Chuyển đổi nguyên thủy nói chung hoạt động như chuyển đổi số, vì `valueOf()` được ưu tiên gọi; tuy nhiên, object có method `[Symbol.toPrimitive]()` tùy chỉnh có thể chọn trả về bất kỳ nguyên thủy nào. Các object {{jsxref("Date")}} và {{jsxref("Symbol")}} là các object có sẵn duy nhất ghi đè method `[Symbol.toPrimitive]()`. [`Date.prototype[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/Symbol.toPrimitive) coi gợi ý `"default"` như thể là `"string"`, trong khi [`Symbol.prototype[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/Symbol.toPrimitive) bỏ qua gợi ý và luôn trả về symbol.

### Chuyển đổi số

Có hai kiểu số: [Number](#number_type) và [BigInt](#bigint_type). Đôi khi ngôn ngữ cụ thể mong đợi số hoặc BigInt (chẳng hạn như {{jsxref("Array.prototype.slice()")}}, nơi index phải là số); các lần khác, nó có thể chấp nhận cả hai và thực hiện các thao tác khác nhau tùy thuộc vào kiểu của toán hạng. Đối với các quá trình chuyển đổi nghiêm ngặt không cho phép chuyển đổi ngầm định từ kiểu kia, xem [chuyển đổi number](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) và [chuyển đổi BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt#bigint_coercion).

Chuyển đổi số gần giống với [chuyển đổi number](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), ngoại trừ BigInt được trả về nguyên trạng thay vì gây ra `TypeError`. Chuyển đổi số được dùng bởi tất cả toán tử số học, vì chúng được nạp chồng cho cả số và BigInt. Ngoại lệ duy nhất là [unary plus](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus), luôn thực hiện chuyển đổi number.

### Các chuyển đổi khác

Tất cả kiểu dữ liệu, ngoại trừ Null, Undefined và Symbol, đều có quá trình chuyển đổi tương ứng. Xem [chuyển đổi chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), [chuyển đổi boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion) và [chuyển đổi object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#object_coercion) để biết thêm chi tiết.

Như bạn có thể nhận thấy, có ba con đường riêng biệt để chuyển đổi object thành nguyên thủy:

- [Chuyển đổi nguyên thủy](#primitive_coercion): `[Symbol.toPrimitive]("default")` → `valueOf()` → `toString()`
- [Chuyển đổi số](#numeric_coercion), [chuyển đổi number](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), [chuyển đổi BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt#bigint_coercion): `[Symbol.toPrimitive]("number")` → `valueOf()` → `toString()`
- [Chuyển đổi chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion): `[Symbol.toPrimitive]("string")` → `toString()` → `valueOf()`

Trong mọi trường hợp, `[Symbol.toPrimitive]()`, nếu có, phải có thể gọi được và trả về nguyên thủy, trong khi `valueOf` hoặc `toString` sẽ bị bỏ qua nếu chúng không thể gọi được hoặc trả về object. Ở cuối quá trình, nếu thành công, kết quả được đảm bảo là nguyên thủy. Nguyên thủy kết quả sau đó sẽ được chuyển đổi thêm tùy thuộc vào context.

## Xem thêm

- [JavaScript Data Structures and Algorithms](https://github.com/trekhleb/javascript-algorithms) bởi Oleksii Trekhleb
- [Computer Science in JavaScript](https://github.com/humanwhocodes/computer-science-in-javascript) bởi Nicholas C. Zakas
