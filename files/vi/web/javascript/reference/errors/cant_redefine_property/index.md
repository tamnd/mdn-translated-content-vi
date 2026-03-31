---
title: 'TypeError: can''t redefine non-configurable property "x"'
slug: Web/JavaScript/Reference/Errors/Cant_redefine_property
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "can't redefine non-configurable property" xảy ra khi cố gắng
định nghĩa lại một thuộc tính, nhưng thuộc tính đó là [non-configurable](/en-US/docs/Web/JavaScript/Guide/Data_structures#properties).

## Thông báo

```plain
TypeError: Cannot redefine property: "x" (V8-based)
TypeError: can't redefine non-configurable property "x" (Firefox)
TypeError: Attempting to change value of a readonly property. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Đã cố gắng định nghĩa lại một thuộc tính, nhưng thuộc tính đó là [non-configurable](/en-US/docs/Web/JavaScript/Guide/Data_structures#properties). Thuộc tính
`configurable` kiểm soát liệu thuộc tính có thể bị xóa khỏi
đối tượng hay không và liệu các thuộc tính của nó (ngoài `writable`) có thể thay đổi hay không.
Thông thường, các thuộc tính trong một đối tượng được tạo bởi
[object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) là configurable. Tuy nhiên, ví dụ, khi sử dụng
{{jsxref("Object.defineProperty()")}}, thuộc tính không configurable theo mặc định.

## Ví dụ

### Các thuộc tính non-configurable được tạo bởi Object.defineProperty

{{jsxref("Object.defineProperty()")}} tạo các thuộc tính non-configurable nếu bạn
chưa chỉ định chúng là configurable.

```js example-bad
const obj = Object.create({});
Object.defineProperty(obj, "foo", { value: "bar" });

Object.defineProperty(obj, "foo", { value: "baz" });
// TypeError: can't redefine non-configurable property "foo"
```

Bạn sẽ cần đặt thuộc tính "foo" là configurable, nếu bạn muốn định nghĩa lại nó
sau trong code.

```js example-good
const obj = Object.create({});
Object.defineProperty(obj, "foo", { value: "bar", configurable: true });
Object.defineProperty(obj, "foo", { value: "baz", configurable: true });
```

## Xem thêm

- [\[\[Configurable\]\]](/en-US/docs/Web/JavaScript/Guide/Data_structures#properties)
- {{jsxref("Object.defineProperty()")}}
