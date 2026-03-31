---
title: Reflect
slug: Web/JavaScript/Reference/Global_Objects/Reflect
page-type: javascript-namespace
browser-compat: javascript.builtins.Reflect
sidebar: jsref
---

Đối tượng namespace **`Reflect`** chứa các phương thức tĩnh để gọi các phương thức nội tại của đối tượng JavaScript có thể chặn. Các phương thức này giống với các phương thức của [proxy handler](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy).

## Mô tả

Không giống hầu hết các đối tượng toàn cục khác, `Reflect` không phải là constructor. Bạn không thể dùng nó với [toán tử `new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) hay gọi đối tượng `Reflect` như một hàm. Tất cả các thuộc tính và phương thức của `Reflect` là tĩnh (giống như đối tượng {{jsxref("Math")}}).

Đối tượng `Reflect` cung cấp một tập hợp các hàm tĩnh có cùng tên với [các phương thức proxy handler](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy).

Trường hợp sử dụng chính của `Reflect` là cung cấp hành vi chuyển tiếp mặc định trong các trap handler của `Proxy`. Một [trap](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#terminology) được dùng để chặn một thao tác trên một đối tượng — nó cung cấp một triển khai tùy chỉnh cho một [phương thức nội tại của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods). API `Reflect` được dùng để gọi phương thức nội tại tương ứng. Ví dụ, code bên dưới tạo một proxy `p` với trap [`deleteProperty`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/deleteProperty) chặn phương thức nội tại `[[Delete]]`. `Reflect.deleteProperty()` được dùng để gọi hành vi `[[Delete]]` mặc định trên `targetObject` trực tiếp. Bạn có thể thay thế nó bằng [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete), nhưng dùng `Reflect` giúp bạn không phải nhớ cú pháp mà mỗi phương thức nội tại tương ứng với.

```js
const p = new Proxy(
  {},
  {
    deleteProperty(targetObject, property) {
      // Custom functionality: log the deletion
      console.log("Deleting property:", property);

      // Execute the default introspection behavior
      return Reflect.deleteProperty(targetObject, property);
    },
  },
);
```

Các phương thức `Reflect` cũng cho phép kiểm soát tốt hơn cách phương thức nội tại được gọi. Ví dụ, {{jsxref("Reflect.construct()")}} là cách duy nhất để xây dựng một hàm target với một giá trị [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) cụ thể. Nếu bạn dùng toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) để gọi một hàm, giá trị `new.target` luôn là chính hàm đó. Điều này có các hiệu ứng quan trọng với [subclassing](/en-US/docs/Web/JavaScript/Reference/Operators/new.target#new.target_using_reflect.construct). Ví dụ khác, {{jsxref("Reflect.get()")}} cho phép bạn chạy một [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) với giá trị `this` tùy chỉnh, trong khi [các accessor thuộc tính](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) luôn dùng đối tượng hiện tại làm giá trị `this`.

Hầu hết hành vi của mỗi phương thức `Reflect` đều có thể thực hiện bằng một số cú pháp hoặc phương thức khác. Một số phương thức này có các phương thức tĩnh tương ứng cùng tên trên {{jsxref("Object")}}, mặc dù chúng có một số khác biệt nhỏ. Để biết sự khác biệt chính xác, hãy xem mô tả cho từng phương thức `Reflect`.

## Thuộc tính tĩnh

- `Reflect[Symbol.toStringTag]`
  - : Giá trị khởi đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Reflect"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức tĩnh

- {{jsxref("Reflect.apply()")}}
  - : Gọi một hàm `target` với các đối số được chỉ định bởi tham số `argumentsList`. Xem thêm {{jsxref("Function.prototype.apply()")}}.
- {{jsxref("Reflect.construct()")}}
  - : [Toán tử `new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) dưới dạng hàm. Tương đương với việc gọi `new target(...argumentsList)`. Cũng cung cấp tùy chọn để chỉ định một prototype khác.
- {{jsxref("Reflect.defineProperty()")}}
  - : Tương tự {{jsxref("Object.defineProperty()")}}. Trả về một boolean là `true` nếu thuộc tính được định nghĩa thành công.
- {{jsxref("Reflect.deleteProperty()")}}
  - : [Toán tử `delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete) dưới dạng hàm. Tương đương với việc gọi `delete target[propertyKey]`.
- {{jsxref("Reflect.get()")}}
  - : Trả về giá trị của thuộc tính. Hoạt động như việc lấy một thuộc tính từ một đối tượng (`target[propertyKey]`) dưới dạng hàm.
- {{jsxref("Reflect.getOwnPropertyDescriptor()")}}
  - : Tương tự {{jsxref("Object.getOwnPropertyDescriptor()")}}. Trả về property descriptor của thuộc tính đã cho nếu nó tồn tại trên đối tượng, {{jsxref("undefined")}} nếu không.
- {{jsxref("Reflect.getPrototypeOf()")}}
  - : Giống {{jsxref("Object.getPrototypeOf()")}}.
- {{jsxref("Reflect.has()")}}
  - : Trả về một boolean cho biết target có thuộc tính đó không. Bao gồm cả thuộc tính riêng hoặc kế thừa. Hoạt động như [toán tử `in`](/en-US/docs/Web/JavaScript/Reference/Operators/in) dưới dạng hàm.
- {{jsxref("Reflect.isExtensible()")}}
  - : Giống {{jsxref("Object.isExtensible()")}}. Trả về một boolean là `true` nếu target có thể mở rộng.
- {{jsxref("Reflect.ownKeys()")}}
  - : Trả về một mảng các key thuộc tính riêng (không kế thừa) của đối tượng target.
- {{jsxref("Reflect.preventExtensions()")}}
  - : Tương tự {{jsxref("Object.preventExtensions()")}}. Trả về một boolean là `true` nếu cập nhật thành công.
- {{jsxref("Reflect.set()")}}
  - : Một hàm gán giá trị cho các thuộc tính. Trả về một boolean là `true` nếu cập nhật thành công.
- {{jsxref("Reflect.setPrototypeOf()")}}
  - : Một hàm thiết lập prototype của một đối tượng. Trả về một boolean là `true` nếu cập nhật thành công.

## Ví dụ

### Phát hiện xem một đối tượng có chứa thuộc tính nhất định không

```js
const duck = {
  name: "Maurice",
  color: "white",
  greeting() {
    console.log(`Quaaaack! My name is ${this.name}`);
  },
};

Reflect.has(duck, "color");
// true
Reflect.has(duck, "haircut");
// false
```

### Trả về các key riêng của đối tượng

```js
Reflect.ownKeys(duck);
// [ "name", "color", "greeting" ]
```

### Thêm một thuộc tính mới vào đối tượng

```js
Reflect.set(duck, "eyes", "black");
// returns "true" if successful
// "duck" now contains the property "eyes: 'black'"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
