---
title: import
slug: Web/JavaScript/Reference/Statements/import
page-type: javascript-statement
browser-compat: javascript.statements.import
sidebar: jssidebar
---

Khai báo **`import`** tĩnh được sử dụng để nhập các {{Glossary("binding", "binding")}} live chỉ đọc được [xuất](/en-US/docs/Web/JavaScript/Reference/Statements/export) bởi một module khác. Các binding được nhập gọi là _live binding_ vì chúng được cập nhật bởi module xuất binding đó, nhưng không thể được gán lại bởi module nhập.

Để sử dụng khai báo `import` trong một tệp nguồn, tệp đó phải được runtime hiểu là một [module](/en-US/docs/Web/JavaScript/Guide/Modules). Trong HTML, điều này được thực hiện bằng cách thêm `type="module"` vào thẻ {{HTMLElement("script")}}. Các module được tự động diễn giải trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode).

Cũng có [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import) động giống như hàm, không yêu cầu script có `type="module"`.

## Cú pháp

```js-nolint
import defaultExport from "module-name";
import * as name from "module-name";
import { export1 } from "module-name";
import { export1 as alias1 } from "module-name";
import { default as alias } from "module-name";
import { export1, export2 } from "module-name";
import { export1, export2 as alias2, /* … */ } from "module-name";
import { "string name" as alias } from "module-name";
import defaultExport, { export1, /* … */ } from "module-name";
import defaultExport, * as name from "module-name";
import "module-name";
```

- `defaultExport`
  - : Tên sẽ tham chiếu đến export mặc định từ module. Phải là một định danh JavaScript hợp lệ.
