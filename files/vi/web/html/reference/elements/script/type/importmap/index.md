---
title: <script type="importmap">
short-title: importmap
slug: Web/HTML/Reference/Elements/script/type/importmap
page-type: html-attribute-value
browser-compat: html.elements.script.type.importmap
sidebar: htmlsidebar
---

Giá trị **`importmap`** của thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/script/type) của [phần tử `<script>`](/en-US/docs/Web/HTML/Reference/Elements/script) chỉ ra rằng phần thân của phần tử chứa một import map.

Import map là một đối tượng JSON cho phép các nhà phát triển kiểm soát cách trình duyệt giải quyết các chỉ định module khi nhập [các JavaScript module](/en-US/docs/Web/JavaScript/Guide/Modules).
Nó cung cấp ánh xạ giữa văn bản được sử dụng làm chỉ định module trong một [câu lệnh `import`](/en-US/docs/Web/JavaScript/Reference/Statements/import) hoặc [toán tử `import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import), và giá trị tương ứng sẽ thay thế văn bản đó khi giải quyết chỉ định.
Đối tượng JSON phải tuân thủ [định dạng biểu diễn JSON của import map](#import_map_json_representation).

Import map được sử dụng để giải quyết các chỉ định module trong các import tĩnh và động, và do đó phải được khai báo và xử lý trước bất kỳ phần tử `<script>` nào nhập module sử dụng các chỉ định được khai báo trong map.
Lưu ý rằng import map chỉ áp dụng cho các chỉ định module trong [câu lệnh `import`](/en-US/docs/Web/JavaScript/Reference/Statements/import) hoặc [toán tử `import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import) cho các module được tải vào tài liệu; nó không áp dụng cho đường dẫn được chỉ định trong thuộc tính `src` của phần tử `<script>` hoặc cho các module được tải vào workers hoặc worklets.

