---
title: Array.prototype.reduce()
short-title: reduce()
slug: Web/JavaScript/Reference/Global_Objects/Array/reduce
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.reduce
sidebar: jsref
---

Phương thức **`reduce()`** của các đối tượng {{jsxref("Array")}} thực thi một hàm callback "reducer" do người dùng cung cấp trên mỗi phần tử của mảng, theo thứ tự, truyền giá trị trả về từ phép tính trên phần tử trước đó vào. Kết quả cuối cùng của việc chạy reducer trên tất cả các phần tử của mảng là một giá trị duy nhất.

Lần đầu tiên callback được chạy, không có "giá trị trả về của phép tính trước". Nếu được cung cấp, giá trị khởi đầu có thể được dùng thay thế. Nếu không, phần tử mảng ở chỉ mục 0 được dùng làm giá trị khởi đầu và việc lặp bắt đầu từ phần tử tiếp theo (chỉ mục 1 thay vì chỉ mục 0).

{{InteractiveExample("JavaScript Demo: Array.prototype.reduce()")}}

```js interactive-example
const array = [1, 2, 3, 4];

// 0 + 1 + 2 + 3 + 4
const initialValue = 0;
const sumWithInitial = array.reduce(
  (accumulator, currentValue) => accumulator + currentValue,
  initialValue,
);

console.log(sumWithInitial);
// Expected output: 10
```

## Cú pháp

```js-nolint
reduce(callbackFn)
reduce(callbackFn, initialValue)
```

### Tham số

- `callbackFn`
  - : Một hàm để thực thi cho mỗi phần tử trong mảng. Giá trị trả về của nó trở thành giá trị của tham số `accumulator` ở lần gọi tiếp theo của `callbackFn`. Ở lần gọi cuối cùng, giá trị trả về trở thành giá trị trả về của `reduce()`. Hàm được gọi với các đối số sau:
    - `accumulator`
      - : Giá trị kết quả từ lần gọi trước của `callbackFn`. Ở lần gọi đầu tiên, giá trị của nó là `initialValue` nếu tham số đó được chỉ định; nếu không thì giá trị của nó là `array[0]`.
    - `currentValue`
      - : Giá trị của phần tử hiện tại. Ở lần gọi đầu tiên, giá trị của nó là `array[0]` nếu `initialValue` được chỉ định; nếu không thì giá trị của nó là `array[1]`.
    - `currentIndex`
      - : Vị trí chỉ mục của `currentValue` trong mảng. Ở lần gọi đầu tiên, giá trị của nó là `0` nếu `initialValue` được chỉ định, nếu không thì là `1`.
    - `array`
      - : Mảng mà `reduce()` được gọi.
- `initialValue` {{optional_inline}}
  - : Giá trị mà `accumulator` được khởi tạo lần đầu tiên callback được gọi.
    Nếu `initialValue` được chỉ định, `callbackFn` bắt đầu thực thi với giá trị đầu tiên trong mảng là `currentValue`.
    Nếu `initialValue` _không_ được chỉ định, `accumulator` được khởi tạo bằng giá trị đầu tiên trong mảng, và `callbackFn` bắt đầu thực thi với giá trị thứ hai trong mảng là `currentValue`. Trong trường hợp này, nếu mảng rỗng (không có giá trị đầu tiên nào để trả về làm `accumulator`), sẽ có lỗi được ném ra.

### Giá trị trả về

Giá trị kết quả từ việc chạy hàm callback "reducer" đến hoàn thành trên toàn bộ mảng.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu mảng không chứa phần tử nào và `initialValue` không được cung cấp.

## Mô tả

Phương thức `reduce()` là một [phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods). Nó chạy hàm callback "reducer" trên tất cả các phần tử trong mảng, theo thứ tự chỉ mục tăng dần, và tích lũy chúng thành một giá trị duy nhất. Mỗi lần, giá trị trả về của `callbackFn` được truyền vào `callbackFn` lần tiếp theo dưới dạng `accumulator`. Giá trị cuối cùng của `accumulator` (là giá trị trả về từ `callbackFn` ở lần lặp cuối cùng của mảng) trở thành giá trị trả về của `reduce()`. Đọc phần [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) để biết thêm thông tin về cách các phương thức này hoạt động nói chung.

