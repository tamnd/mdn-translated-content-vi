---
title: Iterator.zip()
short-title: zip()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/zip
page-type: javascript-static-method
status:
  - experimental
browser-compat: javascript.builtins.Iterator.zip
---

{{JSRef}}{{SeeCompatTable}}

Phương thức tĩnh **`Iterator.zip()`** tạo một đối tượng {{jsxref("Iterator")}} mới tổng hợp các phần tử từ nhiều đối tượng iterable bằng cách yield các mảng chứa các phần tử ở cùng vị trí. Về cơ bản, nó "ghép kéo" các iterable đầu vào lại với nhau, cho phép lặp đồng thời qua chúng.

Phương thức {{jsxref("Iterator.zipKeyed()")}} tương tự, nhưng yield các đối tượng thay vì mảng với các key mà bạn có thể chỉ định.

## Cú pháp

```js-nolint
Iterator.zip(iterables)
Iterator.zip(iterables, options)
```

### Tham số

- `iterables`
  - : Một iterable gồm các iterable có các phần tử được tổng hợp. Nó phải là [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) và không được là [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol). Nó nên hữu hạn, mặc dù các phần tử của nó có thể là các iterable vô hạn. Mỗi phần tử phải triển khai giao thức [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) hoặc, nếu không, giao thức [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol). Chuỗi bị từ chối: để ghép kéo chuỗi, hãy chuyển đổi chúng thành iterators một cách tường minh bằng {{jsxref("Iterator.from()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chỉ định hành vi trong trường hợp độ dài đầu vào không nhất quán. Nó có thể có các thuộc tính sau:
    - `mode` {{optional_inline}}
      - : Một trong các giá trị sau:
        - `"shortest"` (mặc định): Iterator kết quả dừng khi một iterable đầu vào cạn kiệt.
        - `"longest"`: Iterator kết quả dừng khi tất cả các iterable đầu vào cạn kiệt. Các giá trị bị thiếu từ các iterable ngắn hơn được điền theo tùy chọn `padding`.
        - `"strict"`: Một {{jsxref("TypeError")}} được ném ra nếu không phải tất cả các iterable đầu vào kết thúc cùng một lúc.
    - `padding` {{optional_inline}}
      - : Một đối tượng iterable (không phải iterator). Chỉ được lấy và xác thực khi `mode` là `"longest"`. Nếu `undefined` hoặc không có, các giá trị bị thiếu từ các iterable ngắn hơn được điền bằng `undefined` (tương đương với việc truyền một iterable rỗng). Nếu một iterable được cung cấp, nó được lặp một số lần bằng số phần tử trong `iterables` _ngay khi `Iterator.zip()` được gọi_. `padding[i]` được sử dụng cho các giá trị bị thiếu của `iterables[i]` (giả sử `padding` và `iterables` được cung cấp dưới dạng mảng; chúng không nhất thiết phải là mảng). Nếu `padding` ngắn hơn `iterables`, `undefined` được sử dụng cho các iterable còn lại.

### Giá trị trả về

Một đối tượng {{jsxref("Iterator")}} mới. Mỗi phần tử của nó là một mảng có độ dài bằng số iterable đầu vào, chứa các phần tử từ mỗi iterable đầu vào ở vị trí tương ứng. Nếu đối tượng `iterables` rỗng, iterator kết quả được tạo là đã hoàn thành.

## Mô tả

Hàm `Iterator.zip()` hoạt động như một phép [chuyển vị](https://en.wikipedia.org/wiki/Transpose), yield các mảng chứa các phần tử ở các vị trí khớp trong mỗi đầu vào. Nếu chúng ta biểu diễn các iterable dưới dạng mảng, đầu vào có thể trông như thế này:

```js
[
  [a1, a2, a3, a4], // Iterable a
  [b1, b2, b3], // Iterable b
  [c1, c2, c3, c4, c5], // Iterable c
];
```

Iterator kết quả, bất kể các tùy chọn, sẽ bắt đầu bằng cách yield các mảng sau:

```js
[a1, b1, c1];
[a2, b2, c2];
[a3, b3, c3];
```

Sau khi ba mảng đầu tiên được yield, iterable đầu vào `b` cạn kiệt ở lần gọi `next()` thứ tư — nó trả về `{ done: true }`. Điều gì xảy ra tiếp theo phụ thuộc vào tùy chọn `mode`. Nếu `mode` là `"shortest"` (mặc định), iterator kết quả dừng ở đây: hai iterator đầu vào còn lại được [đóng](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#errors_during_iteration). Nếu `mode` là `"strict"`, một lỗi được ném ra vì hai iterable còn lại _không_ kết thúc khi iterable thứ hai yield kết quả `{ done: true }`. Nếu `mode` là `"longest"`, iterator kết quả tiếp tục yield các mảng, điền vào các giá trị còn thiếu. Ví dụ, nếu `padding` không được cung cấp, nó mặc định là `undefined`:

```js
[a4, undefined, c4];
[undefined, undefined, c5];
```

Nếu `padding` được cung cấp dưới dạng iterable, vì có ba iterable đầu vào, ba giá trị đầu tiên từ iterable `padding` được sử dụng để điền vào các giá trị bị thiếu. Giả sử `padding` là một mảng với các giá trị `[p1, p2, p3]`. Thì `p2` được sử dụng để điền giá trị bị thiếu từ iterable đầu vào `b`, và `p1` được sử dụng để điền giá trị bị thiếu từ iterable đầu vào `a`:

```js
[a4, p2, c4];
[p1, p2, c5];
```

Nếu iterable `padding` có ít hơn ba giá trị, `undefined` được sử dụng cho các iterable còn lại bị thiếu.

## Ví dụ

### Lặp qua map với chỉ số

Sử dụng `Iterator.zip()`, bạn có thể lặp qua bất kỳ đối tượng iterable nào (chuỗi không được hỗ trợ theo mặc định) trong khi cũng có quyền truy cập vào bộ đếm tăng dần:

```js
const ages = new Map([
  ["Caroline", 30],
  ["Danielle", 25],
  ["Evelyn", 35],
]);

const numbers = (function* () {
  let n = 0;
  while (true) {
    yield n++;
  }
})();
for (const [index, [name, age]] of Iterator.zip([numbers, ages])) {
  console.log(`${index}: ${name} is ${age} years old.`);
}

// Kết quả:
// 0: Caroline is 30 years old.
// 1: Danielle is 25 years old.
// 2: Evelyn is 35 years old.
```

`numbers` là iterator vô hạn tạo ra các số tăng dần bắt đầu từ `0`. Vì `Iterator.zip()` mặc định dừng khi iterable đầu vào ngắn nhất cạn kiệt, vòng lặp lặp đúng ba lần. Iterator `numbers` được đóng đúng cách sau khi vòng lặp kết thúc; nó không gây ra vòng lặp vô hạn.

### Tạo Map từ danh sách key và value

Giả sử bạn có hai mảng: một với key và một với value. Bạn có thể sử dụng `Iterator.zip()` để kết hợp chúng thành một {{jsxref("Map")}}:

```js
const days = ["Mon", "Tue", "Wed", "Thu", "Fri"];
const temperatures = [22, 21, 23, 20, 19];

const dayTemperatureMap = new Map(Iterator.zip([days, temperatures]));
console.log(dayTemperatureMap);
// Map(5) { 'Mon' => 22, 'Tue' => 21, 'Wed' => 23, 'Thu' => 20, 'Fri' => 19 }
```

### Lặp đồng thời qua nhiều nguồn dữ liệu

Giả sử bạn có dữ liệu đến từ nhiều nguồn, chẳng hạn như nhiều microservice hoặc cơ sở dữ liệu. Bạn biết rằng mỗi nguồn cung cấp dữ liệu liên quan theo cùng thứ tự và bạn muốn xử lý chúng cùng nhau. Bạn có thể sử dụng `Iterator.zip()` để đạt được điều này:

```js
const names = fetchNames(); // ví dụ: ["Caroline", "Danielle", "Evelyn"]
const ages = fetchAges(); // ví dụ: [30, 25, 35]
const cities = fetchCities(); // ví dụ: ["New York", "London", "Hong Kong"]

for (const [name, age, city] of Iterator.zip([names, ages, cities])) {
  console.log(`${name}, aged ${age}, lives in ${city}.`);
}

// Kết quả:
// Caroline, aged 30, lives in New York.
// Danielle, aged 25, lives in London.
// Evelyn, aged 35, lives in Hong Kong.
```

### Cung cấp padding cho các iterable không đều

Khi ghép kéo các iterable có độ dài khác nhau với `mode` được đặt là `"longest"`, bạn có thể cung cấp iterable `padding` để chỉ định các giá trị được sử dụng để điền vào các mục bị thiếu:

```js
const letters = ["a", "b", "c", "d", "e"];
const numbers = [1, 2, 3];

// Một giá trị padding cho mỗi iterable
const padding = ["[Letter missing]", "[Number missing]"];
const it = Iterator.zip([letters, numbers], { mode: "longest", padding });
for (const [letter, number] of it) {
  console.log(`${letter}: ${number}`);
}
// Kết quả:
// a: 1
// b: 2
// c: 3
// d: [Number missing]
// e: [Number missing]
```

### Ghép kéo chuỗi

Chuỗi không được chấp nhận là iterable đầu vào cho `Iterator.zip()`, vì bây giờ nó được coi là lỗi khi làm cho chuỗi có thể lặp ngầm. Để ghép kéo chuỗi, hãy chuyển đổi chúng thành iterators một cách tường minh bằng {{jsxref("Iterator.from()")}}:

```js
const str1 = "abc";
const str2 = "1234";
const it = Iterator.zip([Iterator.from(str1), Iterator.from(str2)]);
for (const [char1, char2] of it) {
  console.log(`${char1} - ${char2}`);
}
// Kết quả:
// a - 1
// b - 2
// c - 3
```

Trong một số trường hợp, bạn có thể muốn tách theo [các cụm grapheme](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters) thay vì các đơn vị code. Trong trường hợp đó, bạn có thể sử dụng API {{jsxref("Intl.Segmenter")}}:

```js
const segmenter = new Intl.Segmenter("en-US", { granularity: "grapheme" });
const str1 = "🤷‍♂️🤷‍♀️🤷";
const str2 = "123";
const it = Iterator.zip([
  segmenter.segment(str1).map(({ segment }) => segment),
  segmenter.segment(str2).map(({ segment }) => segment),
]);
for (const [char1, char2] of it) {
  console.log(`${char1} - ${char2}`);
}
// Kết quả:
// 🤷‍♂️ - 1
// 🤷‍♀️ - 2
// 🤷 - 3
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.zip` trong `core-js`](https://core-js.io/docs/features/proposals/joint-iteration)
- [es-shims polyfill của `Iterator.zip`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.zipKeyed()")}}
- {{jsxref("Iterator.from()")}}
- {{jsxref("Iterator.concat()")}}
