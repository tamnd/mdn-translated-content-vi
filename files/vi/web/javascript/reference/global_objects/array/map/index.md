---
title: Array.prototype.map()
short-title: map()
slug: Web/JavaScript/Reference/Global_Objects/Array/map
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.map
sidebar: jsref
---

Phương thức **`map()`** của các đối tượng {{jsxref("Array")}} tạo ra một mảng mới được điền với các kết quả của việc gọi một hàm được cung cấp trên mỗi phần tử trong mảng gọi.

{{InteractiveExample("JavaScript Demo: Array.prototype.map()")}}

```js interactive-example
const array = [1, 4, 9, 16];

// Pass a function to map
const mapped = array.map((x) => x * 2);

console.log(mapped);
// Expected output: Array [2, 8, 18, 32]
```

## Cú pháp

```js-nolint
map(callbackFn)
map(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Một hàm để thực thi cho mỗi phần tử trong mảng. Giá trị trả về của nó được thêm vào như một phần tử duy nhất trong mảng mới. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `index`
      - : Chỉ mục của phần tử hiện tại đang được xử lý trong mảng.
    - `array`
      - : Mảng mà `map()` được gọi.
- `thisArg` {{optional_inline}}
  - : Giá trị dùng làm `this` khi thực thi `callbackFn`. Xem [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Giá trị trả về

Một mảng mới với mỗi phần tử là kết quả của hàm callback.

## Mô tả

Phương thức `map()` là một [phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods). Nó gọi hàm `callbackFn` được cung cấp một lần cho mỗi phần tử trong mảng và xây dựng một mảng mới từ các kết quả. Đọc phần [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) để biết thêm thông tin về cách các phương thức này hoạt động nói chung.

`callbackFn` chỉ được gọi cho các chỉ mục mảng có giá trị được gán. Nó không được gọi cho các ô trống trong [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays).

Phương thức `map()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

Vì `map` xây dựng một mảng mới, việc gọi nó mà không sử dụng mảng trả về là một anti-pattern; hãy dùng {{jsxref("Array/forEach", "forEach")}} hoặc {{jsxref("Statements/for...of", "for...of")}} thay thế.

## Ví dụ

### Ánh xạ một mảng số thành mảng căn bậc hai

Đoạn mã sau lấy một mảng số và tạo ra một mảng mới chứa căn bậc hai của các số trong mảng đầu tiên.

```js
const numbers = [1, 4, 9];
const roots = numbers.map((num) => Math.sqrt(num));

// roots is now     [1, 2, 3]
// numbers is still [1, 4, 9]
```

### Dùng map để định dạng lại các đối tượng trong mảng

Đoạn mã sau lấy một mảng các đối tượng và tạo ra một mảng mới chứa các đối tượng được định dạng lại.

```js
const kvArray = [
  { key: 1, value: 10 },
  { key: 2, value: 20 },
  { key: 3, value: 30 },
];

const reformattedArray = kvArray.map(({ key, value }) => ({ [key]: value }));

console.log(reformattedArray); // [{ 1: 10 }, { 2: 20 }, { 3: 30 }]
console.log(kvArray);
// [
//   { key: 1, value: 10 },
//   { key: 2, value: 20 },
//   { key: 3, value: 30 }
// ]
```

### Sử dụng parseInt() với map()

Thông thường người ta dùng callback với một đối số (phần tử đang được duyệt qua). Một số hàm cũng thường được dùng với một đối số, mặc dù chúng nhận thêm đối số tùy chọn. Những thói quen này có thể dẫn đến hành vi khó hiểu. Xem xét:

```js
["1", "2", "3"].map(parseInt);
```

Trong khi người ta có thể mong đợi `[1, 2, 3]`, kết quả thực tế là `[1, NaN, NaN]`.

{{jsxref("parseInt")}} thường được dùng với một đối số, nhưng nhận hai đối số. Đối số thứ nhất là biểu thức và thứ hai là cơ số cho hàm callback, `Array.prototype.map` truyền 3 đối số: phần tử, chỉ mục và mảng. Đối số thứ ba bị {{jsxref("parseInt")}} bỏ qua — nhưng _không_ phải đối số thứ hai! Đây là nguồn gốc của sự nhầm lẫn có thể xảy ra.

Đây là ví dụ ngắn gọn về các bước lặp:

```js
/* first iteration  (index is 0): */ parseInt("1", 0); // 1
/* second iteration (index is 1): */ parseInt("2", 1); // NaN
/* third iteration  (index is 2): */ parseInt("3", 2); // NaN
```

Để giải quyết vấn đề này, hãy định nghĩa hàm khác chỉ nhận một đối số:

```js
["1", "2", "3"].map((str) => parseInt(str, 10)); // [1, 2, 3]
```

Bạn cũng có thể dùng hàm {{jsxref("Number")}}, chỉ nhận một đối số:

```js
["1", "2", "3"].map(Number); // [1, 2, 3]

// But unlike parseInt(), Number() will also return a float or (resolved) exponential notation:
["1.1", "2.2e2", "3e300"].map(Number); // [1.1, 220, 3e+300]

// For comparison, if we use parseInt() on the array above:
["1.1", "2.2e2", "3e300"].map((str) => parseInt(str, 10)); // [1, 2, 3]
```

