---
title: Map
slug: Web/JavaScript/Reference/Global_Objects/Map
page-type: javascript-class
browser-compat: javascript.builtins.Map
sidebar: jsref
---

Đối tượng **`Map`** lưu trữ các cặp key-value và ghi nhớ thứ tự chèn ban đầu của các key.
Bất kỳ giá trị nào (cả đối tượng lẫn {{Glossary("Primitive", "giá trị nguyên thủy")}}) đều có thể được dùng làm key hoặc value.

{{InteractiveExample("JavaScript Demo: Map", "taller")}}

```js interactive-example
const map = new Map();

map.set("a", 1);
map.set("b", 2);
map.set("c", 3);

console.log(map.get("a"));
// Expected output: 1

map.set("a", 97);

console.log(map.get("a"));
// Expected output: 97

console.log(map.size);
// Expected output: 3

map.delete("b");

console.log(map.size);
// Expected output: 2
```

## Mô tả

Các đối tượng `Map` là tập hợp các cặp key-value. Một key trong `Map` **chỉ có thể xuất hiện một lần**; nó là duy nhất trong tập hợp của `Map`. Một đối tượng `Map` được duyệt theo các cặp key-value — một vòng lặp {{jsxref("Statements/for...of", "for...of")}} trả về một mảng 2 phần tử `[key, value]` cho mỗi lần lặp. Việc duyệt xảy ra theo _thứ tự chèn_, tương ứng với thứ tự mỗi cặp key-value được chèn vào map lần đầu tiên bởi phương thức [`set()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/set) (tức là, không có key nào có cùng giá trị đã có trong map khi `set()` được gọi).

Đặc tả yêu cầu các map phải được triển khai "trung bình, cung cấp thời gian truy cập ít hơn tuyến tính so với số phần tử trong tập hợp". Do đó, nó có thể được biểu diễn nội bộ dưới dạng bảng băm (với tra cứu O(1)), cây tìm kiếm (với tra cứu O(log(N))), hoặc bất kỳ cấu trúc dữ liệu nào khác, miễn là độ phức tạp tốt hơn O(N).

### Bình đẳng key

Bình đẳng giá trị dựa trên thuật toán [SameValueZero](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#same-value-zero_equality). (Trước đây sử dụng [SameValue](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#same-value_equality_using_object.is), coi `0` và `-0` là khác nhau. Kiểm tra [khả năng tương thích trình duyệt](#tương_thích_trình_duyệt).) Điều này có nghĩa là {{jsxref("NaN")}} được coi là giống `NaN` (mặc dù `NaN !== NaN`) và tất cả các giá trị khác được coi là bằng nhau theo ngữ nghĩa của toán tử `===`. Ngoài ra, đối với các key là đối tượng, bình đẳng dựa trên danh tính đối tượng. Chúng được so sánh theo tham chiếu, không phải theo giá trị. Xem [Sử dụng đối tượng Map](#sử_dụng_đối_tượng_map) để biết ví dụ.

### Object so với Map

{{jsxref("Object")}} tương tự `Map` — cả hai đều cho phép bạn đặt key thành các giá trị, truy xuất các giá trị đó, xóa key, và phát hiện xem có gì đó được lưu trữ tại một key hay không. Vì lý do này (và vì không có sẵn các lựa chọn thay thế tích hợp), `Object` đã được dùng như `Map` trong lịch sử.

Tuy nhiên, có những sự khác biệt quan trọng khiến `Map` được ưa thích trong một số trường hợp:

<table class="standard-table">
  <thead>
    <tr>
      <th scope="row"></th>
      <th scope="col">Map</th>
      <th scope="col">Object</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Key ngoài ý muốn</th>
      <td>
        Một <code>Map</code> không chứa bất kỳ key nào theo mặc định. Nó chỉ
        chứa những gì được đặt vào một cách tường minh.
      </td>
      <td>
        <p>
          Một <code>Object</code> có một prototype, vì vậy nó chứa các key mặc định
          có thể xung đột với các key của bạn nếu bạn không cẩn thận.
        </p>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> Điều này có thể được khắc phục bằng cách sử dụng
            {{jsxref("Object.create", "Object.create(null)")}},
            nhưng điều này hiếm khi được thực hiện.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <th scope="row">Bảo mật</th>
      <td>
        Một <code>Map</code> an toàn khi sử dụng với các key và value do người dùng cung cấp.
      </td>
      <td>
        <p>
          Đặt các cặp key-value do người dùng cung cấp lên một <code>Object</code> có thể cho phép
          kẻ tấn công ghi đè prototype của đối tượng, có thể dẫn đến
          <a href="https://github.com/eslint-community/eslint-plugin-security/blob/main/docs/the-dangers-of-square-bracket-notation.md">
            các cuộc tấn công tiêm nhiễm đối tượng
          </a> hoặc <a href="/en-US/docs/Web/Security/Attacks/Prototype_pollution">các cuộc tấn công ô nhiễm prototype</a>. Giống như vấn đề key ngoài ý muốn, điều này cũng có thể được giảm thiểu bằng cách sử dụng
          đối tượng có <code>null</code>-prototype.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Kiểu Key</th>
      <td>
        Key của một <code>Map</code> có thể là bất kỳ giá trị nào (bao gồm các hàm,
        đối tượng, hoặc bất kỳ giá trị nguyên thủy nào).
      </td>
      <td>
        Key của một <code>Object</code> phải là
        {{jsxref("String")}} hoặc {{jsxref("Symbol")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Thứ tự Key</th>
      <td>
        <p>
          Các key trong <code>Map</code> được sắp xếp theo cách đơn giản:
          Một đối tượng <code>Map</code> duyệt các mục, key và value theo
          thứ tự chèn mục.
        </p>
      </td>
      <td>
        <p>
          Mặc dù các key của một <code>Object</code> thông thường hiện đã được sắp xếp,
          điều này không phải lúc nào cũng như vậy, và thứ tự rất phức tạp. Do đó,
          tốt nhất là không nên dựa vào thứ tự thuộc tính.
        </p>
        <p>
          Thứ tự lần đầu tiên được xác định chỉ cho các thuộc tính riêng trong ECMAScript
          2015; ECMAScript 2020 xác định thứ tự cho các thuộc tính kế thừa. Nhưng lưu ý rằng không có cơ chế đơn lẻ nào
          duyệt
          <strong>tất cả</strong> các thuộc tính của một đối tượng; các cơ chế khác nhau
          mỗi cái bao gồm các tập con thuộc tính khác nhau.
          ({{jsxref("Statements/for...in", "for-in")}}
          chỉ bao gồm các thuộc tính string-keyed có thể liệt kê;
          {{jsxref("Object.keys")}} chỉ bao gồm các thuộc tính riêng, có thể liệt kê, string-keyed;
          {{jsxref("Object.getOwnPropertyNames")}} bao gồm các thuộc tính riêng,
          string-keyed ngay cả khi không thể liệt kê;
          {{jsxref("Object.getOwnPropertySymbols")}} làm điều tương tự
          chỉ cho các thuộc tính <code>Symbol</code>-keyed, v.v.)
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row"><p>Kích thước</p></th>
      <td>
        Số lượng mục trong một <code>Map</code> dễ dàng lấy được từ thuộc tính
        {{jsxref("Map.prototype.size", "size")}} của nó.
      </td>
      <td>
        Xác định số lượng mục trong một <code>Object</code> phức tạp hơn và kém hiệu quả hơn. Một cách phổ biến để làm điều đó là thông qua {{jsxref("Array/length", "length")}} của mảng trả về từ {{jsxref("Object.keys()")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Duyệt</th>
      <td>
        Một <code>Map</code> là
        <a href="/en-US/docs/Web/JavaScript/Reference/Iteration_protocols"
          >iterable</a
        >, vì vậy nó có thể được duyệt trực tiếp.
      </td>
      <td>
        <p>
          <code>Object</code> không triển khai <a
            href="/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol"
            >giao thức iterable</a
          >, vì vậy các đối tượng không thể trực tiếp duyệt bằng câu lệnh JavaScript
          <a href="/en-US/docs/Web/JavaScript/Reference/Statements/for...of"
            >for...of</a
          > (theo mặc định).
        </p>
        <div class="notecard note">
          <p><strong>Lưu ý:</strong></p>
          <ul>
            <li>
              Một đối tượng có thể triển khai giao thức iterable, hoặc bạn có thể lấy một
              iterable cho một đối tượng bằng cách sử dụng <a
                href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys"
                ><code>Object.keys</code></a
              > hoặc <a
                href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/entries"
                ><code>Object.entries</code></a
              >.
            </li>
            <li>
              Câu lệnh
              <a href="/en-US/docs/Web/JavaScript/Reference/Statements/for...in"
                >for...in</a
              >
              cho phép bạn duyệt các thuộc tính
              <em>có thể liệt kê</em> của một đối tượng.
            </li>
          </ul>
        </div>
      </td>
    </tr>
    <tr>
      <th scope="row">Hiệu năng</th>
      <td>
        <p>
          Thực hiện tốt hơn trong các kịch bản liên quan đến việc thêm và xóa
          các cặp key-value thường xuyên.
        </p>
      </td>
      <td>
        <p>
          Không được tối ưu hóa cho việc thêm và xóa các cặp key-value thường xuyên.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Tuần tự hóa và phân tích cú pháp</th>
      <td>
        <p>Không có hỗ trợ gốc cho tuần tự hóa hoặc phân tích cú pháp.</p>
        <p>
          (Nhưng bạn có thể xây dựng hỗ trợ tuần tự hóa và phân tích cú pháp riêng cho
          <code>Map</code> bằng cách sử dụng {{jsxref("JSON.stringify()")}}
          với đối số <em>replacer</em>, và bằng cách sử dụng
          {{jsxref("JSON.parse()")}} với đối số
          <em>reviver</em>. Xem câu hỏi Stack Overflow
          <a href="https://stackoverflow.com/q/29085197/"
            >How do you JSON.stringify an ES6 Map?</a
          >).
        </p>
      </td>
      <td>
        <p>
          Hỗ trợ gốc cho tuần tự hóa từ {{jsxref("Object")}} sang
          JSON, sử dụng {{jsxref("JSON.stringify()")}}.
        </p>
        <p>
          Hỗ trợ gốc cho phân tích cú pháp từ JSON sang {{jsxref("Object")}},
          sử dụng {{jsxref("JSON.parse()")}}.
        </p>
      </td>
    </tr>
  </tbody>
</table>

### Đặt thuộc tính đối tượng

Việc đặt thuộc tính đối tượng cũng hoạt động với các đối tượng Map và có thể gây ra
nhầm lẫn đáng kể.

Do đó, đây có vẻ hoạt động theo một cách:

```js example-bad
const wrongMap = new Map();
wrongMap["bla"] = "blaa";
wrongMap["bla2"] = "blaaa2";

console.log(wrongMap); // Map { bla: 'blaa', bla2: 'blaaa2' }
```

Nhưng cách đặt thuộc tính đó không tương tác với cấu trúc dữ liệu Map. Nó sử dụng tính năng của đối tượng generic. Giá trị của 'bla' không được lưu trong Map cho các truy vấn. Các thao tác khác trên dữ liệu thất bại:

```js example-bad
wrongMap.has("bla"); // false
wrongMap.delete("bla"); // false
console.log(wrongMap); // Map { bla: 'blaa', bla2: 'blaaa2' }
```

Cách sử dụng đúng để lưu trữ dữ liệu trong Map là thông qua phương thức `set(key, value)`.

```js example-good
const contacts = new Map();
contacts.set("Jessie", { phone: "213-555-1234", address: "123 N 1st Ave" });
contacts.has("Jessie"); // true
contacts.get("Hilary"); // undefined
contacts.set("Hilary", { phone: "617-555-4321", address: "321 S 2nd St" });
contacts.get("Jessie"); // {phone: "213-555-1234", address: "123 N 1st Ave"}
contacts.delete("Raymond"); // false
contacts.delete("Jessie"); // true
console.log(contacts.size); // 1
```

### Các Web API giống Map trong trình duyệt

**Các đối tượng giống `Map` trong trình duyệt** (hay "các đối tượng maplike") là các giao diện [Web API](/en-US/docs/Web/API) hoạt động theo nhiều cách giống như một `Map`.

Giống như `Map`, các mục có thể được duyệt theo cùng thứ tự chúng được thêm vào đối tượng.
Các đối tượng giống `Map` và `Map` cũng có các thuộc tính và phương thức có cùng tên và hành vi.
Tuy nhiên, không giống `Map`, chúng chỉ cho phép các kiểu được xác định trước cụ thể cho các key và value của mỗi mục.

Các kiểu được phép được đặt trong định nghĩa IDL của đặc tả.
Ví dụ, {{domxref("RTCStatsReport")}} là một đối tượng giống `Map` phải dùng string cho key và đối tượng cho value.
Điều này được định nghĩa trong IDL đặc tả bên dưới:

```webidl
interface RTCStatsReport {
  readonly maplike<DOMString, object>;
};
```

Các đối tượng giống `Map` có thể chỉ đọc hoặc đọc-ghi (xem từ khóa `readonly` trong IDL ở trên).

- Các đối tượng giống `Map` chỉ đọc có thuộc tính {{jsxref("Map/size", "size")}}, và các phương thức: {{jsxref("Map/entries", "entries()")}}, {{jsxref("Map/forEach", "forEach()")}}, {{jsxref("Map/get", "get()")}}, {{jsxref("Map/has", "has()")}}, {{jsxref("Map/keys", "keys()")}}, {{jsxref("Map/values", "values()")}}, và [`Symbol.iterator()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Symbol.iterator).
- Các đối tượng giống `Map` có thể ghi bổ sung có các phương thức: {{jsxref("Map/clear", "clear()")}}, {{jsxref("Map/delete", "delete()")}}, và {{jsxref("Map/set", "set()")}}.

