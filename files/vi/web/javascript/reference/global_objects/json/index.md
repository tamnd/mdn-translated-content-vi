---
title: JSON
slug: Web/JavaScript/Reference/Global_Objects/JSON
page-type: javascript-namespace
browser-compat: javascript.builtins.JSON
sidebar: jsref
---

Đối tượng không gian tên **`JSON`** chứa các phương thức tĩnh để phân tích cú pháp các giá trị từ và chuyển đổi các giá trị sang [Ký hiệu đối tượng JavaScript](https://json.org/) ({{Glossary("JSON")}}).

## Mô tả

Không giống hầu hết các đối tượng toàn cục, `JSON` không phải là constructor. Bạn không thể sử dụng nó với [toán tử `new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) hay gọi đối tượng `JSON` như một hàm. Tất cả thuộc tính và phương thức của `JSON` đều là tĩnh (giống như đối tượng {{jsxref("Math")}}).

### Sự khác biệt giữa JavaScript và JSON

JSON là một cú pháp để tuần tự hóa đối tượng, mảng, số, chuỗi, giá trị boolean, và [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null). Nó dựa trên cú pháp JavaScript, nhưng khác biệt với JavaScript: hầu hết JavaScript _không phải_ là JSON. Ví dụ:

- Đối tượng và Mảng
  - : Tên thuộc tính phải là chuỗi được đặt trong ngoặc kép; [dấu phẩy cuối](/en-US/docs/Web/JavaScript/Reference/Trailing_commas) bị cấm.
- Số
  - : Không được có số không đứng đầu. Dấu thập phân phải có ít nhất một chữ số theo sau. `NaN` và `Infinity` không được hỗ trợ.

Bất kỳ văn bản JSON nào đều là biểu thức JavaScript hợp lệ, nhưng chỉ sau khi có sửa đổi [JSON superset](https://github.com/tc39/proposal-json-superset). Trước khi có sửa đổi này, U+2028 LINE SEPARATOR và U+2029 PARAGRAPH SEPARATOR được phép xuất hiện trong chuỗi ký tự và khóa thuộc tính trong JSON; nhưng việc sử dụng tương tự trong chuỗi ký tự JavaScript gây ra {{jsxref("SyntaxError")}}.

Các điểm khác biệt khác bao gồm chỉ cho phép chuỗi được đặt trong ngoặc kép và không hỗ trợ {{jsxref("undefined")}} hay chú thích. Đối với những ai muốn sử dụng định dạng cấu hình thân thiện hơn dựa trên JSON, có [JSON5](https://json5.org/), được dùng bởi trình biên dịch Babel, và [YAML](https://en.wikipedia.org/wiki/YAML) được sử dụng phổ biến hơn.

Cùng một văn bản có thể biểu diễn các giá trị khác nhau trong literal đối tượng JavaScript và JSON. Để biết thêm thông tin, hãy xem [Cú pháp literal đối tượng và JSON](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#object_literal_syntax_vs._json).

### Ngữ pháp JSON đầy đủ

Cú pháp JSON hợp lệ được định nghĩa chính thức bởi ngữ pháp sau, được biểu diễn bằng [ABNF](https://en.wikipedia.org/wiki/Augmented_Backus%E2%80%93Naur_form), và được sao chép từ [tiêu chuẩn JSON IETF (RFC)](https://datatracker.ietf.org/doc/html/rfc8259):

```plain
JSON-text = ws value ws
begin-array     = ws %x5B ws  ; [ left square bracket
begin-object    = ws %x7B ws  ; { left curly bracket
end-array       = ws %x5D ws  ; ] right square bracket
end-object      = ws %x7D ws  ; } right curly bracket
name-separator  = ws %x3A ws  ; : colon
value-separator = ws %x2C ws  ; , comma
ws = *(
     %x20 /              ; Space
     %x09 /              ; Horizontal tab
     %x0A /              ; Line feed or New line
     %x0D                ; Carriage return
     )
value = false / null / true / object / array / number / string
false = %x66.61.6c.73.65   ; false
null  = %x6e.75.6c.6c      ; null
true  = %x74.72.75.65      ; true
object = begin-object [ member *( value-separator member ) ]
         end-object
member = string name-separator value
array = begin-array [ value *( value-separator value ) ] end-array
number = [ minus ] int [ frac ] [ exp ]
decimal-point = %x2E       ; .
digit1-9 = %x31-39         ; 1-9
e = %x65 / %x45            ; e E
exp = e [ minus / plus ] 1*DIGIT
frac = decimal-point 1*DIGIT
int = zero / ( digit1-9 *DIGIT )
minus = %x2D               ; -
plus = %x2B                ; +
zero = %x30                ; 0
string = quotation-mark *char quotation-mark
char = unescaped /
    escape (
        %x22 /          ; "    quotation mark  U+0022
        %x5C /          ; \    reverse solidus U+005C
        %x2F /          ; /    solidus         U+002F
        %x62 /          ; b    backspace       U+0008
        %x66 /          ; f    form feed       U+000C
        %x6E /          ; n    line feed       U+000A
        %x72 /          ; r    carriage return U+000D
        %x74 /          ; t    tab             U+0009
        %x75 4HEXDIG )  ; uXXXX                U+XXXX
escape = %x5C              ; \
quotation-mark = %x22      ; "
unescaped = %x20-21 / %x23-5B / %x5D-10FFFF
HEXDIG = DIGIT / %x41-46 / %x61-66   ; 0-9, A-F, or a-f
       ; HEXDIG equivalent to HEXDIG rule in [RFC5234]
DIGIT = %x30-39            ; 0-9
      ; DIGIT equivalent to DIGIT rule in [RFC5234]
```

{{Glossary("whitespace")}} không có ý nghĩa có thể xuất hiện ở bất kỳ đâu trừ bên trong `JSONNumber` (số không được chứa khoảng trắng) hay `JSONString` (nơi nó được hiểu là ký tự tương ứng trong chuỗi, hoặc sẽ gây ra lỗi). Ký tự tab (U+0009), carriage return (U+000D), line feed (U+000A), và space (U+0020) là các ký tự khoảng trắng hợp lệ duy nhất.

## Thuộc tính tĩnh

- `JSON[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"JSON"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức tĩnh

- {{jsxref("JSON.isRawJSON()")}}
  - : Kiểm tra xem một giá trị có phải là đối tượng được trả về bởi {{jsxref("JSON.rawJSON()")}} hay không.
- {{jsxref("JSON.parse()")}}
  - : Phân tích cú pháp một đoạn văn bản chuỗi dạng JSON, tùy chọn biến đổi giá trị được tạo ra và các thuộc tính của nó, rồi trả về giá trị.
- {{jsxref("JSON.rawJSON()")}}
  - : Tạo một đối tượng "JSON thô" chứa một đoạn văn bản JSON. Khi được tuần tự hóa sang JSON, đối tượng JSON thô được xử lý như thể nó đã là một đoạn JSON. Văn bản này phải là JSON hợp lệ.
- {{jsxref("JSON.stringify()")}}
  - : Trả về chuỗi JSON tương ứng với giá trị được chỉ định, tùy chọn chỉ bao gồm một số thuộc tính nhất định hoặc thay thế các giá trị thuộc tính theo cách do người dùng định nghĩa.

## Ví dụ

### Ví dụ JSON

```json
{
  "browsers": {
    "firefox": {
      "name": "Firefox",
      "pref_url": "about:config",
      "releases": {
        "1": {
          "release_date": "2004-11-09",
          "status": "retired",
          "engine": "Gecko",
          "engine_version": "1.7"
        }
      }
    }
  }
}
```

Bạn có thể dùng phương thức {{jsxref("JSON.parse()")}} để chuyển đổi chuỗi JSON trên thành đối tượng JavaScript:

```js
const jsonText = `{
  "browsers": {
    "firefox": {
      "name": "Firefox",
      "pref_url": "about:config",
      "releases": {
        "1": {
          "release_date": "2004-11-09",
          "status": "retired",
          "engine": "Gecko",
          "engine_version": "1.7"
        }
      }
    }
  }
}`;

console.log(JSON.parse(jsonText));
```

### Tuần tự hóa số không mất độ chính xác

JSON có thể chứa số nguyên với độ chính xác tùy ý. Tuy nhiên, không thể biểu diễn chính xác tất cả các số JSON trong JavaScript, vì JavaScript sử dụng biểu diễn dấu phẩy động với độ chính xác cố định. Ví dụ, `12345678901234567890 === 12345678901234567000` trong JavaScript vì chúng có cùng biểu diễn dấu phẩy động. Điều này có nghĩa là không có số JavaScript nào tương ứng chính xác với số JSON `12345678901234567890`.

Giả sử bạn có biểu diễn chính xác của một số nào đó (thông qua {{jsxref("BigInt")}} hoặc một thư viện tùy chỉnh):

```js
const data = {
  // Using a BigInt here to store the exact value,
  // but it can also be a custom high-precision number library,
  // if the number might not be an integer.
  gross_gdp: 12345678901234567890n,
};
```

Bạn muốn tuần tự hóa rồi phân tích cú pháp để thu được cùng một số chính xác. Có một số khó khăn:

- Về phía tuần tự hóa, để có một số trong JSON, bạn phải truyền một số vào `JSON.stringify`, thông qua hàm `replacer` hoặc phương thức `toJSON`. Nhưng dù sao, bạn đã mất độ chính xác trong quá trình chuyển đổi số. Nếu bạn truyền một chuỗi vào `JSON.stringify`, nó sẽ được tuần tự hóa dưới dạng chuỗi, không phải số.
- Về phía phân tích cú pháp, không phải tất cả các số đều có thể được biểu diễn chính xác. Ví dụ, `JSON.parse("12345678901234567890")` trả về `12345678901234568000` vì số được làm tròn đến số biểu diễn được gần nhất. Ngay cả khi bạn sử dụng hàm `reviver`, số đã bị làm tròn trước khi hàm `reviver` được gọi.

Nói chung, có hai cách để đảm bảo các số được chuyển đổi sang JSON và phân tích ngược lại không mất độ chính xác: một cách liên quan đến số JSON, cách kia liên quan đến chuỗi JSON. JSON là _định dạng giao tiếp_, vì vậy nếu bạn sử dụng JSON, có thể bạn đang giao tiếp với một hệ thống khác (yêu cầu HTTP, lưu trữ trong cơ sở dữ liệu, v.v.). Giải pháp tốt nhất phụ thuộc vào hệ thống nhận.

#### Sử dụng chuỗi JSON

Nếu hệ thống nhận không có cùng khả năng xử lý JSON như JavaScript và không hỗ trợ số có độ chính xác cao, bạn có thể muốn tuần tự hóa số dưới dạng chuỗi, sau đó xử lý nó như một chuỗi ở phía nhận. Đây cũng là lựa chọn duy nhất trong JavaScript cũ hơn.

Để chỉ định cách các kiểu dữ liệu tùy chỉnh (bao gồm `BigInt`) được tuần tự hóa sang JSON, thêm phương thức `toJSON` vào kiểu dữ liệu của bạn hoặc sử dụng hàm `replacer` của {{jsxref("JSON.stringify()")}}.

```js
// Using toJSON() method
BigInt.prototype.toJSON = function () {
  return this.toString();
};
const str1 = JSON.stringify(data);

// Using JSON.stringify() with replacer
const str2 = JSON.stringify(data, (key, value) => {
  if (key === "gross_gdp") {
    return value.toString();
  }
  return value;
});
```

Trong cả hai trường hợp, văn bản JSON trông giống như `{"gross_gdp":"12345678901234567890"}`, trong đó giá trị là chuỗi, không phải số. Sau đó, ở phía nhận, bạn có thể phân tích JSON và xử lý chuỗi.

#### Sử dụng số JSON

Nếu hệ thống nhận tin nhắn này hỗ trợ số có độ chính xác cao một cách tự nhiên (như số nguyên Python), việc truyền số dưới dạng số JSON rõ ràng là tốt hơn, vì chúng có thể phân tích trực tiếp sang kiểu có độ chính xác cao thay vì phân tích chuỗi từ JSON, rồi phân tích số từ chuỗi. Trong JavaScript, bạn có thể tuần tự hóa các kiểu dữ liệu tùy ý sang số JSON mà không tạo ra giá trị số trước (dẫn đến mất độ chính xác) bằng cách sử dụng {{jsxref("JSON.rawJSON()")}} để chỉ định chính xác văn bản nguồn JSON cần là gì.

```js
// Using toJSON() method
BigInt.prototype.toJSON = function () {
  return JSON.rawJSON(this.toString());
};
const str1 = JSON.stringify(data);

// Using JSON.stringify() with replacer
const str2 = JSON.stringify(data, (key, value) => {
  if (key === "gross_gdp") {
    return JSON.rawJSON(value.toString());
  }
  return value;
});
```

Văn bản được truyền cho `JSON.rawJSON` được xử lý như thể nó đã là một đoạn JSON, vì vậy nó sẽ không được tuần tự hóa lại thành chuỗi. Do đó, văn bản JSON trông giống như `{"gross_gdp":12345678901234567890}`, trong đó giá trị là số. JSON này sau đó có thể được phân tích bởi hệ thống nhận mà không cần xử lý thêm, miễn là hệ thống nhận không có cùng hạn chế về độ chính xác như JavaScript.

Khi phân tích JSON chứa các số có độ chính xác cao trong JavaScript, hãy đặc biệt cẩn thận vì khi `JSON.parse()` gọi hàm `reviver`, giá trị bạn nhận đã được phân tích (và đã mất độ chính xác). Bạn có thể sử dụng tham số `context.source` của hàm `reviver` trong {{jsxref("JSON.parse()")}} để phân tích lại số.

```js
const parsedData = JSON.parse(str, (key, value, context) => {
  if (key === "gross_gdp") {
    // Or use the constructor of your custom high-precision number library
    return BigInt(context.source);
  }
  return value;
});
// { gross_gdp: 12345678901234567890n }
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [JSON Diff](https://json-diff.com/)
- [JSON Beautifier/editor](https://jsonbeautifier.org/)
- [JSON Parser](https://jsonparser.org/)
- [JSON Validator](https://tools.learningcontainer.com/json-validator/)
