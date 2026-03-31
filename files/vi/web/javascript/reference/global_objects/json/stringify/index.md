---
title: JSON.stringify()
short-title: stringify()
slug: Web/JavaScript/Reference/Global_Objects/JSON/stringify
page-type: javascript-static-method
browser-compat: javascript.builtins.JSON.stringify
sidebar: jsref
---

Phương thức tĩnh **`JSON.stringify()`** chuyển đổi một giá trị JavaScript thành chuỗi JSON, tùy chọn thay thế các giá trị nếu hàm replacer được chỉ định hoặc tùy chọn chỉ bao gồm các thuộc tính được chỉ định nếu mảng replacer được chỉ định.

{{InteractiveExample("JavaScript Demo: JSON.stringify()", "taller")}}

```js interactive-example
console.log(JSON.stringify({ x: 5, y: 6 }));
// Expected output: '{"x":5,"y":6}'

console.log(
  JSON.stringify([new Number(3), new String("false"), new Boolean(false)]),
);
// Expected output: '[3,"false",false]'

console.log(JSON.stringify({ x: [10, undefined, function () {}, Symbol("")] }));
// Expected output: '{"x":[10,null,null,null]}'

console.log(JSON.stringify(new Date(2006, 0, 2, 15, 4, 5)));
// Expected output: '"2006-01-02T15:04:05.000Z"'
```

## Cú pháp

```js-nolint
JSON.stringify(value)
JSON.stringify(value, replacer)
JSON.stringify(value, replacer, space)
```

### Tham số

- `value`
  - : Giá trị cần chuyển đổi thành chuỗi JSON.
