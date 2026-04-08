---
title: Map.prototype.getOrInsert()
short-title: getOrInsert()
slug: Web/JavaScript/Reference/Global_Objects/Map/getOrInsert
page-type: javascript-instance-method
browser-compat: javascript.builtins.Map.getOrInsert
sidebar: jsref
---

Phương thức **`getOrInsert()`** của các instance {{jsxref("Map")}} trả về giá trị tương ứng với khóa được chỉ định trong `Map` này. Nếu khóa không có mặt, nó chèn một entry mới với khóa và giá trị mặc định đã cho, rồi trả về giá trị được chèn.

Nếu việc tính toán giá trị mặc định tốn kém, hãy cân nhắc dùng {{jsxref("Map.prototype.getOrInsertComputed()")}} thay thế, vốn nhận một callback để tính toán giá trị mặc định chỉ khi thực sự cần.

{{InteractiveExample("JavaScript Demo: Map.prototype.getOrInsert()")}}

```js interactive-example
const map = new Map([["bar", "foo"]]);
console.log(map.getOrInsert("bar", "default"));
// Expected output: "foo"

console.log(map.getOrInsert("baz", "default"));
// Expected output: "default"
```

## Cú pháp

```js-nolint
getOrInsert(key, defaultValue)
```

### Tham số

- `key`
  - : Khóa của giá trị cần trả về từ đối tượng `Map`. Các khóa object được so sánh theo [reference](/en-US/docs/Glossary/Object_reference), không theo giá trị.
- `defaultValue`
  - : Giá trị cần chèn và trả về nếu khóa chưa có trong đối tượng `Map`.

### Giá trị trả về

Giá trị được liên kết với khóa được chỉ định trong đối tượng `Map`. Nếu không tìm thấy khóa, `defaultValue` được chèn vào và trả về.

## Mô tả

Phương thức `getOrInsert()` tương đương với đoạn code sau:

```js
if (map.has(key)) {
  return map.get(key);
}
map.set(key, defaultValue);
return defaultValue;
```

Nó cũng tương tự pattern sau (ít đáng tin cậy hơn một chút nếu `null` hay `undefined` là các giá trị hợp lệ trong map của bạn):

```js
map.set(key, map.get(key) ?? defaultValue);
```

## Ví dụ

### Multimap

Trong một map nơi mỗi khóa được ánh xạ đến một mảng giá trị, bạn có thể dùng `getOrInsert()` để đảm bảo rằng mảng tồn tại cho một khóa đã cho trước khi cố gắng push một giá trị mới vào mảng.

```js
map.getOrInsert(key, []).push(value);
```

### Áp dụng giá trị mặc định

Bạn có thể dùng `getOrInsert()` để đảm bảo rằng một khóa tồn tại trong map, ngay cả khi bạn hiện không cần giá trị của nó. Điều này thường dùng để chuẩn hóa đầu vào từ người dùng.

Hãy tưởng tượng bạn có một map về tùy chọn người dùng, và bạn muốn đảm bảo rằng một tùy chọn nhất định luôn được đặt thành giá trị mặc định nếu người dùng chưa chỉ định:

```js
const options = readConfig();
options.getOrInsert("theme", "light");
options.getOrInsert("fontSize", 14);

// Later in your code, you can safely assume these options exist
document.body.dataset.theme = options.get("theme");
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Map.prototype.getOrInsert` trong `core-js`](https://github.com/zloirock/core-js#map-upsert)
- [es-shims polyfill của `Map.prototype.getOrInsert`](https://www.npmjs.com/package/map.prototype.getorinsert)
- {{jsxref("Map")}}
- {{jsxref("Map.prototype.get()")}}
- {{jsxref("Map.prototype.set()")}}
- {{jsxref("Map.prototype.has()")}}
- {{jsxref("Map.prototype.getOrInsertComputed()")}}
