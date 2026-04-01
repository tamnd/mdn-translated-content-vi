---
title: Set[Symbol.species]
short-title: "[Symbol.species]"
slug: Web/JavaScript/Reference/Global_Objects/Set/Symbol.species
page-type: javascript-static-accessor-property
browser-compat: javascript.builtins.Set.@@species
sidebar: jsref
---

Thuộc tính accessor tĩnh **`Set[Symbol.species]`** là một thuộc tính accessor không được sử dụng chỉ định cách sao chép các đối tượng `Set`.

## Cú pháp

```js-nolint
Set[Symbol.species]
```

### Giá trị trả về

Giá trị của constructor (`this`) mà `get [Symbol.species]` được gọi trên. Giá trị trả về được dùng để khởi tạo các instance `Set` được sao chép.

## Mô tả

Thuộc tính accessor `[Symbol.species]` trả về constructor mặc định cho các đối tượng `Set`. Các constructor lớp con có thể ghi đè nó để thay đổi việc gán constructor.

> [!NOTE]
> Thuộc tính này hiện không được sử dụng bởi bất kỳ phương thức `Set` nào.

## Ví dụ

### Species trong các đối tượng thông thường

Thuộc tính `[Symbol.species]` trả về hàm constructor mặc định, là constructor `Set` cho `Set`.

```js
Set[Symbol.species]; // function Set()
```

### Species trong các đối tượng dẫn xuất

Trong một instance của lớp con `Set` tùy chỉnh, chẳng hạn như `MySet`, species của `MySet` là constructor `MySet`. Tuy nhiên, bạn có thể muốn ghi đè điều này, để trả về các đối tượng `Set` cha trong các phương thức lớp dẫn xuất của bạn:

```js
class MySet extends Set {
  // Overwrite MySet species to the parent Set constructor
  static get [Symbol.species]() {
    return Set;
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Set")}}
- {{jsxref("Symbol.species")}}
