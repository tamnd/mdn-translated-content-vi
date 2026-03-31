---
title: "SyntaxError: reference to undeclared private field or method #x"
slug: Web/JavaScript/Reference/Errors/Undeclared_private_field_or_method
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "reference to undeclared private field or method #x" xảy ra khi một [tên private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) được sử dụng, nhưng tên private này không được khai báo trong phạm vi class.

## Thông báo

```plain
SyntaxError: Private field '#x' must be declared in an enclosing class (V8-based)
SyntaxError: reference to undeclared private field or method #x (Firefox)
SyntaxError: Cannot reference undeclared private names: "#x" (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Không giống như các thuộc tính string hoặc symbol thông thường, trả về `undefined` nếu thuộc tính không tồn tại, tên private rất nghiêm ngặt và chỉ có thể được truy cập hợp lệ nếu chúng thực sự tồn tại. Việc truy cập một tên private chưa được khai báo sẽ dẫn đến lỗi cú pháp, trong khi việc truy cập một tên private đã được khai báo nhưng không tồn tại trên đối tượng sẽ dẫn đến [lỗi type](/en-US/docs/Web/JavaScript/Reference/Errors/Get_set_missing_private).

## Ví dụ

### Trường private chưa được khai báo

Bạn không thể truy cập một trường private không được khai báo trong phạm vi class.

```js example-bad
class MyClass {
  doSomething() {
    console.log(this.#x);
  }
}
```

Lỗi tương tự xảy ra nếu bạn sử dụng toán tử {{jsxref("Operators/in", "in")}} để kiểm tra một trường private chưa được khai báo.

```js example-bad
class MyClass {
  doSomething() {
    console.log(#x in this);
  }
}
```

Những đoạn code này có thể là lỗi vì không thể có `#x` tồn tại trên `this` nếu nó không được khai báo trong phạm vi class. Lưu ý rằng bạn không thể tự động _thêm_ các phần tử private vào các đối tượng không liên quan. Bạn nên xóa code này hoặc khai báo trường private trong phạm vi class.

```js example-good
class MyClass {
  #x = 0;
  doSomething() {
    console.log(this.#x);
  }
}
```

## Xem thêm

- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- [Private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements)
