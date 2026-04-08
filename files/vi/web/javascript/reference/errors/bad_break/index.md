---
title: "SyntaxError: unlabeled break must be inside loop or switch"
slug: Web/JavaScript/Reference/Errors/Bad_break
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "unlabeled break must be inside loop or switch" xảy ra khi câu lệnh {{jsxref("Statements/break", "break")}} không nằm bên trong một vòng lặp hoặc câu lệnh {{jsxref("Statements/switch", "switch")}}.

## Thông báo

```plain
SyntaxError: Illegal break statement (V8-based)
SyntaxError: unlabeled break must be inside loop or switch (Firefox)
SyntaxError: 'break' is only valid inside a switch or loop statement. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}.

## Nguyên nhân?

Câu lệnh {{jsxref("Statements/break", "break")}} có thể được dùng để thoát khỏi vòng lặp hoặc câu lệnh `switch`, và sử dụng chúng ở nơi khác là lỗi cú pháp. Ngoài ra, bạn có thể cung cấp một [nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label) cho câu lệnh `break` để thoát ra khỏi bất kỳ câu lệnh nào có nhãn đó — tuy nhiên, nếu nhãn không tham chiếu đến câu lệnh đang chứa, một lỗi khác [SyntaxError: label not found](/en-US/docs/Web/JavaScript/Reference/Errors/Label_not_found) sẽ được ném ra.

## Ví dụ

### break không hợp lệ cú pháp

`break` không thể được dùng bên ngoài `switch` hoặc vòng lặp.

```js-nolint example-bad
let score = 0;

function increment() {
  if (score === 100)
    break; // SyntaxError: unlabeled break must be inside loop or switch
  }
  score++;
}
```

Thay vì `break`, có thể bạn muốn dùng {{jsxref("Statements/return", "return")}} để kết thúc sớm một hàm.

```js example-good
let score = 0;

function increment() {
  if (score === 100) {
    return;
  }
  score++;
}
```

### Sử dụng break trong callbacks

`break` không thể được dùng trong callbacks, ngay cả khi callback được gọi từ một vòng lặp.

```js-nolint example-bad
let containingIndex = 0;
const matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
];

while (containingIndex < matrix.length) {
  matrix[containingIndex].forEach((value) => {
    if (value === 5) {
      break; // SyntaxError: unlabeled break must be inside loop or switch
    }
  });
  containingIndex++;
}
```

Thay vào đó, hãy tái cấu trúc code để `break` được dùng bên ngoài callback.

```js example-good
let containingIndex = 0;
const matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
];

outer: while (containingIndex < matrix.length) {
  for (const value of matrix[containingIndex]) {
    if (value === 5) {
      break outer;
    }
  }
  containingIndex++;
}
```

```js example-good
let containingIndex = 0;
const matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
];

while (containingIndex < matrix.length) {
  if (matrix[containingIndex].includes(5)) {
    break;
  }
  containingIndex++;
}
```

Không có cách nào để kết thúc sớm vòng lặp {{jsxref("Array/forEach", "forEach()")}}. Bạn có thể dùng {{jsxref("Array/some", "some()")}} thay thế, hoặc chuyển đổi thành vòng lặp {{jsxref("Statements/for...of", "for...of")}}.

```js-nolint example-bad
array.forEach((value) => {
  if (value === 5) {
    break; // SyntaxError: unlabeled break must be inside loop or switch
  }
  // do something with value
});
```

```js example-good
array.some((value) => {
  if (value === 5) {
    return true;
  }
  // do something with value
  return false;
});
```

```js example-good
for (const value of array) {
  if (value === 5) {
    break;
  }
  // do something with value
}
```

## Xem thêm

- {{jsxref("Statements/break", "break")}}
