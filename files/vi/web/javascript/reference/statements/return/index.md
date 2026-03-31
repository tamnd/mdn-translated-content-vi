---
title: return
slug: Web/JavaScript/Reference/Statements/return
page-type: javascript-statement
browser-compat: javascript.statements.return
sidebar: jssidebar
---

Câu lệnh **`return`** kết thúc việc thực thi hàm và chỉ định một giá trị trả về cho hàm gọi.

{{InteractiveExample("JavaScript Demo: return statement")}}

```js interactive-example
function getRectArea(width, height) {
  if (width > 0 && height > 0) {
    return width * height;
  }
  return 0;
}

console.log(getRectArea(3, 4));
// Expected output: 12

console.log(getRectArea(-3, 4));
// Expected output: 0
```

## Cú pháp

```js-nolint
return;
return expression;
```

- `expression` {{optional_inline}}
  - : Biểu thức có giá trị cần được trả về. Nếu bị bỏ qua, `undefined` được trả về.

## Mô tả

Câu lệnh `return` chỉ có thể được sử dụng trong thân hàm. Khi câu lệnh `return` được sử dụng trong thân hàm, việc thực thi hàm sẽ dừng lại. Câu lệnh `return` có các tác dụng khác nhau khi được đặt trong các hàm khác nhau:

- Trong hàm thông thường, lời gọi đến hàm đó được đánh giá là giá trị trả về.
- Trong async function, promise được tạo ra sẽ được giải quyết với giá trị trả về.
- Trong generator function, đối tượng generator được tạo ra có phương thức `next()` trả về `{ done: true, value: returnedValue }`.
- Trong async generator function, đối tượng async generator được tạo ra có phương thức `next()` trả về một promise được thực hiện với `{ done: true, value: returnedValue }`.

Nếu câu lệnh `return` được thực thi trong một khối {{jsxref("Statements/try...catch", "try")}}, khối `finally` của nó, nếu có, sẽ được thực thi trước, trước khi giá trị thực sự được trả về.

### Chèn dấu chấm phẩy tự động

Cú pháp cấm các ký tự kết thúc dòng giữa từ khóa `return` và biểu thức cần được trả về.

```js-nolint example-bad
return
a + b;
```

Đoạn code trên được biến đổi bởi [chèn dấu chấm phẩy tự động (ASI)](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion) thành:

```js-nolint
return;
a + b;
```

Điều này làm cho hàm trả về `undefined` và biểu thức `a + b` không bao giờ được đánh giá. Điều này có thể tạo ra [cảnh báo trong console](/en-US/docs/Web/JavaScript/Reference/Errors/Stmt_after_return).

Để tránh vấn đề này (để ngăn ASI), bạn có thể sử dụng dấu ngoặc đơn:

```js-nolint
return (
  a + b
);
```

## Ví dụ

### Ngắt một hàm

Một hàm dừng ngay lập tức tại điểm mà `return` được gọi.

```js
function counter() {
  // Infinite loop
  for (let count = 1; ; count++) {
    console.log(`${count}A`); // Until 5
    if (count === 5) {
      return;
    }
    console.log(`${count}B`); // Until 4
  }
  console.log(`${count}C`); // Never appears
}

counter();

// Logs:
// 1A
// 1B
// 2A
// 2B
// 3A
// 3B
// 4A
// 4B
// 5A
```

### Trả về một hàm

Xem thêm bài viết về [Closures](/en-US/docs/Web/JavaScript/Guide/Closures).

```js
function magic() {
  return function calc(x) {
    return x * 42;
  };
}

const answer = magic();
answer(1337); // 56154
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- [Closures](/en-US/docs/Web/JavaScript/Guide/Closures)
