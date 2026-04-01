---
title: import.meta.resolve()
slug: Web/JavaScript/Reference/Operators/import.meta/resolve
page-type: javascript-language-feature
browser-compat: javascript.operators.import_meta.resolve
sidebar: jssidebar
---

**`import.meta.resolve()`** là một hàm tích hợp được định nghĩa trên đối tượng [`import.meta`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta) của một JavaScript module, dùng để phân giải một module specifier thành URL bằng cách sử dụng URL của module hiện tại làm base.

## Cú pháp

```js-nolint
import.meta.resolve(moduleName)
```

### Tham số

- `moduleName`
  - : Một chuỗi chỉ định một module có thể được nhập. Đây có thể là đường dẫn tương đối (chẳng hạn như `"./lib/helper.js"`), tên bare (chẳng hạn như `"my-module"`), hoặc URL tuyệt đối (chẳng hạn như `"https://example.com/lib/helper.js"`).

### Giá trị trả về

Trả về một chuỗi tương ứng với đường dẫn sẽ được nhập nếu đối số được truyền vào [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import).

## Mô tả

`import.meta.resolve()` cho phép một script truy cập thuật toán _phân giải module specifier_ cho một tên, như thế này:

```js
// Script tại https://example.com/main.js

const helperPath = import.meta.resolve("./lib/helper.js");
console.log(helperPath); // "https://example.com/lib/helper.js"
```

Lưu ý rằng `import.meta.resolve()` chỉ thực hiện phân giải và không cố gắng tải hoặc nhập đường dẫn kết quả. Do đó, giá trị trả về của nó giống nhau _bất kể đường dẫn trả về có tương ứng với tệp tồn tại hay không, và bất kể tệp đó có chứa mã hợp lệ cho một module hay không_. Điều này cho phép `import.meta.resolve()` là một thao tác _đồng bộ_.

Nó khác với [dynamic import](/en-US/docs/Web/JavaScript/Reference/Operators/import), mặc dù cả hai đều chấp nhận một module specifier làm đối số đầu tiên, `import.meta.resolve()` trả về đường dẫn _sẽ được nhập_ mà không thực hiện bất kỳ nỗ lực nào để truy cập đường dẫn đó. Do đó, hai đoạn mã sau đây thực chất là giống nhau:

```js
// Cách 1
console.log(await import("./lib/helper.js"));

// Cách 2
const helperPath = import.meta.resolve("./lib/helper.js");
console.log(await import(helperPath));
```

Tuy nhiên, ngay cả khi `"./lib/helper.js"` không thể được nhập thành công, đoạn mã thứ hai sẽ không gặp lỗi cho đến khi nó cố gắng thực hiện import ở dòng 2.

### Tên module bare

