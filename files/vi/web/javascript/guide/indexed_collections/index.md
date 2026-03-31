---
title: Indexed collections
slug: Web/JavaScript/Guide/Indexed_collections
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Regular_expressions", "Web/JavaScript/Guide/Keyed_collections")}}

Chương này giới thiệu các tập hợp dữ liệu được sắp xếp theo chỉ số (index). Bao gồm mảng (array) và các cấu trúc tương tự mảng như đối tượng {{jsxref("Array")}} và đối tượng {{jsxref("TypedArray")}}.

Một _mảng_ là danh sách các giá trị có thứ tự mà bạn tham chiếu bằng tên và chỉ số.

Ví dụ, hãy xét một mảng tên là `emp`, chứa tên nhân viên được lập chỉ số theo số hiệu nhân viên. Như vậy `emp[0]` là nhân viên số không, `emp[1]` là nhân viên số một, v.v.

JavaScript không có kiểu dữ liệu mảng tường minh. Tuy nhiên, bạn có thể dùng đối tượng `Array` được xây dựng sẵn cùng các phương thức của nó để làm việc với mảng trong ứng dụng. Đối tượng `Array` có các phương thức thao tác mảng theo nhiều cách khác nhau, chẳng hạn như nối, đảo ngược và sắp xếp. Nó có thuộc tính xác định độ dài mảng và các thuộc tính khác dùng với biểu thức chính quy.

Bài viết này tập trung vào mảng thông thường, nhưng nhiều khái niệm tương tự cũng áp dụng cho typed array vì cả hai chia sẻ nhiều phương thức giống nhau. Để biết thêm thông tin về typed array, xem [hướng dẫn typed array](/en-US/docs/Web/JavaScript/Guide/Typed_arrays).

## Tạo mảng

Các câu lệnh sau tạo ra các mảng tương đương nhau:

```js
const arr1 = new Array(element0, element1, /* …, */ elementN);
const arr2 = Array(element0, element1, /* …, */ elementN);
const arr3 = [element0, element1, /* …, */ elementN];
```

`element0, element1, …, elementN` là danh sách các giá trị cho các phần tử của mảng. Khi các giá trị này được chỉ định, mảng được khởi tạo với chúng làm các phần tử. Thuộc tính `length` của mảng được đặt bằng số lượng đối số.

