---
title: Enumerability and ownership of properties
slug: Web/JavaScript/Guide/Enumerability_and_ownership_of_properties
page-type: guide
sidebar: jssidebar
---

Mỗi thuộc tính trong các đối tượng JavaScript có thể được phân loại theo ba yếu tố:

- Enumerable (liệt kê được) hoặc non-enumerable (không liệt kê được);
- String hoặc [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol);
- Own property (thuộc tính riêng) hoặc inherited property (thuộc tính kế thừa) từ chuỗi prototype.

_Enumerable properties_ là những thuộc tính có cờ enumerable bên trong được đặt thành true, đây là mặc định cho các thuộc tính được tạo thông qua gán đơn giản hoặc thông qua trình khởi tạo thuộc tính. Các thuộc tính được định nghĩa thông qua [`Object.defineProperty`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty) và các phương thức tương tự mặc định không phải là enumerable. Hầu hết các phương tiện lặp (chẳng hạn như vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in) và [`Object.keys`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys)) chỉ duyệt qua các khóa enumerable.

Ownership (quyền sở hữu) của các thuộc tính được xác định bởi việc thuộc tính có thuộc trực tiếp về đối tượng hay không, chứ không phải thuộc chuỗi prototype của nó.

Tất cả các thuộc tính, dù enumerable hay không, string hay symbol, own hay inherited, đều có thể được truy cập bằng [ký hiệu chấm hoặc ký hiệu dấu ngoặc vuông](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors). Trong phần này, chúng ta sẽ tập trung vào các phương tiện mà JavaScript cung cấp để duyệt qua một nhóm các thuộc tính đối tượng từng cái một.

## Truy vấn thuộc tính của đối tượng

Có bốn cách tích hợp để truy vấn một thuộc tính của đối tượng. Tất cả đều hỗ trợ cả khóa string và symbol. Bảng sau tóm tắt khi nào mỗi phương thức trả về `true`.