Các phương thức và thuộc tính có hành vi giống như các thực thể tương đương trong `Map`, ngoại trừ hạn chế về kiểu của key và value.

Sau đây là các ví dụ về đối tượng giống `Map` chỉ đọc trong trình duyệt:

- {{domxref("AudioParamMap")}}
- {{domxref("CSSFontFeatureValuesMap")}}
- {{domxref("EventCounts")}}
- {{domxref("KeyboardLayoutMap")}}
- {{domxref("MIDIInputMap")}}
- {{domxref("MIDIOutputMap")}}
- {{domxref("RTCStatsReport")}}

## Constructor

- {{jsxref("Map/Map", "Map()")}}
  - : Tạo một đối tượng `Map` mới.

## Thuộc tính tĩnh

- [`Map[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Symbol.species)
  - : Hàm constructor được dùng để tạo các đối tượng dẫn xuất.

## Phương thức tĩnh

- {{jsxref("Map.groupBy()")}}
  - : Nhóm các phần tử của một iterable đã cho bằng cách sử dụng các giá trị được trả về bởi một callback function được cung cấp. `Map` cuối cùng được trả về sử dụng các giá trị duy nhất từ hàm kiểm tra làm key, có thể được dùng để lấy mảng phần tử trong mỗi nhóm.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Map.prototype` và được chia sẻ bởi tất cả các instance `Map`.

- {{jsxref("Object/constructor", "Map.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `Map`, giá trị khởi đầu là constructor {{jsxref("Map/Map", "Map")}}.
- {{jsxref("Map.prototype.size")}}
  - : Trả về số lượng cặp key/value trong đối tượng `Map`.
- `Map.prototype[Symbol.toStringTag]`
  - : Giá trị khởi đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Map"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Map.prototype.clear()")}}
  - : Xóa tất cả các cặp key-value khỏi đối tượng `Map`.
- {{jsxref("Map.prototype.delete()")}}
  - : Xóa mục được chỉ định bởi key khỏi `Map` này.
- {{jsxref("Map.prototype.entries()")}}
  - : Trả về một đối tượng Iterator mới chứa mảng hai phần tử `[key, value]` cho mỗi phần tử trong đối tượng `Map` theo thứ tự chèn.
- {{jsxref("Map.prototype.forEach()")}}
  - : Gọi `callbackFn` một lần cho mỗi cặp key-value có trong đối tượng `Map`, theo thứ tự chèn. Nếu tham số `thisArg` được cung cấp cho `forEach`, nó sẽ được dùng làm giá trị `this` cho mỗi callback.
- {{jsxref("Map.prototype.get()")}}
  - : Trả về giá trị tương ứng với key trong `Map` này, hoặc `undefined` nếu không có.
- {{jsxref("Map.prototype.getOrInsert()")}}
  - : Trả về giá trị tương ứng với key được chỉ định trong `Map` này. Nếu key không có mặt, nó chèn một mục mới với key và giá trị mặc định đã cho, và trả về giá trị được chèn.
- {{jsxref("Map.prototype.getOrInsertComputed()")}}
  - : Trả về giá trị tương ứng với key được chỉ định trong `Map` này. Nếu key không có mặt, nó chèn một mục mới với key và giá trị mặc định được tính từ một callback đã cho, và trả về giá trị được chèn.
- {{jsxref("Map.prototype.has()")}}
  - : Trả về một boolean cho biết liệu có một mục với key được chỉ định tồn tại trong `Map` này hay không.
- {{jsxref("Map.prototype.keys()")}}
  - : Trả về một đối tượng Iterator mới chứa các key cho mỗi phần tử trong đối tượng `Map` theo thứ tự chèn.
- {{jsxref("Map.prototype.set()")}}
  - : Thêm một mục mới với key và value được chỉ định vào `Map` này, hoặc cập nhật một mục hiện có nếu key đã tồn tại.
- {{jsxref("Map.prototype.values()")}}
  - : Trả về một đối tượng Iterator mới chứa các value cho mỗi phần tử trong đối tượng `Map` theo thứ tự chèn.
- [`Map.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Symbol.iterator)
  - : Trả về một đối tượng Iterator mới chứa mảng hai phần tử `[key, value]` cho mỗi phần tử trong đối tượng `Map` theo thứ tự chèn.

## Ví dụ

### Sử dụng đối tượng Map

```js
const myMap = new Map();

const keyString = "a string";
const keyObj = {};
const keyFunc = () => {};

// setting the values
myMap.set(keyString, "value associated with 'a string'");
myMap.set(keyObj, "value associated with keyObj");
myMap.set(keyFunc, "value associated with keyFunc");

console.log(myMap.size); // 3

// getting the values
console.log(myMap.get(keyString)); // "value associated with 'a string'"
console.log(myMap.get(keyObj)); // "value associated with keyObj"
console.log(myMap.get(keyFunc)); // "value associated with keyFunc"

console.log(myMap.get("a string")); // "value associated with 'a string'", because keyString === 'a string'
console.log(myMap.get({})); // undefined, because keyObj !== {}
console.log(myMap.get(() => {})); // undefined, because keyFunc !== () => {}
```

### Dùng NaN làm key của Map

{{jsxref("NaN")}} cũng có thể được dùng làm key. Mặc dù mỗi `NaN`
không bằng chính nó (`NaN !== NaN` là đúng), ví dụ sau hoạt động vì
các `NaN` không thể phân biệt với nhau:

```js
const myMap = new Map();
myMap.set(NaN, "not a number");

myMap.get(NaN);
// "not a number"

const otherNaN = Number("foo");
myMap.get(otherNaN);
// "not a number"
```

### Duyệt Map với for...of

Map có thể được duyệt bằng vòng lặp `for...of`:

```js
const myMap = new Map();
myMap.set(0, "zero");
myMap.set(1, "one");

for (const [key, value] of myMap) {
  console.log(`${key} = ${value}`);
}
// 0 = zero
// 1 = one

for (const key of myMap.keys()) {
  console.log(key);
}
// 0
// 1

for (const value of myMap.values()) {
  console.log(value);
}
// zero
// one

for (const [key, value] of myMap.entries()) {
  console.log(`${key} = ${value}`);
}
// 0 = zero
// 1 = one
```

### Duyệt Map với forEach()

Map có thể được duyệt bằng phương thức
{{jsxref("Map/forEach", "forEach()")}}:

```js
myMap.forEach((value, key) => {
  console.log(`${key} = ${value}`);
});
// 0 = zero
// 1 = one
```

### Quan hệ với các đối tượng Array

```js
const kvArray = [
  ["key1", "value1"],
  ["key2", "value2"],
];

// Use the regular Map constructor to transform a 2D key-value Array into a map
const myMap = new Map(kvArray);

console.log(myMap.get("key1")); // "value1"

// Use Array.from() to transform a map into a 2D key-value Array
console.log(Array.from(myMap)); // Will show you exactly the same Array as kvArray

// A succinct way to do the same, using the spread syntax
console.log([...myMap]);

// Or use the keys() or values() iterators, and convert them to an array
console.log(Array.from(myMap.keys())); // ["key1", "key2"]
```

### Sao chép và hợp nhất Map

Giống như `Array`, `Map` có thể được sao chép:

```js
const original = new Map([[1, "one"]]);

const clone = new Map(original);

console.log(clone.get(1)); // one
console.log(original === clone); // false (useful for shallow comparison)
```

> [!NOTE]
> Hãy lưu ý rằng _dữ liệu bản thân_ không được sao chép. Nói cách khác, đây chỉ là [bản sao nông](/en-US/docs/Glossary/Shallow_copy) của `Map`.

Map có thể được hợp nhất, duy trì tính duy nhất của key:

```js
const first = new Map([
  [1, "one"],
  [2, "two"],
  [3, "three"],
]);

const second = new Map([
  [1, "uno"],
  [2, "dos"],
]);

// Merge two maps. The last repeated key wins.
// Spread syntax essentially converts a Map to an Array
const merged = new Map([...first, ...second]);

console.log(merged.get(1)); // uno
console.log(merged.get(2)); // dos
console.log(merged.get(3)); // three
```

Map cũng có thể được hợp nhất với các Array:

```js
const first = new Map([
  [1, "one"],
  [2, "two"],
  [3, "three"],
]);

const second = new Map([
  [1, "uno"],
  [2, "dos"],
]);

// Merge maps with an array. The last repeated key wins.
const merged = new Map([...first, ...second, [1, "un"]]);

console.log(merged.get(1)); // un
console.log(merged.get(2)); // dos
console.log(merged.get(3)); // three
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill for `Map` in `core-js`](https://github.com/zloirock/core-js#map)
- [es-shims polyfill of `Map`](https://www.npmjs.com/package/es-map)
- {{jsxref("Set")}}
- {{jsxref("WeakMap")}}
- {{jsxref("WeakSet")}}