Cú pháp dấu ngoặc vuông được gọi là "array literal" hay "array initializer". Nó ngắn gọn hơn các cách tạo mảng khác và thường được ưa dùng hơn. Xem [Array literals](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#array_literals) để biết thêm chi tiết.

Để tạo mảng có độ dài khác không nhưng không có phần tử nào, bạn có thể dùng một trong các cách sau:

```js
// This...
const arr1 = new Array(arrayLength);

// … results in the same array as this
const arr2 = Array(arrayLength);

// This has exactly the same effect
const arr3 = [];
arr3.length = arrayLength;
```

> [!NOTE]
> Trong đoạn code trên, `arrayLength` phải là kiểu `Number`. Nếu không, một mảng có một phần tử duy nhất (giá trị đã truyền vào) sẽ được tạo. Gọi `arr.length` sẽ trả về `arrayLength`, nhưng mảng không chứa phần tử nào thực sự. Vòng lặp {{jsxref("Statements/for...in", "for...in")}} sẽ không tìm thấy thuộc tính nào trên mảng này.

Ngoài biến mới được định nghĩa như trên, mảng cũng có thể được gán làm thuộc tính của đối tượng mới hoặc đối tượng hiện có:

```js
const obj = {};
// …
obj.prop = [element0, element1, /* …, */ elementN];

// OR
const obj = { prop: [element0, element1, /* …, */ elementN] };
```

Nếu bạn muốn khởi tạo mảng với một phần tử duy nhất và phần tử đó là kiểu `Number`, bạn phải dùng cú pháp dấu ngoặc vuông. Khi một giá trị `Number` đơn lẻ được truyền vào hàm tạo `Array()`, nó được hiểu là `arrayLength` chứ không phải phần tử đơn lẻ.

Đoạn code này tạo mảng chỉ có một phần tử: số 42.

```js
const arr = [42];
```

Đoạn code này tạo mảng không có phần tử nào và `arr.length` được đặt thành 42.

```js
const arr = Array(42);
```

Điều này tương đương với:

```js
const arr = [];
arr.length = 42;
```

Gọi `Array(N)` sẽ gây ra `RangeError` nếu `N` là số không nguyên có phần thập phân khác không. Ví dụ sau minh họa hành vi này.

```js
const arr = Array(9.3); // RangeError: Invalid array length
```

Nếu code của bạn cần tạo mảng với phần tử đơn lẻ thuộc kiểu dữ liệu tùy ý, nên dùng array literal. Hoặc tạo mảng rỗng trước rồi thêm phần tử đơn vào sau.

Bạn cũng có thể dùng phương thức tĩnh {{jsxref("Array.of")}} để tạo mảng với phần tử đơn lẻ.

```js
const arr = Array.of(9.3); // arr contains only one element 9.3
```

## Tham chiếu đến phần tử mảng

Vì các phần tử cũng là thuộc tính, bạn có thể truy cập chúng bằng [property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors). Giả sử bạn định nghĩa mảng sau:

```js
const myArray = ["Wind", "Rain", "Fire"];
```

Bạn có thể tham chiếu đến phần tử đầu tiên của mảng là `myArray[0]`, phần tử thứ hai là `myArray[1]`, v.v. Chỉ số của các phần tử bắt đầu từ không.

> [!NOTE]
> Bạn cũng có thể dùng [property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) để truy cập các thuộc tính khác của mảng, giống như với đối tượng.
>
> ```js
> const arr = ["one", "two", "three"];
> arr[2]; // three
> arr["length"]; // 3
> ```

## Điền vào mảng

Bạn có thể điền vào mảng bằng cách gán giá trị cho các phần tử. Ví dụ:

```js
const emp = [];
emp[0] = "Casey Jones";
emp[1] = "Phil Lesh";
emp[2] = "August West";
```

> [!NOTE]
> Nếu bạn cung cấp giá trị không phải số nguyên cho toán tử mảng trong code trên, một thuộc tính sẽ được tạo trong đối tượng đại diện cho mảng, thay vì một phần tử mảng.
>
> ```js
> const arr = [];
> arr[3.4] = "Oranges";
> console.log(arr.length); // 0
> console.log(Object.hasOwn(arr, 3.4)); // true
> ```

Bạn cũng có thể điền vào mảng khi tạo nó:

```js
const myArray = new Array("Hello", myVar, 3.14159);
// OR
const myArray = ["Mango", "Apple", "Orange"];
```

### Hiểu về length

Ở mức triển khai, các mảng JavaScript thực sự lưu trữ phần tử của chúng dưới dạng thuộc tính đối tượng chuẩn, sử dụng chỉ số mảng làm tên thuộc tính.

Thuộc tính `length` là đặc biệt. Giá trị của nó luôn là số nguyên dương lớn hơn chỉ số của phần tử cuối cùng nếu tồn tại. (Trong ví dụ dưới, `'Dusty'` có chỉ số là `30`, nên `cats.length` trả về `30 + 1`).

Hãy nhớ rằng, chỉ số mảng JavaScript bắt đầu từ 0: chúng bắt đầu từ `0`, không phải `1`. Điều này có nghĩa là thuộc tính `length` sẽ lớn hơn một so với chỉ số cao nhất được lưu trong mảng:

```js
const cats = [];
cats[30] = ["Dusty"];
console.log(cats.length); // 31
```

Bạn cũng có thể gán giá trị cho thuộc tính `length`.

Ghi một giá trị nhỏ hơn số phần tử hiện có sẽ cắt bớt mảng. Ghi `0` sẽ làm trống hoàn toàn:

```js
const cats = ["Dusty", "Misty", "Twiggy"];
console.log(cats.length); // 3

cats.length = 2;
console.log(cats); // [ 'Dusty', 'Misty' ] - Twiggy has been removed

cats.length = 0;
console.log(cats); // []; the cats array is empty

cats.length = 3;
console.log(cats); // [ <3 empty items> ]
```

### Duyệt qua mảng

Một thao tác phổ biến là duyệt qua các giá trị của mảng, xử lý từng giá trị theo một cách nào đó, như sau:

```js
const colors = ["red", "green", "blue"];
for (let i = 0; i < colors.length; i++) {
  console.log(colors[i]);
}
```

Nếu bạn biết rằng không có phần tử nào trong mảng được đánh giá là `false` trong ngữ cảnh boolean — ví dụ, mảng chỉ gồm các node [DOM](/en-US/docs/Web/API/Document_Object_Model) — bạn có thể dùng một idiom hiệu quả hơn:

```js
const divs = document.getElementsByTagName("div");
for (let i = 0, div; (div = divs[i]); i++) {
  /* Process div in some way */
}
```

Cách này tránh được chi phí kiểm tra độ dài mảng và đảm bảo biến `div` được gán lại phần tử hiện tại mỗi lần lặp cho tiện lợi hơn.

Phương thức [`forEach()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) cung cấp một cách khác để duyệt qua mảng:

```js
const colors = ["red", "green", "blue"];
colors.forEach((color) => console.log(color));
// red
// green
// blue
```

Hàm truyền vào `forEach` được thực thi một lần cho mỗi phần tử trong mảng, với phần tử mảng được truyền làm đối số. Các giá trị chưa được gán không được duyệt trong vòng lặp `forEach`.

Lưu ý rằng các phần tử của mảng bị bỏ qua khi mảng được định nghĩa sẽ không được liệt kê khi duyệt bằng `forEach`, nhưng _sẽ_ được liệt kê khi `undefined` được gán thủ công cho phần tử đó:

```js
const sparseArray = ["first", "second", , "fourth"];

sparseArray.forEach((element) => {
  console.log(element);
});
// Logs:
// first
// second
// fourth

if (sparseArray[2] === undefined) {
  console.log("sparseArray[2] is undefined"); // true
}

const nonsparseArray = ["first", "second", undefined, "fourth"];

nonsparseArray.forEach((element) => {
  console.log(element);
});
// Logs:
// first
// second
// undefined
// fourth
```

Vì các phần tử mảng JavaScript được lưu dưới dạng thuộc tính đối tượng chuẩn, không nên duyệt mảng JavaScript bằng vòng lặp {{jsxref("Statements/for...in", "for...in")}}, vì cả phần tử bình thường lẫn tất cả thuộc tính enumerable đều sẽ được liệt kê.

### Các phương thức mảng

Đối tượng {{jsxref("Array")}} có các phương thức sau:

Phương thức [`concat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat) nối hai hoặc nhiều mảng và trả về mảng mới.

```js
let myArray = ["1", "2", "3"];
myArray = myArray.concat("a", "b", "c");
// myArray is now ["1", "2", "3", "a", "b", "c"]
```

Phương thức [`join()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join) nối tất cả phần tử của mảng thành một chuỗi.

```js
const myArray = ["Wind", "Rain", "Fire"];
const list = myArray.join(" - "); // list is "Wind - Rain - Fire"
```

Phương thức [`push()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) thêm một hoặc nhiều phần tử vào cuối mảng và trả về `length` mới của mảng.

```js
const myArray = ["1", "2"];
myArray.push("3"); // myArray is now ["1", "2", "3"]
```

Phương thức [`pop()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/pop) xóa phần tử cuối cùng khỏi mảng và trả về phần tử đó.

```js
const myArray = ["1", "2", "3"];
const last = myArray.pop();
// myArray is now ["1", "2"], last = "3"
```

Phương thức [`shift()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift) xóa phần tử đầu tiên khỏi mảng và trả về phần tử đó.

```js
const myArray = ["1", "2", "3"];
const first = myArray.shift();
// myArray is now ["2", "3"], first is "1"
```

Phương thức [`unshift()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift) thêm một hoặc nhiều phần tử vào đầu mảng và trả về độ dài mới của mảng.

```js
const myArray = ["1", "2", "3"];
myArray.unshift("4", "5");
// myArray becomes ["4", "5", "1", "2", "3"]
```

Phương thức [`slice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) trích xuất một phần của mảng và trả về mảng mới.

```js
let myArray = ["a", "b", "c", "d", "e"];
myArray = myArray.slice(1, 4); // [ "b", "c", "d"]
// starts at index 1 and extracts all elements
// until index 3
```

Phương thức [`at()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/at) trả về phần tử tại chỉ số đã chỉ định trong mảng, hoặc `undefined` nếu chỉ số nằm ngoài phạm vi. Phương thức này đặc biệt hữu ích với chỉ số âm để truy cập phần tử từ cuối mảng.

```js
const myArray = ["a", "b", "c", "d", "e"];
myArray.at(-2); // "d", the second-last element of myArray
```

Phương thức [`splice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice) xóa các phần tử khỏi mảng và (tùy chọn) thay thế chúng. Nó trả về các phần tử đã bị xóa.

```js
const myArray = ["1", "2", "3", "4", "5"];
myArray.splice(1, 3, "a", "b", "c", "d");
// myArray is now ["1", "a", "b", "c", "d", "5"]
// This code started at index one (or where the "2" was),
// removed 3 elements there, and then inserted all consecutive
// elements in its place.
```

Phương thức [`reverse()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse) đảo ngược các phần tử của mảng tại chỗ: phần tử đầu tiên trở thành cuối cùng và ngược lại. Nó trả về tham chiếu đến mảng.

```js
const myArray = ["1", "2", "3"];
myArray.reverse();
// transposes the array so that myArray = ["3", "2", "1"]
```

Phương thức [`flat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flat) trả về mảng mới với tất cả các phần tử con mảng được nối vào đệ quy tới độ sâu đã chỉ định.

```js
let myArray = [1, 2, [3, 4]];
myArray = myArray.flat();
// myArray is now [1, 2, 3, 4], since the [3, 4] subarray is flattened
```

Phương thức [`sort()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort) sắp xếp các phần tử của mảng tại chỗ và trả về tham chiếu đến mảng.

```js
const myArray = ["Wind", "Rain", "Fire"];
myArray.sort();
// sorts the array so that myArray = ["Fire", "Rain", "Wind"]
```

`sort()` cũng có thể nhận một hàm callback để xác định cách so sánh các phần tử mảng. Hàm callback được gọi với hai đối số là hai giá trị từ mảng. Hàm so sánh hai giá trị này và trả về số dương, số âm hoặc không, biểu thị thứ tự của hai giá trị. Ví dụ, đoạn code sau sắp xếp mảng theo chữ cái cuối của chuỗi:

```js
const sortFn = (a, b) => {
  if (a[a.length - 1] < b[b.length - 1]) {
    return -1; // Negative number => a < b, a comes before b
  } else if (a[a.length - 1] > b[b.length - 1]) {
    return 1; // Positive number => a > b, a comes after b
  }
  return 0; // Zero => a = b, a and b keep their original order
};
myArray.sort(sortFn);
// sorts the array so that myArray = ["Wind","Fire","Rain"]
```

- nếu `a` nhỏ hơn `b` theo hệ thống sắp xếp, trả về `-1` (hoặc bất kỳ số âm nào)
- nếu `a` lớn hơn `b` theo hệ thống sắp xếp, trả về `1` (hoặc bất kỳ số dương nào)
- nếu `a` và `b` được coi là tương đương, trả về `0`.

Phương thức [`indexOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) tìm kiếm `searchElement` trong mảng và trả về chỉ số của lần xuất hiện đầu tiên.

```js
const a = ["a", "b", "a", "b", "a"];
console.log(a.indexOf("b")); // 1

// Now try again, starting from after the last match
console.log(a.indexOf("b", 2)); // 3
console.log(a.indexOf("z")); // -1, because 'z' was not found
```

Phương thức [`lastIndexOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/lastIndexOf) hoạt động như `indexOf`, nhưng bắt đầu từ cuối và tìm ngược.

```js
const a = ["a", "b", "c", "d", "a", "b"];
console.log(a.lastIndexOf("b")); // 5

// Now try again, starting from before the last match
console.log(a.lastIndexOf("b", 4)); // 1
console.log(a.lastIndexOf("z")); // -1
```

Phương thức [`forEach()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) thực thi `callback` trên mỗi phần tử mảng và trả về `undefined`.

```js
const a = ["a", "b", "c"];
a.forEach((element) => {
  console.log(element);
});
// Logs:
// a
// b
// c
```

Phương thức `forEach` (và các phương thức khác dưới đây) nhận callback được gọi là _iterative methods_ (phương thức duyệt), vì chúng duyệt qua toàn bộ mảng theo một cách nào đó. Mỗi phương thức nhận một đối số tùy chọn thứ hai tên là `thisArg`. Nếu được cung cấp, `thisArg` trở thành giá trị của từ khóa `this` bên trong thân hàm callback. Nếu không cung cấp, như các trường hợp khác khi hàm được gọi ngoài ngữ cảnh đối tượng tường minh, `this` sẽ tham chiếu đến đối tượng toàn cục ([`window`](/en-US/docs/Web/API/Window), [`globalThis`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/globalThis), v.v.) khi hàm [không ở chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), hoặc `undefined` khi hàm ở chế độ strict.

> [!NOTE]
> Phương thức `sort()` đã giới thiệu ở trên không phải là iterative method, vì hàm callback của nó chỉ dùng để so sánh và có thể không được gọi theo thứ tự cụ thể dựa trên thứ tự phần tử. `sort()` cũng không chấp nhận tham số `thisArg`.

Phương thức [`map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) trả về mảng mới chứa các giá trị trả về từ việc thực thi `callback` trên mỗi phần tử mảng.

```js
const a1 = ["a", "b", "c"];
const a2 = a1.map((item) => item.toUpperCase());
console.log(a2); // ['A', 'B', 'C']
```

Phương thức [`flatMap()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flatMap) chạy `map()` rồi thực hiện `flat()` ở độ sâu 1.

```js
const a1 = ["a", "b", "c"];
const a2 = a1.flatMap((item) => [item.toUpperCase(), item.toLowerCase()]);
console.log(a2); // ['A', 'a', 'B', 'b', 'C', 'c']
```

Phương thức [`filter()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) trả về mảng mới chứa các phần tử mà `callback` trả về `true`.

```js
const a1 = ["a", 10, "b", 20, "c", 30];
const a2 = a1.filter((item) => typeof item === "number");
console.log(a2); // [10, 20, 30]
```

Phương thức [`find()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find) trả về phần tử đầu tiên mà `callback` trả về `true`.

```js
const a1 = ["a", 10, "b", 20, "c", 30];
const i = a1.find((item) => typeof item === "number");
console.log(i); // 10
```

Phương thức [`findLast()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findLast) trả về phần tử cuối cùng mà `callback` trả về `true`.

```js
const a1 = ["a", 10, "b", 20, "c", 30];
const i = a1.findLast((item) => typeof item === "number");
console.log(i); // 30
```

Phương thức [`findIndex()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex) trả về chỉ số của phần tử đầu tiên mà `callback` trả về `true`.

```js
const a1 = ["a", 10, "b", 20, "c", 30];
const i = a1.findIndex((item) => typeof item === "number");
console.log(i); // 1
```

Phương thức [`findLastIndex()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findLastIndex) trả về chỉ số của phần tử cuối cùng mà `callback` trả về `true`.

```js
const a1 = ["a", 10, "b", 20, "c", 30];
const i = a1.findLastIndex((item) => typeof item === "number");
console.log(i); // 5
```

Phương thức [`every()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) trả về `true` nếu `callback` trả về `true` cho mọi phần tử trong mảng.

```js
function isNumber(value) {
  return typeof value === "number";
}
const a1 = [1, 2, 3];
console.log(a1.every(isNumber)); // true
const a2 = [1, "2", 3];
console.log(a2.every(isNumber)); // false
```

Phương thức [`some()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some) trả về `true` nếu `callback` trả về `true` cho ít nhất một phần tử trong mảng.

```js
function isNumber(value) {
  return typeof value === "number";
}
const a1 = [1, 2, 3];
console.log(a1.some(isNumber)); // true
const a2 = [1, "2", 3];
console.log(a2.some(isNumber)); // true
const a3 = ["1", "2", "3"];
console.log(a3.some(isNumber)); // false
```

Phương thức [`reduce()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce) áp dụng `callback(accumulator, currentValue, currentIndex, array)` cho mỗi giá trị trong mảng nhằm rút gọn danh sách các phần tử xuống còn một giá trị duy nhất. Hàm `reduce` trả về giá trị cuối cùng được trả bởi hàm `callback`.

Nếu `initialValue` được chỉ định, `callback` sẽ được gọi với `initialValue` là giá trị tham số đầu tiên và giá trị phần tử đầu tiên của mảng là tham số thứ hai.

Nếu `initialValue` _không_ được chỉ định, hai tham số đầu tiên của `callback` sẽ là phần tử thứ nhất và thứ hai của mảng. Trong mỗi lần gọi tiếp theo, giá trị tham số đầu tiên là bất cứ thứ gì `callback` trả về trong lần gọi trước, và giá trị tham số thứ hai là giá trị tiếp theo trong mảng.

Nếu `callback` cần truy cập chỉ số của phần tử đang xử lý, hoặc toàn bộ mảng, chúng có thể dùng dưới dạng tham số tùy chọn.

```js
const a = [10, 20, 30];
const total = a.reduce(
  (accumulator, currentValue) => accumulator + currentValue,
  0,
);
console.log(total); // 60
```

Phương thức [`reduceRight()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduceRight) hoạt động như `reduce()`, nhưng bắt đầu từ phần tử cuối cùng.

`reduce` và `reduceRight` là các iterative method ít rõ ràng nhất. Chúng nên được dùng cho các thuật toán kết hợp hai giá trị đệ quy để rút gọn một chuỗi thành một giá trị đơn.

## Biến đổi mảng

Bạn có thể chuyển đổi qua lại giữa mảng và các cấu trúc dữ liệu khác.

### Nhóm các phần tử của mảng

Phương thức {{jsxref("Object.groupBy()")}} có thể dùng để nhóm các phần tử của mảng, sử dụng hàm kiểm tra trả về một chuỗi biểu thị nhóm của phần tử hiện tại.

Ở đây chúng ta có mảng inventory chứa các đối tượng "food" có `name` và `type`.

```js
const inventory = [
  { name: "asparagus", type: "vegetables" },
  { name: "bananas", type: "fruit" },
  { name: "goat", type: "meat" },
  { name: "cherries", type: "fruit" },
  { name: "fish", type: "meat" },
];
```

Để dùng `Object.groupBy()`, bạn cung cấp hàm callback được gọi với phần tử hiện tại, và tùy chọn chỉ số hiện tại cùng mảng, và trả về chuỗi biểu thị nhóm của phần tử.

Đoạn code dưới dùng arrow function để trả về `type` của từng phần tử mảng (sử dụng [cú pháp destructuring đối tượng cho đối số hàm](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring#unpacking_properties_from_objects_passed_as_a_function_parameter) để giải nén phần tử `type` từ đối tượng được truyền vào). Kết quả là đối tượng có các thuộc tính được đặt tên theo chuỗi duy nhất được trả về bởi callback. Mỗi thuộc tính được gán một mảng chứa các phần tử trong nhóm.

```js
const result = Object.groupBy(inventory, ({ type }) => type);
console.log(result);
// Logs
// {
//   vegetables: [{ name: 'asparagus', type: 'vegetables' }],
//   fruit: [
//     { name: 'bananas', type: 'fruit' },
//     { name: 'cherries', type: 'fruit' }
//   ],
//   meat: [
//     { name: 'goat', type: 'meat' },
//     { name: 'fish', type: 'meat' }
//   ]
// }
```

Lưu ý rằng đối tượng được trả về tham chiếu đến _cùng_ các phần tử như mảng gốc (không phải {{Glossary("deep copy", "bản sao sâu")}}). Thay đổi cấu trúc bên trong của các phần tử này sẽ được phản ánh trong cả mảng gốc và đối tượng được trả về.

Nếu bạn không thể dùng chuỗi làm khóa, ví dụ, nếu thông tin nhóm liên quan đến một đối tượng có thể thay đổi, thì bạn có thể dùng {{jsxref("Map.groupBy()")}}. Cách này rất giống `Object.groupBy()` ngoại trừ nó nhóm các phần tử của mảng vào {{jsxref("Map")}} có thể dùng giá trị tùy ý ({{Glossary("object")}} hoặc {{Glossary("primitive")}}) làm khóa.

## Mảng thưa (Sparse arrays)

Mảng có thể chứa "ô trống" (empty slots), khác với các ô được điền bằng giá trị `undefined`. Ô trống có thể được tạo theo một trong các cách sau:

```js
// Array constructor:
const a = Array(5); // [ <5 empty items> ]

// Consecutive commas in array literal:
const b = [1, 2, , , 5]; // [ 1, 2, <2 empty items>, 5 ]

// Directly setting a slot with index greater than array.length:
const c = [1, 2];
c[4] = 5; // [ 1, 2, <2 empty items>, 5 ]

// Elongating an array by directly setting .length:
const d = [1, 2];
d.length = 5; // [ 1, 2, <3 empty items> ]

// Deleting an element:
const e = [1, 2, 3, 4, 5];
delete e[2]; // [ 1, 2, <1 empty item>, 4, 5 ]
```

Trong một số thao tác, ô trống hoạt động như thể chúng được điền bằng `undefined`.

```js
const arr = [1, 2, , , 5]; // Create a sparse array

// Indexed access
console.log(arr[2]); // undefined

// For...of
for (const i of arr) {
  console.log(i);
}
// Logs: 1 2 undefined undefined 5

// Spreading
const another = [...arr]; // "another" is [ 1, 2, undefined, undefined, 5 ]
```

Nhưng trong các thao tác khác (đặc biệt là các iterative method của mảng), ô trống bị bỏ qua.

```js
const mapped = arr.map((i) => i + 1); // [ 2, 3, <2 empty items>, 6 ]
arr.forEach((i) => console.log(i)); // 1 2 5
const filtered = arr.filter(() => true); // [ 1, 2, 5 ]
const hasFalsy = arr.some((k) => !k); // false

// Property enumeration
const keys = Object.keys(arr); // [ '0', '1', '4' ]
for (const key in arr) {
  console.log(key);
}
// Logs: '0' '1' '4'
// Spreading into an object uses property enumeration, not the array's iterator
const objectSpread = { ...arr }; // { '0': 1, '1': 2, '4': 5 }
```

Để xem danh sách đầy đủ cách các phương thức mảng hoạt động với mảng thưa, xem [trang tham chiếu `Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#array_methods_and_empty_slots).

## Mảng đa chiều

Mảng có thể được lồng nhau, nghĩa là một mảng có thể chứa mảng khác làm phần tử. Sử dụng đặc tính này của mảng JavaScript, có thể tạo mảng đa chiều.

Đoạn code sau tạo mảng hai chiều.

```js
const a = new Array(4);
for (let i = 0; i < 4; i++) {
  a[i] = new Array(4);
  for (let j = 0; j < 4; j++) {
    a[i][j] = `[${i}, ${j}]`;
  }
}
```

Ví dụ này tạo mảng với các hàng sau:

```plain
Row 0: [0, 0] [0, 1] [0, 2] [0, 3]
Row 1: [1, 0] [1, 1] [1, 2] [1, 3]
Row 2: [2, 0] [2, 1] [2, 2] [2, 3]
Row 3: [3, 0] [3, 1] [3, 2] [3, 3]
```

## Dùng mảng để lưu trữ các thuộc tính khác

Mảng cũng có thể được dùng như đối tượng để lưu trữ thông tin liên quan.

```js
const arr = [1, 2, 3];
arr.property = "value";
console.log(arr.property); // "value"
```

Ví dụ, khi mảng là kết quả của kết quả khớp giữa biểu thức chính quy và chuỗi, mảng trả về các thuộc tính và phần tử cung cấp thông tin về kết quả khớp. Mảng là giá trị trả về của [`RegExp.prototype.exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec), [`String.prototype.match()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match), và [`String.prototype.split()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split). Để biết thêm thông tin về việc dùng mảng với biểu thức chính quy, xem [Regular Expressions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions).

## Làm việc với các đối tượng tương tự mảng

Một số đối tượng JavaScript, chẳng hạn như [`NodeList`](/en-US/docs/Web/API/NodeList) trả về bởi [`document.getElementsByTagName()`](/en-US/docs/Web/API/Document/getElementsByTagName) hoặc đối tượng {{jsxref("Functions/arguments", "arguments")}} có sẵn trong thân hàm, trông và hoạt động như mảng về bề ngoài nhưng không chia sẻ tất cả các phương thức. Đối tượng `arguments` cung cấp thuộc tính {{jsxref("Function/length", "length")}} nhưng không triển khai các phương thức mảng như [`forEach()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach).

Các phương thức mảng không thể được gọi trực tiếp trên các đối tượng tương tự mảng.

```js example-bad
function printArguments() {
  arguments.forEach((item) => {
    console.log(item);
  }); // TypeError: arguments.forEach is not a function
}
```

Nhưng bạn có thể gọi chúng gián tiếp bằng {{jsxref("Function.prototype.call()")}}.

```js example-good
function printArguments() {
  Array.prototype.forEach.call(arguments, (item) => {
    console.log(item);
  });
}
```

Các phương thức prototype của mảng cũng có thể được dùng với chuỗi vì chúng cung cấp truy cập tuần tự đến các ký tự tương tự như mảng:

```js
Array.prototype.forEach.call("a string", (chr) => {
  console.log(chr);
});
```

{{PreviousNext("Web/JavaScript/Guide/Regular_expressions", "Web/JavaScript/Guide/Keyed_collections")}}
