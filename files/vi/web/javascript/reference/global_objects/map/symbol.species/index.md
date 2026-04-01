---
title: Map[Symbol.species]
short-title: "[Symbol.species]"
slug: Web/JavaScript/Reference/Global_Objects/Map/Symbol.species
page-type: javascript-static-accessor-property
browser-compat: javascript.builtins.Map.@@species
sidebar: jsref
---

Thuộc tính accessor tĩnh **`Map[Symbol.species]`** là một thuộc tính accessor không được sử dụng chỉ định cách sao chép các đối tượng `Map`.

## Cú pháp

```js-nolint
Map[Symbol.species]
```

### Giá trị trả về

Giá trị của constructor (`this`) mà `get [Symbol.species]` được gọi trên. Giá trị trả về được dùng để khởi tạo các instance `Map` được sao chép.

## Mô tả

Thuộc tính accessor `[Symbol.species]` trả về constructor mặc định cho các đối tượng `Map`. Các constructor lớp con có thể ghi đè nó để thay đổi việc gán constructor.

> [!NOTE]
> Thuộc tính này hiện không được sử dụng bởi bất kỳ phương thức `Map` nào.

## Ví dụ

### Species trong các đối tượng thông thường

Thuộc tính `[Symbol.species]` trả về hàm constructor mặc định, là constructor `Map` cho `Map`.

```js
Map[Symbol.species]; // function Map()
```

### Species trong các đối tượng dẫn xuất

Trong một instance của lớp con `Map` tùy chỉnh, chẳng hạn như `MyMap`, species của `MyMap` là constructor `MyMap`. Tuy nhiên, bạn có thể muốn ghi đè điều này, để trả về các đối tượng `Map` cha trong các phương thức lớp dẫn xuất của bạn:

```js
class MyMap extends Map {
  // Overwrite MyMap species to the parent Map constructor
  static get [Symbol.species]() {
    return Map;
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map")}}
- {{jsxref("Symbol.species")}}