`callbackFn` chỉ được gọi cho các chỉ mục mảng có giá trị được gán. Nó không được gọi cho các ô trống trong [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays).

Không giống các [phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) khác, `reduce()` không nhận tham số `thisArg`. `callbackFn` luôn được gọi với `undefined` làm `this`, được thay bằng `globalThis` nếu `callbackFn` không nghiêm ngặt.

`reduce()` là một khái niệm trung tâm trong [lập trình hàm](https://en.wikipedia.org/wiki/Functional_programming), trong đó không thể thay đổi bất kỳ giá trị nào, vì vậy để tích lũy tất cả các giá trị trong mảng, người ta phải trả về một giá trị accumulator mới ở mỗi lần lặp. Quy ước này lan truyền sang `reduce()` của JavaScript: bạn nên dùng [spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) hoặc các phương thức sao chép khác khi có thể để tạo mảng và đối tượng mới làm accumulator, thay vì thay đổi đối tượng hiện có. Nếu bạn quyết định thay đổi accumulator thay vì sao chép nó, hãy nhớ vẫn trả về đối tượng đã thay đổi trong callback, nếu không lần lặp tiếp theo sẽ nhận được undefined. Tuy nhiên, lưu ý rằng việc sao chép accumulator có thể dẫn đến tăng sử dụng bộ nhớ và giảm hiệu suất — xem [Khi nào không nên dùng reduce()](#when_to_not_use_reduce) để biết thêm chi tiết. Trong những trường hợp như vậy, để tránh hiệu suất kém và mã khó đọc, tốt hơn nên dùng vòng lặp `for` thay thế.

Phương thức `reduce()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

### Các trường hợp biên

Nếu mảng chỉ có một phần tử (bất kể vị trí) và không có `initialValue` được cung cấp, hoặc nếu `initialValue` được cung cấp nhưng mảng rỗng, giá trị duy nhất sẽ được trả về _mà không_ gọi `callbackFn`.

Nếu `initialValue` được cung cấp và mảng không rỗng, thì phương thức reduce sẽ luôn gọi hàm callback bắt đầu từ chỉ mục 0.

Nếu `initialValue` không được cung cấp thì phương thức reduce sẽ hoạt động khác nhau cho các mảng có độ dài lớn hơn 1, bằng 1 và 0, như trong ví dụ sau:

```js
const getMax = (a, b) => Math.max(a, b);

// callback is invoked for each element in the array starting at index 0
[1, 100].reduce(getMax, 50); // 100
[50].reduce(getMax, 10); // 50

// callback is invoked once for element at index 1
[1, 100].reduce(getMax); // 100

// callback is not invoked
[50].reduce(getMax); // 50
[].reduce(getMax, 1); // 1

[].reduce(getMax); // TypeError
```

## Ví dụ

### Cách reduce() hoạt động không có giá trị khởi đầu

Đoạn mã dưới đây cho thấy điều gì xảy ra nếu chúng ta gọi `reduce()` với một mảng và không có giá trị khởi đầu.

```js
const array = [15, 16, 17, 18, 19];

function reducer(accumulator, currentValue, index) {
  const returns = accumulator + currentValue;
  console.log(
    `accumulator: ${accumulator}, currentValue: ${currentValue}, index: ${index}, returns: ${returns}`,
  );
  return returns;
}

array.reduce(reducer);
```

Callback sẽ được gọi bốn lần, với các đối số và giá trị trả về trong mỗi lần gọi như sau:

|             | `accumulator` | `currentValue` | `index` | Giá trị trả về |
| ----------- | ------------- | -------------- | ------- | -------------- |
| Lần gọi đầu | `15`          | `16`           | `1`     | `31`           |
| Lần gọi hai | `31`          | `17`           | `2`     | `48`           |
| Lần gọi ba  | `48`          | `18`           | `3`     | `66`           |
| Lần gọi bốn | `66`          | `19`           | `4`     | `85`           |

Tham số `array` không bao giờ thay đổi trong quá trình — nó luôn là `[15, 16, 17, 18, 19]`. Giá trị trả về bởi `reduce()` sẽ là giá trị của lần gọi callback cuối cùng (`85`).

### Cách reduce() hoạt động với giá trị khởi đầu

Ở đây chúng ta rút gọn cùng mảng bằng cùng thuật toán, nhưng với `initialValue` là `10` được truyền làm đối số thứ hai cho `reduce()`:

```js
[15, 16, 17, 18, 19].reduce(
  (accumulator, currentValue) => accumulator + currentValue,
  10,
);
```

Callback sẽ được gọi năm lần, với các đối số và giá trị trả về trong mỗi lần gọi như sau:

|             | `accumulator` | `currentValue` | `index` | Giá trị trả về |
| ----------- | ------------- | -------------- | ------- | -------------- |
| Lần gọi đầu | `10`          | `15`           | `0`     | `25`           |
| Lần gọi hai | `25`          | `16`           | `1`     | `41`           |
| Lần gọi ba  | `41`          | `17`           | `2`     | `58`           |
| Lần gọi bốn | `58`          | `18`           | `3`     | `76`           |
| Lần gọi năm | `76`          | `19`           | `4`     | `95`           |

Giá trị trả về bởi `reduce()` trong trường hợp này sẽ là `95`.

### Tổng các giá trị trong mảng đối tượng

Để tổng các giá trị trong một mảng đối tượng, bạn **phải** cung cấp `initialValue`, để mỗi phần tử đi qua hàm của bạn.

```js
const objects = [{ x: 1 }, { x: 2 }, { x: 3 }];
const sum = objects.reduce(
  (accumulator, currentValue) => accumulator + currentValue.x,
  0,
);

console.log(sum); // 6
```

### Nối tiếp hàm

Hàm `pipe` nhận một chuỗi các hàm và trả về một hàm mới. Khi hàm mới được gọi với một đối số, chuỗi các hàm được gọi theo thứ tự, mỗi hàm nhận giá trị trả về của hàm trước.

```js
const pipe =
  (...functions) =>
  (initialValue) =>
    functions.reduce((acc, fn) => fn(acc), initialValue);

// Building blocks to use for composition
const double = (x) => 2 * x;
const triple = (x) => 3 * x;
const quadruple = (x) => 4 * x;

// Composed functions for multiplication of specific values
const multiply6 = pipe(double, triple);
const multiply9 = pipe(triple, triple);
const multiply16 = pipe(quadruple, quadruple);
const multiply24 = pipe(double, triple, quadruple);

// Usage
multiply6(6); // 36
multiply9(9); // 81
multiply16(16); // 256
multiply24(10); // 240
```

### Chạy promise theo trình tự

[Promise sequencing](/en-US/docs/Web/JavaScript/Guide/Using_promises#composition) về cơ bản là nối tiếp hàm được minh họa trong phần trước, ngoại trừ được thực hiện bất đồng bộ.

```js
// Compare this with pipe: fn(acc) is changed to acc.then(fn),
// and initialValue is ensured to be a promise
const asyncPipe =
  (...functions) =>
  (initialValue) =>
    functions.reduce((acc, fn) => acc.then(fn), Promise.resolve(initialValue));

// Building blocks to use for composition
const p1 = async (a) => a * 5;
const p2 = async (a) => a * 2;
// The composed functions can also return non-promises, because the values are
// all eventually wrapped in promises
const f3 = (a) => a * 3;
const p4 = async (a) => a * 4;

asyncPipe(p1, p2, f3, p4)(10).then(console.log); // 1200
```

`asyncPipe` cũng có thể được triển khai bằng `async`/`await`, điều này minh họa rõ hơn sự tương đồng của nó với `pipe`:

```js
const asyncPipe =
  (...functions) =>
  (initialValue) =>
    functions.reduce(async (acc, fn) => fn(await acc), initialValue);
```

### Sử dụng reduce() với mảng thưa

`reduce()` bỏ qua các phần tử bị thiếu trong mảng thưa, nhưng không bỏ qua các giá trị `undefined`.

```js
console.log([1, 2, , 4].reduce((a, b) => a + b)); // 7
console.log([1, 2, undefined, 4].reduce((a, b) => a + b)); // NaN
```

### Gọi reduce() trên đối tượng không phải mảng

Phương thức `reduce()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: 2,
  1: 3,
  2: 4,
  3: 99, // ignored by reduce() since length is 3
};
console.log(Array.prototype.reduce.call(arrayLike, (x, y) => x + y));
// 9
```

### Khi nào không nên dùng reduce()

Các hàm bậc cao đa mục đích như `reduce()` có thể mạnh nhưng đôi khi khó hiểu, đặc biệt đối với các nhà phát triển JavaScript ít kinh nghiệm hơn. Nếu mã trở nên rõ ràng hơn khi sử dụng các phương thức mảng khác, các nhà phát triển phải cân nhắc sự đánh đổi về khả năng đọc so với các lợi ích khác của việc dùng `reduce()`.

Lưu ý rằng `reduce()` luôn tương đương với vòng lặp `for...of`, ngoại trừ thay vì thay đổi một biến trong phạm vi trên, chúng ta trả về giá trị mới cho mỗi lần lặp:

```js
const val = array.reduce((acc, cur) => update(acc, cur), initialValue);

