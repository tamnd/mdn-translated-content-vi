---
title: continue
slug: Web/JavaScript/Reference/Statements/continue
page-type: javascript-statement
browser-compat: javascript.statements.continue
sidebar: jssidebar
---

Câu lệnh **`continue`** kết thúc việc thực thi các câu lệnh trong vòng lặp hiện tại của vòng lặp hiện tại hoặc vòng lặp có nhãn, và tiếp tục thực thi vòng lặp với vòng lặp tiếp theo.

{{InteractiveExample("JavaScript Demo: continue statement")}}

```js interactive-example
let text = "";

for (let i = 0; i < 10; i++) {
  if (i === 3) {
    continue;
  }
  text += i;
}

console.log(text);
// Expected output: "012456789"
```

## Cú pháp

```js-nolint
continue;
continue label;
```

- `label` {{optional_inline}}
  - : Định danh được liên kết với nhãn của câu lệnh.

## Mô tả

Trái ngược với câu lệnh {{jsxref("Statements/break", "break")}}, `continue` không kết thúc hoàn toàn việc thực thi vòng lặp, mà thay vào đó:

- Trong vòng lặp {{jsxref("Statements/while", "while")}} hoặc {{jsxref("Statements/do...while", "do...while")}}, nó nhảy trở lại điều kiện.
- Trong vòng lặp {{jsxref("Statements/for", "for")}}, nó nhảy đến biểu thức cập nhật.
- Trong vòng lặp {{jsxref("Statements/for...in", "for...in")}}, {{jsxref("Statements/for...of", "for...of")}}, hoặc {{jsxref("Statements/for-await...of", "for await...of")}}, nó nhảy đến vòng lặp tiếp theo.

Câu lệnh `continue` có thể bao gồm một nhãn tùy chọn cho phép chương trình nhảy đến vòng lặp tiếp theo của câu lệnh vòng lặp có nhãn thay vì vòng lặp trong cùng. Trong trường hợp này, câu lệnh `continue` cần được lồng trong câu lệnh có nhãn đó.

Câu lệnh `continue`, có hoặc không có nhãn theo sau, không thể được sử dụng ở cấp cao nhất của script, module, thân hàm, hoặc [khối khởi tạo tĩnh](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks), ngay cả khi hàm hoặc class được chứa thêm trong một vòng lặp.

## Ví dụ

### Sử dụng continue với while

Ví dụ sau đây minh họa vòng lặp {{jsxref("Statements/while", "while")}} có câu lệnh `continue` được thực thi khi giá trị của `i` là 3. Do đó, `n` nhận các giá trị 1, 3, 7 và 12.

```js
let i = 0;
let n = 0;

while (i < 5) {
  i++;

  if (i === 3) {
    continue;
  }

  n += i;
}
```

### Sử dụng continue với nhãn

Trong ví dụ sau, một câu lệnh có nhãn `checkIAndJ` chứa một câu lệnh có nhãn `checkJ`. Nếu gặp `continue`, chương trình tiếp tục ở đầu câu lệnh `checkJ`. Mỗi khi gặp `continue`, `checkJ` lặp lại cho đến khi điều kiện của nó trả về false. Khi trả về false, phần còn lại của câu lệnh `checkIAndJ` được hoàn thành.

Nếu `continue` có nhãn là `checkIAndJ`, chương trình sẽ tiếp tục ở đầu câu lệnh `checkIAndJ`.

```js
let i = 0;
let j = 8;

checkIAndJ: while (i < 4) {
  console.log(`i: ${i}`);
  i += 1;

  checkJ: while (j > 4) {
    console.log(`j: ${j}`);
    j -= 1;

    if (j % 2 === 0) continue;
    console.log(`${j} is odd.`);
  }
  console.log(`i = ${i}`);
  console.log(`j = ${j}`);
}
```

Kết quả:

```plain
i: 0

// start checkJ
j: 8
7 is odd.
j: 7
j: 6
5 is odd.
j: 5
// end checkJ

i = 1
j = 4

i: 1
i = 2
j = 4

i: 2
i = 3
j = 4

i: 3
i = 4
j = 4
```

### Các câu lệnh continue không hợp lệ về cú pháp

`continue` không thể được sử dụng trong vòng lặp vượt qua ranh giới hàm.

```js-nolint example-bad
for (let i = 0; i < 10; i++) {
  (() => {
    continue; // SyntaxError: Illegal continue statement: no surrounding iteration statement
  })();
}
```

Khi tham chiếu đến nhãn, câu lệnh có nhãn phải chứa câu lệnh `continue`.

```js-nolint example-bad
label: for (let i = 0; i < 10; i++) {
  console.log(i);
}

for (let i = 0; i < 10; i++) {
  continue label; // SyntaxError: Undefined label 'label'
}
```

Câu lệnh có nhãn phải là một vòng lặp.

```js-nolint example-bad
label: {
  for (let i = 0; i < 10; i++) {
    continue label; // SyntaxError: Illegal continue statement: 'label' does not denote an iteration statement
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/break", "break")}}
- {{jsxref("Statements/label", "label", "", 1)}}
