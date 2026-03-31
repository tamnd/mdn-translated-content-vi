---
title: "SyntaxError: import declarations may only appear at top level of a module"
slug: Web/JavaScript/Reference/Errors/import_decl_module_top_level
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "import declarations may only appear at top level of a module"
xảy ra khi một khai báo import không nằm ở cấp cao nhất của một module. Điều này
có thể do khai báo import được lồng trong các cấu trúc khác (hàm, khối lệnh,
v.v.), hoặc thường gặp hơn là do tệp hiện tại không được xử lý như một module.

## Thông báo

```plain
SyntaxError: Cannot use import statement outside a module (V8-based)
SyntaxError: import declarations may only appear at top level of a module (Firefox)
SyntaxError: Unexpected identifier 'x'. import call expects one or two arguments. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Bạn có thể có một khai báo `import` được lồng trong một cấu trúc khác, chẳng hạn
như một hàm hoặc một khối lệnh. Khai báo `import` phải nằm ở cấp cao nhất của
module. Nếu bạn muốn import một module có điều kiện hoặc tải module theo yêu cầu,
hãy dùng [dynamic import](/en-US/docs/Web/JavaScript/Reference/Operators/import)
thay thế.

Nếu `import` đã nằm ở cấp cao nhất của mã, có thể tệp không được hiểu là một
module. Các môi trường chạy cần gợi ý bên ngoài để xác định liệu một tệp có phải
là module hay không, và đây là một số cách để cung cấp các gợi ý đó:

- Nếu tệp được tải trực tiếp từ HTML, hãy đảm bảo thẻ
  [`<script>`](/en-US/docs/Web/HTML/Reference/Elements/script) có thuộc tính
  `type="module"`.
- Nếu tệp chạy trong Node, hãy đảm bảo tệp có phần mở rộng `.mjs`, hoặc tệp
  `package.json` gần nhất có trường `"type": "module"`.
- Nếu tệp chạy như một [worker](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers),
  hãy đảm bảo bạn gọi hàm khởi tạo `Worker()` với tùy chọn `type: "module"`.
- Import tệp này từ một module khác.

Một nguyên nhân khác có thể xảy ra khi bạn viết `import` với một trình biên dịch
(chẳng hạn như TypeScript) và vô tình chạy tệp nguồn. Do khai báo `import`
thường xuất hiện ở đầu chương trình, chúng là thứ đầu tiên trình phân tích cú
pháp nhìn thấy và sau đó phàn nàn. Hãy đảm bảo biên dịch tệp nguồn và thực thi
tệp đã biên dịch.

## Ví dụ

### Import có điều kiện

Bạn không thể dùng `import` bên trong các cấu trúc khác, như bạn có thể làm
trong Python.

```js example-bad
if (writeOutput) {
  import fs from "fs"; // SyntaxError
}
```

Hãy chuyển `import` lên cấp cao nhất hoặc dùng dynamic import.

```js example-good
if (writeOutput) {
  import("fs").then((fs) => {
    // use fs
  });
}
```

### Import trong script không phải module

Nếu bạn đang tải script từ HTML, hãy đảm bảo thêm thuộc tính `type="module"`
vào thẻ `<script>`.

```html
<script type="module" src="main.js"></script>
```

Nếu vì lý do nào đó bạn không thể chuyển script thành module, bạn có thể dùng
dynamic import.

```js example-good
async function main() {
  const myModule = await import("./my-module.js");
  // use myModule
}

main();
```

## Xem thêm

- [Using modules](/en-US/docs/Web/JavaScript/Guide/Modules)
- {{jsxref("Statements/import", "import")}}
- {{jsxref("Operators/import", "import()")}}
