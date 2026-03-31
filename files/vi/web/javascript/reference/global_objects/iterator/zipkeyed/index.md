---
title: Iterator.zipKeyed()
short-title: zipKeyed()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/zipKeyed
page-type: javascript-static-method
status:
  - experimental
browser-compat: javascript.builtins.Iterator.zipKeyed
---

{{JSRef}}{{SeeCompatTable}}

Phương thức tĩnh **`Iterator.zipKeyed()`** tạo một đối tượng {{jsxref("Iterator")}} mới tổng hợp các phần tử từ nhiều đối tượng iterable bằng cách yield các đối tượng chứa các phần tử ở cùng vị trí, với các key được chỉ định bởi đầu vào. Về cơ bản, nó "ghép kéo" các iterable đầu vào lại với nhau, cho phép lặp đồng thời qua chúng.

Phương thức {{jsxref("Iterator.zip()")}} tương tự, nhưng yield các mảng thay vì đối tượng.

## Cú pháp

```js-nolint
Iterator.zipKeyed(iterables)
Iterator.zipKeyed(iterables, options)
```

### Tham số

- `iterables`
  - : Một đối tượng. Key của mỗi thuộc tính được sử dụng làm key trong các đối tượng kết quả. Giá trị của thuộc tính phải triển khai giao thức [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) hoặc, nếu không, giao thức [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol). Các iterable này có thể là vô hạn. Chuỗi bị từ chối: để ghép kéo chuỗi, hãy chuyển đổi chúng thành iterators một cách tường minh bằng {{jsxref("Iterator.from()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chỉ định hành vi trong trường hợp độ dài đầu vào không nhất quán. Nó có thể có các thuộc tính sau:
    - `mode` {{optional_inline}}
      - : Một trong các giá trị sau:
        - `"shortest"` (mặc định): Iterator kết quả dừng khi một iterable đầu vào cạn kiệt.
        - `"longest"`: Iterator kết quả dừng khi tất cả các iterable đầu vào cạn kiệt. Các giá trị bị thiếu từ các iterable ngắn hơn được điền theo tùy chọn `padding`.
        - `"strict"`: Một {{jsxref("TypeError")}} được ném ra nếu không phải tất cả các iterable đầu vào kết thúc cùng một lúc.
    - `padding` {{optional_inline}}
      - : Một đối tượng. Chỉ được lấy và xác thực khi `mode` là `"longest"`. Nếu `undefined` hoặc không có, các giá trị bị thiếu từ các iterable ngắn hơn được điền bằng `undefined` (tương đương với việc truyền một đối tượng rỗng). Nếu một đối tượng được cung cấp, mỗi key của đối số `iterables` được lấy _ngay khi `Iterator.zipKeyed()` được gọi_. `padding[key]` được sử dụng cho các giá trị bị thiếu của `iterables[key]`. Nếu đối tượng `padding` thiếu một số key, những key đó được điền bằng `undefined`.

### Giá trị trả về

Một đối tượng {{jsxref("Iterator")}} mới. Mỗi phần tử của nó là một đối tượng có cùng key như đối số `iterables`, chứa các phần tử từ mỗi iterable đầu vào ở vị trí tương ứng.

## Mô tả

Hàm `Iterator.zipKeyed()` hoạt động như {{jsxref("Iterator.zip()")}}; sự khác biệt duy nhất là bạn có thể chỉ định các key được sử dụng trong các đối tượng kết quả, trong khi `Iterator.zip()` luôn sử dụng các chỉ số số (bằng cách yield mảng).

Nếu chúng ta biểu diễn các iterable dưới dạng mảng, đầu vào có thể trông như thế này:

```js
({
  a: [a1, a2, a3, a4],
  b: [b1, b2, b3],
  c: [c1, c2, c3, c4, c5],
});
```

Iterator kết quả, bất kể các tùy chọn, sẽ bắt đầu bằng cách yield các mảng sau:

```js
({ a: a1, b: b1, c: c1 });
({ a: a2, b: b2, c: c2 });
({ a: a3, b: b3, c: c3 });
```

Sau khi ba đối tượng đầu tiên được yield, iterable đầu vào `b` cạn kiệt ở lần gọi `next()` thứ tư — nó trả về `{ done: true }`. Điều gì xảy ra tiếp theo phụ thuộc vào tùy chọn `mode`. Nếu `mode` là `"shortest"` (mặc định), iterator kết quả dừng ở đây: hai iterator đầu vào còn lại được [đóng](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#errors_during_iteration). Nếu `mode` là `"strict"`, một lỗi được ném ra vì hai iterable còn lại _không_ kết thúc khi iterable thứ hai yield kết quả `{ done: true }`. Nếu `mode` là `"longest"`, iterator kết quả tiếp tục yield các đối tượng, điền vào các giá trị còn thiếu. Ví dụ, nếu `padding` không được cung cấp, nó mặc định là `undefined`:

```js
({ a: a4, b: undefined, c: c4 });
({ a: undefined, b: undefined, c: c5 });
```

Nếu `padding` được cung cấp như một đối tượng, nó có thể trông như `{ a: p1, b: p2, c: p3 }`. Thì `p2` được sử dụng để điền giá trị bị thiếu từ iterable đầu vào `b`, và `p1` được sử dụng để điền giá trị bị thiếu từ iterable đầu vào `a`:

```js
({ a: a4, b: p2, c: c4 });
({ a: p1, b: p2, c: c5 });
```

## Ví dụ

### Chuyển vị dữ liệu dạng bảng

Có hai cách phổ biến để biểu diễn dữ liệu dạng bảng: như một đối tượng trong đó mỗi thuộc tính là một cột, hoặc như một mảng các đối tượng trong đó mỗi đối tượng là một hàng. Ví dụ này cho thấy cách bạn có thể lặp qua biểu diễn dựa trên cột theo hàng bằng cách sử dụng `Iterator.zipKeyed()`.

```js
const table = {
  name: ["Caroline", "Danielle", "Evelyn"],
  age: [30, 25, 35],
  city: ["New York", "London", "Hong Kong"],
};

for (const { name, age, city } of Iterator.zipKeyed(table)) {
  console.log(`${name}, aged ${age}, lives in ${city}.`);
}

// Kết quả:
// Caroline, aged 30, lives in New York.
// Danielle, aged 25, lives in London.
// Evelyn, aged 35, lives in Hong Kong.
```

Hầu hết các trường hợp sử dụng của `Iterator.zipKeyed()` đều giống với {{jsxref("Iterator.zip()")}}. Cái nào để sử dụng phụ thuộc vào việc bạn đã có một đối tượng gồm các iterable (sử dụng `zipKeyed()`) hay một mảng gồm các iterable (sử dụng `zip()`). Chúng tôi khuyến nghị sử dụng `zipKeyed()` khi có thể, vì việc chỉ định các key tường minh làm cho việc vô tình nhầm thứ tự các iterable trở nên khó hơn.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.zipKeyed` trong `core-js`](https://core-js.io/docs/features/proposals/joint-iteration)
- [es-shims polyfill của `Iterator.zipKeyed`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.zip()")}}
- {{jsxref("Iterator.from()")}}
- {{jsxref("Iterator.concat()")}}