- `replacer` {{optional_inline}}
  - : Một hàm làm thay đổi hành vi của quá trình chuỗi hóa, hoặc một mảng chuỗi và số chỉ định các thuộc tính của `value` cần được bao gồm trong đầu ra. Nếu `replacer` là mảng, tất cả các phần tử trong mảng này không phải là chuỗi hoặc số (cả nguyên thủy lẫn đối tượng bọc), bao gồm cả các giá trị {{jsxref("Symbol")}}, đều bị bỏ qua hoàn toàn. Nếu `replacer` là bất cứ thứ gì khác ngoài hàm hoặc mảng (ví dụ, [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc không được cung cấp), tất cả các thuộc tính có khóa chuỗi của đối tượng đều được bao gồm trong chuỗi JSON kết quả.
- `space` {{optional_inline}}
  - : Một chuỗi hoặc số được dùng để chèn khoảng trắng (bao gồm thụt lề, ký tự ngắt dòng, v.v.) vào chuỗi JSON đầu ra cho mục đích dễ đọc.

    Nếu đây là số, nó chỉ ra số ký tự khoảng trắng được dùng làm thụt lề, giới hạn ở 10 (tức là, bất kỳ số nào lớn hơn `10` được xử lý như thể là `10`). Các giá trị nhỏ hơn 1 chỉ ra rằng không nên dùng khoảng trắng.

    Nếu đây là chuỗi, chuỗi đó (hoặc 10 ký tự đầu tiên của chuỗi, nếu dài hơn) được chèn trước mỗi đối tượng hoặc mảng lồng nhau.

    Nếu `space` là bất cứ thứ gì khác ngoài chuỗi hoặc số (có thể là nguyên thủy hoặc đối tượng bọc) — ví dụ, là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc không được cung cấp — không sử dụng khoảng trắng.

### Giá trị trả về

Một chuỗi JSON đại diện cho giá trị đã cho, hoặc undefined.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `value` chứa một tham chiếu vòng tròn.
    - Gặp phải một giá trị {{jsxref("BigInt")}}.

## Mô tả

`JSON.stringify()` chuyển đổi một giá trị thành ký hiệu JSON đại diện cho giá trị đó. Các giá trị được chuỗi hóa theo cách sau:

- Các đối tượng {{jsxref("Boolean")}}, {{jsxref("Number")}}, {{jsxref("String")}}, và {{jsxref("BigInt")}} (có thể lấy qua [`Object()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/Object)) được chuyển đổi thành các giá trị nguyên thủy tương ứng trong quá trình chuỗi hóa, theo ngữ nghĩa chuyển đổi truyền thống. Các đối tượng {{jsxref("Symbol")}} (có thể lấy qua [`Object()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/Object)) được xử lý như đối tượng thuần túy.
- Cố gắng tuần tự hóa các giá trị {{jsxref("BigInt")}} sẽ ném ra lỗi. Tuy nhiên, nếu BigInt có phương thức `toJSON()` (thông qua monkey patching: `BigInt.prototype.toJSON = ...`), phương thức đó có thể cung cấp kết quả tuần tự hóa. Ràng buộc này đảm bảo rằng hành vi tuần tự hóa đúng (và rất có thể, kèm theo đó là hành vi giải tuần tự hóa) luôn được cung cấp rõ ràng bởi người dùng.
- Các giá trị {{jsxref("undefined")}}, {{jsxref("Function")}}, và {{jsxref("Symbol")}} không phải là các giá trị JSON hợp lệ. Nếu bất kỳ giá trị nào như vậy được gặp trong quá trình chuyển đổi, chúng hoặc bị bỏ qua (khi tìm thấy trong đối tượng) hoặc được đổi thành [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) (khi tìm thấy trong mảng). `JSON.stringify()` có thể trả về `undefined` khi truyền vào các giá trị "thuần túy" như `JSON.stringify(() => {})` hoặc `JSON.stringify(undefined)`.
- Các số {{jsxref("Infinity")}} và {{jsxref("NaN")}}, cũng như giá trị [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), đều được coi là `null`. (Nhưng không giống như các giá trị ở điểm trước, chúng sẽ không bao giờ bị bỏ qua.)
- Mảng được tuần tự hóa như mảng (được bao quanh bởi ngoặc vuông). Chỉ các chỉ số mảng từ 0 đến `length - 1` (bao gồm) được tuần tự hóa; các thuộc tính khác bị bỏ qua.
- Đối tượng JSON thô đặc biệt được tạo bằng {{jsxref("JSON.rawJSON()")}} được tuần tự hóa như văn bản JSON thô mà nó chứa (bằng cách truy cập thuộc tính `rawJSON` của nó).
- Đối với các đối tượng khác:
  - Tất cả các thuộc tính có khóa {{jsxref("Symbol")}} sẽ bị bỏ qua hoàn toàn, ngay cả khi sử dụng tham số [`replacer`](#tham_số_replacer).

  - Nếu giá trị có phương thức `toJSON()`, nó chịu trách nhiệm xác định dữ liệu nào sẽ được tuần tự hóa. Thay vì đối tượng được tuần tự hóa, giá trị được trả về bởi phương thức `toJSON()` khi được gọi sẽ được tuần tự hóa. `JSON.stringify()` gọi `toJSON` với một tham số, `key`, có ngữ nghĩa giống như tham số `key` của hàm [`replacer`](#tham_số_replacer):
    - nếu đối tượng này là một giá trị thuộc tính, tên thuộc tính
    - nếu nó ở trong mảng, chỉ số trong mảng, dưới dạng chuỗi
    - nếu `JSON.stringify()` được gọi trực tiếp trên đối tượng này, một chuỗi rỗng

    Tất cả các đối tượng {{jsxref("Temporal")}} triển khai phương thức `toJSON()`, trả về một chuỗi (giống như gọi `toString()`). Do đó, chúng sẽ được tuần tự hóa thành chuỗi. Tương tự, các đối tượng {{jsxref("Date")}} triển khai `toJSON()`, trả về giống như [`toISOString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString).

  - Chỉ các [thuộc tính riêng có thể liệt kê](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties) được duyệt qua. Điều này có nghĩa {{jsxref("Map")}}, {{jsxref("Set")}}, v.v. sẽ trở thành `"{}"`. Bạn có thể sử dụng tham số [`replacer`](#tham_số_replacer) để tuần tự hóa chúng thành thứ gì đó hữu ích hơn.

    Các thuộc tính được duyệt qua bằng cùng thuật toán như [`Object.keys()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys), có thứ tự xác định rõ ràng và ổn định qua các triển khai. Ví dụ, `JSON.stringify` trên cùng một đối tượng sẽ luôn tạo ra cùng một chuỗi, và `JSON.parse(JSON.stringify(obj))` sẽ tạo ra một đối tượng với cùng thứ tự khóa như bản gốc (giả sử đối tượng hoàn toàn có thể tuần tự hóa JSON).

### Tham số replacer

Tham số `replacer` có thể là hàm hoặc mảng.

Là mảng, các phần tử của nó chỉ ra tên của các thuộc tính trong đối tượng cần được bao gồm trong chuỗi JSON kết quả. Chỉ các giá trị chuỗi và số được tính đến; các khóa symbol bị bỏ qua.

Là hàm, nó nhận hai tham số: `key` và `value` đang được chuỗi hóa. Đối tượng trong đó khóa được tìm thấy được cung cấp như ngữ cảnh `this` của `replacer`.

Hàm `replacer` được gọi cho đối tượng ban đầu đang được chuỗi hóa, trong trường hợp đó `key` là chuỗi rỗng (`""`). Sau đó nó được gọi cho mỗi thuộc tính trên đối tượng hoặc mảng đang được chuỗi hóa. Các chỉ số mảng sẽ được cung cấp dưới dạng chuỗi làm `key`. Giá trị thuộc tính hiện tại sẽ được thay thế bằng giá trị trả về của `replacer` cho quá trình chuỗi hóa. Điều này có nghĩa:

- Nếu bạn trả về một số, chuỗi, boolean hoặc `null`, giá trị đó được tuần tự hóa trực tiếp và dùng làm giá trị của thuộc tính. (Trả về BigInt cũng sẽ ném ra lỗi.)
- Nếu bạn trả về một {{jsxref("Function")}}, {{jsxref("Symbol")}}, hoặc {{jsxref("undefined")}}, thuộc tính không được bao gồm trong đầu ra.
- Nếu bạn trả về bất kỳ đối tượng nào khác, đối tượng đó được chuỗi hóa đệ quy, gọi hàm `replacer` trên mỗi thuộc tính.

> [!NOTE]
> Khi phân tích JSON được tạo với các hàm `replacer`, bạn có thể muốn sử dụng tham số [`reviver`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse#using_the_reviver_parameter) để thực hiện thao tác ngược lại.

Thông thường, chỉ số của các phần tử mảng sẽ không bao giờ bị dịch chuyển (ngay cả khi phần tử là giá trị không hợp lệ như hàm, nó sẽ trở thành `null` thay vì bị bỏ qua). Sử dụng hàm `replacer` cho phép bạn kiểm soát thứ tự của các phần tử mảng bằng cách trả về một mảng khác.

### Tham số space

Tham số `space` có thể được dùng để kiểm soát khoảng cách trong chuỗi cuối cùng.

- Nếu là số, các cấp kế tiếp trong quá trình chuỗi hóa sẽ được thụt lề bằng số ký tự khoảng trắng này.
- Nếu là chuỗi, các cấp kế tiếp sẽ được thụt lề bằng chuỗi này.

Mỗi cấp thụt lề sẽ không bao giờ dài hơn 10. Các giá trị số của `space` được giới hạn ở 10, và các giá trị chuỗi được cắt bớt xuống còn 10 ký tự.

## Ví dụ

### Sử dụng JSON.stringify

```js
JSON.stringify({}); // '{}'
JSON.stringify(true); // 'true'
JSON.stringify("foo"); // '"foo"'
JSON.stringify([1, "false", false]); // '[1,"false",false]'
JSON.stringify([NaN, null, Infinity]); // '[null,null,null]'
JSON.stringify({ x: 5 }); // '{"x":5}'

JSON.stringify(new Date(1906, 0, 2, 15, 4, 5));
// '"1906-01-02T15:04:05.000Z"'

JSON.stringify({ x: 5, y: 6 });
// '{"x":5,"y":6}'
JSON.stringify([new Number(3), new String("false"), new Boolean(false)]);
// '[3,"false",false]'

// String-keyed array elements are not enumerable and make no sense in JSON
const a = ["foo", "bar"];
a["baz"] = "quux"; // a: [ 0: 'foo', 1: 'bar', baz: 'quux' ]
JSON.stringify(a);
// '["foo","bar"]'

JSON.stringify({ x: [10, undefined, function () {}, Symbol("")] });
// '{"x":[10,null,null,null]}'

// Standard data structures
JSON.stringify([
  new Set([1]),
  new Map([[1, 2]]),
  new WeakSet([{ a: 1 }]),
  new WeakMap([[{ a: 1 }, 2]]),
]);
// '[{},{},{},{}]'

// TypedArray
JSON.stringify([new Int8Array([1]), new Int16Array([1]), new Int32Array([1])]);
// '[{"0":1},{"0":1},{"0":1}]'
JSON.stringify([
  new Uint8Array([1]),
  new Uint8ClampedArray([1]),
  new Uint16Array([1]),
  new Uint32Array([1]),
]);
// '[{"0":1},{"0":1},{"0":1},{"0":1}]'
JSON.stringify([new Float32Array([1]), new Float64Array([1])]);
// '[{"0":1},{"0":1}]'

// toJSON()
JSON.stringify({
  x: 5,
  y: 6,
  toJSON() {
    return this.x + this.y;
  },
});
// '11'

// Symbols:
JSON.stringify({ x: undefined, y: Object, z: Symbol("") });
// '{}'
JSON.stringify({ [Symbol("foo")]: "foo" });
// '{}'
JSON.stringify({ [Symbol.for("foo")]: "foo" }, [Symbol.for("foo")]);
// '{}'
JSON.stringify({ [Symbol.for("foo")]: "foo" }, (k, v) => {
  if (typeof k === "symbol") {
    return "a symbol";
  }
});
// undefined

// Non-enumerable properties:
JSON.stringify(
  Object.create(null, {
    x: { value: "x", enumerable: false },
    y: { value: "y", enumerable: true },
  }),
);
// '{"y":"y"}'

// BigInt values throw
JSON.stringify({ x: 2n });
// TypeError: BigInt value can't be serialized in JSON
```

### Sử dụng hàm làm replacer

```js
function replacer(key, value) {
  // Filtering out properties
  if (typeof value === "string") {
    return undefined;
  }
  return value;
}

const foo = {
  foundation: "Mozilla",
  model: "box",
  week: 45,
  transport: "car",
  month: 7,
};
JSON.stringify(foo, replacer);
// '{"week":45,"month":7}'
```

Nếu bạn muốn `replacer` phân biệt một đối tượng ban đầu với một khóa có thuộc tính chuỗi rỗng (vì cả hai đều cho chuỗi rỗng làm khóa và có thể là đối tượng làm giá trị), bạn sẽ phải theo dõi số lần lặp (nếu vượt quá lần lặp đầu tiên, đó là khóa chuỗi rỗng thực sự).

```js
function makeReplacer() {
  let isInitial = true;

  return (key, value) => {
    if (isInitial) {
      isInitial = false;
      return value;
    }
    if (key === "") {
      // Omit all properties with name "" (except the initial object)
      return undefined;
    }
    return value;
  };
}

const replacer = makeReplacer();
console.log(JSON.stringify({ "": 1, b: 2 }, replacer)); // "{"b":2}"
```

### Sử dụng mảng làm replacer

```js
const foo = {
  foundation: "Mozilla",
  model: "box",
  week: 45,
  transport: "car",
  month: 7,
};

JSON.stringify(foo, ["week", "month"]);
// '{"week":45,"month":7}', only keep "week" and "month" properties
```

### Sử dụng tham số space

Thụt lề đầu ra với một khoảng trắng:

```js
console.log(JSON.stringify({ a: 2 }, null, " "));
/*
{
 "a": 2
}
*/
```

Sử dụng ký tự tab mimics giao diện pretty-print tiêu chuẩn:

<!-- markdownlint-disable MD010 -->

```js
console.log(JSON.stringify({ uno: 1, dos: 2 }, null, "\t"));
/*
{
	"uno": 1,
	"dos": 2
}
*/
```

<!-- markdownlint-enable MD010 -->

### Hành vi toJSON()

Định nghĩa `toJSON()` cho một đối tượng cho phép ghi đè hành vi tuần tự hóa của nó.

```js
const obj = {
  data: "data",

  toJSON(key) {
    return key ? `Now I am a nested object under key '${key}'` : this;
  },
};

JSON.stringify(obj);
// '{"data":"data"}'

JSON.stringify({ obj });
// '{"obj":"Now I am a nested object under key 'obj'"}'

JSON.stringify([obj]);
// '["Now I am a nested object under key '0'"]'
```

### Vấn đề với tuần tự hóa tham chiếu vòng tròn

Vì [định dạng JSON](https://www.json.org/) không hỗ trợ các tham chiếu đối tượng (mặc dù [bản nháp IETF tồn tại](https://datatracker.ietf.org/doc/html/draft-pbryan-zyp-json-ref-03)), {{jsxref("TypeError")}} sẽ được ném ra nếu cố gắng mã hóa một đối tượng với các tham chiếu vòng tròn.

```js example-bad
const circularReference = {};
circularReference.myself = circularReference;

// Serializing circular references throws "TypeError: cyclic object value"
JSON.stringify(circularReference);
```

Để tuần tự hóa các tham chiếu vòng tròn, bạn có thể sử dụng một thư viện hỗ trợ chúng (ví dụ, [cycle.js](https://github.com/douglascrockford/JSON-js/blob/master/cycle.js) của Douglas Crockford) hoặc tự triển khai giải pháp, điều này sẽ yêu cầu tìm và thay thế (hoặc xóa) các tham chiếu vòng tròn bằng các giá trị có thể tuần tự hóa.

Nếu bạn đang sử dụng `JSON.stringify()` để sao chép sâu một đối tượng, bạn có thể muốn sử dụng {{DOMxRef("Window.structuredClone", "structuredClone()")}} thay thế, vì nó hỗ trợ tham chiếu vòng tròn. Các API JavaScript engine cho tuần tự hóa nhị phân, chẳng hạn như [`v8.serialize()`](https://nodejs.org/api/v8.html#v8serializevalue), cũng hỗ trợ tham chiếu vòng tròn.

### Sử dụng JSON.stringify() với localStorage

Trong trường hợp bạn muốn lưu trữ một đối tượng được tạo bởi người dùng và cho phép nó được khôi phục ngay cả sau khi trình duyệt đã bị đóng, ví dụ sau là mô hình về khả năng áp dụng của `JSON.stringify()`:

```js
// Creating an example of JSON
const session = {
  screens: [],
  state: true,
};
session.screens.push({ name: "screenA", width: 450, height: 250 });
session.screens.push({ name: "screenB", width: 650, height: 350 });
session.screens.push({ name: "screenC", width: 750, height: 120 });
session.screens.push({ name: "screenD", width: 250, height: 60 });
session.screens.push({ name: "screenE", width: 390, height: 120 });
session.screens.push({ name: "screenF", width: 1240, height: 650 });

// Converting the JSON string with JSON.stringify()
// then saving with localStorage in the name of session
localStorage.setItem("session", JSON.stringify(session));

// Example of how to transform the String generated through
// JSON.stringify() and saved in localStorage in JSON object again
const restoredSession = JSON.parse(localStorage.getItem("session"));

// Now restoredSession variable contains the object that was saved
// in localStorage
console.log(restoredSession);
```

### JSON.stringify() tuân thủ đúng định dạng

Các engine triển khai [đặc tả JSON.stringify tuân thủ đúng định dạng](https://github.com/tc39/proposal-well-formed-stringify) sẽ chuỗi hóa các ký tự thay thế đơn lẻ (bất kỳ điểm mã nào từ U+D800 đến U+DFFF) bằng cách sử dụng các chuỗi thoát Unicode thay vì theo nghĩa đen (xuất ra các ký tự thay thế đơn lẻ). Trước thay đổi này, những chuỗi như vậy không thể được mã hóa trong UTF-8 hoặc UTF-16 hợp lệ:

```js
JSON.stringify("\uD800"); // '"<broken>"'
```

Nhưng với thay đổi này `JSON.stringify()` đại diện cho các ký tự thay thế đơn lẻ bằng cách sử dụng các chuỗi thoát JSON _có thể_ được mã hóa trong UTF-8 hoặc UTF-16 hợp lệ:

```js
JSON.stringify("\uD800"); // '"\\ud800"'
```

Thay đổi này nên tương thích ngược miễn là bạn truyền kết quả của `JSON.stringify()` cho các API như `JSON.parse()` sẽ chấp nhận bất kỳ văn bản JSON hợp lệ nào, vì chúng sẽ coi các chuỗi thoát Unicode của các ký tự thay thế đơn lẻ là giống hệt với các ký tự thay thế đơn lẻ đó. _Chỉ_ khi bạn đang trực tiếp diễn giải kết quả của `JSON.stringify()` mới cần phải cẩn thận xử lý hai mã hóa có thể có của `JSON.stringify()` cho các điểm mã này.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của hành vi `JSON.stringify` hiện đại (symbol, unicode tuân thủ đúng định dạng, JSON thô) trong `core-js`](https://github.com/zloirock/core-js#ecmascript-json)
- {{jsxref("JSON.parse()")}}
- {{jsxref("JSON.rawJSON()")}}
