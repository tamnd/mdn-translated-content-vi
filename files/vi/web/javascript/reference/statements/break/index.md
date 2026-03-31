---
title: break
slug: Web/JavaScript/Reference/Statements/break
page-type: javascript-statement
browser-compat: javascript.statements.break
sidebar: jssidebar
---

Câu lệnh **`break`** kết thúc vòng lặp hiện tại hoặc câu lệnh {{jsxref("Statements/switch", "switch")}} và chuyển quyền kiểm soát chương trình đến câu lệnh tiếp theo sau câu lệnh đã kết thúc. Nó cũng có thể được dùng để nhảy qua một [câu lệnh có nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label) khi được sử dụng bên trong câu lệnh có nhãn đó.

{{InteractiveExample("JavaScript Demo: break statement")}}

```js interactive-example
let i = 0;

while (i < 6) {
  if (i === 3) {
    break;
  }
  i += 1;
}

console.log(i);
// Expected output: 3
```

## Cú pháp

```js-nolint
break;
break label;
```

- `label` {{optional_inline}}
  - : Định danh liên kết với nhãn của câu lệnh cần break đến. Nếu câu lệnh `break` không được lồng bên trong vòng lặp hoặc {{jsxref("Statements/switch", "switch")}}, thì định danh nhãn là bắt buộc.

## Mô tả

Khi gặp `break;`, chương trình thoát ra khỏi câu lệnh `switch` hoặc [vòng lặp](/en-US/docs/Web/JavaScript/Reference/Statements#iterations) trong cùng và tiếp tục thực thi câu lệnh tiếp theo sau đó.

Khi gặp `break label;`, chương trình thoát ra khỏi câu lệnh được đánh nhãn là `label` và tiếp tục thực thi câu lệnh tiếp theo sau đó. Câu lệnh `break` cần được lồng bên trong nhãn được tham chiếu. Câu lệnh có nhãn có thể là bất kỳ câu lệnh nào (thường là câu lệnh {{jsxref("Statements/block", "block", "", 1)}}); không nhất thiết phải là một câu lệnh vòng lặp khác.

Câu lệnh `break`, có hoặc không có nhãn theo sau, không thể được sử dụng ở cấp cao nhất của một script, module, thân hàm, hoặc [khối khởi tạo tĩnh](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks), ngay cả khi hàm hoặc lớp được chứa thêm bên trong một vòng lặp.

## Ví dụ

### break trong vòng lặp while

Hàm sau có câu lệnh `break` kết thúc vòng lặp {{jsxref("Statements/while", "while")}} khi `i` bằng 3, rồi trả về giá trị `3 * x`.

```js
function testBreak(x) {
  let i = 0;

  while (i < 6) {
    if (i === 3) {
      break;
    }
    i += 1;
  }

  return i * x;
}
```

### break trong câu lệnh switch

Đoạn code sau có câu lệnh `break` kết thúc câu lệnh {{jsxref("Statements/switch", "switch")}} khi một trường hợp khớp và code tương ứng đã chạy.

```js
const food = "sushi";

switch (food) {
  case "sushi":
    console.log("Sushi is originally from Japan.");
    break;
  case "pizza":
    console.log("Pizza is originally from Italy.");
    break;
  default:
    console.log("I have never heard of that dish.");
    break;
}
```

### break trong khối có nhãn

Đoạn code sau sử dụng các câu lệnh `break` với các khối có nhãn. Bằng cách sử dụng `break outerBlock`, quyền kiểm soát được chuyển đến cuối câu lệnh khối được đánh dấu là `outerBlock`.

```js
outerBlock: {
  innerBlock: {
    console.log("1");
    break outerBlock; // breaks out of both innerBlock and outerBlock
    console.log(":-("); // skipped
  }
  console.log("2"); // skipped
}
```

### Các câu lệnh break không hợp lệ về cú pháp

Câu lệnh `break` phải được lồng bên trong bất kỳ nhãn nào mà nó tham chiếu. Đoạn code sau cũng sử dụng các câu lệnh `break` với khối có nhãn, nhưng tạo ra lỗi cú pháp vì câu lệnh `break` tham chiếu đến `block2` nhưng không được lồng bên trong `block2`.

```js-nolint example-bad
block1: {
  console.log("1");
  break block2; // SyntaxError: label not found
}

block2: {
  console.log("2");
}
```

Lỗi cú pháp cũng được tạo ra trong các ví dụ code sau sử dụng câu lệnh `break` bên trong các hàm được lồng bên trong vòng lặp, hoặc khối có nhãn mà câu lệnh `break` dự kiến thoát ra.

```js-nolint example-bad
function testBreak(x) {
  let i = 0;

  while (i < 6) {
    if (i === 3) {
      (() => {
        break;
      })();
    }
    i += 1;
  }

  return i * x;
}

testBreak(1); // SyntaxError: Illegal break statement
```

```js-nolint example-bad
block1: {
  console.log("1");
  (() => {
    break block1; // SyntaxError: Undefined label 'block1'
  })();
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/continue", "continue")}}
- {{jsxref("Statements/label", "label", "", 1)}}
- {{jsxref("Statements/switch", "switch")}}
