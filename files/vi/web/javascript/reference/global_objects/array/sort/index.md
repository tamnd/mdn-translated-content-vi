---
title: Array.prototype.sort()
short-title: sort()
slug: Web/JavaScript/Reference/Global_Objects/Array/sort
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.sort
sidebar: jsref
---

Phương thức **`sort()`** của các đối tượng {{jsxref("Array")}} sắp xếp các phần tử của mảng _[tại chỗ](https://en.wikipedia.org/wiki/In-place_algorithm)_ và trả về tham chiếu đến cùng một mảng, nay đã được sắp xếp. Thứ tự sắp xếp mặc định là tăng dần, dựa trên việc chuyển đổi các phần tử thành chuỗi, sau đó so sánh các chuỗi đó theo giá trị của đơn vị mã UTF-16.

Độ phức tạp thời gian và không gian của quá trình sắp xếp không thể được đảm bảo vì nó phụ thuộc vào cài đặt.

Để sắp xếp các phần tử trong mảng mà không thay đổi mảng gốc, hãy dùng {{jsxref("Array/toSorted", "toSorted()")}}.

{{InteractiveExample("JavaScript Demo: Array.prototype.sort()")}}

```js interactive-example
const months = ["March", "Jan", "Feb", "Dec"];
months.sort();
console.log(months);
// Expected output: Array ["Dec", "Feb", "Jan", "March"]

const array = [1, 30, 4, 21, 100000];
array.sort();
console.log(array);
// Expected output: Array [1, 100000, 21, 30, 4]
```

## Cú pháp

```js-nolint
sort()
sort(compareFn)
```

### Tham số

- `compareFn` {{optional_inline}}
  - : Hàm xác định thứ tự của các phần tử. Hàm được gọi với các đối số sau:
    - `a`
      - : Phần tử đầu tiên để so sánh. Sẽ không bao giờ là `undefined`.
    - `b`
      - : Phần tử thứ hai để so sánh. Sẽ không bao giờ là `undefined`.

    Nó nên trả về một số trong đó:
    - Giá trị âm chỉ ra rằng `a` nên đứng trước `b`.
    - Giá trị dương chỉ ra rằng `a` nên đứng sau `b`.
    - Bằng không hoặc `NaN` chỉ ra rằng `a` và `b` được coi là bằng nhau.

    Để ghi nhớ điều này, hãy nhớ rằng `(a, b) => a - b` sắp xếp số theo thứ tự tăng dần.

    Nếu bị bỏ qua, các phần tử mảng được chuyển đổi thành chuỗi, sau đó được sắp xếp theo giá trị điểm mã Unicode của từng ký tự.

### Giá trị trả về

Tham chiếu đến mảng gốc, nay đã được sắp xếp. Lưu ý rằng mảng được sắp xếp _[tại chỗ](https://en.wikipedia.org/wiki/In-place_algorithm)_ và không có bản sao nào được tạo.

## Mô tả

Nếu `compareFn` không được cung cấp, tất cả các phần tử mảng không phải `undefined` được sắp xếp bằng cách chuyển đổi chúng thành chuỗi và so sánh các chuỗi theo thứ tự đơn vị mã UTF-16. Ví dụ, "banana" đứng trước "cherry". Trong sắp xếp số, 9 đứng trước 80, nhưng vì các số được chuyển đổi thành chuỗi, "80" đứng trước "9" theo thứ tự Unicode. Tất cả các phần tử `undefined` được sắp xếp vào cuối mảng.

Phương thức `sort()` bảo tồn các vị trí trống. Nếu mảng nguồn là [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), các vị trí trống được di chuyển đến cuối mảng và luôn đứng sau tất cả các `undefined`.

> [!NOTE]
> Trong UTF-16, các ký tự Unicode trên `\uFFFF` được mã hóa thành hai đơn vị mã thay thế, trong phạm vi `\uD800` - `\uDFFF`. Giá trị của mỗi đơn vị mã được tính riêng lẻ cho việc so sánh. Vì vậy, ký tự được hình thành bởi cặp thay thế `\uD855\uDE51` sẽ được sắp xếp trước ký tự `\uFF3A`.

Nếu `compareFn` được cung cấp, tất cả các phần tử mảng không phải `undefined` được sắp xếp theo giá trị trả về của hàm so sánh (tất cả các phần tử `undefined` được sắp xếp vào cuối mảng, không có lần gọi nào đến `compareFn`).

| Giá trị trả về của `compareFn(a, b)` | Thứ tự sắp xếp                        |
| ------------------------------------ | ------------------------------------- |
| > 0                                  | sắp xếp `a` sau `b`, ví dụ `[b, a]`   |
| < 0                                  | sắp xếp `a` trước `b`, ví dụ `[a, b]` |
| === 0                                | giữ nguyên thứ tự của `a` và `b`      |

Vì vậy, hàm so sánh có dạng sau:

```js-nolint
function compareFn(a, b) {
  if (a is less than b by some ordering criterion) {
    return -1;
  } else if (a is greater than b by the ordering criterion) {
    return 1;
  }
  // a must be equal to b
  return 0;
}
```

Chính thức hơn, hàm so sánh được kỳ vọng có các thuộc tính sau để đảm bảo hành vi sắp xếp đúng:

- _Thuần túy_: Hàm so sánh không thay đổi các đối tượng được so sánh hoặc bất kỳ trạng thái bên ngoài nào. (Điều này quan trọng vì không có đảm bảo _khi nào_ và _cách_ hàm so sánh sẽ được gọi, vì vậy bất kỳ cuộc gọi cụ thể nào cũng không nên tạo ra các hiệu ứng nhìn thấy từ bên ngoài.)
- _Ổn định_: Hàm so sánh trả về cùng kết quả với cùng cặp đầu vào.
- _Phản xạ_: `compareFn(a, a) === 0`.
- _Phản đối xứng_: `compareFn(a, b)` và `compareFn(b, a)` phải đều là `0` hoặc có dấu ngược nhau.
- _Bắc cầu_: Nếu `compareFn(a, b)` và `compareFn(b, c)` đều dương, bằng không, hoặc âm, thì `compareFn(a, c)` có cùng tính dương như hai cái trước.

Hàm so sánh tuân thủ các ràng buộc trên sẽ luôn có thể trả về tất cả các giá trị `1`, `0`, và `-1`, hoặc nhất quán trả về `0`. Ví dụ, nếu hàm so sánh chỉ trả về `1` và `0`, hoặc chỉ trả về `0` và `-1`, nó sẽ không thể sắp xếp đáng tin cậy vì _phản đối xứng_ bị phá vỡ. Hàm so sánh luôn trả về `0` sẽ khiến mảng không bị thay đổi, nhưng vẫn đáng tin cậy.

Hàm so sánh từ điển mặc định thỏa mãn tất cả các ràng buộc trên.

Để so sánh số thay vì chuỗi, hàm so sánh có thể trừ `b` từ `a`. Hàm sau sẽ sắp xếp mảng theo thứ tự tăng dần (nếu nó không chứa `NaN`):

```js
function compareNumbers(a, b) {
  return a - b;
}
```

Phương thức `sort()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên. Mặc dù chuỗi cũng là dạng giống mảng, phương thức này không phù hợp để áp dụng cho chúng vì chuỗi là bất biến.

## Ví dụ

### Tạo, hiển thị và sắp xếp một mảng

Ví dụ sau tạo bốn mảng và hiển thị mảng gốc, sau đó là các mảng đã được sắp xếp. Các mảng số được sắp xếp mà không có hàm so sánh, sau đó được sắp xếp với hàm so sánh.

```js
const stringArray = ["Blue", "Humpback", "Beluga"];
const numberArray = [40, 1, 5, 200];
const numericStringArray = ["80", "9", "700"];
const mixedNumericArray = ["80", "9", "700", 40, 1, 5, 200];

function compareNumbers(a, b) {
  return a - b;
}

stringArray.join(); // 'Blue,Humpback,Beluga'
stringArray.sort(); // ['Beluga', 'Blue', 'Humpback']

numberArray.join(); // '40,1,5,200'
numberArray.sort(); // [1, 200, 40, 5]
numberArray.sort(compareNumbers); // [1, 5, 40, 200]

numericStringArray.join(); // '80,9,700'
numericStringArray.sort(); // ['700', '80', '9']
numericStringArray.sort(compareNumbers); // ['9', '80', '700']

mixedNumericArray.join(); // '80,9,700,40,1,5,200'
mixedNumericArray.sort(); // [1, 200, 40, 5, '700', '80', '9']
mixedNumericArray.sort(compareNumbers); // [1, 5, '9', 40, '80', 200, '700']
```

### Sắp xếp mảng các đối tượng

Mảng các đối tượng có thể được sắp xếp bằng cách so sánh giá trị của một trong các thuộc tính của chúng.

```js
const items = [
  { name: "Edward", value: 21 },
  { name: "Sharpe", value: 37 },
  { name: "And", value: 45 },
  { name: "The", value: -12 },
  { name: "Magnetic", value: 13 },
  { name: "Zeros", value: 37 },
];

// sort by value
items.sort((a, b) => a.value - b.value);

// sort by name
items.sort((a, b) => {
  const nameA = a.name.toUpperCase(); // ignore upper and lowercase
  const nameB = b.name.toUpperCase(); // ignore upper and lowercase
  if (nameA < nameB) {
    return -1;
  }
  if (nameA > nameB) {
    return 1;
  }

  // names must be equal
  return 0;
});
```

### Sắp xếp các ký tự không phải ASCII

Để sắp xếp chuỗi có ký tự không phải {{Glossary("ASCII")}}, tức là chuỗi có ký tự có dấu (e, é, è, a, ä, v.v.), chuỗi từ các ngôn ngữ khác ngoài tiếng Anh, hãy dùng {{jsxref("String.prototype.localeCompare()")}}. Hàm này có thể so sánh các ký tự đó để chúng xuất hiện theo đúng thứ tự.

```js
const items = ["réservé", "premier", "communiqué", "café", "adieu", "éclair"];
items.sort((a, b) => a.localeCompare(b));

// items is ['adieu', 'café', 'communiqué', 'éclair', 'premier', 'réservé']
```

### Sắp xếp với map

`compareFn` có thể được gọi nhiều lần cho mỗi phần tử trong mảng. Tùy thuộc vào bản chất của `compareFn`, điều này có thể tạo ra chi phí cao. Khi `compareFn` thực hiện nhiều công việc hơn và có nhiều phần tử hơn cần sắp xếp, có thể hiệu quả hơn nếu dùng [`map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) để sắp xếp. Ý tưởng là duyệt mảng một lần để trích xuất các giá trị thực tế được dùng cho việc sắp xếp vào một mảng tạm thời, sắp xếp mảng tạm thời, sau đó duyệt mảng tạm thời để đạt được thứ tự đúng.

```js
// the array to be sorted
const data = ["delta", "alpha", "charlie", "bravo"];

// temporary array holds objects with position and sort-value
const mapped = data.map((v, i) => ({ i, value: someSlowOperation(v) }));

// sorting the mapped array containing the reduced values
mapped.sort((a, b) => {
  if (a.value > b.value) {
    return 1;
  }
  if (a.value < b.value) {
    return -1;
  }
  return 0;
});

const result = mapped.map((v) => data[v.i]);
```

Có một thư viện mã nguồn mở có tên [mapsort](https://github.com/Pimm/mapsort) áp dụng phương pháp này.

### sort() trả về tham chiếu đến cùng một mảng

Phương thức `sort()` trả về tham chiếu đến mảng gốc, vì vậy việc thay đổi mảng được trả về cũng sẽ thay đổi mảng gốc.

```js
const numbers = [3, 1, 4, 1, 5];
const sorted = numbers.sort((a, b) => a - b);
// numbers and sorted are both [1, 1, 3, 4, 5]
sorted[0] = 10;
console.log(numbers[0]); // 10
```

Nếu bạn muốn `sort()` không thay đổi mảng gốc, nhưng trả về một mảng [được sao chép nông](/en-US/docs/Glossary/Shallow_copy) như các phương thức mảng khác (ví dụ: [`map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)), hãy dùng phương thức {{jsxref("Array/toSorted", "toSorted()")}}. Ngoài ra, bạn có thể sao chép nông trước khi gọi `sort()`, bằng cách dùng [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) hoặc [`Array.from()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from).

```js
const numbers = [3, 1, 4, 1, 5];
// [...numbers] creates a shallow copy, so sort() does not mutate the original
const sorted = [...numbers].sort((a, b) => a - b);
sorted[0] = 10;
console.log(numbers[0]); // 3
```

### Tính ổn định của sắp xếp

Kể từ phiên bản 10 (hay ECMAScript 2019), đặc tả yêu cầu `Array.prototype.sort` phải ổn định.

Ví dụ, giả sử bạn có danh sách học sinh cùng điểm số. Lưu ý rằng danh sách học sinh đã được sắp xếp sẵn theo tên theo thứ tự bảng chữ cái:

```js
const students = [
  { name: "Alex", grade: 15 },
  { name: "Devlin", grade: 15 },
  { name: "Eagle", grade: 13 },
  { name: "Sam", grade: 14 },
];
```

Sau khi sắp xếp mảng này theo `grade` theo thứ tự tăng dần:

```js
students.sort((firstItem, secondItem) => firstItem.grade - secondItem.grade);
```

Biến `students` sẽ có giá trị sau:

```js
[
  { name: "Eagle", grade: 13 },
  { name: "Sam", grade: 14 },
  { name: "Alex", grade: 15 }, // original maintained for similar grade (stable sorting)
  { name: "Devlin", grade: 15 }, // original maintained for similar grade (stable sorting)
];
```

Điều quan trọng cần lưu ý là các học sinh có cùng điểm (ví dụ: Alex và Devlin) sẽ giữ nguyên thứ tự như trước khi gọi sort. Đây là điều mà thuật toán sắp xếp ổn định đảm bảo.

Trước phiên bản 10 (hay ECMAScript 2019), tính ổn định của sắp xếp không được đảm bảo, có nghĩa là bạn có thể nhận được kết quả sau:

```js
[
  { name: "Eagle", grade: 13 },
  { name: "Sam", grade: 14 },
  { name: "Devlin", grade: 15 }, // original order not maintained
  { name: "Alex", grade: 15 }, // original order not maintained
];
```

### Sắp xếp với hàm so sánh không hợp lệ

Nếu hàm so sánh không thỏa mãn tất cả các quy tắc thuần túy, ổn định, phản xạ, phản đối xứng và bắc cầu, như được giải thích trong [mô tả](#mô-tả), hành vi của chương trình không được xác định rõ.

Ví dụ, hãy xem xét code này:

```js
const arr = [3, 1, 4, 1, 5, 9];
const compareFn = (a, b) => (a > b ? 1 : 0);
arr.sort(compareFn);
```

Hàm `compareFn` ở đây không hợp lệ vì nó không thỏa mãn phản đối xứng: nếu `a > b`, nó trả về `1`; nhưng khi đổi `a` và `b`, nó trả về `0` thay vì giá trị âm. Do đó, mảng kết quả sẽ khác nhau giữa các engine. Ví dụ, V8 (được dùng bởi Chrome, Node.js, v.v.) và JavaScriptCore (được dùng bởi Safari) sẽ không sắp xếp mảng chút nào và trả về `[3, 1, 4, 1, 5, 9]`, trong khi SpiderMonkey (được dùng bởi Firefox) sẽ trả về mảng được sắp xếp tăng dần, là `[1, 1, 3, 4, 5, 9]`.

Tuy nhiên, nếu hàm `compareFn` được thay đổi một chút để trả về `-1` hoặc `0`:

```js
const arr = [3, 1, 4, 1, 5, 9];
const compareFn = (a, b) => (a > b ? -1 : 0);
arr.sort(compareFn);
```

Thì V8 và JavaScriptCore sắp xếp theo thứ tự giảm dần, là `[9, 5, 4, 3, 1, 1]`, trong khi SpiderMonkey trả về nguyên trạng: `[3, 1, 4, 1, 5, 9]`.

Do sự không nhất quán trong cài đặt này, bạn luôn nên làm cho hàm so sánh của mình hợp lệ bằng cách tuân theo năm ràng buộc.

### Sử dụng sort() trên mảng thưa

Các vị trí trống được di chuyển đến cuối mảng.

```js
console.log(["a", "c", , "b"].sort()); // ['a', 'b', 'c', empty]
console.log([, undefined, "a", "b"].sort()); // ["a", "b", undefined, empty]
```

### Gọi sort() trên đối tượng không phải mảng

Phương thức `sort()` đọc thuộc tính `length` của `this`. Sau đó nó thu thập tất cả các thuộc tính có khóa nguyên trong phạm vi `0` đến `length - 1`, sắp xếp chúng, và ghi lại. Nếu có các thuộc tính bị thiếu trong phạm vi, các thuộc tính cuối tương ứng sẽ bị [xóa](/en-US/docs/Web/JavaScript/Reference/Operators/delete), như thể các thuộc tính không tồn tại được sắp xếp về cuối.

```js
const arrayLike = {
  length: 3,
  unrelated: "foo",
  0: 5,
  2: 4,
};
console.log(Array.prototype.sort.call(arrayLike));
// { '0': 4, '1': 5, length: 3, unrelated: 'foo' }
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.sort` với hành vi hiện đại như sắp xếp ổn định trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.reverse()")}}
- {{jsxref("Array.prototype.toSorted()")}}
- {{jsxref("String.prototype.localeCompare()")}}
- {{jsxref("TypedArray.prototype.sort()")}}
- [Getting things sorted in V8](https://v8.dev/blog/array-sort) trên v8.dev (2018)
- [Stable `Array.prototype.sort`](https://v8.dev/features/stable-sort) trên v8.dev (2019)
- [`Array.prototype.sort` stability](https://mathiasbynens.be/demo/sort-stability) bởi Mathias Bynens
