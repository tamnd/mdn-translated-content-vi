---
title: globalThis
slug: Web/JavaScript/Reference/Global_Objects/globalThis
page-type: javascript-global-property
browser-compat: javascript.builtins.globalThis
sidebar: jssidebar
---

Global property **`globalThis`** chứa giá trị [`this` toàn cục](/en-US/docs/Web/JavaScript/Reference/Operators/this#global_context), thường tương đương với [global object](/en-US/docs/Glossary/Global_object).

{{InteractiveExample("JavaScript Demo: globalThis", "shorter")}}

```js interactive-example
function canMakeHTTPRequest() {
  return typeof globalThis.XMLHttpRequest === "function";
}

console.log(canMakeHTTPRequest());
// Expected output (in a browser): true
```

## Giá trị

Global object `this`.

{{js_property_attributes(1, 0, 1)}}

> [!NOTE]
> Thuộc tính `globalThis` có thể cấu hình và ghi được để các tác giả mã có thể ẩn nó khi thực thi mã không tin cậy và ngăn không cho lộ global object.

## Mô tả

Trong lịch sử, việc truy cập global object yêu cầu cú pháp khác nhau ở các môi trường JavaScript khác nhau. Trên web bạn có thể dùng {{domxref("Window/window", "window")}}, {{domxref("Window/self", "self")}}, hay {{domxref("Window/frames", "frames")}} — nhưng trong [Web Workers](/en-US/docs/Web/API/Worker) chỉ có `self` hoạt động. Trong Node.js không có cái nào trong số đó hoạt động, thay vào đó bạn phải dùng `global`. Từ khóa `this` có thể được dùng trong các hàm chạy ở non-strict mode, nhưng `this` sẽ là `undefined` trong các module và trong các hàm chạy ở strict mode. Bạn cũng có thể dùng `Function('return this')()`, nhưng các môi trường vô hiệu hóa {{jsxref("Global_Objects/eval", "eval()")}}, như {{Glossary("CSP")}} trong trình duyệt, ngăn việc sử dụng {{jsxref("Function")}} theo cách này.

Thuộc tính `globalThis` cung cấp một cách tiêu chuẩn để truy cập giá trị `this` toàn cục (và do đó là bản thân global object) trên các môi trường. Không giống các thuộc tính tương tự như `window` và `self`, nó được đảm bảo hoạt động trong cả ngữ cảnh window và non-window. Theo cách này, bạn có thể truy cập global object theo cách nhất quán mà không cần biết môi trường mà code đang chạy. Để dễ nhớ tên, hãy nhớ rằng trong global scope, giá trị `this` là `globalThis`.

> [!NOTE]
> `globalThis` nói chung là cùng khái niệm với global object (tức là thêm các thuộc tính vào `globalThis` làm chúng trở thành biến toàn cục) — điều này đúng với trình duyệt và Node — nhưng các host được phép cung cấp giá trị khác cho `globalThis` không liên quan đến global object.

### HTML và WindowProxy

Trong nhiều engine, `globalThis` sẽ là tham chiếu đến actual global object, nhưng trong trình duyệt web, do các cân nhắc bảo mật iframe và cross-window, nó tham chiếu đến {{jsxref("Proxy")}} bao quanh actual global object (mà bạn không thể truy cập trực tiếp). Sự phân biệt này hiếm khi liên quan trong sử dụng thông thường, nhưng quan trọng phải biết.

### Đặt tên

Một số lựa chọn tên phổ biến khác như `self` và `global` đã bị loại bỏ vì khả năng phá vỡ tính tương thích với mã hiện có. Xem [tài liệu "naming" của đề xuất ngôn ngữ](https://github.com/tc39/proposal-global/blob/master/NAMING.md) để biết thêm chi tiết.

`globalThis` theo nghĩa đen là giá trị `this` toàn cục. Đây là giá trị tương tự như giá trị `this` trong một hàm non-strict được gọi không có đối tượng. Đây cũng là giá trị của `this` trong global scope của một script.

## Ví dụ

### Tìm kiếm global qua các môi trường

Thông thường, global object không cần được chỉ định tường minh — các thuộc tính của nó có thể truy cập tự động như các biến toàn cục.

```js
console.log(window.Math === Math); // true
```

Tuy nhiên, một trường hợp cần truy cập tường minh global object là khi _ghi_ vào nó, thường để tạo [polyfill](/en-US/docs/Glossary/Polyfill).

Trước `globalThis`, cách duy nhất đáng tin cậy đa nền tảng để lấy global object cho một môi trường là `Function('return this')()`. Tuy nhiên, điều này gây ra vi phạm [CSP](/en-US/docs/Web/HTTP/Guides/CSP) trong một số cài đặt, vì vậy các tác giả thường dùng định nghĩa từng phần như thế này (được điều chỉnh một chút từ [nguồn core-js gốc](https://github.com/zloirock/core-js/blob/master/packages/core-js/internals/global-this.js)):

```js
function check(it) {
  // Math is known to exist as a global in every environment.
  return it && it.Math === Math && it;
}

const globalObject =
  check(typeof window === "object" && window) ||
  check(typeof self === "object" && self) ||
  check(typeof global === "object" && global) ||
  // This returns undefined when running in strict mode
  (function () {
    return this;
  })() ||
  Function("return this")();
```

Sau khi có được global object, chúng ta có thể định nghĩa các global mới trên nó. Ví dụ, thêm một implementation cho [`Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl):

```js
if (typeof globalObject.Intl === "undefined") {
  // No Intl in this environment; define our own on the global scope
  Object.defineProperty(globalObject, "Intl", {
    value: {
      // Our Intl implementation
    },
    enumerable: false,
    configurable: true,
    writable: true,
  });
}
```

Với `globalThis` có sẵn, việc tìm kiếm thêm global qua các môi trường không còn cần thiết nữa:

```js
if (typeof globalThis.Intl === "undefined") {
  Object.defineProperty(globalThis, "Intl", {
    value: {
      // Our Intl implementation
    },
    enumerable: false,
    configurable: true,
    writable: true,
  });
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `globalThis` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-globalthis)
- [es-shims polyfill của `globalThis`](https://www.npmjs.com/package/globalthis)
- {{jsxref("Operators/this", "this")}}
