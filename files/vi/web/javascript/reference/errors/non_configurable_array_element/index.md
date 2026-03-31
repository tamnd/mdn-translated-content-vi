---
title: "TypeError: can't delete non-configurable array element"
slug: Web/JavaScript/Reference/Errors/Non_configurable_array_element
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "can't delete non-configurable array element" xảy ra khi cố gắng [rút ngắn độ dài](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length#shortening_an_array) của một mảng, nhưng một trong các phần tử của mảng là [non-configurable](/en-US/docs/Web/JavaScript/Guide/Data_structures#properties).

## Thông báo

```plain
TypeError: Cannot delete property '1' of [object Array] (V8-based)
TypeError: can't delete non-configurable array element (Firefox)
TypeError: Unable to delete property. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Đã cố gắng [rút ngắn độ dài](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length#shortening_an_array) của một mảng, nhưng một trong các phần tử của mảng là [non-configurable](/en-US/docs/Web/JavaScript/Guide/Data_structures#properties). Khi rút ngắn mảng, các phần tử vượt quá độ dài mảng mới sẽ bị xóa, điều đó thất bại trong tình huống này.

Thuộc tính `configurable` kiểm soát liệu thuộc tính có thể bị xóa khỏi đối tượng hay không và liệu các thuộc tính của nó (ngoài `writable`) có thể bị thay đổi hay không.

Thông thường, các thuộc tính trong một đối tượng được tạo bởi [array initializer](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#array_literals) là configurable. Tuy nhiên, ví dụ khi sử dụng {{jsxref("Object.defineProperty()")}}, thuộc tính mặc định là không configurable.

## Ví dụ

### Thuộc tính non-configurable được tạo bởi Object.defineProperty

{{jsxref("Object.defineProperty()")}} tạo ra các thuộc tính non-configurable theo mặc định nếu bạn không chỉ định chúng là configurable.

```js example-bad
"use strict";
const arr = [];
Object.defineProperty(arr, 0, { value: 0 });
Object.defineProperty(arr, 1, { value: "1" });

arr.length = 1;
// TypeError: can't delete non-configurable array element
```

Bạn cần đặt các phần tử là configurable nếu muốn rút ngắn mảng.

```js example-good
"use strict";
const arr = [];
Object.defineProperty(arr, 0, { value: 0, configurable: true });
Object.defineProperty(arr, 1, { value: "1", configurable: true });

arr.length = 1;
```

### Mảng bị đóng (Sealed Arrays)

Hàm {{jsxref("Object.seal()")}} đánh dấu tất cả các phần tử hiện có là non-configurable.

```js example-bad
"use strict";
const arr = [1, 2, 3];
Object.seal(arr);

arr.length = 1;
// TypeError: can't delete non-configurable array element
```

Bạn cần xóa lời gọi {{jsxref("Object.seal()")}}, hoặc tạo một bản sao của nó. Trong trường hợp bản sao, việc rút ngắn bản sao của mảng không làm thay đổi độ dài của mảng gốc.

```js example-good
"use strict";
const arr = [1, 2, 3];
Object.seal(arr);

// Sao chép mảng ban đầu để rút ngắn bản sao
const copy = Array.from(arr);
copy.length = 1;
// arr.length === 3
```

## Xem thêm

- [\[\[Configurable\]\]](/en-US/docs/Web/JavaScript/Guide/Data_structures#properties)
- {{jsxref("Array/length", "length")}}
- {{jsxref("Object.defineProperty()")}}
- {{jsxref("Object.seal()")}}