- `module-name`
  - : Module cần nhập từ. Chỉ cho phép string literal được đặt trong dấu nháy đơn hoặc nháy kép. Việc đánh giá specifier do host quy định. Hầu hết các host tuân theo trình duyệt và giải quyết specifier dưới dạng URL tương đối so với URL module hiện tại (xem [`import.meta.url`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta)). Node, các bundler và các môi trường không phải trình duyệt khác thường định nghĩa các tính năng riêng của mình, vì vậy bạn nên xem tài liệu của chúng để hiểu các quy tắc chính xác. Phần [giải quyết module specifier](#giải_quyết_module_specifier) cũng có thêm thông tin.
- `name`
  - : Tên của đối tượng module sẽ được sử dụng như một loại namespace khi tham chiếu đến các import. Phải là một định danh JavaScript hợp lệ.
- `exportN`
  - : Tên của các export cần nhập. Tên có thể là một định danh hoặc một string literal, tùy thuộc vào những gì `module-name` khai báo là export. Nếu là string literal, nó phải được đặt bí danh thành một định danh hợp lệ.
- `aliasN`
  - : Các tên sẽ tham chiếu đến các named import. Phải là định danh JavaScript hợp lệ.

`"module-name"` có thể được theo sau bởi một tập hợp [thuộc tính import](/en-US/docs/Web/JavaScript/Reference/Statements/import/with), bắt đầu bằng từ khóa `with`.

## Mô tả

Khai báo `import` chỉ có thể xuất hiện trong các module, và chỉ ở cấp cao nhất (tức là không bên trong block, hàm, v.v.). Nếu một khai báo `import` gặp phải trong ngữ cảnh không phải module (ví dụ như thẻ `<script>` không có `type="module"`, `eval`, `new Function`, vốn có "script" hoặc "function body" làm mục tiêu phân tích cú pháp), một `SyntaxError` sẽ được ném ra. Để tải module trong ngữ cảnh không phải module, hãy sử dụng cú pháp [dynamic import](/en-US/docs/Web/JavaScript/Reference/Operators/import) thay thế.

Tất cả các binding được nhập không thể ở trong cùng phạm vi với bất kỳ khai báo nào khác, bao gồm {{jsxref("Statements/let", "let")}}, {{jsxref("Statements/const", "const")}}, {{jsxref("Statements/class", "class")}}, {{jsxref("Statements/function", "function")}}, {{jsxref("Statements/var", "var")}}, và khai báo `import`.

Khai báo `import` được thiết kế cứng nhắc về mặt cú pháp (ví dụ: chỉ có string literal làm specifier, chỉ được phép ở cấp cao nhất, tất cả binding phải là định danh), điều này cho phép các module được phân tích tĩnh và liên kết trước khi được đánh giá. Đây là chìa khóa để làm cho các module có bản chất bất đồng bộ, hỗ trợ các tính năng như [top-level await](/en-US/docs/Web/JavaScript/Guide/Modules#top_level_await).

### Các dạng khai báo import

Có bốn dạng khai báo `import`:

- [Named import](#named_import): `import { export1, export2 } from "module-name";`
- [Default import](#default_import): `import defaultExport from "module-name";`
- [Namespace import](#namespace_import): `import * as name from "module-name";`
- [Side effect import](#nhập_một_module_chỉ_để_lấy_side_effect): `import "module-name";`

Dưới đây là các ví dụ để làm rõ cú pháp.

#### Named import

Với một giá trị có tên `myExport` đã được xuất từ module `my-module` hoặc ngầm định như `export * from "another.js"` hoặc rõ ràng bằng câu lệnh {{jsxref("Statements/export", "export")}}, điều này chèn `myExport` vào phạm vi hiện tại.

```js
import { myExport } from "/modules/my-module.js";
```

Bạn có thể nhập nhiều tên từ cùng một module.

```js
import { foo, bar } from "/modules/my-module.js";
```

Bạn có thể đổi tên một export khi nhập. Ví dụ, điều này chèn `shortName` vào phạm vi hiện tại.

```js
import { reallyReallyLongModuleExportName as shortName } from "/modules/my-module.js";
```

Một module cũng có thể xuất một thành viên dưới dạng string literal không phải là định danh hợp lệ, trong trường hợp đó bạn phải đặt bí danh cho nó để sử dụng trong module hiện tại.

```js
// /modules/my-module.js
const a = 1;
export { a as "a-b" };
```

```js
import { "a-b" as a } from "/modules/my-module.js";
```

> [!NOTE]
> `import { x, y } from "mod"` không tương đương với `import defaultExport from "mod"` rồi destructure `x` và `y` từ `defaultExport`. Named import và default import là các cú pháp riêng biệt trong các module JavaScript.

#### Default import

Các export mặc định cần được nhập bằng cú pháp default import tương ứng. Phiên bản này nhập trực tiếp mặc định:

```js
import myDefault from "/modules/my-module.js";
```

Vì export mặc định không chỉ định rõ tên, bạn có thể đặt định danh bất kỳ tên nào bạn muốn.

Cũng có thể chỉ định một default import với namespace import hoặc named import. Trong những trường hợp đó, default import phải được khai báo trước. Ví dụ:

```js
import myDefault, * as myModule from "/modules/my-module.js";
// myModule.default and myDefault point to the same binding
```

hoặc

```js
import myDefault, { foo, bar } from "/modules/my-module.js";
```

Nhập một tên gọi là `default` có tác dụng tương tự như default import. Cần thiết phải đặt bí danh cho tên vì `default` là một từ khóa dành riêng.

```js
import { default as myDefault } from "/modules/my-module.js";
```

#### Namespace import

Đoạn code sau chèn `myModule` vào phạm vi hiện tại, chứa tất cả các export từ module nằm tại `/modules/my-module.js`.

```js
import * as myModule from "/modules/my-module.js";
```

Ở đây, `myModule` đại diện cho một đối tượng _namespace_ chứa tất cả các export như thuộc tính. Ví dụ, nếu module được nhập ở trên có một export là `doAllTheAmazingThings()`, bạn sẽ gọi nó như thế này:

```js
myModule.doAllTheAmazingThings();
```

`myModule` là một đối tượng [sealed](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isSealed) với [prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects). Export mặc định có sẵn dưới dạng key có tên `default`. Để biết thêm thông tin, xem [module namespace object](/en-US/docs/Web/JavaScript/Reference/Operators/import#module_namespace_object).

> [!NOTE]
> JavaScript không có wildcard import như `import * from "module-name"`, vì khả năng xung đột tên cao.

#### Nhập một module chỉ để lấy side effect

Nhập toàn bộ một module chỉ để lấy side effect, mà không nhập bất kỳ thứ gì. Điều này chạy code toàn cục của module nhưng không thực sự nhập bất kỳ giá trị nào.

```js
import "/modules/my-module.js";
```

Điều này thường được dùng cho [polyfill](/en-US/docs/Glossary/Polyfill), vốn thay đổi các biến toàn cục.

### Hoisting

Khai báo import được [hoisted](/en-US/docs/Glossary/Hoisting). Trong trường hợp này, điều đó có nghĩa là các định danh mà import giới thiệu có sẵn trong toàn bộ phạm vi module, và các side effect của chúng được tạo ra trước khi phần còn lại của code module chạy.

```js
myModule.doAllTheAmazingThings(); // myModule.doAllTheAmazingThings is imported by the next line

import * as myModule from "/modules/my-module.js";
```

### Giải quyết module specifier

Đặc tả ECMAScript không định nghĩa cách giải quyết module specifier và để lại cho môi trường host (ví dụ: trình duyệt, Node.js, Deno). Hành vi trình duyệt được quy định bởi [đặc tả HTML](https://html.spec.whatwg.org/multipage/webappapis.html#resolve-a-module-specifier), và điều này đã trở thành _de facto_ baseline cho tất cả các môi trường.

Có ba loại specifier được nhận biết rộng rãi, như được triển khai bởi đặc tả HTML, Node và nhiều môi trường khác:

- _Relative specifier_ bắt đầu bằng `/`, `./`, hoặc `../`, được giải quyết tương đối so với URL module hiện tại.
- _Absolute specifier_ là các URL có thể phân tích cú pháp, được giải quyết nguyên bản.
- _Bare specifier_ không thuộc các loại trên.

Lưu ý đáng chú ý nhất đối với relative specifier, đặc biệt với những người quen với các quy ước [CommonJS](https://wiki.commonjs.org/wiki/CommonJS), là trình duyệt cấm một specifier có thể giải quyết ngầm định đến nhiều ứng viên tiềm năng. Trong CommonJS, nếu bạn có `main.js` và `utils/index.js`, thì tất cả những điều sau sẽ nhập "default export" từ `utils/index.js`:

```js
// main.js
const utils = require("./utils"); // Omit the "index.js" file name
const utils = require("./utils/index"); // Omit only the ".js" extension
const utils = require("./utils/index.js"); // The most explicit form
```

Trên web, điều này tốn kém vì nếu bạn viết `import x from "./utils"`, trình duyệt cần gửi yêu cầu đến `utils`, `utils/index.js`, `utils.js`, và nhiều URL khác cho đến khi tìm thấy một module có thể nhập. Do đó, trong đặc tả HTML, specifier mặc định chỉ có thể là URL được giải quyết tương đối so với URL module hiện tại. Bạn không thể bỏ qua phần mở rộng tệp hay tên tệp `index.js`. Hành vi này đã được kế thừa bởi triển khai ESM của Node, nhưng nó không phải là một phần của đặc tả ECMAScript.

Lưu ý rằng điều này không có nghĩa là `import x from "./utils"` không bao giờ hoạt động trên web. Trình duyệt vẫn gửi yêu cầu đến URL đó, và nếu máy chủ có thể phản hồi với nội dung chính xác, import sẽ thành công. Điều này yêu cầu máy chủ triển khai một số logic giải quyết tùy chỉnh, vì thường các yêu cầu không có phần mở rộng được hiểu là yêu cầu cho tệp HTML.

Absolute specifier có thể là bất kỳ loại [URL](/en-US/docs/Web/URI) nào giải quyết thành mã nguồn có thể nhập. Đáng chú ý nhất:

- [HTTP URL](/en-US/docs/Web/HTTP) luôn được hỗ trợ trên web vì hầu hết các script đã có HTTP URL. Nó được hỗ trợ nguyên bản bởi Deno (vốn ban đầu đặt toàn bộ hệ thống module của nó trên HTTP URL), nhưng chỉ có hỗ trợ thử nghiệm trong Node thông qua [custom HTTPS loaders](https://nodejs.org/api/module.html#import-from-https).
- URL `file:` được hỗ trợ bởi nhiều runtime không phải trình duyệt như Node, vì các script ở đó đã có URL `file:`, nhưng không được trình duyệt hỗ trợ vì lý do bảo mật.
- [Data URL](/en-US/docs/Web/URI/Reference/Schemes/data) được hỗ trợ bởi nhiều runtime bao gồm trình duyệt, Node, Deno, v.v. Chúng hữu ích để nhúng các module nhỏ trực tiếp vào mã nguồn. Các [loại MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) được hỗ trợ là những loại chỉ định mã nguồn có thể nhập, chẳng hạn như `text/javascript` cho JavaScript, `application/json` cho JSON module, `application/wasm` cho WebAssembly module, v.v. (Chúng vẫn có thể yêu cầu [thuộc tính import](/en-US/docs/Web/JavaScript/Reference/Statements/import/with).)

  ```js
  // HTTP URLs
  import x from "https://example.com/x.js";
  // Data URLs
  import x from "data:text/javascript,export default 42;";
  // Data URLs for JSON modules
  import x from 'data:application/json,{"foo":42}' with { type: "json" };
  ```

  Data URL `text/javascript` vẫn được diễn giải là module, nhưng chúng không thể sử dụng relative import — vì scheme URL `data:` không có cấu trúc phân cấp. Nghĩa là, `import x from "data:text/javascript,import y from './y.js';"` sẽ ném lỗi vì relative specifier `'./y.js'` không thể được giải quyết.

- [URL `node:`](https://nodejs.org/api/esm.html#node-imports) giải quyết đến các module Node.js tích hợp sẵn. Chúng được hỗ trợ bởi Node và các runtime khác tuyên bố tương thích với Node, chẳng hạn như Bun.

Bare specifier, được phổ biến bởi CommonJS, được giải quyết trong thư mục `node_modules`. Ví dụ, nếu bạn có `import x from "foo"`, runtime sẽ tìm kiếm gói `foo` trong bất kỳ thư mục `node_modules` nào trong các thư mục cha của module hiện tại. Hành vi này có thể được tái tạo trong trình duyệt bằng cách sử dụng [import maps](/en-US/docs/Web/JavaScript/Guide/Modules#importing_modules_using_import_maps), cũng cho phép bạn tùy chỉnh giải quyết theo nhiều cách khác.

Thuật toán giải quyết module cũng có thể được thực thi theo chương trình bằng cách sử dụng hàm [`import.meta.resolve`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta/resolve) được định nghĩa bởi đặc tả HTML.

## Ví dụ

### Import chuẩn

Trong ví dụ này, chúng ta tạo một module có thể tái sử dụng để xuất một hàm lấy tất cả các số nguyên tố trong một phạm vi nhất định.

```js
// getPrimes.js
/**
 * Returns a list of prime numbers that are smaller than `max`.
 */
export function getPrimes(max) {
  const isPrime = Array.from({ length: max }, () => true);
  isPrime[0] = isPrime[1] = false;
  isPrime[2] = true;
  for (let i = 2; i * i < max; i++) {
    if (isPrime[i]) {
      for (let j = i ** 2; j < max; j += i) {
        isPrime[j] = false;
      }
    }
  }
  return [...isPrime.entries()]
    .filter(([, isPrime]) => isPrime)
    .map(([number]) => number);
}
```

```js
import { getPrimes } from "/modules/getPrimes.js";

console.log(getPrimes(10)); // [2, 3, 5, 7]
```

### Các giá trị được nhập chỉ có thể được sửa đổi bởi bên xuất

Định danh được nhập là một _live binding_, vì module xuất nó có thể gán lại nó và giá trị được nhập sẽ thay đổi. Tuy nhiên, module nhập nó không thể gán lại. Tuy nhiên, bất kỳ module nào giữ một đối tượng được xuất đều có thể thay đổi đối tượng đó, và giá trị đã thay đổi có thể được quan sát bởi tất cả các module khác nhập cùng giá trị đó.

Bạn cũng có thể quan sát giá trị mới thông qua [module namespace object](/en-US/docs/Web/JavaScript/Reference/Operators/import#module_namespace_object).

```js
// my-module.js
export let myValue = 1;
setTimeout(() => {
  myValue = 2;
}, 500);
```

```js
// main.js
import { myValue } from "/modules/my-module.js";
import * as myModule from "/modules/my-module.js";

console.log(myValue); // 1
console.log(myModule.myValue); // 1
setTimeout(() => {
  console.log(myValue); // 2; my-module has updated its value
  console.log(myModule.myValue); // 2
  myValue = 3; // TypeError: Assignment to constant variable.
  // The importing module can only read the value but can't re-assign it.
}, 1000);
```

### Nhập các module không phải JavaScript

Các module không phải JavaScript cũng có thể được nhập bằng câu lệnh `import`, nhưng kiểu của chúng cần được khai báo rõ ràng bằng cách sử dụng [thuộc tính import](/en-US/docs/Web/JavaScript/Reference/Statements/import/with). Ví dụ, để nhập một JSON module, bạn cần chỉ định thuộc tính `type: "json"`.

```js
import data from "./data.json" with { type: "json" };
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/export", "export")}}
- [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import)
- [`import.meta`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta)
- [Thuộc tính Import](/en-US/docs/Web/JavaScript/Reference/Statements/import/with)
- [Previewing ES6 Modules and more from ES2015, ES2016 and beyond](https://blogs.windows.com/msedgedev/2016/05/17/es6-modules-and-beyond/) on blogs.windows.com (2016)
- [ES6 in Depth: Modules](https://hacks.mozilla.org/2015/08/es6-in-depth-modules/) on hacks.mozilla.org (2015)
- [ES modules: A cartoon deep-dive](https://hacks.mozilla.org/2018/03/es-modules-a-cartoon-deep-dive/) on hacks.mozilla.org (2018)
- [Exploring JS, Ch.16: Modules](https://exploringjs.com/es6/ch_modules.html) by Dr. Axel Rauschmayer
- [Export and Import](https://javascript.info/import-export) on javascript.info
