---
title: "SyntaxError: private fields can't be deleted"
slug: Web/JavaScript/Reference/Errors/Cant_delete_private_fields
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "SyntaxError: private fields can't be deleted" xảy ra khi [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete) được dùng trên một [phần tử private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) của class hoặc object.

## Thông báo lỗi

```plain
SyntaxError: Private fields can not be deleted (V8-based)
SyntaxError: private fields can't be deleted (Firefox)
SyntaxError: Cannot delete private field X (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân

Có đoạn code đang cố `delete` một phần tử private (field hoặc method) của object hoặc class. Điều này bị JavaScript cấm — các phần tử private không thể được thêm vào hoặc xóa đi trong lúc chạy chương trình.

## Ví dụ

```js example-bad
class MyClass {
  #myPrivateField;
  deleteIt() {
    delete this.#myPrivateField; // SyntaxError: private fields can't be deleted
  }
}
```

```js example-bad
class MyClass {
  #myPrivateMethod() {
  }
  #deleteIt() {
    delete this.#myPrivateMethod; // SyntaxError: private fields can't be deleted
  }
}
```

## Xem thêm

- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- [Private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements)