|                                                                                                             | Enumerable, own | Enumerable, inherited | Non-enumerable, own | Non-enumerable, inherited |
| ----------------------------------------------------------------------------------------------------------- | --------------- | --------------------- | ------------------- | ------------------------- |
| [`propertyIsEnumerable()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/propertyIsEnumerable) | `true ✅`       | `false ❌`            | `false ❌`          | `false ❌`                |
| [`hasOwnProperty()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty)             | `true ✅`       | `false ❌`            | `true ✅`           | `false ❌`                |
| [`Object.hasOwn()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwn)                      | `true ✅`       | `false ❌`            | `true ✅`           | `false ❌`                |
| [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in)                                                   | `true ✅`       | `true ✅`             | `true ✅`           | `true ✅`                 |

## Duyệt qua các thuộc tính của đối tượng

Có nhiều phương thức trong JavaScript duyệt qua một nhóm các thuộc tính của đối tượng. Đôi khi, các thuộc tính này được trả về dưới dạng mảng; đôi khi chúng được lặp từng cái một trong một vòng lặp; đôi khi chúng được sử dụng để xây dựng hoặc thay đổi một đối tượng khác. Bảng sau tóm tắt khi nào một thuộc tính có thể được duyệt.

Các phương thức chỉ duyệt qua thuộc tính string hoặc chỉ thuộc tính symbol sẽ có ghi chú thêm. ✅ có nghĩa là thuộc tính thuộc loại này sẽ được duyệt; ❌ có nghĩa là không.

|                                                                                                                                                                                                                                                                        | Enumerable, own   | Enumerable, inherited | Non-enumerable, own | Non-enumerable, inherited |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------- | --------------------- | ------------------- | ------------------------- |
| [`Object.keys`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys)<br />[`Object.values`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/values)<br />[`Object.entries`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/entries) | ✅<br />(strings) | ❌                    | ❌                  | ❌                        |
| [`Object.getOwnPropertyNames`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyNames)                                                                                                                                                         | ✅<br />(strings) | ❌                    | ✅<br />(strings)   | ❌                        |
| [`Object.getOwnPropertySymbols`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertySymbols)                                                                                                                                                     | ✅<br />(symbols) | ❌                    | ✅<br />(symbols)   | ❌                        |
| [`Object.getOwnPropertyDescriptors`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyDescriptors)                                                                                                                                             | ✅                | ❌                    | ✅                  | ❌                        |
| [`Reflect.ownKeys`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Reflect/ownKeys)                                                                                                                                                                               | ✅                | ❌                    | ✅                  | ❌                        |
| [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in)                                                                                                                                                                                                 | ✅<br />(strings) | ✅<br />(strings)     | ❌                  | ❌                        |
| [`Object.assign`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign)<br />(After the first parameter)                                                                                                                                                  | ✅                | ❌                    | ❌                  | ❌                        |
| [Object spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)                                                                                                                                                                                          | ✅                | ❌                    | ❌                  | ❌                        |

## Lấy thuộc tính theo enumerability/ownership

Lưu ý rằng đây không phải là thuật toán hiệu quả nhất cho mọi trường hợp, nhưng hữu ích để minh họa nhanh.

- Phát hiện có thể xảy ra bằng `SimplePropertyRetriever.theGetMethodYouWant(obj).includes(prop)`
- Lặp có thể xảy ra bằng `SimplePropertyRetriever.theGetMethodYouWant(obj).forEach((value, prop) => {});` (hoặc dùng `filter()`, `map()`, v.v.)

```js
const SimplePropertyRetriever = {
  getOwnEnumProps(obj) {
    return this._getPropertyNames(obj, true, false, this._enumerable);
    // Or could use for...in filtered with Object.hasOwn or just this: return Object.keys(obj);
  },
  getOwnNonEnumProps(obj) {
    return this._getPropertyNames(obj, true, false, this._notEnumerable);
  },
  getOwnProps(obj) {
    return this._getPropertyNames(
      obj,
      true,
      false,
      this._enumerableAndNotEnumerable,
    );
    // Or just use: return Object.getOwnPropertyNames(obj);
  },
  getPrototypeEnumProps(obj) {
    return this._getPropertyNames(obj, false, true, this._enumerable);
  },
  getPrototypeNonEnumProps(obj) {
    return this._getPropertyNames(obj, false, true, this._notEnumerable);
  },
  getPrototypeProps(obj) {
    return this._getPropertyNames(
      obj,
      false,
      true,
      this._enumerableAndNotEnumerable,
    );
  },
  getOwnAndPrototypeEnumProps(obj) {
    return this._getPropertyNames(obj, true, true, this._enumerable);
    // Or could use unfiltered for...in
  },
  getOwnAndPrototypeNonEnumProps(obj) {
    return this._getPropertyNames(obj, true, true, this._notEnumerable);
  },
  getOwnAndPrototypeEnumAndNonEnumProps(obj) {
    return this._getPropertyNames(
      obj,
      true,
      true,
      this._enumerableAndNotEnumerable,
    );
  },
  // Private static property checker callbacks
  _enumerable(obj, prop) {
    return Object.prototype.propertyIsEnumerable.call(obj, prop);
  },
  _notEnumerable(obj, prop) {
    return !Object.prototype.propertyIsEnumerable.call(obj, prop);
  },
  _enumerableAndNotEnumerable(obj, prop) {
    return true;
  },
  // Inspired by http://stackoverflow.com/a/8024294/271577
  _getPropertyNames(obj, iterateSelf, iteratePrototype, shouldInclude) {
    const props = [];
    do {
      if (iterateSelf) {
        Object.getOwnPropertyNames(obj).forEach((prop) => {
          if (props.indexOf(prop) === -1 && shouldInclude(obj, prop)) {
            props.push(prop);
          }
        });
      }
      if (!iteratePrototype) {
        break;
      }
      iterateSelf = true;
      obj = Object.getPrototypeOf(obj);
    } while (obj);
    return props;
  },
};
```

## Xem thêm

- [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in)
- [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in)
- [`Object.prototype.hasOwnProperty()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty)
- [`Object.prototype.propertyIsEnumerable()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/propertyIsEnumerable)
- [`Object.getOwnPropertyNames()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyNames)
- [`Object.getOwnPropertySymbols()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertySymbols)
- [`Object.keys()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys)
- [`Object.getOwnPropertyDescriptors()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyDescriptors)
- [`Object.hasOwn()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwn)
- [`Reflect.ownKeys()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Reflect/ownKeys)
