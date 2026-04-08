---
title: "SyntaxError: Unexpected '#' used outside of class body"
slug: Web/JavaScript/Reference/Errors/Hash_outside_class
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "Unexpected '#' used outside of class body" xảy ra khi dấu thăng ("#") xuất hiện trong một ngữ cảnh không mong đợi, phổ biến nhất là [ngoài phần khai báo lớp](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements). Dấu thăng hợp lệ ở đầu tệp như [bình luận hashbang](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar), hoặc bên trong lớp như một phần của trường private. Bạn có thể gặp lỗi này nếu quên dấu ngoặc kép khi cố gắng truy cập một định danh DOM.

## Thông báo

```plain
SyntaxError: Unexpected '#' used outside of class body.
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Chúng ta gặp `#` ở nơi không mong đợi. Điều này có thể do mã đã được di chuyển và không còn là một phần của lớp, bình luận hashbang được tìm thấy trên một dòng khác ngoài dòng đầu tiên của tệp, hoặc vô tình quên dấu ngoặc kép xung quanh định danh DOM.

## Ví dụ

### Thiếu dấu ngoặc kép

Đối với mỗi trường hợp, có thể có điều gì đó hơi sai. Ví dụ:

```js-nolint example-bad
document.querySelector(#some-element)
```

Điều này có thể được sửa bằng cách:

```js example-good
document.querySelector("#some-element");
```

### Ngoài phạm vi lớp

```js-nolint example-bad
class ClassWithPrivateField {
  #privateField;

  constructor() {}
}

this.#privateField = 42;
```

Điều này có thể được sửa bằng cách di chuyển trường private trở lại vào lớp:

```js example-good
class ClassWithPrivateField {
  #privateField;

  constructor() {
    this.#privateField = 42;
  }
}
```

## Xem thêm

- {{jsxref("SyntaxError")}}