Để biết thêm thông tin, hãy xem phần [Nhập module bằng import maps](/en-US/docs/Web/JavaScript/Guide/Modules#importing_modules_using_import_maps) trong hướng dẫn JavaScript modules.

## Cú pháp

```html
<script type="importmap">
  // JSON object defining import
</script>
```

Các thuộc tính `src`, `async`, `nomodule`, `defer`, `crossorigin`, `integrity`, và `referrerpolicy` không được chỉ định.

### Ngoại lệ

- `TypeError`
  - : Định nghĩa import map không phải là đối tượng JSON, khóa `importmap` được xác định nhưng giá trị của nó không phải là đối tượng JSON, hoặc khóa `scopes` được xác định nhưng giá trị của nó không phải là đối tượng JSON.

Các trình duyệt tạo ra cảnh báo console cho các trường hợp khác mà JSON của import map không tuân thủ schema [import map](#import_map_json_representation).

## Mô tả

Khi nhập một [JavaScript module](/en-US/docs/Web/JavaScript/Guide/Modules), cả [câu lệnh `import`](/en-US/docs/Web/JavaScript/Reference/Statements/import) và [toán tử `import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import) đều có "chỉ định module" chỉ ra module cần nhập.
Trình duyệt phải có khả năng giải quyết chỉ định này thành một URL tuyệt đối để nhập module.

Ví dụ, các câu lệnh sau nhập các phần tử từ chỉ định module `"https://example.com/shapes/circle.js"`, là một URL tuyệt đối, và chỉ định module `"./modules/shapes/square.js"`, là một đường dẫn tương đối với URL cơ sở của tài liệu.

```js
import { name as circleName } from "https://example.com/shapes/circle.js";
import { name as squareName, draw } from "./modules/shapes/square.js";
```

Import maps cho phép các nhà phát triển chỉ định (gần như) bất kỳ văn bản nào họ muốn trong chỉ định module; map cung cấp giá trị tương ứng sẽ thay thế văn bản đó khi chỉ định module được giải quyết.

### Module trần

Import map bên dưới xác định khóa `imports` có "map chỉ định module" với các thuộc tính `circle` và `square`.

```html
<script type="importmap">
  {
    "imports": {
      "circle": "https://example.com/shapes/circle.js",
      "square": "./modules/shapes/square.js"
    }
  }
</script>
```

Với import map này, chúng ta có thể nhập các module giống như ở trên, nhưng sử dụng "module trần" trong các chỉ định module của chúng ta:

```js
import { name as circleName } from "circle";
import { name as squareName, draw } from "square";
```

### Ánh xạ tiền tố đường dẫn

Một khóa map chỉ định module cũng có thể được sử dụng để ánh xạ lại tiền tố đường dẫn trong một chỉ định module.
Lưu ý rằng trong trường hợp này, thuộc tính và đường dẫn được ánh xạ đều phải có dấu gạch chéo (`/`) ở cuối.

```html
<script type="importmap">
  {
    "imports": {
      "shapes/": "./modules/shapes/",
      "other-shapes/": "https://example.com/modules/shapes/"
    }
  }
</script>
```

Sau đó chúng ta có thể nhập một module circle như được hiển thị.

```js
import { name as circleName } from "shapes/circle.js";
```

### Đường dẫn trong khóa map chỉ định module

Các khóa chỉ định module không cần phải là tên từ đơn ("tên trần").
Chúng cũng có thể chứa hoặc kết thúc bằng dấu phân tách đường dẫn, hoặc là các URL tuyệt đối, hoặc là các đường dẫn URL tương đối bắt đầu bằng `/`, `./`, hoặc `../`.

```json
{
  "imports": {
    "modules/shapes/": "./modules/src/shapes/",
    "modules/square": "./modules/src/other/shapes/square.js",
    "https://example.com/modules/square.js": "./modules/src/other/shapes/square.js",
    "../modules/shapes/": "/modules/shapes/"
  }
}
```

Nếu có một số khóa chỉ định module trong một map chỉ định module có thể khớp, thì khóa cụ thể nhất sẽ được chọn (tức là, khóa có đường dẫn/giá trị dài hơn).

Một chỉ định module `./foo/../js/app.js` sẽ được giải quyết thành `./js/app.js` trước khi khớp.
Điều này có nghĩa là khóa chỉ định module `./js/app.js` sẽ khớp với chỉ định module mặc dù chúng không hoàn toàn giống nhau.

### Map chỉ định module theo phạm vi

Bạn có thể sử dụng khóa `scopes` để cung cấp ánh xạ chỉ được sử dụng nếu script nhập module chứa một đường dẫn URL cụ thể.
Nếu URL của script đang tải khớp với đường dẫn được cung cấp, ánh xạ liên kết với phạm vi đó sẽ được sử dụng.
Điều này cho phép sử dụng các phiên bản module khác nhau tùy thuộc vào mã đang thực hiện việc nhập.

Ví dụ, map bên dưới sẽ chỉ sử dụng map phạm vi nếu module đang tải có URL bao gồm đường dẫn: "/modules/custom-shapes/".

```html
<script type="importmap">
  {
    "imports": {
      "square": "./modules/shapes/square.js"
    },
    "scopes": {
      "/modules/custom-shapes/": {
        "square": "https://example.com/modules/shapes/square.js"
      }
    }
  }
</script>
```

Nếu nhiều phạm vi khớp với URL referrer, thì đường dẫn phạm vi cụ thể nhất được sử dụng (tên khóa phạm vi có tên dài nhất).
Trình duyệt quay lại đường dẫn phạm vi cụ thể tiếp theo nếu không có chỉ định khớp, và tiếp tục như vậy, cuối cùng quay lại map chỉ định module trong khóa `imports`.

### Map siêu dữ liệu tính toàn vẹn

Bạn có thể sử dụng khóa `integrity` để cung cấp ánh xạ cho [siêu dữ liệu tính toàn vẹn](/en-US/docs/Web/Security/Defenses/Subresource_Integrity#using_subresource_integrity) của module.
Điều này cho phép bạn đảm bảo tính toàn vẹn của các module được nhập động hoặc tĩnh.
`integrity` cũng cho phép bạn cung cấp dự phòng cho các module cấp cao nhất hoặc được tải trước, trong trường hợp chúng chưa có thuộc tính `integrity`.

Các khóa map đại diện cho các URL module, có thể là tuyệt đối hoặc tương đối (bắt đầu bằng `/`, `./`, hoặc `../`).
Các giá trị map đại diện cho siêu dữ liệu tính toàn vẹn, giống với giá trị thuộc tính [`integrity`](/en-US/docs/Web/HTML/Reference/Elements/script#integrity).

Ví dụ, map bên dưới xác định siêu dữ liệu tính toàn vẹn cho module `square.js` (trực tiếp) và chỉ định trần của nó (gián tiếp, qua khóa `imports`).

```html
<script type="importmap">
  {
    "imports": {
      "square": "./modules/shapes/square.js"
    },
    "integrity": {
      "./modules/shapes/square.js": "sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC"
    }
  }
</script>
```

### Hợp nhất nhiều import maps

Về mặt nội bộ, các trình duyệt duy trì một biểu diễn import map toàn cục duy nhất. Khi nhiều import maps được bao gồm trong một tài liệu, nội dung của chúng được hợp nhất vào import map toàn cục khi chúng được đăng ký.

Ví dụ, hãy xem xét hai import maps sau:

```html
<script type="importmap">
  {
    "imports": {
      "/app/": "./original-app/"
    }
  }
</script>
```

```html
<script type="importmap">
  {
    "imports": {
      "/app/helper": "./helper/index.mjs"
    },
    "scopes": {
      "/js": {
        "/app/": "./js-app/"
      }
    }
  }
</script>
```

Chúng tương đương với import map đơn sau:

```html
<script type="importmap">
  {
    "imports": {
      "/app/": "./original-app/",
      "/app/helper": "./helper/index.mjs"
    },
    "scopes": {
      "/js": {
        "/app/": "./js-app/"
      }
    }
  }
</script>
```

Các chỉ định module trong mỗi map đã đăng ký đã được giải quyết trước đó sẽ bị loại bỏ. Các giải quyết tiếp theo của các chỉ định này sẽ cung cấp kết quả tương tự như các giải quyết trước đó của chúng.

Ví dụ, nếu chỉ định module `/app/helper.js` đã được giải quyết, import map mới sau:

```html
<script type="importmap">
  {
    "imports": {
      "/app/helper.js": "./helper/index.mjs",
      "lodash": "/node_modules/lodash-es/lodash.js"
    }
  }
</script>
```

Sẽ tương đương với:

```html
<script type="importmap">
  {
    "imports": {
      "lodash": "/node_modules/lodash-es/lodash.js"
    }
  }
</script>
```

Quy tắc `/app/helper.js` đã bị bỏ qua và không được tích hợp vào map.

Tương tự, các chỉ định module trong một map đã đăng ký đã được ánh xạ đến các URL trong map toàn cục sẽ bị loại bỏ; ánh xạ trước của chúng sẽ được ưu tiên.

Ví dụ, hai import maps sau:

```html
<script type="importmap">
  {
    "imports": {
      "/app/helper": "./helper/index.mjs",
      "lodash": "/node_modules/lodash-es/lodash.js"
    }
  }
</script>
```

```html
<script type="importmap">
  {
    "imports": {
      "/app/helper": "./main/helper/index.mjs"
    }
  }
</script>
```

Tương đương với import map đơn sau:

```html
<script type="importmap">
  {
    "imports": {
      "/app/helper": "./helper/index.mjs",
      "lodash": "/node_modules/lodash-es/lodash.js"
    }
  }
</script>
```

Quy tắc `/app/helper/` đã bị loại bỏ khỏi map thứ hai.

> [!NOTE]
> Trong các trình duyệt không hỗ trợ (kiểm tra [dữ liệu tương thích](#browser_compatibility)), có thể sử dụng [polyfill](https://github.com/guybedford/es-module-shims) để tránh các vấn đề liên quan đến giải quyết module.

## Định dạng biểu diễn JSON của import map

Dưới đây là định nghĩa "chính thức" về định dạng biểu diễn JSON của import map.

Import map phải là một đối tượng JSON hợp lệ có thể xác định bất kỳ khóa tùy chọn nào là `imports`, `scopes` và `integrity`. Giá trị của mỗi khóa phải là một đối tượng, có thể trống.

- `imports` {{optional_inline}}
  - : Giá trị là một [map chỉ định module](#module_specifier_map), cung cấp ánh xạ giữa văn bản chỉ định module có thể xuất hiện trong câu lệnh `import` hoặc toán tử `import()`, và văn bản sẽ thay thế nó khi chỉ định được giải quyết.

    Đây là map dự phòng được tìm kiếm các chỉ định module khớp nếu không có URL đường dẫn `scopes` nào khớp, hoặc nếu các map chỉ định module trong các đường dẫn `scopes` khớp không chứa khóa khớp với chỉ định module.
    - `<module specifier map>`
      - : Một "map chỉ định module" là một đối tượng JSON hợp lệ mà _các khóa_ là văn bản có thể xuất hiện trong chỉ định module khi nhập module, và _các giá trị_ tương ứng là các URL hoặc đường dẫn sẽ thay thế văn bản này khi chỉ định module được giải quyết thành một địa chỉ.

        Đối tượng JSON map chỉ định module có các yêu cầu sau:
        - Không có khóa nào có thể trống.
        - Tất cả các giá trị phải là chuỗi, xác định một URL tuyệt đối hợp lệ hoặc một chuỗi URL hợp lệ bắt đầu bằng `/`, `./`, hoặc `../`.
        - Nếu một khóa kết thúc bằng `/`, thì giá trị tương ứng cũng phải kết thúc bằng `/`.
          Một khóa có dấu gạch chéo ở cuối có thể được sử dụng như một tiền tố khi ánh xạ (hoặc ánh xạ lại) các địa chỉ module.
        - Thứ tự của các thuộc tính đối tượng không liên quan: nếu nhiều khóa có thể khớp với chỉ định module, khóa cụ thể nhất được sử dụng (nói cách khác, chỉ định "olive/branch/" sẽ khớp trước "olive/").

- `integrity` {{optional_inline}}
  - : Xác định một đối tượng JSON hợp lệ mà _các khóa_ là các chuỗi chứa các URL tuyệt đối hoặc tương đối hợp lệ (bắt đầu bằng `/`, `./`, hoặc `../`),
    và _các giá trị_ tương ứng là [siêu dữ liệu tính toàn vẹn](/en-US/docs/Web/Security/Defenses/Subresource_Integrity#using_subresource_integrity) hợp lệ.

    Nếu URL của một script nhập hoặc tải trước một module khớp với một khóa trong đối tượng `integrity`, siêu dữ liệu tính toàn vẹn tương ứng được áp dụng cho các tùy chọn fetch của script,
    trừ khi chúng đã có siêu dữ liệu tính toàn vẹn được đính kèm.

- `scopes` {{optional_inline}}
  - : Các phạm vi xác định [các map chỉ định module](#module_specifier_map) theo đường dẫn cụ thể, cho phép lựa chọn map phụ thuộc vào đường dẫn của mã nhập module.

    Đối tượng scopes là một đối tượng JSON hợp lệ trong đó mỗi thuộc tính là một `<scope key>`, là một đường dẫn URL, với giá trị tương ứng là một `<module specifier map>`.

    Nếu URL của một script nhập một module khớp với một đường dẫn `<scope key>`, thì `<module specifier map>` liên kết với khóa đó được kiểm tra trước tiên để tìm các chỉ định khớp.
    Nếu có nhiều khóa phạm vi khớp, thì giá trị liên kết với các đường dẫn phạm vi cụ thể/lồng nhau nhất được kiểm tra trước tiên để tìm các chỉ định module khớp.
    Map chỉ định module dự phòng trong `imports` được sử dụng nếu không có khóa chỉ định module khớp nào trong bất kỳ map chỉ định module có phạm vi khớp nào.

    Lưu ý rằng phạm vi không thay đổi cách địa chỉ được giải quyết; các địa chỉ tương đối luôn được giải quyết đến URL cơ sở của import map.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [JavaScript modules > Nhập module bằng import maps](/en-US/docs/Web/JavaScript/Guide/Modules#importing_modules_using_import_maps)
- [Thuộc tính `type` của phần tử HTML `<script>`](/en-US/docs/Web/HTML/Reference/Elements/script/type)
- [Câu lệnh `import`](/en-US/docs/Web/JavaScript/Reference/Statements/import)
- [Toán tử `import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import)
