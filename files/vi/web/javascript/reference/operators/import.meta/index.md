---
title: import.meta
slug: Web/JavaScript/Reference/Operators/import.meta
page-type: javascript-language-feature
browser-compat: javascript.operators.import_meta
sidebar: jssidebar
---

Thuộc tính meta **`import.meta`** cung cấp metadata cụ thể theo ngữ cảnh cho một module JavaScript. Nó chứa thông tin về module, chẳng hạn như URL của module.

## Cú pháp

```js-nolint
import.meta
```

### Giá trị

Đối tượng `import.meta` được tạo bởi môi trường host, như một đối tượng có thể mở rộng với [prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects) trong đó tất cả các thuộc tính đều có thể ghi, cấu hình và liệt kê. Đặc tả không xác định bất kỳ thuộc tính nào được định nghĩa trên nó, nhưng các host thường triển khai các thuộc tính sau:

- `url`
  - : URL đầy đủ đến module, bao gồm các tham số truy vấn và/hoặc hash (theo sau `?` hoặc `#`). Trong trình duyệt, đây là URL mà script được lấy về (đối với các script bên ngoài), hoặc URL của tài liệu chứa (đối với các script nội tuyến). Trong Node.js, đây là đường dẫn file (bao gồm giao thức `file://`).
- [`resolve`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta/resolve)
  - : Phân giải một module specifier thành một URL bằng cách sử dụng URL của module hiện tại làm base.

## Mô tả

Cú pháp `import.meta` bao gồm từ khóa `import`, một dấu chấm, và identifier `meta`. Vì `import` là một [từ khóa dành riêng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words), không phải là một identifier, đây không phải là một [property accessor](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors), mà là một cú pháp biểu thức đặc biệt.

Thuộc tính meta `import.meta` có sẵn trong các module JavaScript; sử dụng `import.meta` bên ngoài một module (bao gồm [direct `eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#direct_and_indirect_eval) trong một module) là một lỗi cú pháp.

## Ví dụ

### Truyền tham số truy vấn

Sử dụng tham số truy vấn trong specifier `import` cho phép truyền đối số cụ thể cho module, điều này có thể bổ sung cho việc đọc tham số từ [`window.location`](/en-US/docs/Web/API/Window/location) toàn ứng dụng (hoặc trong Node.js, thông qua `process.argv`). Ví dụ, với HTML sau:

```html
<script type="module">
  import "./index.mjs?someURLInfo=5";
</script>
```

Module `index.mjs` có thể truy xuất tham số `someURLInfo` thông qua `import.meta`:

```js
// index.mjs
new URL(import.meta.url).searchParams.get("someURLInfo"); // 5
```

Tương tự khi một module import một module khác:

```js
// index.mjs
import "./index2.mjs?someURLInfo=5";

// index2.mjs
new URL(import.meta.url).searchParams.get("someURLInfo"); // 5
```

Việc triển khai ES module trong Node.js hỗ trợ phân giải các module specifier chứa tham số truy vấn (hoặc hash), như trong ví dụ sau. Tuy nhiên, bạn không thể sử dụng truy vấn hoặc hash khi module được chỉ định qua lệnh CLI (như `node index.mjs?someURLInfo=5`), vì điểm vào CLI sử dụng chế độ phân giải giống CommonJS hơn, coi đường dẫn như một đường dẫn file thay vì một URL. Để truyền tham số đến module điểm vào, hãy sử dụng đối số CLI và đọc chúng qua `process.argv` thay thế (như `node index.mjs --someURLInfo=5`).

### Phân giải một file tương đối với file hiện tại

Trong các module Node.js CommonJS, có một biến `__dirname` chứa đường dẫn tuyệt đối đến thư mục chứa module hiện tại, rất hữu ích để phân giải các đường dẫn tương đối. Tuy nhiên, các module ES không thể có các biến ngữ cảnh ngoại trừ `import.meta`. Do đó, để phân giải một file tương đối, bạn có thể sử dụng `import.meta.url`. Lưu ý rằng điều này sử dụng URL thay vì đường dẫn hệ thống file.

Trước đây (CommonJS):

```js
const fs = require("fs/promises");
const path = require("path");

const filePath = path.join(__dirname, "someFile.txt");
fs.readFile(filePath, "utf8").then(console.log);
```

Sau này (ES modules):

```js
import fs from "node:fs/promises";

const fileURL = new URL("./someFile.txt", import.meta.url);
fs.readFile(fileURL, "utf8").then(console.log);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/import", "import")}}
- {{jsxref("Statements/export", "export")}}
