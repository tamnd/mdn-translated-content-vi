---
title: import()
slug: Web/JavaScript/Reference/Operators/import
page-type: javascript-operator
browser-compat: javascript.operators.import
sidebar: jssidebar
---

Cú pháp **`import()`**, thường được gọi là _dynamic import_ (nhập động), là một biểu thức dạng hàm cho phép tải một module ECMAScript một cách bất đồng bộ và động vào một môi trường có thể không phải module.

Không giống như [counterpart dạng khai báo](/en-US/docs/Web/JavaScript/Reference/Statements/import), dynamic import chỉ được đánh giá khi cần thiết và cho phép linh hoạt cú pháp hơn.

## Cú pháp

```js-nolint
import(moduleName)
import(moduleName, options)
```

Lời gọi `import()` là một cú pháp trông giống lời gọi hàm, nhưng `import` chính nó là một từ khóa, không phải hàm. Bạn không thể đặt alias cho nó như `const myImport = import`, điều này sẽ ném ra {{jsxref("SyntaxError")}}.

[Trailing commas](/en-US/docs/Web/JavaScript/Reference/Trailing_commas) chỉ được cho phép nếu runtime cũng hỗ trợ `options`. Kiểm tra [browser compatibility](#browser_compatibility).

### Tham số

- `moduleName`
  - : Module cần import. Việc đánh giá specifier được xác định bởi host, nhưng luôn tuân theo thuật toán tương tự như [import declarations](/en-US/docs/Web/JavaScript/Reference/Statements/import) tĩnh.
- `options`
  - : Một đối tượng chứa các tùy chọn import. Khóa sau được nhận dạng:
    - `with`
      - : Các [import attributes](/en-US/docs/Web/JavaScript/Reference/Statements/import/with).

### Giá trị trả về

Trả về một promise mà:

- Nếu module được tham chiếu được tải và đánh giá thành công, sẽ hoàn thành với một [module namespace object](#module_namespace_object): một đối tượng chứa tất cả exports từ `moduleName`.
- Nếu [ép kiểu thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion) của `moduleName` ném ra, sẽ từ chối với lỗi được ném.
- Nếu việc tải module thất bại vì bất kỳ lý do gì, sẽ từ chối với một lỗi được định nghĩa bởi implementation (Node sử dụng `Error` chung, trong khi tất cả trình duyệt sử dụng `TypeError`). Các nguyên nhân phổ biến có thể bao gồm:
  - Trong hệ thống module dựa trên file (ví dụ Node.js), nếu truy cập file system thất bại (từ chối quyền, không tìm thấy file, v.v.).
  - Trong hệ thống module dựa trên web (ví dụ trình duyệt), nếu request mạng thất bại (không có kết nối Internet, vấn đề CORS, v.v.) hoặc xảy ra lỗi HTTP (404, 500, v.v.).
- Nếu việc đánh giá module được tham chiếu ném ra, sẽ từ chối với lỗi được ném.

> [!NOTE]
> `import()` không bao giờ đồng bộ ném ra lỗi.

## Mô tả

Cú pháp khai báo import (`import something from "somewhere"`) là tĩnh và sẽ luôn dẫn đến module được import được đánh giá tại thời điểm tải. Dynamic import cho phép vượt qua sự cứng nhắc về cú pháp của khai báo import và tải module theo điều kiện hoặc theo yêu cầu. Dưới đây là một số lý do tại sao bạn có thể cần sử dụng dynamic import:

- Khi import tĩnh làm chậm đáng kể việc tải code của bạn hoặc tăng mức sử dụng bộ nhớ của chương trình, và có ít khả năng bạn sẽ cần code đang import, hoặc bạn sẽ không cần nó cho đến một thời điểm sau.
- Khi module bạn đang import không tồn tại tại thời điểm tải.
- Khi chuỗi import specifier cần được xây dựng động. (Import tĩnh chỉ hỗ trợ các specifier tĩnh.)
- Khi module được import có tác dụng phụ, và bạn không muốn các tác dụng phụ đó trừ khi một điều kiện là đúng. (Khuyến nghị không có tác dụng phụ nào trong module, nhưng đôi khi bạn không thể kiểm soát điều này trong các module dependencies.)
- Khi bạn đang ở trong môi trường không phải module (ví dụ `eval` hoặc file script).

Chỉ sử dụng dynamic import khi cần thiết. Dạng tĩnh được ưu tiên để tải các dependencies ban đầu và có thể hưởng lợi nhiều hơn từ các công cụ phân tích tĩnh và [tree shaking](/en-US/docs/Glossary/Tree_shaking).

Nếu file của bạn không được chạy như một module (nếu nó được tham chiếu trong file HTML, thẻ script phải có `type="module"`), bạn sẽ không thể sử dụng khai báo import tĩnh. Mặt khác, cú pháp dynamic import bất đồng bộ luôn khả dụng, cho phép bạn import các module vào môi trường không phải module.

Tham số `options` cho phép các loại tùy chọn import khác nhau. Ví dụ, [import attributes](/en-US/docs/Web/JavaScript/Reference/Statements/import/with):

```js
import("./data.json", { with: { type: "json" } });
```

Dynamic module import không được phép trong tất cả ngữ cảnh thực thi.
Ví dụ, `import()` có thể được sử dụng trong main thread, một shared worker, hoặc một dedicated worker, nhưng sẽ ném ra lỗi nếu được gọi trong [service worker](/en-US/docs/Web/API/Service_Worker_API) hoặc [worklet](/en-US/docs/Web/API/Worklet).

### Module namespace object

Một _module namespace object_ là một đối tượng mô tả tất cả exports từ một module. Đây là một đối tượng tĩnh được tạo khi module được đánh giá. Có hai cách để truy cập module namespace object của một module: thông qua [namespace import](/en-US/docs/Web/JavaScript/Reference/Statements/import#namespace_import) (`import * as name from moduleName`), hoặc thông qua giá trị hoàn thành của dynamic import.

Module namespace object là một đối tượng [sealed](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isSealed) với [prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects). Điều này có nghĩa là tất cả các khóa chuỗi của đối tượng tương ứng với các exports của module và không bao giờ có khóa thừa. Tất cả các khóa đều [enumerable](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties) theo thứ tự từ điển (tức là hành vi mặc định của [`Array.prototype.sort()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort#description)), với export mặc định có sẵn dưới dạng một khóa có tên là `default`. Ngoài ra, module namespace object có thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) với giá trị `"Module"`, được dùng trong {{jsxref("Object.prototype.toString()")}}.

Các thuộc tính chuỗi là non-configurable và writable khi bạn sử dụng {{jsxref("Object.getOwnPropertyDescriptors()")}} để lấy descriptor của chúng. Tuy nhiên, chúng thực tế là chỉ đọc (read-only), vì bạn không thể gán lại một thuộc tính sang giá trị mới. Hành vi này phản ánh thực tế rằng các import tĩnh tạo ra "[live bindings](/en-US/docs/Web/JavaScript/Reference/Statements/import#imported_values_can_only_be_modified_by_the_exporter)" — các giá trị có thể được gán lại bởi module xuất chúng, nhưng không phải bởi module nhập chúng. Tính writable của các thuộc tính phản ánh khả năng các giá trị thay đổi, vì các thuộc tính non-configurable và non-writable phải là hằng số. Ví dụ, bạn có thể gán lại giá trị export của một biến, và giá trị mới có thể được quan sát trong module namespace object.

Mỗi module specifier (đã chuẩn hóa) tương ứng với một module namespace object duy nhất, vì vậy điều sau thường đúng:

```js
import * as mod from "/my-module.js";

import("/my-module.js").then((mod2) => {
  console.log(mod === mod2); // true
});
```

Ngoại trừ trong một trường hợp thú vị: vì promise không bao giờ hoàn thành với một [thenable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#thenables), nếu module `my-module.js` xuất một hàm có tên `then()`, hàm đó sẽ tự động được gọi khi promise của dynamic import được hoàn thành, như một phần của quy trình [promise resolution](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise#the_resolve_function).

```js
// my-module.js
export function then(resolve) {
  console.log("then() called");
  resolve(1);
}
```

```js
// main.js
import * as mod from "/my-module.js";

import("/my-module.js").then((mod2) => {
  // Logs "then() called"
  console.log(mod === mod2); // false
});
```

> [!WARNING]
> Không export một hàm có tên `then()` từ module. Điều này sẽ khiến module hoạt động khác nhau khi được import động so với khi được import tĩnh.

Bộ nhớ đệm tích cực này đảm bảo rằng một đoạn code JavaScript không bao giờ được thực thi nhiều hơn một lần, ngay cả khi nó được import nhiều lần. Các lần import trong tương lai thậm chí không tạo ra HTTP request hay truy cập đĩa. Nếu bạn cần reimport và re-evaluate một module mà không khởi động lại toàn bộ môi trường JavaScript, một thủ thuật có thể là sử dụng tham số query duy nhất trong module specifier. Điều này cũng hoạt động trong các runtime không phải trình duyệt hỗ trợ URL specifier.

```js
import(`/my-module.js?t=${Date.now()}`);
```

Lưu ý rằng điều này có thể dẫn đến rò rỉ bộ nhớ trong ứng dụng chạy lâu dài, vì engine không thể an toàn thu gom rác cho bất kỳ module namespace object nào. Hiện tại, không có cách nào để xóa thủ công bộ nhớ đệm của module namespace object.

Bạn cũng có thể sử dụng [Fetch API](/en-US/docs/Web/API/Fetch_API) để tải source code module dưới dạng văn bản, sau đó đánh giá module thủ công tùy thuộc vào loại module:

- Đối với JavaScript module, bạn có thể dynamic import source code dưới dạng [`blob:` URL](/en-US/docs/Web/API/URL/createObjectURL_static) trong trình duyệt, hoặc sử dụng [`vm.Module`](https://nodejs.org/docs/latest/api/vm.html#class-vmmodule) để đánh giá nó trong Node.js.
- Đối với JSON module, bạn có thể phân tích source code bằng {{jsxref("JSON.parse()")}}.
- Đối với CSS module, bạn có thể tạo một đối tượng {{domxref("CSSStyleSheet")}} mới và sử dụng phương thức [`replace()`](/en-US/docs/Web/API/CSSStyleSheet/replace) của nó để điền source code.

Tuy nhiên, về mặt ngữ nghĩa điều này không giống với dynamic import, vì các cài đặt user-agent như [fetch destination](/en-US/docs/Web/API/Request/destination), [CSP](/en-US/docs/Web/HTTP/Guides/CSP), hoặc [module resolution](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta/resolve) có thể không được áp dụng đúng cách.

Bộ nhớ đệm module namespace object chỉ áp dụng cho các module được tải và liên kết _thành công_. Một module được import theo ba bước: tải (fetch module), liên kết (chủ yếu là phân tích module), và đánh giá (thực thi code đã phân tích). Chỉ các lỗi đánh giá mới được lưu vào bộ nhớ đệm; nếu một module không tải hoặc liên kết được, lần import tiếp theo có thể thử tải và liên kết module lại. Trình duyệt có thể hoặc không lưu kết quả của hoạt động fetch vào bộ nhớ đệm, nhưng nó nên tuân theo semantics HTTP thông thường, vì vậy xử lý các lỗi mạng như vậy không nên khác với xử lý các lỗi {{domxref("Window/fetch", "fetch()")}}.

## Ví dụ

### Import module chỉ cho tác dụng phụ

```js
(async () => {
  if (somethingIsTrue) {
    // import module for side effects
    await import("/modules/my-module.js");
  }
})();
```

Nếu dự án của bạn sử dụng các package xuất ESM, bạn cũng có thể import chúng chỉ cho tác dụng phụ. Điều này sẽ chạy code trong file điểm vào của package (và bất kỳ file nào nó import) chỉ một lần.

### Importing defaults

Nếu bạn đang destructure module namespace object được import, bạn phải đổi tên khóa `default` vì `default` là một từ khóa dành riêng.

```js
(async () => {
  if (somethingIsTrue) {
    const {
      default: myDefault,
      foo,
      bar,
    } = await import("/modules/my-module.js");
  }
})();
```

### Import theo yêu cầu khi phản hồi hành động người dùng

Ví dụ này cho thấy cách tải chức năng vào trang dựa trên hành động của người dùng, trong trường hợp này là nhấp vào nút, rồi gọi một hàm trong module đó. Đây không phải cách duy nhất để triển khai chức năng này. Hàm `import()` cũng hỗ trợ `await`.

```js
const main = document.querySelector("main");
for (const link of document.querySelectorAll("nav > a")) {
  link.addEventListener("click", (e) => {
    e.preventDefault();

    import("/modules/my-module.js")
      .then((module) => {
        module.loadPageInto(main);
      })
      .catch((err) => {
        main.textContent = err.message;
      });
  });
}
```

### Import các module khác nhau dựa trên môi trường

Trong các quy trình như server-side rendering, bạn có thể cần tải các logic khác nhau trên server hoặc trong trình duyệt vì chúng tương tác với các global hoặc module khác nhau (ví dụ, code trình duyệt có thể truy cập các web API như `document` và `navigator`, trong khi code server có thể truy cập file system của server). Bạn có thể làm điều này thông qua dynamic import có điều kiện.

```js
let myModule;

if (typeof window === "undefined") {
  myModule = await import("module-used-on-server");
} else {
  myModule = await import("module-used-in-browser");
}
```

### Import module với specifier không phải literal

Dynamic import cho phép bất kỳ biểu thức nào làm module specifier, không nhất thiết phải là chuỗi literal.

Ở đây, chúng ta tải 10 module, `/modules/module-0.js`, `/modules/module-1.js`, v.v., đồng thời và gọi các hàm `load` mà mỗi module xuất.

```js
Promise.all(
  Array.from({ length: 10 }).map(
    (_, index) => import(`/modules/module-${index}.js`),
  ),
).then((modules) => modules.forEach((module) => module.load()));
```

### Sử dụng import attributes với dynamic import

[Import attributes](/en-US/docs/Web/JavaScript/Reference/Statements/import/with) được chấp nhận là tham số thứ hai của cú pháp `import()`.

```js
const data = await import("./data.json", {
  with: { type: "json" },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import)
