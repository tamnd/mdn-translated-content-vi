---
title: "SyntaxError: return not in function"
slug: Web/JavaScript/Reference/Errors/Bad_return
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "return not in function" xảy ra khi câu lệnh [`return`](/en-US/docs/Web/JavaScript/Reference/Statements/return) được gọi bên ngoài một [hàm](/en-US/docs/Web/JavaScript/Guide/Functions).

## Thông báo

```plain
SyntaxError: Illegal return statement (V8-based)
SyntaxError: return not in function (Firefox)
SyntaxError: Return statements are only valid inside functions. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}.

## Nguyên nhân?

Câu lệnh [`return`](/en-US/docs/Web/JavaScript/Reference/Statements/return) được gọi bên ngoài một [hàm](/en-US/docs/Web/JavaScript/Guide/Functions). Có thể có dấu ngoặc nhọn bị thiếu ở đâu đó? Câu lệnh `return` phải nằm trong một hàm, vì nó kết thúc việc thực thi hàm và chỉ định một giá trị để trả về cho người gọi hàm.

## Ví dụ

### Thiếu dấu ngoặc nhọn

```js-nolint example-bad
function cheer(score) {
  if (score === 147)
    return "Maximum!";
  }
  if (score > 100) {
    return "Century!";
  }
}

// SyntaxError: return not in function
```

Các dấu ngoặc nhọn trông đúng ở cái nhìn đầu tiên, nhưng đoạn code này thiếu `{` sau câu lệnh `if` đầu tiên. Đúng phải là:

```js example-good
function cheer(score) {
  if (score === 147) {
    return "Maximum!";
  }
  if (score > 100) {
    return "Century!";
  }
}
```

## Xem thêm

- [`return`](/en-US/docs/Web/JavaScript/Reference/Statements/return)
