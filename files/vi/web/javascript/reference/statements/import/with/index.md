---
title: Import attributes
slug: Web/JavaScript/Reference/Statements/import/with
page-type: javascript-language-feature
browser-compat: javascript.statements.import.import_attributes
sidebar: jssidebar
---

> [!NOTE]
> Phiên bản trước của đề xuất này sử dụng từ khóa `assert` thay vì `with`. Tính năng assertion hiện không còn là tiêu chuẩn. Xem [bảng tương thích trình duyệt](#browser_compatibility) để biết chi tiết.

Tính năng **import attributes** (thuộc tính nhập) hướng dẫn runtime về cách một module nên được tải, bao gồm hành vi phân giải module, tải về, phân tích cú pháp và thực thi. Tính năng này được hỗ trợ trong khai báo [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import), khai báo [`export...from`](/en-US/docs/Web/JavaScript/Reference/Statements/export#re-exporting_aggregating), và [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import) động.

Các thuộc tính có thể được gắn vào bất kỳ loại câu lệnh `import`/`export from` nào, bao gồm nhập mặc định, nhập namespace, v.v. Chúng theo sau chuỗi module specifier và bắt đầu bằng từ khóa `with`. Khi dùng với `import()`, các thuộc tính được chỉ định trong tham số `options` thông qua thuộc tính `with`.

## Cú pháp

```js-nolint
import { names } from "module-name" with {};
import { names } from "module-name" with { key: "data" };
import { names } from "module-name" with { key: "data", key2: "data2" };
import { names } from "module-name" with { key: "data", key2: "data2", /* …, */ keyN: "dataN" };

export { names } from "module-name" with {};
export { names } from "module-name" with { key: "data" };
export { names } from "module-name" with { key: "data", key2: "data2" };
export { names } from "module-name" with { key: "data", key2: "data2", /* …, */ keyN: "dataN" };
```

### Tham số

- `keyN`
  - : Một khóa thuộc tính. Có thể là một identifier hoặc một string literal. Tất cả các khóa phải là duy nhất và phải được runtime nhận diện.
- `"dataN"`
  - : Giá trị của thuộc tính. Phải là một string literal.

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : Một `key` không được hỗ trợ được chỉ định trong _static import_.

- {{jsxref("TypeError")}}
  - : Một `key` không được hỗ trợ được chỉ định trong _dynamic import_.

Lưu ý rằng việc chỉ định một giá trị không được hỗ trợ cho một khóa được hỗ trợ cũng có thể gây ra ngoại lệ trong một số trường hợp, tùy thuộc vào khóa.

## Mô tả

Import attributes cho runtime biết cách tải một module cụ thể.

Trường hợp sử dụng chính là tải các module không phải JS, chẳng hạn như JSON module và CSS module. Xét câu lệnh sau:

```js
import data from "https://example.com/data.json";
```

Trên web, mỗi câu lệnh import dẫn đến một yêu cầu HTTP. Phản hồi sau đó được chuẩn bị thành một giá trị JavaScript và được cung cấp cho chương trình bởi runtime. Ví dụ, phản hồi có thể trông như thế này:

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
...
{"name":"Maria"}
```

Các module được xác định và phân tích cú pháp chỉ dựa vào [kiểu media (MIME type)](/en-US/docs/Web/HTTP/Guides/MIME_types) mà chúng được phục vụ — phần mở rộng tệp trong URL không thể được dùng để xác định loại tệp. Trong trường hợp này, MIME type là `application/json`, cho trình duyệt biết rằng tệp là JSON và phải được phân tích cú pháp dưới dạng JSON. Nếu vì lý do nào đó (ví dụ: server bị tấn công hoặc giả mạo), kiểu media trong phản hồi server được đặt thành `text/javascript` (cho mã nguồn JavaScript), thì tệp sẽ được phân tích cú pháp và thực thi dưới dạng mã. Nếu tệp "JSON" thực ra chứa mã độc hại, khai báo `import` sẽ vô tình thực thi mã bên ngoài, gây ra mối đe dọa bảo mật nghiêm trọng.

Import attributes giải quyết vấn đề này bằng cách cho phép tác giả chỉ định rõ ràng cách một module nên được xác thực.
Đặc biệt, thuộc tính `type` cho phép bạn xác thực rằng tệp được phục vụ với một kiểu media cụ thể, và thất bại quá trình import nếu một kiểu media khác được sử dụng.

Ví dụ, đoạn mã ở trên có thể được viết để chỉ định rằng kiểu dự kiến là `"json"` và quá trình import sẽ thất bại nếu nó được phục vụ với `text/javascript` (hoặc bất kỳ kiểu media nào khác ngoài `application/json`):

```js
import data from "https://example.com/data.json" with { type: "json" };
```

Thuộc tính `type` cho phép bạn chỉ định rằng các module được phục vụ dưới dạng JSON hoặc CSS (và ngầm định là JavaScript).

Các thuộc tính khác cũng có thể được hỗ trợ, và [có thể ảnh hưởng đến hành vi của các phần khác nhau trong quá trình tải](#intended_semantics_for_import_attributes).
Lỗi cú pháp được ném ra nếu một thuộc tính không được nhận diện được sử dụng.

### Các thuộc tính chuẩn

Các thuộc tính khả dụng phụ thuộc vào ngôn ngữ và môi trường runtime.
Tiêu chuẩn ECMAScript [định nghĩa thuộc tính `type` với giá trị `"json"`](https://tc39.es/ecma262/multipage/ecmascript-language-scripts-and-modules.html#sec-HostLoadImportedModule).

Đặc tả HTML cũng [định nghĩa thuộc tính `type` với các giá trị `"json"` và `"css"`](https://html.spec.whatwg.org/multipage/webappapis.html#module-type-allowed) — đây là các thuộc tính được hỗ trợ trong môi trường trình duyệt.

#### JSON Module (`{ type: "json" }`)

Kiểu `json` cho biết rằng tệp được nhập phải chứa JSON.
Bạn có thể tải JSON từ một tệp vào đối tượng `data` bằng đoạn mã sau:

```js
import data from "https://example.com/data.json" with { type: "json" };
```

Nếu tệp được phục vụ với bất kỳ kiểu media nào khác ngoài `"application/json"`, quá trình import sẽ thất bại.

Thuộc tính `type` thay đổi cách module được tải về (trình duyệt gửi yêu cầu với header `{{HTTPHeader("Accept")}}: application/json`), nhưng _không_ thay đổi cách module được phân tích cú pháp hoặc thực thi. Runtime đã biết cách phân tích module dưới dạng JSON dựa vào MIME type của phản hồi. Nó chỉ sử dụng thuộc tính để kiểm tra _sau khi thực tế_ rằng module `data.json` thực sự là một JSON module. Ví dụ, nếu header phản hồi thay đổi thành `Content-Type: text/javascript`, chương trình sẽ thất bại với lỗi tương tự như trên.

Đặc tả rõ ràng yêu cầu `type: "json"` phải được hỗ trợ — nếu một module được khẳng định là `type: "json"` và runtime không làm thất bại quá trình import này, thì nó phải được phân tích cú pháp dưới dạng JSON.

Tuy nhiên, không có yêu cầu hành vi nào trong trường hợp khác: đối với các import không có thuộc tính `type: "json"`, runtime vẫn có thể phân tích cú pháp dưới dạng JSON nếu bảo mật không phải là vấn đề trong môi trường đó.

Mặt khác, các trình duyệt ngầm định giả sử rằng module là JavaScript nếu `type` không được chỉ định, và thất bại nếu module không phải là JavaScript (ví dụ: JSON). Điều này đảm bảo rằng các kiểu module luôn được xác thực nghiêm ngặt và ngăn ngừa mọi rủi ro bảo mật.
Các runtime không phải trình duyệt như Node và Deno tuân theo ngữ nghĩa của trình duyệt và bắt buộc `type` cho JSON module.

Nói cách khác, nếu bạn bỏ qua `type` và cố gắng import một tệp dưới dạng `"application/json"`, bạn thường sẽ nhận được lỗi như sau:

```plain
Failed to load module script: Expected a JavaScript module script but the server responded with a MIME type of "application/json". Strict MIME type checking is enforced for module scripts per HTML spec.
```

#### CSS Module (`{ type: "css" }`)

Đặc tả HTML định nghĩa kiểu `css`, nhập một stylesheet vào một script dưới dạng đối tượng {{domxref("CSSStyleSheet")}}.

Đoạn mã dưới đây cho thấy cách bạn có thể import một style và thêm nó vào tài liệu của mình.
Quá trình import sẽ ném ra ngoại lệ nếu `example_styles.css` được phục vụ với bất kỳ kiểu media nào khác ngoài `"text/css"`.

```js
import exampleStyles from "https://example.com/example_styles.css" with { type: "css" };

document.adoptedStyleSheets.push(exampleStyles);
```

Lưu ý rằng việc import CSS module vào worker thường không được hỗ trợ, vì đặc tả CSSOM chỉ hiển thị `CSSStyleSheet` trong ngữ cảnh window.

### Ngữ nghĩa dự kiến cho import attributes

Một thuộc tính có thể thay đổi hành vi của runtime ở mọi giai đoạn của quá trình tải module:

- Phân giải: thuộc tính là một phần của module specifier (chuỗi trong mệnh đề `from`). Do đó, với cùng một đường dẫn chuỗi, các thuộc tính khác nhau có thể dẫn đến các module hoàn toàn khác nhau được tải. Ví dụ, [TypeScript hỗ trợ thuộc tính `resolution-mode`](https://devblogs.microsoft.com/typescript/announcing-typescript-5-3/#stable-support-resolution-mode-in-import-types).

  ```ts
  import type { TypeFromRequire } from "pkg" with {
    "resolution-mode": "require",
  };
  ```

- Tải về: ví dụ, CSS module được tải về với [`destination`](/en-US/docs/Web/API/Request/destination) được đặt thành `"style"`, và JSON module được tải về với `destination: "json"`. Điều này có nghĩa là với cùng một URL đích, server vẫn có thể trả về nội dung khác nhau.
- Phân tích cú pháp và thực thi: runtime có thể sử dụng thuộc tính để xác định cách phân tích cú pháp và thực thi module.

## Ví dụ

### Nhập JSON module với thuộc tính type

Trong `data.json`:

```json
{
  "name": "Shilpa"
}
```

Trong `index.html`:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <script type="module">
      import data from "./data.json" with { type: "json" };

      const p = document.createElement("p");
      p.textContent = `name: ${data.name}`;
      document.body.appendChild(p);
    </script>
  </head>
  <body></body>
</html>
```

Khởi động một HTTP server cục bộ (xem [khắc phục sự cố](/en-US/docs/Web/JavaScript/Guide/Modules#troubleshooting)) và truy cập trang `index.html`. Bạn sẽ thấy `Shilpa` trên trang.

> [!NOTE]
> JSON module chỉ có một export mặc định. Bạn không thể thực hiện named import từ chúng (như `import { name } from "data.json"`).

### Sử dụng import attributes với dynamic import

Import attributes cũng được chấp nhận như là tham số thứ hai của cú pháp `import()`.

```js
const data = await import("./data.json", {
  with: { type: "json" },
});
```

Lưu ý rằng, giống như static import, dynamic import được lưu vào bộ nhớ cache trong suốt thời gian tồn tại của môi trường (ví dụ: một trang hoặc worker). Nếu bạn dự kiến dữ liệu này sẽ thay đổi (chẳng hạn như tin tức mới nhất hoặc số dư của người dùng), hãy sử dụng [Fetch API](/en-US/docs/Web/API/Fetch_API) thay thế.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import)
- [`export`](/en-US/docs/Web/JavaScript/Reference/Statements/export)
- [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import)
- [Import attributes proposal](https://github.com/tc39/proposal-import-attributes)
- [JSON modules proposal](https://github.com/tc39/proposal-json-modules)