// Is equivalent to:
let val = initialValue;
for (const cur of array) {
  val = update(val, cur);
}
```

Như đã đề cập trước đó, lý do tại sao mọi người muốn dùng `reduce()` là để mô phỏng các thực hành lập trình hàm về dữ liệu bất biến. Do đó, các nhà phát triển giữ tính bất biến của accumulator thường sao chép toàn bộ accumulator cho mỗi lần lặp, như sau:

```js example-bad
const names = ["Alice", "Bob", "Tiff", "Bruce", "Alice"];
const countedNames = names.reduce((allNames, name) => {
  const currCount = Object.hasOwn(allNames, name) ? allNames[name] : 0;
  return {
    ...allNames,
    [name]: currCount + 1,
  };
}, {});
```

Mã này hoạt động kém vì mỗi lần lặp phải sao chép toàn bộ đối tượng `allNames`, có thể rất lớn tùy thuộc vào số lượng tên duy nhất. Mã này có hiệu suất xấu nhất là `O(N^2)`, trong đó `N` là độ dài của `names`.

Một thay thế tốt hơn là _thay đổi_ đối tượng `allNames` trong mỗi lần lặp. Tuy nhiên, nếu `allNames` bị thay đổi dù sao, bạn có thể muốn chuyển `reduce()` thành vòng lặp `for` thay thế, vì nó rõ ràng hơn nhiều:

```js example-bad
const names = ["Alice", "Bob", "Tiff", "Bruce", "Alice"];
const countedNames = names.reduce((allNames, name) => {
  const currCount = allNames[name] ?? 0;
  allNames[name] = currCount + 1;
  // return allNames, otherwise the next iteration receives undefined
  return allNames;
}, Object.create(null));
```

```js example-good
const names = ["Alice", "Bob", "Tiff", "Bruce", "Alice"];
const countedNames = Object.create(null);
for (const name of names) {
  const currCount = countedNames[name] ?? 0;
  countedNames[name] = currCount + 1;
}
```

Do đó, nếu accumulator của bạn là mảng hoặc đối tượng và bạn đang sao chép mảng hoặc đối tượng trong mỗi lần lặp, bạn có thể vô tình đưa vào độ phức tạp bậc hai trong mã của mình, khiến hiệu suất giảm nhanh chóng trên dữ liệu lớn. Điều này đã xảy ra trong code thực tế — xem ví dụ [Making Tanstack Table 1000x faster with a 1 line change](https://jpcamara.com/2023/03/07/making-tanstack-table.html).

Một số trường hợp sử dụng `reduce()` được chấp nhận được đưa ra ở trên (đáng chú ý nhất là tổng mảng, nối tiếp promise và nối tiếp hàm). Có những trường hợp khác tồn tại các lựa chọn tốt hơn `reduce()`.

- Làm phẳng mảng của các mảng. Dùng {{jsxref("Array/flat", "flat()")}} thay thế.

  ```js example-bad
  const flattened = array.reduce((acc, cur) => acc.concat(cur), []);
  ```

  ```js example-good
  const flattened = array.flat();
  ```

- Nhóm đối tượng theo thuộc tính. Dùng {{jsxref("Object.groupBy()")}} thay thế.

  ```js example-bad
  const groups = array.reduce((acc, obj) => {
    const key = obj.name;
    const curGroup = acc[key] ?? [];
    return { ...acc, [key]: [...curGroup, obj] };
  }, {});
  ```

  ```js example-good
  const groups = Object.groupBy(array, (obj) => obj.name);
  ```

- Nối mảng chứa trong mảng của đối tượng. Dùng {{jsxref("Array/flatMap", "flatMap()")}} thay thế.

  ```js example-bad
  const friends = [
    { name: "Anna", books: ["Bible", "Harry Potter"] },
    { name: "Bob", books: ["War and peace", "Romeo and Juliet"] },
    { name: "Alice", books: ["The Lord of the Rings", "The Shining"] },
  ];
  const allBooks = friends.reduce((acc, cur) => [...acc, ...cur.books], []);
  ```

  ```js example-good
  const allBooks = friends.flatMap((person) => person.books);
  ```

- Xóa các phần tử trùng lặp trong mảng. Dùng {{jsxref("Set")}} và {{jsxref("Array.from()")}} thay thế.

  ```js example-bad
  const uniqArray = array.reduce(
    (acc, cur) => (acc.includes(cur) ? acc : [...acc, cur]),
    [],
  );
  ```

  ```js example-good
  const uniqArray = Array.from(new Set(array));
  ```

- Loại bỏ hoặc thêm phần tử trong mảng. Dùng {{jsxref("Array/flatMap", "flatMap()")}} thay thế.

  ```js example-bad
  // Takes an array of numbers and splits perfect squares into its square roots
  const roots = array.reduce((acc, cur) => {
    if (cur < 0) return acc;
    const root = Math.sqrt(cur);
    if (Number.isInteger(root)) return [...acc, root, root];
    return [...acc, cur];
  }, []);
  ```

  ```js example-good
  const roots = array.flatMap((val) => {
    if (val < 0) return [];
    const root = Math.sqrt(val);
    if (Number.isInteger(root)) return [root, root];
    return [val];
  });
  ```

  Nếu bạn chỉ loại bỏ phần tử khỏi mảng, bạn cũng có thể dùng {{jsxref("Array/filter", "filter()")}}.

- Tìm kiếm phần tử hoặc kiểm tra xem các phần tử có thỏa mãn điều kiện không. Dùng {{jsxref("Array/find", "find()")}} và {{jsxref("Array/find", "findIndex()")}}, hoặc {{jsxref("Array/some", "some()")}} và {{jsxref("Array/every", "every()")}} thay thế. Các phương thức này có lợi ích bổ sung là trả về ngay khi kết quả chắc chắn, không cần lặp qua toàn bộ mảng.

  ```js example-bad
  const allEven = array.reduce((acc, cur) => acc && cur % 2 === 0, true);
  ```

  ```js example-good
  const allEven = array.every((val) => val % 2 === 0);
  ```

Trong các trường hợp `reduce()` là lựa chọn tốt nhất, tài liệu và đặt tên biến có nghĩa ngữ nghĩa có thể giúp giảm thiểu nhược điểm về khả năng đọc.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.reduce` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.reduce`](https://www.npmjs.com/package/array.prototype.reduce)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.map()")}}
- {{jsxref("Array.prototype.flat()")}}
- {{jsxref("Array.prototype.flatMap()")}}
- {{jsxref("Array.prototype.reduceRight()")}}
- {{jsxref("TypedArray.prototype.reduce()")}}
- {{jsxref("Object.groupBy()")}}
- {{jsxref("Map.groupBy()")}}
