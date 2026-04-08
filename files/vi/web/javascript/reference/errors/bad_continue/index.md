---
title: "SyntaxError: continue must be inside loop"
slug: Web/JavaScript/Reference/Errors/Bad_continue
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "continue must be inside loop" xảy ra khi câu lệnh {{jsxref("Statements/continue", "continue")}} không nằm bên trong một câu lệnh vòng lặp.

## Thông báo

```plain
SyntaxError: Illegal continue statement: no surrounding iteration statement (V8-based)
SyntaxError: Illegal continue statement: 'label' does not denote an iteration statement (V8-based)
SyntaxError: continue must be inside loop (Firefox)
SyntaxError: 'continue' is only valid inside a loop statement. (Safari)
SyntaxError: Cannot continue to the label 'label' as it is not targeting a loop. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}.

## Nguyên nhân?

Câu lệnh {{jsxref("Statements/continue", "continue")}} có thể được dùng để tiếp tục vòng lặp, và sử dụng chúng ở nơi khác là lỗi cú pháp. Ngoài ra, bạn có thể cung cấp một [nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label) cho câu lệnh `continue` để tiếp tục bất kỳ vòng lặp nào có nhãn đó — tuy nhiên, nếu nhãn không tham chiếu đến câu lệnh đang chứa, một lỗi khác [SyntaxError: label not found](/en-US/docs/Web/JavaScript/Reference/Errors/Label_not_found) sẽ được ném ra, và nếu nhãn tham chiếu đến câu lệnh không phải vòng lặp, lỗi cú pháp vẫn được ném ra.

## Ví dụ

### Sử dụng continue trong callbacks

Nếu bạn muốn tiếp tục vòng lặp tiếp theo trong vòng lặp {{jsxref("Array/forEach", "forEach()")}}, hãy sử dụng {{jsxref("Statements/return", "return")}} thay thế, hoặc chuyển đổi thành vòng lặp {{jsxref("Statements/for...of", "for...of")}}.

```js-nolint example-bad
array.forEach((value) => {
  if (value === 5) {
    continue; // SyntaxError: continue must be inside loop
  }
  // do something with value
});
```

```js example-good
array.forEach((value) => {
  if (value === 5) {
    return;
  }
  // do something with value
});
```

```js example-good
for (const value of array) {
  if (value === 5) {
    continue;
  }
  // do something with value
}
```

## Xem thêm

- {{jsxref("Statements/continue", "continue")}}