Bạn có thể truyền một tên module bare (còn gọi là bare module specifier) vào `import.meta.resolve()`, miễn là phân giải module được định nghĩa cho tên đó. Ví dụ, bạn có thể định nghĩa điều này bằng cách sử dụng [import map](/en-US/docs/Web/JavaScript/Guide/Modules#importing_modules_using_import_maps) trong một trình duyệt:

```html
<!-- index.html -->
<script type="importmap">
  {
    "imports": {
      "my-module": "./modules/my-module/index.js"
    }
  }
</script>

<script type="module">
  const moduleEntryPath = import.meta.resolve("my-module");
  console.log(moduleEntryPath);
</script>
```

Một lần nữa, vì đoạn mã này không cố gắng nhập `moduleEntryPath` — import map cũng không — nó in ra URL đã phân giải bất kể `./modules/my-module/index.js` có thực sự tồn tại hay không.

### So sánh với new URL()

Constructor [`URL()`](/en-US/docs/Web/API/URL/URL) chấp nhận một đối số _base URL_ thứ hai. Khi đối số đầu tiên là một đường dẫn tương đối và base URL là [`import.meta.url`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta#value), hiệu ứng tương tự như `import.meta.resolve()`.

```js
const helperPath = new URL("./lib/helper.js", import.meta.url).href;
console.log(helperPath);
```

Đây cũng là một cú pháp thay thế hữu ích khi nhắm đến các trình duyệt cũ hơn. Tuy nhiên, có một số khác biệt:

- `import.meta.resolve()` trả về một chuỗi, trong khi `new URL()` trả về một đối tượng `URL`. Có thể sử dụng [`href`](/en-US/docs/Web/API/URL/href) hoặc [`toString()`](/en-US/docs/Web/API/URL/toString) trên đối tượng `URL` được tạo, nhưng điều này vẫn có thể không tạo ra kết quả hoàn toàn giống nhau trong một số môi trường JavaScript hoặc khi sử dụng các công cụ như bundler để phân tích mã tĩnh.
- `import.meta.resolve()` nhận biết các cấu hình phân giải bổ sung, chẳng hạn như phân giải tên module bare bằng import map, như mô tả ở trên. `new URL()` không nhận biết import map và xử lý tên module bare như đường dẫn tương đối (tức là `new URL("my-module", import.meta.url)` có nghĩa là `new URL("./my-module", import.meta.url)`).

Một số công cụ nhận ra `new URL("./lib/helper.js", import.meta.url).href` như là một phụ thuộc vào `"./lib/helper.js"` (tương tự như một import), và tính đến điều này cho các tính năng như bundling, viết lại import cho các tệp đã di chuyển, chức năng "go to source", v.v. Tuy nhiên, vì `import.meta.resolve()` ít mơ hồ hơn và được thiết kế đặc biệt để chỉ ra phụ thuộc phân giải đường dẫn module, bạn nên sử dụng `import.meta.resolve(moduleName)` thay vì `new URL(moduleName, import.meta.url)` cho những trường hợp sử dụng này bất cứ khi nào có thể.

### Không phải tính năng ECMAScript

`import.meta.resolve()` không được chỉ định hoặc ghi lại như là một phần của [đặc tả ECMAScript](/en-US/docs/Web/JavaScript/Reference/JavaScript_technologies_overview#javascript_the_core_language_ecmascript) cho JavaScript module. Thay vào đó, đặc tả định nghĩa [đối tượng `import.meta`](https://tc39.es/ecma262/multipage/ecmascript-language-expressions.html#prod-ImportMeta) nhưng [để lại tất cả các thuộc tính của nó như là "host-defined"](https://tc39.es/ecma262/multipage/ecmascript-language-expressions.html#sec-hostgetimportmetaproperties). Tiêu chuẩn HTML WHATWG tiếp tục từ nơi tiêu chuẩn ECMAScript dừng lại, và [định nghĩa `import.meta.resolve`](https://html.spec.whatwg.org/multipage/webappapis.html#hostgetimportmetaproperties) bằng cách sử dụng [phân giải module specifier](https://html.spec.whatwg.org/multipage/webappapis.html#resolve-a-module-specifier) của nó.

Điều này có nghĩa là `import.meta.resolve()` không bắt buộc phải được triển khai bởi tất cả các JavaScript implementation tuân thủ. Tuy nhiên, `import.meta.resolve()` cũng có thể có sẵn trong các môi trường không phải trình duyệt:

- Deno triển khai [tương thích với hành vi trình duyệt](https://docs.deno.com/api/node/module/~/ImportMeta.resolve).
- Node.js cũng triển khai [hàm `import.meta.resolve()`](https://nodejs.org/docs/latest/api/esm.html#importmetaresolvespecifier), nhưng thêm một tham số `parent` bổ sung nếu bạn sử dụng cờ `--experimental-import-meta-resolve`.

## Ví dụ

### Phân giải đường dẫn cho constructor Worker()

`import.meta.resolve()` đặc biệt hữu ích cho các API nhận một đường dẫn tới tệp script làm đối số, chẳng hạn như constructor [`Worker()`](/en-US/docs/Web/API/Worker/Worker):

```js
// main.js
const workerPath = import.meta.resolve("./worker.js");
const worker = new Worker(workerPath, { type: "module" });
worker.addEventListener("message", console.log);
```

```js
// worker.js
self.postMessage("hello!");
```

Điều này cũng hữu ích để tính toán đường dẫn cho các worker khác, chẳng hạn như [service worker](/en-US/docs/Web/API/ServiceWorker) và [shared worker](/en-US/docs/Web/API/SharedWorker). Tuy nhiên, nếu bạn đang sử dụng một đường dẫn tương đối để tính toán URL của một service worker, hãy lưu ý rằng thư mục của đường dẫn đã phân giải xác định [phạm vi đăng ký](/en-US/docs/Web/API/ServiceWorkerRegistration/scope) của nó theo mặc định (mặc dù một phạm vi khác có thể được chỉ định [trong quá trình đăng ký](/en-US/docs/Web/API/ServiceWorkerContainer/register)).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import)
- [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import)
- [`import.meta`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta)