Xem [A JavaScript optional argument hazard](https://wirfs-brock.com/allen/posts/166) của Allen Wirfs-Brock để biết thêm thảo luận.

### Mảng được ánh xạ chứa undefined

Khi {{jsxref("undefined")}} hoặc không có gì được trả về, mảng kết quả chứa `undefined`. Nếu bạn muốn xóa phần tử thay vào đó, hãy nối thêm phương thức {{jsxref("Array/filter", "filter()")}}, hoặc dùng phương thức {{jsxref("Array/flatMap", "flatMap()")}} và trả về mảng rỗng để báo hiệu việc xóa.

```js
const numbers = [1, 2, 3, 4];
const filteredNumbers = numbers.map((num, index) => {
  if (index < 3) {
    return num;
  }
});

// index goes from 0, so the filterNumbers are 1,2,3 and undefined.
// filteredNumbers is [1, 2, 3, undefined]
// numbers is still [1, 2, 3, 4]
```

### Ánh xạ có hiệu ứng phụ

Callback có thể có hiệu ứng phụ.

```js
const cart = [5, 15, 25];
let total = 0;
const withTax = cart.map((cost) => {
  total += cost;
  return cost * 1.2;
});
console.log(withTax); // [6, 18, 30]
console.log(total); // 45
```

Điều này không được khuyến nghị, vì các phương thức sao chép tốt nhất được dùng với các hàm thuần túy. Trong trường hợp này, chúng ta có thể chọn lặp qua mảng hai lần.

```js
const cart = [5, 15, 25];
const total = cart.reduce((acc, cost) => acc + cost, 0);
const withTax = cart.map((cost) => cost * 1.2);
```

Đôi khi mẫu này đi đến cực đoan và điều _duy nhất_ hữu ích mà `map()` làm là gây ra hiệu ứng phụ.

```js
const products = [
  { name: "sports car" },
  { name: "laptop" },
  { name: "phone" },
];

products.map((product) => {
  product.price = 100;
});
```

Như đã đề cập trước đó, đây là một anti-pattern. Nếu bạn không sử dụng giá trị trả về của `map()`, hãy dùng `forEach()` hoặc vòng lặp `for...of` thay thế.

```js
products.forEach((product) => {
  product.price = 100;
});
```

Hoặc, nếu bạn muốn tạo một mảng mới:

```js
const productsWithPrice = products.map((product) => ({
  ...product,
  price: 100,
}));
```

### Sử dụng đối số thứ ba của callbackFn

Đối số `array` hữu ích khi bạn muốn truy cập phần tử khác trong mảng, đặc biệt khi bạn không có biến hiện có tham chiếu đến mảng. Ví dụ sau trước tiên dùng `filter()` để trích xuất các giá trị dương và sau đó dùng `map()` để tạo mảng mới trong đó mỗi phần tử là trung bình của các phần tử lân cận và chính nó.

```js
const numbers = [3, -1, 1, 4, 1, 5, 9, 2, 6];
const averaged = numbers
  .filter((num) => num > 0)
  .map((num, idx, arr) => {
    // Without the arr argument, there's no way to easily access the
    // intermediate array without saving it to a variable.
    const prev = arr[idx - 1];
    const next = arr[idx + 1];
    let count = 1;
    let total = num;
    if (prev !== undefined) {
      count++;
      total += prev;
    }
    if (next !== undefined) {
      count++;
      total += next;
    }
    const average = total / count;
    // Keep two decimal places
    return Math.round(average * 100) / 100;
  });
console.log(averaged); // [2, 2.67, 2, 3.33, 5, 5.33, 5.67, 4]
```

Đối số `array` _không_ phải là mảng đang được xây dựng — không có cách nào truy cập mảng đang được xây dựng từ hàm callback.

### Sử dụng map() trên mảng thưa

Mảng thưa vẫn thưa sau `map()`. Các chỉ mục của các ô trống vẫn rỗng trong mảng trả về, và hàm callback sẽ không được gọi cho chúng.

```js
console.log(
  [1, , 3].map((x, index) => {
    console.log(`Visit ${index}`);
    return x * 2;
  }),
);
// Visit 0
// Visit 2
// [2, empty, 6]
```

### Gọi map() trên đối tượng không phải mảng

Phương thức `map()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: 2,
  1: 3,
  2: 4,
  3: 5, // ignored by map() since length is 3
};
console.log(Array.prototype.map.call(arrayLike, (x) => x ** 2));
// [ 4, 9, 16 ]
```

Ví dụ này cho thấy cách lặp qua một tập hợp các đối tượng được thu thập bởi `querySelectorAll`. Điều này là vì `querySelectorAll` trả về `NodeList` (là một tập hợp các đối tượng). Trong trường hợp này, chúng ta trả về tất cả các giá trị `option` được chọn trên màn hình:

```js
const elems = document.querySelectorAll("select option:checked");
const values = Array.prototype.map.call(elems, ({ value }) => value);
```

Bạn cũng có thể dùng {{jsxref("Array.from()")}} để chuyển đổi `elems` thành mảng, sau đó truy cập phương thức `map()`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.map` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.map`](https://www.npmjs.com/package/array.prototype.map)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.forEach()")}}
- {{jsxref("Array.from()")}}
- {{jsxref("TypedArray.prototype.map()")}}
- {{jsxref("Map")}}
