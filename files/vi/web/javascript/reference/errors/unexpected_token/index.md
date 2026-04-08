---
title: "SyntaxError: Unexpected token"
slug: Web/JavaScript/Reference/Errors/Unexpected_token
page-type: javascript-error
sidebar: jssidebar
---

Các ngoại lệ JavaScript "unexpected token" xảy ra khi trình phân tích cú pháp không nhận ra token tại vị trí đã cho, vì vậy nó không thể hiểu được cấu trúc của chương trình. Đây có thể là một lỗi đánh máy đơn giản.

## Thông báo

```plain
SyntaxError: Unexpected token ';' (V8-based)
SyntaxError: Unexpected identifier 'x' (V8-based)
SyntaxError: Unexpected number (V8-based)
SyntaxError: Unexpected string (V8-based)
SyntaxError: Unexpected regular expression (V8-based)
SyntaxError: Unexpected template string (V8-based)

SyntaxError: unexpected token: identifier (Firefox)
SyntaxError: expected expression, got "x" (Firefox)
SyntaxError: expected property name, got "x" (Firefox)
SyntaxError: expected target, got "x" (Firefox)
SyntaxError: expected meta, got "x" (Firefox)
SyntaxError: expected rest argument name, got "x" (Firefox)
SyntaxError: expected closing parenthesis, got "x" (Firefox)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Một cấu trúc ngôn ngữ cụ thể được mong đợi, nhưng một thứ khác được cung cấp. Đây có thể là một lỗi đánh máy đơn giản.

## Ví dụ

### Biểu thức mong đợi

Ví dụ, khi nối chuỗi các biểu thức, dấu phẩy ở cuối không được phép.

```js-nolint example-bad
for (let i = 0; i < 5,; ++i) {
  console.log(i);
}
// Uncaught SyntaxError: expected expression, got ';'
```

Cách đúng là bỏ dấu phẩy hoặc thêm một biểu thức khác:

```js example-good
for (let i = 0; i < 5; ++i) {
  console.log(i);
}
```

### Thiếu dấu ngoặc đơn

Đôi khi, bạn bỏ quên dấu ngoặc đơn xung quanh các câu lệnh `if`:

```js-nolint example-bad
function round(n, upperBound, lowerBound) {
if (n > upperBound) || (n < lowerBound) { // Thiếu dấu ngoặc đơn ở đây!
    throw new Error(`Number ${n} is more than ${upperBound} or less than ${lowerBound}`);
  } else if (n < (upperBound + lowerBound) / 2) {
    return lowerBound;
  } else {
    return upperBound;
  }
} // SyntaxError: expected expression, got '||'
```

Các dấu ngoặc đơn có thể trông đúng thoạt nhìn, nhưng lưu ý rằng `||` nằm ngoài các dấu ngoặc đơn. Cách đúng là đặt dấu ngoặc đơn xung quanh `||`:

```js-nolint example-good
function round(n, upperBound, lowerBound) {
  if ((n > upperBound) || (n < lowerBound)) {
    throw new Error(
      `Number ${n} is more than ${upperBound} or less than ${lowerBound}`,
    );
  } else if (n < (upperBound + lowerBound) / 2) {
    return lowerBound;
  } else {
    return upperBound;
  }
}
```

### Lỗi cấu trúc ở phía trên làm rối nghĩa

Đôi khi, lỗi do một số vấn đề cấu trúc không nằm ngay tại vị trí lỗi, vì vậy bạn cần nhìn xung quanh để tìm các lỗi tiềm ẩn. Ví dụ, bạn định khai báo một phương thức của một đối tượng, nhưng bạn lại khai báo nó như một thuộc tính:

```js-nolint example-bad
const MyComponent = {
  mounted: {
    document.getElementById("app").classList.add("loaded");
  }
}
```

Dấu `.` sau `document` là bất ngờ, vì JavaScript đang phân tích `{}` như một object literal thay vì function body, vì vậy nó mong đợi `:`. Vấn đề được giải quyết bằng cách khai báo `mounted` như là hàm.

```js-nolint example-good
const MyComponent = {
  mounted() {
    document.getElementById("app").classList.add("loaded");
  }
}
```

## Xem thêm

- {{jsxref("SyntaxError")}}
