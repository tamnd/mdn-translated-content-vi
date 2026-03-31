---
title: 'SyntaxError: "use strict" not allowed in function with non-simple parameters'
slug: Web/JavaScript/Reference/Errors/Strict_non_simple_params
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "`"use strict"` not allowed in function" xảy ra khi một chỉ thị `"use strict"` được sử dụng ở đầu một hàm có {{jsxref("Functions/Default_parameters", "tham số mặc định", "", 1)}}, {{jsxref("Functions/rest_parameters", "tham số rest", "", 1)}}, hoặc {{jsxref("Operators/Destructuring", "tham số destructuring", "", 1)}}.

## Thông báo

```plain
SyntaxError: Illegal 'use strict' directive in function with non-simple parameter list (V8-based)
SyntaxError: "use strict" not allowed in function with default parameter (Firefox)
SyntaxError: "use strict" not allowed in function with rest parameter (Firefox)
SyntaxError: "use strict" not allowed in function with destructuring parameter (Firefox)
SyntaxError: 'use strict' directive not allowed inside a function with a non-simple parameter list. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}.

## Điều gì đã xảy ra?

Một chỉ thị `"use strict"` được viết ở đầu một hàm có một trong các tham số sau:

- {{jsxref("Functions/Default_parameters", "Tham số mặc định", "", 1)}}
- {{jsxref("Functions/rest_parameters", "Tham số rest", "", 1)}}
- {{jsxref("Operators/Destructuring", "Tham số destructuring", "", 1)}}

Một chỉ thị `"use strict"` không được phép ở đầu các hàm như vậy theo đặc tả ECMAScript.

## Ví dụ

### Câu lệnh hàm

Trong trường hợp này, hàm `sum` có các tham số mặc định `a=1` và `b=2`:

```js-nolint example-bad
function sum(a = 1, b = 2) {
  // SyntaxError: "use strict" not allowed in function with default parameter
  "use strict";
  return a + b;
}
```

Nếu hàm nên ở trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), và toàn bộ script hoặc hàm bao ngoài cũng có thể ở trong chế độ strict, bạn có thể di chuyển chỉ thị `"use strict"` ra ngoài hàm:

```js example-good
"use strict";
function sum(a = 1, b = 2) {
  return a + b;
}
```

### Biểu thức hàm

Một biểu thức hàm có thể sử dụng cách giải quyết khác:

```js-nolint example-bad
const sum = function sum([a, b]) {
  // SyntaxError: "use strict" not allowed in function with destructuring parameter
  "use strict";
  return a + b;
};
```

Điều này có thể được chuyển đổi thành biểu thức sau:

```js example-good
const sum = (function () {
  "use strict";
  return function sum([a, b]) {
    return a + b;
  };
})();
```

### Hàm mũi tên

Nếu một hàm mũi tên cần truy cập biến `this`, bạn có thể sử dụng hàm mũi tên như là hàm bao ngoài:

```js-nolint example-bad
const callback = (...args) => {
  // SyntaxError: "use strict" not allowed in function with rest parameter
  "use strict";
  return this.run(args);
};
```

Điều này có thể được chuyển đổi thành biểu thức sau:

```js example-good
const callback = (() => {
  "use strict";
  return (...args) => this.run(args);
})();
```

## Xem thêm

- {{jsxref("Strict_mode", "Chế độ strict", "", 1)}}
- {{jsxref("Statements/function", "câu lệnh function", "", 1)}}
- {{jsxref("Operators/function", "biểu thức function", "", 1)}}
- {{jsxref("Functions/Default_parameters", "Tham số mặc định", "", 1)}}
- {{jsxref("Functions/rest_parameters", "Tham số rest", "", 1)}}
- {{jsxref("Operators/Destructuring", "Tham số destructuring", "", 1)}}
