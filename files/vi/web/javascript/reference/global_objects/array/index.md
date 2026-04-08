---
title: Array
slug: Web/JavaScript/Reference/Global_Objects/Array
page-type: javascript-class
browser-compat: javascript.builtins.Array
sidebar: jsref
---

Đối tượng **`Array`**, giống như mảng trong các ngôn ngữ lập trình khác, cho phép [lưu trữ một tập hợp nhiều phần tử dưới một tên biến duy nhất](/en-US/docs/Learn_web_development/Core/Scripting/Arrays), và có các phương thức để [thực hiện các thao tác mảng phổ biến](#examples).

## Description

Trong JavaScript, mảng không phải là [primitive](/en-US/docs/Glossary/Primitive) mà là các đối tượng `Array` với các đặc điểm cốt lõi sau:

- **Mảng JavaScript có thể thay đổi kích thước** và **có thể chứa hỗn hợp các [kiểu dữ liệu](/en-US/docs/Web/JavaScript/Guide/Data_structures) khác nhau**. (Khi những đặc điểm này không mong muốn, hãy dùng [typed array](/en-US/docs/Web/JavaScript/Guide/Typed_arrays) thay thế.)
- **Mảng JavaScript không phải là mảng kết hợp (associative array)** vì vậy, các phần tử mảng không thể được truy cập bằng chuỗi tùy ý làm chỉ số, mà phải dùng số nguyên không âm (hoặc dạng chuỗi tương ứng) làm chỉ số.
- **Mảng JavaScript được [đánh chỉ số từ 0 (zero-indexed)](https://en.wikipedia.org/wiki/Zero-based_numbering)**: phần tử đầu tiên của mảng ở chỉ số `0`, phần tử thứ hai ở chỉ số `1`, v.v. — và phần tử cuối cùng ở giá trị của thuộc tính {{jsxref("Array/length", "length")}} của mảng trừ đi `1`.
- **[Các thao tác sao chép mảng](#copy_an_array) trong JavaScript tạo ra [bản sao nông (shallow copy)](/en-US/docs/Glossary/Shallow_copy)**. (Tất cả các thao tác sao chép tích hợp chuẩn với _bất kỳ_ đối tượng JavaScript nào đều tạo bản sao nông, thay vì [bản sao sâu (deep copy)](/en-US/docs/Glossary/Deep_copy)).

### Chỉ số mảng (Array indices)

Các đối tượng `Array` không thể dùng chuỗi tùy ý làm chỉ số phần tử (như trong [mảng kết hợp](https://en.wikipedia.org/wiki/Associative_array)) mà phải dùng số nguyên không âm (hoặc dạng chuỗi tương ứng). Việc gán hoặc truy cập thông qua giá trị không phải số nguyên sẽ không thiết lập hay lấy phần tử từ danh sách mảng, mà thiết lập hoặc truy cập một biến liên kết với [tập hợp thuộc tính object](/en-US/docs/Web/JavaScript/Guide/Data_structures#properties) của mảng đó. Các thuộc tính object của mảng và danh sách phần tử mảng là tách biệt, và các [thao tác duyệt và biến đổi mảng](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#array_methods) không thể áp dụng cho các thuộc tính được đặt tên này.

Các phần tử mảng là các thuộc tính object giống như `toString` là một thuộc tính (cụ thể hơn, `toString()` là một phương thức). Tuy nhiên, việc cố gắng truy cập phần tử mảng như sau sẽ gây ra lỗi cú pháp vì tên thuộc tính không hợp lệ:

```js-nolint example-bad
arr.0; // a syntax error
```

JavaScript yêu cầu các thuộc tính bắt đầu bằng chữ số phải được truy cập bằng [ký hiệu ngoặc vuông](/en-US/docs/Web/JavaScript/Guide/Working_with_objects#objects_and_properties) thay vì [ký hiệu chấm](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors). Cũng có thể đặt chỉ số mảng trong dấu nháy (ví dụ: `years['2']` thay vì `years[2]`), dù thường không cần thiết.

Số `2` trong `years[2]` được JavaScript engine chuyển thành chuỗi thông qua chuyển đổi `toString` ngầm định. Kết quả là, `'2'` và `'02'` sẽ tham chiếu đến hai slot khác nhau trên đối tượng `years`, và ví dụ sau có thể là `true`:

```js
console.log(years["2"] !== years["02"]);
```

Chỉ `years['2']` mới là chỉ số mảng thực sự. `years['02']` là một thuộc tính chuỗi tùy ý và sẽ không được duyệt khi lặp mảng.

### Mối quan hệ giữa length và thuộc tính số

Thuộc tính {{jsxref("Array/length", "length")}} của mảng JavaScript và các thuộc tính số có liên kết với nhau.

Nhiều phương thức mảng tích hợp (ví dụ: {{jsxref("Array/join", "join()")}}, {{jsxref("Array/slice", "slice()")}}, {{jsxref("Array/indexOf", "indexOf()")}}, v.v.) sẽ tính đến giá trị của thuộc tính {{jsxref("Array/length", "length")}} của mảng khi được gọi.

Các phương thức khác (ví dụ: {{jsxref("Array/push", "push()")}}, {{jsxref("Array/splice", "splice()")}}, v.v.) cũng dẫn đến việc cập nhật thuộc tính {{jsxref("Array/length", "length")}} của mảng.

```js
const fruits = [];
fruits.push("banana", "apple", "peach");
console.log(fruits.length); // 3
```

Khi gán một thuộc tính trên mảng JavaScript khi thuộc tính đó là chỉ số mảng hợp lệ và chỉ số đó nằm ngoài giới hạn hiện tại của mảng, engine sẽ cập nhật thuộc tính {{jsxref("Array/length", "length")}} của mảng cho phù hợp:

```js
fruits[5] = "mango";
console.log(fruits[5]); // 'mango'
console.log(Object.keys(fruits)); // ['0', '1', '2', '5']
console.log(fruits.length); // 6
```

Tăng {{jsxref("Array/length", "length")}} sẽ mở rộng mảng bằng cách thêm các slot rỗng mà không tạo ra phần tử mới nào — thậm chí không phải `undefined`.

```js
fruits.length = 10;
console.log(fruits); // ['banana', 'apple', 'peach', empty x 2, 'mango', empty x 4]
console.log(Object.keys(fruits)); // ['0', '1', '2', '5']
console.log(fruits.length); // 10
console.log(fruits[8]); // undefined
```

Giảm thuộc tính {{jsxref("Array/length", "length")}} sẽ xóa các phần tử.

```js
fruits.length = 2;
console.log(Object.keys(fruits)); // ['0', '1']
console.log(fruits.length); // 2
```

Điều này được giải thích thêm trên trang {{jsxref("Array/length", "length")}}.

### Phương thức mảng và slot rỗng

Các phương thức mảng có các hành vi khác nhau khi gặp slot rỗng trong [mảng thưa (sparse array)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays). Nhìn chung, các phương thức cũ hơn (ví dụ: `forEach`) xử lý slot rỗng khác với các chỉ số chứa `undefined`.

Các phương thức có cách xử lý đặc biệt cho slot rỗng bao gồm: {{jsxref("Array/concat", "concat()")}}, {{jsxref("Array/copyWithin", "copyWithin()")}}, {{jsxref("Array/every", "every()")}}, {{jsxref("Array/filter", "filter()")}}, {{jsxref("Array/flat", "flat()")}}, {{jsxref("Array/flatMap", "flatMap()")}}, {{jsxref("Array/forEach", "forEach()")}}, {{jsxref("Array/indexOf", "indexOf()")}}, {{jsxref("Array/lastIndexOf", "lastIndexOf()")}}, {{jsxref("Array/map", "map()")}}, {{jsxref("Array/reduce", "reduce()")}}, {{jsxref("Array/reduceRight", "reduceRight()")}}, {{jsxref("Array/reverse", "reverse()")}}, {{jsxref("Array/slice", "slice()")}}, {{jsxref("Array/some", "some()")}}, {{jsxref("Array/sort", "sort()")}} và {{jsxref("Array/splice", "splice()")}}. Các phương thức lặp như `forEach` sẽ không duyệt slot rỗng. Các phương thức khác như `concat`, `copyWithin`, v.v. sẽ giữ nguyên slot rỗng khi sao chép, do đó mảng kết quả vẫn thưa.

```js
const colors = ["red", "yellow", "blue"];
colors[5] = "purple";
colors.forEach((item, index) => {
  console.log(`${index}: ${item}`);
});
// Output:
// 0: red
// 1: yellow
// 2: blue
// 5: purple

colors.reverse(); // ['purple', empty × 2, 'blue', 'yellow', 'red']
```

Các phương thức mới hơn (ví dụ: `keys`) không xử lý đặc biệt slot rỗng mà coi chúng như thể chứa `undefined`. Các phương thức đồng nhất slot rỗng với phần tử `undefined` bao gồm: {{jsxref("Array/entries", "entries()")}}, {{jsxref("Array/fill", "fill()")}}, {{jsxref("Array/find", "find()")}}, {{jsxref("Array/findIndex", "findIndex()")}}, {{jsxref("Array/findLast", "findLast()")}}, {{jsxref("Array/findLastIndex", "findLastIndex()")}}, {{jsxref("Array/includes", "includes()")}}, {{jsxref("Array/join", "join()")}}, {{jsxref("Array/keys", "keys()")}}, {{jsxref("Array/toLocaleString", "toLocaleString()")}}, {{jsxref("Array/toReversed", "toReversed()")}}, {{jsxref("Array/toSorted", "toSorted()")}}, {{jsxref("Array/toSpliced", "toSpliced()")}}, {{jsxref("Array/values", "values()")}} và {{jsxref("Array/with", "with()")}}.

```js
const colors = ["red", "yellow", "blue"];
colors[5] = "purple";
const iterator = colors.keys();
for (const key of iterator) {
  console.log(`${key}: ${colors[key]}`);
}
// Output
// 0: red
// 1: yellow
// 2: blue
// 3: undefined
// 4: undefined
// 5: purple

const newColors = colors.toReversed(); // ['purple', undefined, undefined, 'blue', 'yellow', 'red']
```

### Phương thức sao chép và phương thức biến đổi

Một số phương thức không biến đổi mảng hiện có mà thay vào đó trả về một mảng mới. Chúng làm vậy bằng cách đầu tiên xây dựng một mảng mới rồi điền vào các phần tử. Việc sao chép luôn diễn ra [_nông_](/en-US/docs/Glossary/Shallow_copy) — phương thức không bao giờ sao chép bất cứ thứ gì vượt ra ngoài mảng được tạo ban đầu. Các phần tử của mảng gốc được sao chép vào mảng mới như sau:

- Object: tham chiếu đối tượng được sao chép vào mảng mới. Cả mảng gốc lẫn mảng mới đều tham chiếu đến cùng một đối tượng. Tức là, nếu đối tượng được tham chiếu bị thay đổi, những thay đổi đó sẽ hiển thị ở cả mảng mới lẫn mảng gốc.
- Các kiểu primitive như string, number và boolean (không phải object {{jsxref("String")}}, {{jsxref("Number")}} và {{jsxref("Boolean")}}): giá trị của chúng được sao chép vào mảng mới.

Các phương thức khác biến đổi mảng mà chúng được gọi trên đó, trong trường hợp này giá trị trả về của chúng khác nhau tùy theo phương thức: đôi khi là tham chiếu đến cùng một mảng, đôi khi là độ dài của mảng mới.

Các phương thức sau tạo mảng mới bằng cách truy cập [`this.constructor[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.species) để xác định constructor cần dùng: {{jsxref("Array/concat", "concat()")}}, {{jsxref("Array/filter", "filter()")}}, {{jsxref("Array/flat", "flat()")}}, {{jsxref("Array/flatMap", "flatMap()")}}, {{jsxref("Array/map", "map()")}}, {{jsxref("Array/slice", "slice()")}} và {{jsxref("Array/splice", "splice()")}} (để xây dựng mảng các phần tử đã xóa được trả về).

Các phương thức sau luôn tạo mảng mới với constructor `Array` cơ sở: {{jsxref("Array/toReversed", "toReversed()")}}, {{jsxref("Array/toSorted", "toSorted()")}}, {{jsxref("Array/toSpliced", "toSpliced()")}} và {{jsxref("Array/with", "with()")}}.

Bảng sau liệt kê các phương thức biến đổi mảng gốc và các phương thức thay thế không biến đổi tương ứng:

| Phương thức biến đổi                           | Thay thế không biến đổi                                  |
| ---------------------------------------------- | -------------------------------------------------------- |
| {{jsxref("Array/copyWithin", "copyWithin()")}} | No one-method alternative                                |
| {{jsxref("Array/fill", "fill()")}}             | No one-method alternative                                |
| {{jsxref("Array/pop", "pop()")}}               | {{jsxref("Array/slice", "slice(0, -1)")}}                |
| {{jsxref("Array/push", "push(v1, v2)")}}       | {{jsxref("Array/concat", "concat([v1, v2])")}}           |
| {{jsxref("Array/reverse", "reverse()")}}       | {{jsxref("Array/toReversed", "toReversed()")}}           |
| {{jsxref("Array/shift", "shift()")}}           | {{jsxref("Array/slice", "slice(1)")}}                    |
| {{jsxref("Array/sort", "sort()")}}             | {{jsxref("Array/toSorted", "toSorted()")}}               |
| {{jsxref("Array/splice", "splice()")}}         | {{jsxref("Array/toSpliced", "toSpliced()")}}             |
| {{jsxref("Array/unshift", "unshift(v1, v2)")}} | {{jsxref("Array/toSpliced", "toSpliced(0, 0, v1, v2)")}} |

Một cách đơn giản để chuyển phương thức biến đổi thành phương thức không biến đổi là dùng [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) hoặc {{jsxref("Array/slice", "slice()")}} để tạo bản sao trước:

```js-nolint
arr.copyWithin(0, 1, 2); // mutates arr
const arr2 = arr.slice().copyWithin(0, 1, 2); // does not mutate arr
const arr3 = [...arr].copyWithin(0, 1, 2); // does not mutate arr
```

### Phương thức lặp (Iterative methods)

Nhiều phương thức mảng nhận một callback function làm đối số. Callback function được gọi tuần tự và nhiều nhất một lần cho mỗi phần tử trong mảng, và giá trị trả về của callback function được dùng để xác định giá trị trả về của phương thức. Tất cả chúng đều có cùng chữ ký:

```js-nolint
method(callbackFn, thisArg)
```

Trong đó `callbackFn` nhận ba đối số:

- `element`
  - : Phần tử hiện tại đang được xử lý trong mảng.
- `index`
  - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.
- `array`
  - : Mảng mà phương thức được gọi trên đó.

Giá trị mà `callbackFn` cần trả về tùy thuộc vào phương thức mảng được gọi.

Đối số `thisArg` (mặc định là `undefined`) sẽ được dùng làm giá trị `this` khi gọi `callbackFn`. Giá trị `this` thực sự được quan sát bởi `callbackFn` được xác định theo [các quy tắc thông thường](/en-US/docs/Web/JavaScript/Reference/Operators/this): nếu `callbackFn` là [non-strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode#no_this_substitution), các giá trị `this` primitive được bọc thành object, và `undefined`/`null` được thay thế bằng [`globalThis`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/globalThis). Đối số `thisArg` không liên quan với bất kỳ `callbackFn` nào được định nghĩa bằng [arrow function](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions), vì arrow function không có `this` {{Glossary("binding")}} riêng.

Đối số `array` được truyền vào `callbackFn` hữu ích nhất khi bạn muốn đọc chỉ số khác trong khi lặp, vì bạn không phải lúc nào cũng có biến hiện có tham chiếu đến mảng hiện tại. Thông thường bạn không nên biến đổi mảng trong khi lặp (xem [biến đổi mảng ban đầu trong phương thức lặp](#mutating_initial_array_in_iterative_methods)), nhưng bạn cũng có thể dùng đối số này để làm vậy. Đối số `array` _không_ phải là mảng đang được xây dựng, trong trường hợp các phương thức như `map()`, `filter()` và `flatMap()` — không có cách nào truy cập mảng đang được xây dựng từ callback function.

Tất cả các phương thức lặp đều là [sao chép](#copying_methods_and_mutating_methods) và [tổng quát (generic)](#generic_array_methods), mặc dù chúng có hành vi khác nhau với [slot rỗng](#array_methods_and_empty_slots).

Các phương thức sau là phương thức lặp: {{jsxref("Array/every", "every()")}}, {{jsxref("Array/filter", "filter()")}}, {{jsxref("Array/find", "find()")}}, {{jsxref("Array/findIndex", "findIndex()")}}, {{jsxref("Array/findLast", "findLast()")}}, {{jsxref("Array/findLastIndex", "findLastIndex()")}}, {{jsxref("Array/flatMap", "flatMap()")}}, {{jsxref("Array/forEach", "forEach()")}}, {{jsxref("Array/map", "map()")}} và {{jsxref("Array/some", "some()")}}.

Đặc biệt, {{jsxref("Array/every", "every()")}}, {{jsxref("Array/find", "find()")}}, {{jsxref("Array/findIndex", "findIndex()")}}, {{jsxref("Array/findLast", "findLast()")}}, {{jsxref("Array/findLastIndex", "findLastIndex()")}} và {{jsxref("Array/some", "some()")}} không phải lúc nào cũng gọi `callbackFn` trên mọi phần tử — chúng dừng lặp ngay khi giá trị trả về được xác định.

Các phương thức {{jsxref("Array/reduce", "reduce()")}} và {{jsxref("Array/reduceRight", "reduceRight()")}} cũng nhận một callback function và chạy nó nhiều nhất một lần cho mỗi phần tử trong mảng, nhưng chúng có chữ ký hơi khác so với các phương thức lặp thông thường (ví dụ: chúng không chấp nhận `thisArg`).

Phương thức {{jsxref("Array/sort", "sort()")}} cũng nhận callback function, nhưng nó không phải là phương thức lặp. Nó biến đổi mảng tại chỗ, không chấp nhận `thisArg`, và có thể gọi callback nhiều lần trên một chỉ số.

Các phương thức lặp duyệt qua mảng như sau (với nhiều chi tiết kỹ thuật được lược bỏ):

```js
function method(callbackFn, thisArg) {
  const length = this.length;
  for (let i = 0; i < length; i++) {
    if (i in this) {
      const result = callbackFn.call(thisArg, this[i], i, this);
      // Do something with result; maybe return early
    }
  }
}
```

Lưu ý những điểm sau:

1. Không phải tất cả phương thức đều thực hiện kiểm tra `i in this`. Các phương thức `find`, `findIndex`, `findLast` và `findLastIndex` không làm vậy, nhưng các phương thức khác thì có.
2. `length` được ghi nhớ trước khi vòng lặp bắt đầu. Điều này ảnh hưởng đến cách xử lý các thao tác chèn và xóa trong khi lặp (xem [biến đổi mảng ban đầu trong phương thức lặp](#mutating_initial_array_in_iterative_methods)).
3. Phương thức không ghi nhớ nội dung mảng, vì vậy nếu bất kỳ chỉ số nào bị thay đổi trong khi lặp, giá trị mới có thể được quan sát.
4. Code ở trên lặp mảng theo thứ tự chỉ số tăng dần. Một số phương thức lặp theo thứ tự chỉ số giảm dần (`for (let i = length - 1; i >= 0; i--)`): `reduceRight()`, `findLast()` và `findLastIndex()`.
5. `reduce` và `reduceRight` có chữ ký hơi khác và không phải lúc nào cũng bắt đầu từ phần tử đầu/cuối.

### Phương thức mảng tổng quát (Generic array methods)

Các phương thức mảng luôn tổng quát — chúng không truy cập bất kỳ dữ liệu nội bộ nào của đối tượng mảng. Chúng chỉ truy cập các phần tử mảng thông qua thuộc tính `length` và các phần tử được đánh chỉ số. Điều này có nghĩa là chúng cũng có thể được gọi trên các đối tượng giống mảng.

```js
const arrayLike = {
  0: "a",
  1: "b",
  length: 2,
};
console.log(Array.prototype.join.call(arrayLike, "+")); // 'a+b'
```

#### Chuẩn hóa thuộc tính length

Thuộc tính `length` được [chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion) rồi được giới hạn trong khoảng từ 0 đến 2<sup>53</sup> - 1. `NaN` trở thành `0`, vì vậy ngay cả khi `length` không có hoặc là `undefined`, nó vẫn hoạt động như thể có giá trị `0`.

Ngôn ngữ tránh gán `length` thành [số nguyên không an toàn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER). Tất cả phương thức tích hợp sẽ ném {{jsxref("TypeError")}} nếu `length` sẽ được gán thành số lớn hơn 2<sup>53</sup> - 1. Tuy nhiên, vì thuộc tính {{jsxref("Array/length", "length")}} của mảng ném lỗi khi được gán thành số lớn hơn 2<sup>32</sup> - 1, ngưỡng số nguyên an toàn thường không đạt được trừ khi phương thức được gọi trên đối tượng không phải mảng.

```js
Array.prototype.flat.call({}); // []
```

Một số phương thức mảng thiết lập thuộc tính `length` của đối tượng mảng. Chúng luôn thiết lập giá trị sau khi chuẩn hóa, vì vậy `length` luôn kết thúc là một số nguyên.

```js
const a = { length: 0.7 };
Array.prototype.push.call(a);
console.log(a.length); // 0
```

#### Đối tượng giống mảng (Array-like objects)

Thuật ngữ [_đối tượng giống mảng_](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#working_with_array-like_objects) đề cập đến bất kỳ đối tượng nào không ném lỗi trong quá trình chuyển đổi `length` được mô tả ở trên. Trong thực tế, đối tượng như vậy được kỳ vọng thực sự có thuộc tính `length` và có các phần tử được đánh chỉ số trong khoảng từ `0` đến `length - 1`. (Nếu nó không có tất cả các chỉ số, nó sẽ tương đương về chức năng với [mảng thưa](#array_methods_and_empty_slots).) Bất kỳ chỉ số nguyên nào nhỏ hơn 0 hoặc lớn hơn `length - 1` đều bị bỏ qua khi phương thức mảng thao tác trên đối tượng giống mảng.

Nhiều đối tượng DOM là giống mảng — ví dụ: [`NodeList`](/en-US/docs/Web/API/NodeList) và [`HTMLCollection`](/en-US/docs/Web/API/HTMLCollection). Đối tượng [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments) cũng là giống mảng. Bạn có thể gọi phương thức mảng trên chúng ngay cả khi chúng không có các phương thức này.

```js
function f() {
  console.log(Array.prototype.join.call(arguments, "+"));
}

f("a", "b"); // 'a+b'
```

## Constructor

- {{jsxref("Array/Array", "Array()")}}
  - : Tạo một đối tượng `Array` mới.

## Static properties

- [`Array[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.species)
  - : Trả về constructor `Array`.

## Static methods

- {{jsxref("Array.from()")}}
  - : Tạo một instance `Array` mới từ một iterable hoặc đối tượng giống mảng.
- {{jsxref("Array.fromAsync()")}}
  - : Tạo một instance `Array` mới từ một async iterable, iterable hoặc đối tượng giống mảng.
- {{jsxref("Array.isArray()")}}
  - : Trả về `true` nếu đối số là mảng, hoặc `false` nếu không phải.
- {{jsxref("Array.of()")}}
  - : Tạo một instance `Array` mới với số lượng đối số biến đổi, bất kể số lượng hay kiểu của đối số.

## Instance properties

Các thuộc tính này được định nghĩa trên `Array.prototype` và chia sẻ cho tất cả các instance của `Array`.

- {{jsxref("Object/constructor", "Array.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Với các instance của `Array`, giá trị ban đầu là constructor {{jsxref("Array/Array", "Array")}}.
- [`Array.prototype[Symbol.unscopables]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.unscopables)
  - : Chứa các tên thuộc tính không được đưa vào tiêu chuẩn ECMAScript trước phiên bản ES2015 và bị bỏ qua cho mục đích gắn kết câu lệnh [`with`](/en-US/docs/Web/JavaScript/Reference/Statements/with).

Các thuộc tính sau là thuộc tính riêng của từng instance `Array`.

- {{jsxref("Array/length", "length")}}
  - : Phản ánh số lượng phần tử trong mảng.

## Instance methods

- {{jsxref("Array.prototype.at()")}}
  - : Trả về phần tử mảng tại chỉ số cho trước. Chấp nhận số nguyên âm, tính từ phần tử cuối.
- {{jsxref("Array.prototype.concat()")}}
  - : Trả về một mảng mới là mảng đang gọi được nối với các mảng và/hoặc giá trị khác.
- {{jsxref("Array.prototype.copyWithin()")}}
  - : Sao chép một chuỗi phần tử mảng trong mảng.
- {{jsxref("Array.prototype.entries()")}}
  - : Trả về một đối tượng [_array iterator_](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) mới chứa các cặp khóa/giá trị cho mỗi chỉ số trong mảng.
- {{jsxref("Array.prototype.every()")}}
  - : Trả về `false` nếu tìm thấy phần tử trong mảng không thỏa mãn hàm kiểm tra cho trước. Ngược lại, trả về `true`.
- {{jsxref("Array.prototype.fill()")}}
  - : Điền tất cả phần tử của mảng từ chỉ số bắt đầu đến chỉ số kết thúc bằng một giá trị tĩnh.
- {{jsxref("Array.prototype.filter()")}}
  - : Trả về một mảng mới chứa tất cả phần tử của mảng gọi mà hàm lọc cho trước trả về `true`.
- {{jsxref("Array.prototype.find()")}}
  - : Trả về giá trị của phần tử đầu tiên trong mảng thỏa mãn hàm kiểm tra cho trước, hoặc `undefined` nếu không tìm thấy.
- {{jsxref("Array.prototype.findIndex()")}}
  - : Trả về chỉ số của phần tử đầu tiên trong mảng thỏa mãn hàm kiểm tra cho trước, hoặc `-1` nếu không tìm thấy.
- {{jsxref("Array.prototype.findLast()")}}
  - : Trả về giá trị của phần tử cuối cùng trong mảng thỏa mãn hàm kiểm tra cho trước, hoặc `undefined` nếu không tìm thấy.
- {{jsxref("Array.prototype.findLastIndex()")}}
  - : Trả về chỉ số của phần tử cuối cùng trong mảng thỏa mãn hàm kiểm tra cho trước, hoặc `-1` nếu không tìm thấy.
- {{jsxref("Array.prototype.flat()")}}
  - : Trả về một mảng mới với tất cả phần tử mảng con được nối đệ quy đến độ sâu đã chỉ định.
- {{jsxref("Array.prototype.flatMap()")}}
  - : Trả về một mảng mới được tạo bằng cách áp dụng callback function cho trước lên mỗi phần tử của mảng gọi, rồi làm phẳng kết quả một cấp.
- {{jsxref("Array.prototype.forEach()")}}
  - : Gọi một hàm cho mỗi phần tử trong mảng gọi.
- {{jsxref("Array.prototype.includes()")}}
  - : Xác định xem mảng gọi có chứa một giá trị hay không, trả về `true` hoặc `false` phù hợp.
- {{jsxref("Array.prototype.indexOf()")}}
  - : Trả về chỉ số đầu tiên (nhỏ nhất) mà một phần tử cho trước có thể được tìm thấy trong mảng gọi.
- {{jsxref("Array.prototype.join()")}}
  - : Nối tất cả phần tử của mảng thành một chuỗi.
- {{jsxref("Array.prototype.keys()")}}
  - : Trả về một [_array iterator_](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) mới chứa các khóa cho mỗi chỉ số trong mảng gọi.
- {{jsxref("Array.prototype.lastIndexOf()")}}
  - : Trả về chỉ số cuối cùng (lớn nhất) mà một phần tử cho trước có thể được tìm thấy trong mảng gọi, hoặc `-1` nếu không tìm thấy.
- {{jsxref("Array.prototype.map()")}}
  - : Trả về một mảng mới chứa kết quả của việc gọi một hàm trên mỗi phần tử trong mảng gọi.
- {{jsxref("Array.prototype.pop()")}}
  - : Xóa phần tử cuối cùng khỏi mảng và trả về phần tử đó.
- {{jsxref("Array.prototype.push()")}}
  - : Thêm một hoặc nhiều phần tử vào cuối mảng và trả về `length` mới của mảng.
- {{jsxref("Array.prototype.reduce()")}}
  - : Thực thi callback "reducer" do người dùng cung cấp trên mỗi phần tử của mảng (từ trái sang phải), để thu gọn thành một giá trị duy nhất.
- {{jsxref("Array.prototype.reduceRight()")}}
  - : Thực thi callback "reducer" do người dùng cung cấp trên mỗi phần tử của mảng (từ phải sang trái), để thu gọn thành một giá trị duy nhất.
- {{jsxref("Array.prototype.reverse()")}}
  - : Đảo ngược thứ tự các phần tử của mảng _tại chỗ_. (Phần tử đầu trở thành cuối, cuối trở thành đầu.)
- {{jsxref("Array.prototype.shift()")}}
  - : Xóa phần tử đầu tiên khỏi mảng và trả về phần tử đó.
- {{jsxref("Array.prototype.slice()")}}
  - : Trích xuất một phần của mảng gọi và trả về mảng mới.
- {{jsxref("Array.prototype.some()")}}
  - : Trả về `true` nếu tìm thấy ít nhất một phần tử trong mảng thỏa mãn hàm kiểm tra cho trước. Ngược lại, trả về `false`.
- {{jsxref("Array.prototype.sort()")}}
  - : Sắp xếp các phần tử của mảng tại chỗ và trả về mảng.
- {{jsxref("Array.prototype.splice()")}}
  - : Thêm và/hoặc xóa phần tử khỏi mảng.
- {{jsxref("Array.prototype.toLocaleString()")}}
  - : Trả về chuỗi đã bản địa hóa biểu diễn mảng gọi và các phần tử của nó. Ghi đè phương thức {{jsxref("Object.prototype.toLocaleString()")}}.
- {{jsxref("Array.prototype.toReversed()")}}
  - : Trả về một mảng mới với các phần tử theo thứ tự ngược lại, mà không thay đổi mảng gốc.
- {{jsxref("Array.prototype.toSorted()")}}
  - : Trả về một mảng mới với các phần tử được sắp xếp theo thứ tự tăng dần, mà không thay đổi mảng gốc.
- {{jsxref("Array.prototype.toSpliced()")}}
  - : Trả về một mảng mới với một số phần tử được xóa và/hoặc thay thế tại chỉ số cho trước, mà không thay đổi mảng gốc.
- {{jsxref("Array.prototype.toString()")}}
  - : Trả về chuỗi biểu diễn mảng gọi và các phần tử của nó. Ghi đè phương thức {{jsxref("Object.prototype.toString()")}}.
- {{jsxref("Array.prototype.unshift()")}}
  - : Thêm một hoặc nhiều phần tử vào đầu mảng và trả về `length` mới của mảng.
- {{jsxref("Array.prototype.values()")}}
  - : Trả về một đối tượng [_array iterator_](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) mới chứa các giá trị cho mỗi chỉ số trong mảng.
- {{jsxref("Array.prototype.with()")}}
  - : Trả về một mảng mới với phần tử tại chỉ số cho trước được thay thế bằng giá trị cho trước, mà không thay đổi mảng gốc.
- [`Array.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator)
  - : Mặc định là bí danh của phương thức [`values()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/values).

## Examples

Phần này cung cấp một số ví dụ về các thao tác mảng phổ biến trong JavaScript.

> [!NOTE]
> Nếu bạn chưa quen với kiến thức cơ bản về mảng, hãy xem trước [JavaScript First Steps: Arrays](/en-US/docs/Learn_web_development/Core/Scripting/Arrays), trong đó [giải thích mảng là gì](/en-US/docs/Learn_web_development/Core/Scripting/Arrays#what_is_an_array), và bao gồm các ví dụ khác về các thao tác mảng phổ biến.

### Tạo mảng

Ví dụ này trình bày ba cách tạo mảng mới: đầu tiên dùng [ký hiệu array literal](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Array#array_literal_notation), sau đó dùng constructor [`Array()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Array), và cuối cùng dùng [`String.prototype.split()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) để xây dựng mảng từ chuỗi.

```js
// 'fruits' array created using array literal notation.
const fruits = ["Apple", "Banana"];
console.log(fruits.length);
// 2

// 'fruits2' array created using the Array() constructor.
const fruits2 = new Array("Apple", "Banana");
console.log(fruits2.length);
// 2

// 'fruits3' array created using String.prototype.split().
const fruits3 = "Apple, Banana".split(", ");
console.log(fruits3.length);
// 2
```

### Tạo chuỗi từ mảng

Ví dụ này dùng phương thức [`join()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join) để tạo chuỗi từ mảng `fruits`.

```js
const fruits = ["Apple", "Banana"];
const fruitsString = fruits.join(", ");
console.log(fruitsString);
// "Apple, Banana"
```

### Truy cập phần tử mảng theo chỉ số

Ví dụ này trình bày cách truy cập các phần tử trong mảng `fruits` bằng cách chỉ định số chỉ số vị trí của chúng trong mảng.

```js
const fruits = ["Apple", "Banana"];

// The index of an array's first element is always 0.
fruits[0]; // Apple

// The index of an array's second element is always 1.
fruits[1]; // Banana

// The index of an array's last element is always one
// less than the length of the array.
fruits[fruits.length - 1]; // Banana

// Using an index number larger than the array's length
// returns 'undefined'.
fruits[99]; // undefined
```

### Tìm chỉ số của một phần tử trong mảng

Ví dụ này dùng phương thức [`indexOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) để tìm vị trí (chỉ số) của chuỗi `"Banana"` trong mảng `fruits`.

```js
const fruits = ["Apple", "Banana"];
console.log(fruits.indexOf("Banana"));
// 1
```

### Kiểm tra xem mảng có chứa phần tử nhất định không

Ví dụ này trình bày hai cách kiểm tra xem mảng `fruits` có chứa `"Banana"` và `"Cherry"` hay không: đầu tiên dùng phương thức [`includes()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes), rồi dùng phương thức [`indexOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) để kiểm tra giá trị chỉ số khác `-1`.

```js
const fruits = ["Apple", "Banana"];

fruits.includes("Banana"); // true
fruits.includes("Cherry"); // false

// If indexOf() doesn't return -1, the array contains the given item.
fruits.indexOf("Banana") !== -1; // true
fruits.indexOf("Cherry") !== -1; // false
```

### Thêm phần tử vào cuối mảng

Ví dụ này dùng phương thức [`push()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) để thêm một chuỗi mới vào mảng `fruits`.

```js
const fruits = ["Apple", "Banana"];
const newLength = fruits.push("Orange");
console.log(fruits);
// ["Apple", "Banana", "Orange"]
console.log(newLength);
// 3
```

### Xóa phần tử cuối khỏi mảng

Ví dụ này dùng phương thức [`pop()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/pop) để xóa phần tử cuối cùng khỏi mảng `fruits`.

```js
const fruits = ["Apple", "Banana", "Orange"];
const removedItem = fruits.pop();
console.log(fruits);
// ["Apple", "Banana"]
console.log(removedItem);
// Orange
```

> [!NOTE]
> `pop()` chỉ có thể dùng để xóa phần tử cuối cùng khỏi mảng. Để xóa nhiều phần tử từ cuối mảng, xem ví dụ tiếp theo.

### Xóa nhiều phần tử từ cuối mảng

Ví dụ này dùng phương thức [`splice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice) để xóa 3 phần tử cuối khỏi mảng `fruits`.

```js
const fruits = ["Apple", "Banana", "Strawberry", "Mango", "Cherry"];
const start = -3;
const removedItems = fruits.splice(start);
console.log(fruits);
// ["Apple", "Banana"]
console.log(removedItems);
// ["Strawberry", "Mango", "Cherry"]
```

### Cắt ngắn mảng xuống còn N phần tử đầu tiên

Ví dụ này dùng phương thức [`splice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice) để cắt ngắn mảng `fruits` xuống còn chỉ 2 phần tử đầu tiên.

```js
const fruits = ["Apple", "Banana", "Strawberry", "Mango", "Cherry"];
const start = 2;
const removedItems = fruits.splice(start);
console.log(fruits);
// ["Apple", "Banana"]
console.log(removedItems);
// ["Strawberry", "Mango", "Cherry"]
```

### Xóa phần tử đầu tiên khỏi mảng

Ví dụ này dùng phương thức [`shift()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift) để xóa phần tử đầu tiên khỏi mảng `fruits`.

```js
const fruits = ["Apple", "Banana"];
const removedItem = fruits.shift();
console.log(fruits);
// ["Banana"]
console.log(removedItem);
// Apple
```

> [!NOTE]
> `shift()` chỉ có thể dùng để xóa phần tử đầu tiên khỏi mảng. Để xóa nhiều phần tử từ đầu mảng, xem ví dụ tiếp theo.

### Xóa nhiều phần tử từ đầu mảng

Ví dụ này dùng phương thức [`splice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice) để xóa 3 phần tử đầu tiên khỏi mảng `fruits`.

```js
const fruits = ["Apple", "Strawberry", "Cherry", "Banana", "Mango"];
const start = 0;
const deleteCount = 3;
const removedItems = fruits.splice(start, deleteCount);
console.log(fruits);
// ["Banana", "Mango"]
console.log(removedItems);
// ["Apple", "Strawberry", "Cherry"]
```

### Thêm phần tử mới vào đầu mảng

Ví dụ này dùng phương thức [`unshift()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift) để thêm, tại chỉ số `0`, một phần tử mới vào mảng `fruits` — biến nó thành phần tử đầu tiên mới của mảng.

```js
const fruits = ["Banana", "Mango"];
const newLength = fruits.unshift("Strawberry");
console.log(fruits);
// ["Strawberry", "Banana", "Mango"]
console.log(newLength);
// 3
```

### Xóa một phần tử theo chỉ số

Ví dụ này dùng phương thức [`splice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice) để xóa chuỗi `"Banana"` khỏi mảng `fruits` — bằng cách chỉ định vị trí chỉ số của `"Banana"`.

```js
const fruits = ["Strawberry", "Banana", "Mango"];
const start = fruits.indexOf("Banana");
const deleteCount = 1;
const removedItems = fruits.splice(start, deleteCount);
console.log(fruits);
// ["Strawberry", "Mango"]
console.log(removedItems);
// ["Banana"]
```

### Xóa nhiều phần tử theo chỉ số

Ví dụ này dùng phương thức [`splice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice) để xóa các chuỗi `"Banana"` và `"Strawberry"` khỏi mảng `fruits` — bằng cách chỉ định vị trí chỉ số của `"Banana"` cùng với số lượng phần tử cần xóa.

```js
const fruits = ["Apple", "Banana", "Strawberry", "Mango"];
const start = 1;
const deleteCount = 2;
const removedItems = fruits.splice(start, deleteCount);
console.log(fruits);
// ["Apple", "Mango"]
console.log(removedItems);
// ["Banana", "Strawberry"]
```

### Thay thế nhiều phần tử trong mảng

Ví dụ này dùng phương thức [`splice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice) để thay thế 2 phần tử cuối trong mảng `fruits` bằng các phần tử mới.

```js
const fruits = ["Apple", "Banana", "Strawberry"];
const start = -2;
const deleteCount = 2;
const removedItems = fruits.splice(start, deleteCount, "Mango", "Cherry");
console.log(fruits);
// ["Apple", "Mango", "Cherry"]
console.log(removedItems);
// ["Banana", "Strawberry"]
```

### Lặp qua mảng

Ví dụ này dùng vòng lặp [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) để lặp qua mảng `fruits`, ghi từng phần tử ra console.

```js
const fruits = ["Apple", "Mango", "Cherry"];
for (const fruit of fruits) {
  console.log(fruit);
}
// Apple
// Mango
// Cherry
```

Nhưng `for...of` chỉ là một trong nhiều cách để lặp qua mảng; để biết thêm các cách khác, xem [Loops and iteration](/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration), và xem tài liệu về các phương thức [`every()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every), [`filter()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter), [`flatMap()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flatMap), [`map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map), [`reduce()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce) và [`reduceRight()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduceRight) — và xem ví dụ tiếp theo sử dụng phương thức [`forEach()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach).

### Gọi hàm trên mỗi phần tử trong mảng

Ví dụ này dùng phương thức [`forEach()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) để gọi một hàm trên mỗi phần tử trong mảng `fruits`; hàm này ghi mỗi phần tử cùng với số chỉ số của nó ra console.

```js
const fruits = ["Apple", "Mango", "Cherry"];
fruits.forEach((item, index, array) => {
  console.log(item, index);
});
// Apple 0
// Mango 1
// Cherry 2
```

### Gộp nhiều mảng lại với nhau

Ví dụ này dùng phương thức [`concat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat) để gộp mảng `fruits` với mảng `moreFruits`, tạo ra mảng `combinedFruits` mới. Lưu ý rằng `fruits` và `moreFruits` không bị thay đổi.

```js
const fruits = ["Apple", "Banana", "Strawberry"];
const moreFruits = ["Mango", "Cherry"];
const combinedFruits = fruits.concat(moreFruits);
console.log(combinedFruits);
// ["Apple", "Banana", "Strawberry", "Mango", "Cherry"]

// The 'fruits' array remains unchanged.
console.log(fruits);
// ["Apple", "Banana", "Strawberry"]

// The 'moreFruits' array also remains unchanged.
console.log(moreFruits);
// ["Mango", "Cherry"]
```

### Sao chép mảng

Ví dụ này trình bày ba cách tạo mảng mới từ mảng `fruits` hiện có: đầu tiên dùng [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax), rồi dùng phương thức [`from()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from), và cuối cùng dùng phương thức [`slice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice).

```js
const fruits = ["Strawberry", "Mango"];

// Create a copy using spread syntax.
const fruitsCopy = [...fruits];
// ["Strawberry", "Mango"]

// Create a copy using the from() method.
const fruitsCopy2 = Array.from(fruits);
// ["Strawberry", "Mango"]

// Create a copy using the slice() method.
const fruitsCopy3 = fruits.slice();
// ["Strawberry", "Mango"]
```

Tất cả các thao tác sao chép mảng tích hợp ([cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax), [`Array.from()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from), [`Array.prototype.slice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) và [`Array.prototype.concat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat)) đều tạo ra [bản sao nông](/en-US/docs/Glossary/Shallow_copy). Nếu bạn muốn [bản sao sâu](/en-US/docs/Glossary/Deep_copy) của mảng, bạn có thể dùng {{jsxref("JSON.stringify()")}} để chuyển mảng thành chuỗi JSON, rồi {{jsxref("JSON.parse()")}} để chuyển chuỗi trở lại thành mảng mới hoàn toàn độc lập với mảng gốc.

```js
const fruitsDeepCopy = JSON.parse(JSON.stringify(fruits));
```

Bạn cũng có thể tạo bản sao sâu bằng phương thức {{DOMxRef("Window.structuredClone", "structuredClone()")}}, có ưu điểm là cho phép [các đối tượng có thể chuyển giao (transferable objects)](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) trong nguồn được _chuyển_ sang bản sao mới, thay vì chỉ nhân bản.

Cuối cùng, điều quan trọng cần hiểu là việc gán một mảng hiện có cho một biến mới không tạo ra bản sao của mảng hay các phần tử của nó. Thay vào đó, biến mới chỉ là một tham chiếu, hay bí danh, cho mảng gốc; nghĩa là tên của mảng gốc và tên biến mới chỉ là hai tên cho cùng một đối tượng (và do đó luôn được đánh giá là [tương đương nghiêm ngặt](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#strict_equality_using)). Do đó, nếu bạn thực hiện bất kỳ thay đổi nào với giá trị của mảng gốc hoặc với giá trị của biến mới, thì cái kia cũng sẽ thay đổi:

```js
const fruits = ["Strawberry", "Mango"];
const fruitsAlias = fruits;
// 'fruits' and 'fruitsAlias' are the same object, strictly equivalent.
fruits === fruitsAlias; // true
// Any changes to the 'fruits' array change 'fruitsAlias' too.
fruits.unshift("Apple", "Banana");
console.log(fruits);
// ['Apple', 'Banana', 'Strawberry', 'Mango']
console.log(fruitsAlias);
// ['Apple', 'Banana', 'Strawberry', 'Mango']
```

### Tạo mảng hai chiều

Ví dụ sau tạo một bàn cờ dưới dạng mảng hai chiều gồm các chuỗi. Nước đi đầu tiên được thực hiện bằng cách sao chép `'p'` tại `board[6][4]` sang `board[4][4]`. Vị trí cũ tại `[6][4]` được đặt thành trống.

```js
const board = [
  ["R", "N", "B", "Q", "K", "B", "N", "R"],
  ["P", "P", "P", "P", "P", "P", "P", "P"],
  [" ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " "],
  ["p", "p", "p", "p", "p", "p", "p", "p"],
  ["r", "n", "b", "q", "k", "b", "n", "r"],
];

console.log(`${board.join("\n")}\n\n`);

// Move King's Pawn forward 2
board[4][4] = board[6][4];
board[6][4] = " ";
console.log(board.join("\n"));
```

Đây là kết quả:

```plain
R,N,B,Q,K,B,N,R
P,P,P,P,P,P,P,P
 , , , , , , ,
 , , , , , , ,
 , , , , , , ,
 , , , , , , ,
p,p,p,p,p,p,p,p
r,n,b,q,k,b,n,r

R,N,B,Q,K,B,N,R
P,P,P,P,P,P,P,P
 , , , , , , ,
 , , , , , , ,
 , , , ,p, , ,
 , , , , , , ,
p,p,p,p, ,p,p,p
r,n,b,q,k,b,n,r
```

### Dùng mảng để lập bảng tập hợp giá trị

```js
const values = [];
for (let x = 0; x < 10; x++) {
  values.push([2 ** x, 2 * x ** 2]);
}
console.table(values);
```

Kết quả là

```plain
// The first column is the index
0  1    0
1  2    2
2  4    8
3  8    18
4  16   32
5  32   50
6  64   72
7  128  98
8  256  128
9  512  162
```

### Tạo mảng từ kết quả của một lần khớp

Kết quả của một lần khớp giữa {{jsxref("RegExp")}} và một chuỗi có thể tạo ra một mảng JavaScript có các thuộc tính và phần tử cung cấp thông tin về lần khớp. Mảng như vậy được trả về bởi {{jsxref("RegExp.prototype.exec()")}} và {{jsxref("String.prototype.match()")}}.

Ví dụ:

```js
// Match one d followed by one or more b's followed by one d
// Remember matched b's and the following d
// Ignore case

const myRe = /d(b+)(d)/i;
const execResult = myRe.exec("cdbBdbsbz");

console.log(execResult.input); // 'cdbBdbsbz'
console.log(execResult.index); // 1
console.log(execResult); // [ "dbBd", "bB", "d" ]
```

Để biết thêm thông tin về kết quả của lần khớp, xem các trang {{jsxref("RegExp.prototype.exec()")}} và {{jsxref("String.prototype.match()")}}.

### Biến đổi mảng ban đầu trong phương thức lặp

[Các phương thức lặp](#iterative_methods) không biến đổi mảng được gọi trên đó, nhưng hàm được cung cấp dưới dạng `callbackFn` thì có thể. Nguyên tắc quan trọng cần nhớ là chỉ các chỉ số từ 0 đến `arrayLength - 1` mới được duyệt, trong đó `arrayLength` là độ dài của mảng tại thời điểm phương thức mảng được gọi lần đầu tiên, nhưng phần tử được truyền vào callback là giá trị tại thời điểm chỉ số đó được duyệt. Do đó:

- `callbackFn` sẽ không duyệt bất kỳ phần tử nào được thêm vào vượt quá độ dài ban đầu của mảng khi lệnh gọi phương thức lặp bắt đầu.
- Các thay đổi đối với chỉ số đã duyệt không làm cho `callbackFn` được gọi lại trên chúng.
- Nếu một phần tử hiện có, chưa được duyệt của mảng bị thay đổi bởi `callbackFn`, giá trị được truyền cho `callbackFn` sẽ là giá trị tại thời điểm phần tử đó được duyệt. Các phần tử đã bị xóa sẽ không được duyệt.

> [!WARNING]
> Các thay đổi đồng thời kiểu như mô tả ở trên thường dẫn đến code khó hiểu và nói chung nên tránh (trừ các trường hợp đặc biệt).

Các ví dụ sau dùng phương thức `forEach` làm ví dụ, nhưng các phương thức khác duyệt chỉ số theo thứ tự tăng dần cũng hoạt động theo cùng cách. Chúng ta sẽ định nghĩa một hàm helper trước:

```js
function testSideEffect(effect) {
  const arr = ["e1", "e2", "e3", "e4"];
  arr.forEach((elem, index, arr) => {
    console.log(`array: [${arr.join(", ")}], index: ${index}, elem: ${elem}`);
    effect(arr, index);
  });
  console.log(`Final array: [${arr.join(", ")}]`);
}
```

Các thay đổi đối với chỉ số chưa được duyệt sẽ hiển thị khi chỉ số đó được đến:

```js
testSideEffect((arr, index) => {
  if (index + 1 < arr.length) arr[index + 1] += "*";
});
// array: [e1, e2, e3, e4], index: 0, elem: e1
// array: [e1, e2*, e3, e4], index: 1, elem: e2*
// array: [e1, e2*, e3*, e4], index: 2, elem: e3*
// array: [e1, e2*, e3*, e4*], index: 3, elem: e4*
// Final array: [e1, e2*, e3*, e4*]
```

Thay đổi đối với chỉ số đã duyệt không thay đổi hành vi lặp, mặc dù mảng sẽ khác sau đó:

```js
testSideEffect((arr, index) => {
  if (index > 0) arr[index - 1] += "*";
});
// array: [e1, e2, e3, e4], index: 0, elem: e1
// array: [e1, e2, e3, e4], index: 1, elem: e2
// array: [e1*, e2, e3, e4], index: 2, elem: e3
// array: [e1*, e2*, e3, e4], index: 3, elem: e4
// Final array: [e1*, e2*, e3*, e4]
```

Chèn _n_ phần tử tại các chỉ số chưa được duyệt nhỏ hơn độ dài mảng ban đầu sẽ làm cho chúng được duyệt. _n_ phần tử cuối trong mảng gốc có chỉ số lớn hơn độ dài mảng ban đầu sẽ không được duyệt:

```js
testSideEffect((arr, index) => {
  if (index === 1) arr.splice(2, 0, "new");
});
// array: [e1, e2, e3, e4], index: 0, elem: e1
// array: [e1, e2, e3, e4], index: 1, elem: e2
// array: [e1, e2, new, e3, e4], index: 2, elem: new
// array: [e1, e2, new, e3, e4], index: 3, elem: e3
// Final array: [e1, e2, new, e3, e4]
// e4 is not visited because it now has index 4
```

Chèn _n_ phần tử có chỉ số lớn hơn độ dài mảng ban đầu sẽ không làm cho chúng được duyệt:

```js
testSideEffect((arr) => arr.push("new"));
// array: [e1, e2, e3, e4], index: 0, elem: e1
// array: [e1, e2, e3, e4, new], index: 1, elem: e2
// array: [e1, e2, e3, e4, new, new], index: 2, elem: e3
// array: [e1, e2, e3, e4, new, new, new], index: 3, elem: e4
// Final array: [e1, e2, e3, e4, new, new, new, new]
```

Chèn _n_ phần tử tại các chỉ số đã được duyệt sẽ không làm cho chúng được duyệt, nhưng nó dịch chuyển các phần tử còn lại lùi _n_ vị trí, vì vậy chỉ số hiện tại và _n - 1_ phần tử trước nó sẽ được duyệt lại:

```js
testSideEffect((arr, index) => arr.splice(index, 0, "new"));
// array: [e1, e2, e3, e4], index: 0, elem: e1
// array: [new, e1, e2, e3, e4], index: 1, elem: e1
// array: [new, new, e1, e2, e3, e4], index: 2, elem: e1
// array: [new, new, new, e1, e2, e3, e4], index: 3, elem: e1
// Final array: [new, new, new, new, e1, e2, e3, e4]
// e1 keeps getting visited because it keeps getting shifted back
```

Xóa _n_ phần tử tại các chỉ số chưa được duyệt sẽ làm cho chúng không còn được duyệt. Vì mảng đã co lại, _n_ lần lặp cuối sẽ duyệt các chỉ số ngoài giới hạn. Nếu phương thức bỏ qua các chỉ số không tồn tại (xem [phương thức mảng và slot rỗng](#array_methods_and_empty_slots)), _n_ lần lặp cuối sẽ bị bỏ qua; ngược lại, chúng sẽ nhận `undefined`:

```js
testSideEffect((arr, index) => {
  if (index === 1) arr.splice(2, 1);
});
// array: [e1, e2, e3, e4], index: 0, elem: e1
// array: [e1, e2, e3, e4], index: 1, elem: e2
// array: [e1, e2, e4], index: 2, elem: e4
// Final array: [e1, e2, e4]
// Does not visit index 3 because it's out-of-bounds

// Compare this with find(), which treats nonexistent indexes as undefined:
const arr2 = ["e1", "e2", "e3", "e4"];
arr2.find((elem, index, arr) => {
  console.log(`array: [${arr.join(", ")}], index: ${index}, elem: ${elem}`);
  if (index === 1) arr.splice(2, 1);
  return false;
});
// array: [e1, e2, e3, e4], index: 0, elem: e1
// array: [e1, e2, e3, e4], index: 1, elem: e2
// array: [e1, e2, e4], index: 2, elem: e4
// array: [e1, e2, e4], index: 3, elem: undefined
```

Xóa _n_ phần tử tại các chỉ số đã được duyệt không thay đổi việc chúng đã được duyệt trước khi bị xóa. Vì mảng đã co lại, _n_ phần tử tiếp theo sau chỉ số hiện tại sẽ bị bỏ qua. Nếu phương thức bỏ qua các chỉ số không tồn tại, _n_ lần lặp cuối sẽ bị bỏ qua; ngược lại, chúng sẽ nhận `undefined`:

```js
testSideEffect((arr, index) => arr.splice(index, 1));
// array: [e1, e2, e3, e4], index: 0, elem: e1
// Does not visit e2 because e2 now has index 0, which has already been visited
// array: [e2, e3, e4], index: 1, elem: e3
// Does not visit e4 because e4 now has index 1, which has already been visited
// Final array: [e2, e4]
// Index 2 is out-of-bounds, so it's not visited

// Compare this with find(), which treats nonexistent indexes as undefined:
const arr2 = ["e1", "e2", "e3", "e4"];
arr2.find((elem, index, arr) => {
  console.log(`array: [${arr.join(", ")}], index: ${index}, elem: ${elem}`);
  arr.splice(index, 1);
  return false;
});
// array: [e1, e2, e3, e4], index: 0, elem: e1
// array: [e2, e3, e4], index: 1, elem: e3
// array: [e2, e4], index: 2, elem: undefined
// array: [e2, e4], index: 3, elem: undefined
```

Với các phương thức lặp theo thứ tự chỉ số giảm dần, việc chèn khiến các phần tử bị bỏ qua, và xóa khiến các phần tử được duyệt nhiều lần. Tự điều chỉnh code ở trên để xem các ảnh hưởng.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
