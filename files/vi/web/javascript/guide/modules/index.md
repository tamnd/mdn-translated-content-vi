---
title: JavaScript modules
slug: Web/JavaScript/Guide/Modules
page-type: guide
sidebar: jssidebar
---

{{Previous("Web/JavaScript/Guide/Internationalization")}}

Hướng dẫn này cung cấp mọi thứ bạn cần để bắt đầu với cú pháp module JavaScript.

## Bối cảnh về module

Các chương trình JavaScript ban đầu khá nhỏ — hầu hết công việc trong những ngày đầu là thực hiện các tác vụ kịch bản riêng lẻ, cung cấp một chút tương tác cho các trang web khi cần, vì vậy không cần đến các kịch bản lớn. Vài năm trôi qua và giờ đây chúng ta có các ứng dụng hoàn chỉnh chạy trong trình duyệt với nhiều JavaScript, cũng như JavaScript được sử dụng trong các ngữ cảnh khác ([Node.js](/en-US/docs/Glossary/Node.js), chẳng hạn).

Các dự án phức tạp đòi hỏi một cơ chế chia nhỏ các chương trình JavaScript thành các module riêng biệt có thể được import khi cần. Node.js đã có khả năng này từ lâu, và có nhiều thư viện và framework JavaScript hỗ trợ sử dụng module (ví dụ: các hệ thống module dựa trên [CommonJS](https://en.wikipedia.org/wiki/CommonJS) và [AMD](https://github.com/amdjs/amdjs-api/blob/master/AMD.md) như [RequireJS](https://requirejs.org/), [webpack](https://webpack.js.org/), và [Babel](https://babeljs.io/)).

Tất cả các trình duyệt hiện đại đều hỗ trợ tính năng module một cách tự nhiên mà không cần transpilation. Đây hoàn toàn là điều tốt — trình duyệt có thể tối ưu hóa việc tải module, làm cho nó hiệu quả hơn so với việc sử dụng thư viện và thực hiện tất cả các xử lý phía client và các chuyến đi khứ hồi thêm. Điều này không làm cho các bundler như webpack lỗi thời — các bundler vẫn làm tốt việc phân chia code thành các phần có kích thước hợp lý, và có thể thực hiện các tối ưu hóa khác như thu nhỏ (minification), loại bỏ code chết (dead code elimination), và tree-shaking.

## Giới thiệu ví dụ

Để minh họa cách sử dụng module, chúng tôi đã tạo một [bộ ví dụ](https://github.com/mdn/js-examples/tree/main/module-examples) mà bạn có thể tìm trên GitHub. Các ví dụ này minh họa một tập hợp các module tạo ra một phần tử [`<canvas>`](/en-US/docs/Web/HTML/Reference/Elements/canvas) trên trang web, sau đó vẽ (và báo cáo thông tin về) các hình dạng khác nhau trên canvas.

Những ví dụ này khá đơn giản, nhưng được cố tình giữ đơn giản để minh họa module rõ ràng.

> [!NOTE]
> Nếu bạn muốn tải xuống các ví dụ và chạy chúng cục bộ, bạn cần chạy chúng qua một web server cục bộ.

## Cấu trúc ví dụ cơ bản

Trong ví dụ đầu tiên của chúng tôi (xem [basic-modules](https://github.com/mdn/js-examples/tree/main/module-examples/basic-modules)) chúng tôi có cấu trúc file như sau:

```plain
index.html
main.js
modules/
    canvas.js
    square.js
```

> [!NOTE]
> Tất cả các ví dụ trong hướng dẫn này về cơ bản có cùng cấu trúc; phần trên sẽ trở nên quen thuộc.

Hai module trong thư mục modules được mô tả bên dưới:

- `canvas.js` — chứa các hàm liên quan đến thiết lập canvas:
  - `create()` — tạo một canvas với `width` và `height` được chỉ định bên trong một [`<div>`](/en-US/docs/Web/HTML/Reference/Elements/div) bao bọc với ID được chỉ định, bản thân nó được nối vào một phần tử cha được chỉ định. Trả về một object chứa context 2D của canvas và ID của wrapper.
  - `createReportList()` — tạo một danh sách không có thứ tự được nối vào một phần tử wrapper được chỉ định, có thể được sử dụng để xuất dữ liệu báo cáo. Trả về ID của danh sách.

- `square.js` — chứa:
  - `name` — một hằng số chứa chuỗi 'square'.
  - `draw()` — vẽ một hình vuông trên một canvas được chỉ định, với kích thước, vị trí và màu sắc được chỉ định. Trả về một object chứa kích thước, vị trí và màu sắc của hình vuông.
  - `reportArea()` — ghi diện tích của một hình vuông vào một danh sách báo cáo cụ thể, dựa trên độ dài cạnh của nó.
  - `reportPerimeter()` — ghi chu vi của một hình vuông vào một danh sách báo cáo cụ thể, dựa trên độ dài cạnh của nó.

### Ghi chú — .mjs so với .js

Trong bài viết này, chúng tôi đã sử dụng phần mở rộng `.js` cho các file module, nhưng trong các tài liệu khác bạn có thể thấy phần mở rộng `.mjs` được sử dụng thay thế. [Tài liệu của V8 khuyến nghị điều này](https://v8.dev/features/modules#mjs), chẳng hạn. Lý do được đưa ra là:

- Nó tốt cho sự rõ ràng, tức là nó làm rõ file nào là module và file nào là JavaScript thông thường.
- Nó đảm bảo rằng các file module của bạn được phân tích như một module bởi các runtime như [Node.js](https://nodejs.org/api/esm.html#esm_enabling), và các công cụ build như [Babel](https://babeljs.io/docs/options#sourcetype).

Tuy nhiên, chúng tôi đã quyết định tiếp tục sử dụng `.js`, ít nhất là hiện tại. Để các module hoạt động đúng trong trình duyệt, bạn cần đảm bảo rằng server phục vụ chúng với header `Content-Type` chứa kiểu MIME JavaScript như `text/javascript`. Nếu không, bạn sẽ gặp lỗi kiểm tra kiểu MIME nghiêm ngặt kiểu như "The server responded with a non-JavaScript MIME type" và trình duyệt sẽ không chạy JavaScript của bạn. Hầu hết các server đã đặt đúng kiểu cho các file `.js`, nhưng chưa đặt cho các file `.mjs`. Các server đã phục vụ đúng các file `.mjs` bao gồm [GitHub Pages](https://pages.github.com/) và [`http-server`](https://github.com/http-party/http-server#readme) cho Node.js.

Điều này ổn nếu bạn đang sử dụng môi trường như vậy, hoặc nếu không nhưng bạn biết mình đang làm gì và có quyền truy cập (tức là bạn có thể cấu hình server để đặt đúng [`Content-Type`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Type) cho các file `.mjs`). Tuy nhiên, điều này có thể gây nhầm lẫn nếu bạn không kiểm soát server phục vụ file, hoặc đang xuất bản file để sử dụng công khai.

Vì mục đích học tập và tính di động, chúng tôi quyết định giữ dùng `.js`.

Nếu bạn thực sự coi trọng sự rõ ràng khi sử dụng `.mjs` cho module so với `.js` cho các file JavaScript "thông thường", nhưng không muốn gặp phải vấn đề nêu trên, bạn luôn có thể sử dụng `.mjs` trong quá trình phát triển và chuyển đổi chúng thành `.js` trong bước build.

Cũng đáng lưu ý rằng:

- Một số công cụ có thể không bao giờ hỗ trợ `.mjs`.
- Thuộc tính `<script type="module">` được sử dụng để chỉ ra khi nào một module đang được trỏ đến, như bạn sẽ thấy bên dưới.

## Export các tính năng của module

Điều đầu tiên bạn cần làm để truy cập các tính năng module là export chúng. Điều này được thực hiện bằng câu lệnh {{jsxref("Statements/export", "export")}}.

Cách dễ nhất để sử dụng nó là đặt nó trước bất kỳ mục nào bạn muốn export ra khỏi module, ví dụ:

```js
export const name = "square";

export function draw(ctx, length, x, y, color) {
  ctx.fillStyle = color;
  ctx.fillRect(x, y, length, length);

  return { length, x, y, color };
}
```

Bạn có thể export các hàm, `var`, `let`, `const`, và — như chúng ta sẽ thấy sau — các class. Chúng cần là các mục cấp cao nhất: ví dụ, bạn không thể sử dụng `export` bên trong một hàm.

Một cách thuận tiện hơn để export tất cả các mục bạn muốn export là sử dụng một câu lệnh export duy nhất ở cuối file module của bạn, theo sau là danh sách các tính năng bạn muốn export được phân tách bằng dấu phẩy và bao trong dấu ngoặc nhọn. Ví dụ:

```js
export { name, draw, reportArea, reportPerimeter };
```

## Import các tính năng vào script của bạn

Sau khi bạn đã export một số tính năng từ module, bạn cần import chúng vào script để có thể sử dụng. Cách đơn giản nhất để làm điều này như sau:

```js
import { name, draw, reportArea, reportPerimeter } from "./modules/square.js";
```

Bạn sử dụng câu lệnh {{jsxref("Statements/import", "import")}}, theo sau là danh sách các tính năng bạn muốn import được phân tách bằng dấu phẩy và bao trong dấu ngoặc nhọn, theo sau là từ khóa `from`, theo sau là _module specifier_.

_Module specifier_ cung cấp một chuỗi mà môi trường JavaScript có thể phân giải thành đường dẫn đến file module. Trong trình duyệt, đây có thể là một đường dẫn tương đối so với gốc của site, trong ví dụ `basic-modules` của chúng ta sẽ là `/js-examples/module-examples/basic-modules`. Tuy nhiên, ở đây chúng ta sử dụng cú pháp dấu chấm (`.`) để có nghĩa là "vị trí hiện tại", theo sau là đường dẫn tương đối đến file chúng ta cần tìm. Điều này tốt hơn nhiều so với việc viết ra toàn bộ đường dẫn tuyệt đối mỗi lần, vì các đường dẫn tương đối ngắn hơn và làm cho URL có thể di chuyển được.

Vì vậy, ví dụ:

```bash
/js-examples/module-examples/basic-modules/modules/square.js
```

trở thành

```bash
./modules/square.js
```

Bạn có thể thấy các dòng như vậy trong [`main.js`](https://github.com/mdn/js-examples/blob/main/module-examples/basic-modules/main.js).

> [!NOTE]
> Trong một số hệ thống module, bạn có thể sử dụng module specifier như `modules/square` không phải là đường dẫn tương đối hoặc tuyệt đối, và không có phần mở rộng file. Loại specifier này có thể được sử dụng trong môi trường trình duyệt nếu bạn trước tiên định nghĩa một [import map](#importing_modules_using_import_maps).

Sau khi bạn đã import các tính năng vào script, bạn có thể sử dụng chúng như thể chúng được định nghĩa trong cùng file. Phần sau được tìm thấy trong `main.js`, bên dưới các dòng import:

```js
const myCanvas = create("myCanvas", document.body, 480, 320);
const reportList = createReportList(myCanvas.id);

const square = draw(myCanvas.ctx, 50, 50, 100, "blue");
reportArea(square.length, reportList);
reportPerimeter(square.length, reportList);
```

> [!NOTE]
> Các giá trị được import là các view chỉ đọc của các tính năng được export. Tương tự như các biến `const`, bạn không thể gán lại biến đã được import, nhưng vẫn có thể sửa đổi các thuộc tính của các giá trị object. Giá trị chỉ có thể được gán lại bởi module export nó. Xem [tài liệu tham chiếu `import`](/en-US/docs/Web/JavaScript/Reference/Statements/import#imported_values_can_only_be_modified_by_the_exporter) để biết ví dụ.

## Import module sử dụng import map

Ở trên, chúng ta đã thấy cách trình duyệt có thể import một module bằng cách sử dụng module specifier là URL tuyệt đối hoặc URL tương đối được phân giải bằng URL cơ sở của document:

```js
import { name as circleName } from "https://example.com/shapes/circle.js";
import { name as squareName, draw } from "./shapes/square.js";
```

[Import map](/en-US/docs/Web/HTML/Reference/Elements/script/type/importmap) cho phép các nhà phát triển thay vào đó chỉ định gần như bất kỳ văn bản nào họ muốn trong module specifier khi import một module; map cung cấp một giá trị tương ứng sẽ thay thế văn bản khi URL module được phân giải.

Ví dụ, khóa `imports` trong import map bên dưới định nghĩa một "module specifier map" JSON object trong đó các tên thuộc tính có thể được sử dụng như module specifier, và các giá trị tương ứng sẽ được thay thế khi trình duyệt phân giải URL module. Các giá trị phải là URL tuyệt đối hoặc tương đối. Các URL tương đối được phân giải thành địa chỉ URL tuyệt đối bằng cách sử dụng [URL cơ sở](/en-US/docs/Web/HTML/Reference/Elements/base) của document chứa import map.

```html
<script type="importmap">
  {
    "imports": {
      "shapes": "./shapes/square.js",
      "shapes/square": "./modules/shapes/square.js",
      "https://example.com/shapes/square.js": "./shapes/square.js",
      "https://example.com/shapes/": "/shapes/square/",
      "../shapes/square": "./shapes/square.js"
    }
  }
</script>
```

Import map được định nghĩa bằng cách sử dụng [JSON object](/en-US/docs/Web/HTML/Reference/Elements/script/type/importmap#import_map_json_representation) bên trong một phần tử `<script>` với thuộc tính `type` được đặt thành [`importmap`](/en-US/docs/Web/HTML/Reference/Elements/script/type/importmap). Lưu ý rằng import map chỉ áp dụng cho document — đặc tả không đề cập đến cách áp dụng import map trong ngữ cảnh worker hoặc worklet. <!-- https://github.com/WICG/import-maps/issues/2 -->

Với map này bạn có thể sử dụng các tên thuộc tính ở trên như module specifier. Nếu không có dấu gạch chéo tiếp theo ở module specifier key thì toàn bộ module specifier key sẽ được khớp và thay thế. Ví dụ, bên dưới chúng ta khớp các tên module bare và ánh xạ lại một URL sang đường dẫn khác.

```js
// Bare module names as module specifiers
import { name as squareNameOne } from "shapes";
import { name as squareNameTwo } from "shapes/square";

// Remap a URL to another URL
import { name as squareNameThree } from "https://example.com/shapes/square.js";
```

Nếu module specifier có dấu gạch chéo tiếp theo thì giá trị cũng phải có, và key được khớp như một "tiền tố đường dẫn". Điều này cho phép ánh xạ lại toàn bộ các lớp URL.

```js
// Remap a URL as a prefix ( https://example.com/shapes/)
import { name as squareNameFour } from "https://example.com/shapes/moduleshapes/square.js";
```

Có thể có nhiều key trong import map là các kết quả khớp hợp lệ cho một module specifier. Ví dụ, module specifier `shapes/circle/` có thể khớp với các khóa module specifier `shapes/` và `shapes/circle/`. Trong trường hợp này, trình duyệt sẽ chọn module specifier key khớp cụ thể nhất (dài nhất).

Import map cho phép import module bằng tên module bare (như trong Node.js), và cũng có thể mô phỏng việc import module từ các gói (package), cả có và không có phần mở rộng file. Mặc dù không được hiển thị ở trên, chúng cũng cho phép import các phiên bản cụ thể của thư viện, dựa trên đường dẫn của script đang import module. Nhìn chung, chúng cho phép các nhà phát triển viết code import thuận tiện hơn, và giúp dễ dàng quản lý các phiên bản và phụ thuộc khác nhau của module được sử dụng trong một site. Điều này có thể giảm bớt nỗ lực cần thiết để sử dụng cùng các thư viện JavaScript trong cả trình duyệt và server.

Các phần sau đây mở rộng về các tính năng khác nhau được nêu trên.

### Phát hiện tính năng

Bạn có thể kiểm tra hỗ trợ cho import map bằng phương thức tĩnh [`HTMLScriptElement.supports()`](/en-US/docs/Web/API/HTMLScriptElement/supports_static) (được hỗ trợ rộng rãi):

```js
if (HTMLScriptElement.supports?.("importmap")) {
  console.log("Browser supports import maps.");
}
```

### Import module bằng tên bare

Trong một số môi trường JavaScript, chẳng hạn như Node.js, bạn có thể sử dụng tên bare cho module specifier. Điều này hoạt động vì môi trường có thể phân giải tên module sang một vị trí tiêu chuẩn trong hệ thống file. Ví dụ, bạn có thể sử dụng cú pháp sau để import module "square".

```js
import { name, draw, reportArea, reportPerimeter } from "square";
```

Để sử dụng tên bare trong trình duyệt bạn cần một import map, cung cấp thông tin cần thiết để trình duyệt phân giải module specifier thành URL (JavaScript sẽ ném `TypeError` nếu nó cố import một module specifier không thể phân giải thành vị trí module).

Dưới đây bạn có thể thấy một map định nghĩa khóa module specifier `square`, trong trường hợp này ánh xạ đến một giá trị địa chỉ tương đối.

```html
<script type="importmap">
  {
    "imports": {
      "square": "./shapes/square.js"
    }
  }
</script>
```

Với map này bây giờ chúng ta có thể sử dụng tên bare khi import module:

```js
import { name as squareName, draw } from "square";
```

### Ánh xạ lại đường dẫn module

Các mục module specifier map, trong đó cả khóa specifier và giá trị liên quan của nó đều có dấu gạch chéo tiếp theo (`/`), có thể được sử dụng như tiền tố đường dẫn. Điều này cho phép ánh xạ lại toàn bộ một tập hợp URL import từ một vị trí sang vị trí khác. Nó cũng có thể được sử dụng để mô phỏng làm việc với "gói và module", giống như bạn có thể thấy trong hệ sinh thái Node.

> [!NOTE]
> Dấu `/` tiếp theo chỉ ra rằng khóa module specifier có thể được thay thế như _một phần_ của module specifier. Nếu điều này không có, trình duyệt sẽ chỉ khớp (và thay thế) toàn bộ khóa module specifier.

#### Gói module

Định nghĩa import map JSON sau ánh xạ `lodash` như tên bare, và tiền tố module specifier `lodash/` sang đường dẫn `/node_modules/lodash-es/` (được phân giải theo URL cơ sở của document):

```json
{
  "imports": {
    "lodash": "/node_modules/lodash-es/lodash.js",
    "lodash/": "/node_modules/lodash-es/"
  }
}
```

Với ánh xạ này bạn có thể import cả "gói" hoàn chỉnh, bằng tên bare, và các module trong đó (sử dụng ánh xạ đường dẫn):

```js
import _ from "lodash";
import fp from "lodash/fp.js";
```

Có thể import `fp` ở trên mà không có phần mở rộng file `.js`, nhưng bạn sẽ cần tạo một khóa module specifier bare cho file đó, như `lodash/fp`, thay vì sử dụng ánh xạ đường dẫn. Điều này có thể hợp lý với chỉ một module, nhưng không mở rộng tốt nếu bạn muốn import nhiều module.

#### Ánh xạ lại URL chung

Khóa module specifier không nhất thiết phải là đường dẫn — nó cũng có thể là URL tuyệt đối (hoặc đường dẫn tương đối dạng URL như `./`, `../`, `/`). Điều này có thể hữu ích nếu bạn muốn ánh xạ lại một module có đường dẫn tuyệt đối sang tài nguyên cục bộ của mình.

```json
{
  "imports": {
    "https://www.unpkg.com/moment/": "/node_modules/moment/"
  }
}
```

### Scope module cho quản lý phiên bản

Các hệ sinh thái như Node sử dụng trình quản lý gói như npm để quản lý module và các phụ thuộc của chúng. Trình quản lý gói đảm bảo rằng mỗi module được tách biệt khỏi các module khác và các phụ thuộc của chúng. Kết quả là, mặc dù một ứng dụng phức tạp có thể bao gồm cùng một module nhiều lần với nhiều phiên bản khác nhau trong các phần khác nhau của biểu đồ module, người dùng không cần suy nghĩ về sự phức tạp này.

> [!NOTE]
> Bạn cũng có thể đạt được quản lý phiên bản bằng cách sử dụng đường dẫn tương đối, nhưng điều này không tối ưu vì, trong số những thứ khác, nó áp đặt một cấu trúc cụ thể lên dự án của bạn và ngăn bạn sử dụng tên module bare.

Import map tương tự cho phép bạn có nhiều phiên bản phụ thuộc trong ứng dụng và tham chiếu chúng bằng cùng module specifier. Bạn triển khai điều này với khóa `scopes`, cho phép bạn cung cấp các module specifier map sẽ được sử dụng tùy thuộc vào đường dẫn của script thực hiện việc import. Ví dụ dưới đây minh họa điều này.

```json
{
  "imports": {
    "cool-module": "/node_modules/cool-module/index.js"
  },
  "scopes": {
    "/node_modules/dependency/": {
      "cool-module": "/node_modules/some/other/location/cool-module/index.js"
    }
  }
}
```

Với ánh xạ này, nếu một script có URL chứa `/node_modules/dependency/` import `cool-module`, phiên bản trong `/node_modules/some/other/location/cool-module/index.js` sẽ được sử dụng. Map trong `imports` được sử dụng như dự phòng nếu không có scope khớp trong scope map, hoặc các scope khớp không chứa specifier khớp. Ví dụ, nếu `cool-module` được import từ một script với đường dẫn scope không khớp, thì module specifier map trong `imports` sẽ được sử dụng thay thế, ánh xạ đến phiên bản trong `/node_modules/cool-module/index.js`.

Lưu ý rằng đường dẫn được sử dụng để chọn scope không ảnh hưởng đến cách địa chỉ được phân giải. Giá trị trong đường dẫn được ánh xạ không nhất thiết phải khớp với đường dẫn scope, và các đường dẫn tương đối vẫn được phân giải theo URL cơ sở của script chứa import map.

Giống như các module specifier map, bạn có thể có nhiều khóa scope và chúng có thể chứa các đường dẫn chồng chéo. Nếu nhiều scope khớp với URL referrer, thì đường dẫn scope cụ thể nhất (khóa scope dài nhất) sẽ được kiểm tra đầu tiên để tìm specifier khớp. Các trình duyệt sẽ dự phòng sang đường dẫn scope khớp cụ thể tiếp theo nếu không có specifier khớp, và cứ thế. Nếu không có specifier khớp trong bất kỳ scope nào khớp, trình duyệt kiểm tra kết quả khớp trong module specifier map trong khóa `imports`.

### Cải thiện caching bằng cách ánh xạ tên file có hash

Các file script được sử dụng bởi các website thường có tên file có hash để đơn giản hóa caching. Nhược điểm của cách tiếp cận này là nếu một module thay đổi, bất kỳ module nào import nó sử dụng tên file có hash của nó cũng cần được cập nhật/tái tạo. Điều này có thể dẫn đến một chuỗi các bản cập nhật, gây lãng phí tài nguyên mạng.

Import map cung cấp một giải pháp thuận tiện cho vấn đề này. Thay vì phụ thuộc vào các tên file có hash cụ thể, các ứng dụng và script thay vào đó phụ thuộc vào phiên bản không có hash của tên module (địa chỉ). Import map như bên dưới sau đó cung cấp ánh xạ đến file script thực tế.

```json
{
  "imports": {
    "main_script": "/node/srcs/application-fg7744e1b.js",
    "dependency_script": "/node/srcs/dependency-3qn7e4b1q.js"
  }
}
```

Nếu `dependency_script` thay đổi, thì hash của nó trong tên file cũng thay đổi. Trong trường hợp này, chúng ta chỉ cần cập nhật import map để phản ánh tên đã thay đổi của module. Chúng ta không cần cập nhật nguồn của bất kỳ code JavaScript nào phụ thuộc vào nó, vì specifier trong câu lệnh import không thay đổi.

## Tải các tài nguyên không phải JavaScript

Một tính năng thú vị mà kiến trúc module thống nhất mang lại là khả năng tải các tài nguyên không phải JavaScript dưới dạng module. Ví dụ, bạn có thể import JSON như một JavaScript object, hoặc import CSS như một object {{domxref("CSSStyleSheet")}}.

Bạn phải khai báo rõ ràng loại tài nguyên bạn đang import. Theo mặc định, trình duyệt giả định rằng tài nguyên là JavaScript và sẽ ném lỗi nếu tài nguyên được phân giải là thứ gì đó khác. Để import JSON, CSS hoặc các loại tài nguyên khác, hãy sử dụng cú pháp [import attributes](/en-US/docs/Web/JavaScript/Reference/Statements/import/with):

```js
import colors from "./colors.json" with { type: "json" };
import styles from "./styles.css" with { type: "css" };
```

Trình duyệt cũng sẽ thực hiện xác nhận trên loại module, và thất bại nếu, ví dụ, `./data.json` không phân giải thành một file JSON. Điều này đảm bảo rằng bạn không vô tình thực thi code khi bạn chỉ muốn import dữ liệu. Sau khi import thành công, bạn có thể sử dụng giá trị được import như một JavaScript object bình thường hoặc object `CSSStyleSheet`.

```js
console.log(colors.map((color) => color.value));
document.adoptedStyleSheets = [styles];
```

## Áp dụng module vào HTML của bạn

Bây giờ chúng ta chỉ cần áp dụng module `main.js` vào trang HTML của chúng ta. Điều này rất giống với cách chúng ta áp dụng một script thông thường vào trang, với một vài điểm khác biệt đáng chú ý.

Trước hết, bạn cần bao gồm `type="module"` trong phần tử [`<script>`](/en-US/docs/Web/HTML/Reference/Elements/script), để khai báo script này như một module. Để import script `main.js`, chúng ta sử dụng:

```html
<script type="module" src="main.js"></script>
```

Bạn cũng có thể nhúng script của module trực tiếp vào file HTML bằng cách đặt code JavaScript vào trong body của phần tử `<script>`:

```html
<script type="module">
  /* JavaScript module code here */
</script>
```

Bạn chỉ có thể sử dụng các câu lệnh `import` và `export` bên trong module, không phải script thông thường. Một lỗi sẽ được ném nếu phần tử `<script>` của bạn không có thuộc tính `type="module"` và cố import các module khác. Ví dụ:

```html example-bad
<script>
  import _ from "lodash"; // SyntaxError: import declarations may only appear at top level of a module
  // …
</script>
<script src="a-module-using-import-statements.js"></script>
<!-- SyntaxError: import declarations may only appear at top level of a module -->
```

Bạn thường nên định nghĩa tất cả module trong các file riêng biệt. Các module được khai báo inline trong HTML chỉ có thể import các module khác, nhưng bất cứ thứ gì chúng export sẽ không thể truy cập được bởi các module khác (vì chúng không có URL).

> [!NOTE]
> Các module và phụ thuộc của chúng có thể được preload bằng cách chỉ định chúng trong các phần tử [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link) với [`rel="modulepreload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/modulepreload). Điều này có thể giảm đáng kể thời gian tải khi các module được sử dụng.

## Sự khác biệt giữa module và script thông thường

- Bạn cần chú ý đến kiểm thử cục bộ — nếu bạn cố tải file HTML cục bộ (tức là với URL `file://`), bạn sẽ gặp lỗi CORS do các yêu cầu bảo mật của module JavaScript. Bạn cần thực hiện kiểm thử qua một server.
- Ngoài ra, lưu ý rằng bạn có thể nhận được hành vi khác nhau từ các phần script được định nghĩa bên trong module so với trong script thông thường. Điều này là vì các module sử dụng {{jsxref("Strict_mode", "strict mode", "", 1)}} tự động.
- Không cần sử dụng thuộc tính `defer` (xem [thuộc tính `<script>`](/en-US/docs/Web/HTML/Reference/Elements/script#attributes)) khi tải một module script; các module được defer tự động.
- Các module chỉ được thực thi một lần, ngay cả khi chúng được tham chiếu trong nhiều thẻ `<script>`.
- Cuối cùng, hãy làm rõ điều này — các tính năng của module được import vào phạm vi của một script duy nhất — chúng không có sẵn trong phạm vi toàn cục. Do đó, bạn chỉ có thể truy cập các tính năng được import trong script chúng được import vào, và bạn sẽ không thể truy cập chúng từ console JavaScript, ví dụ. Bạn vẫn sẽ nhận được các lỗi cú pháp được hiển thị trong DevTools, nhưng bạn sẽ không thể sử dụng một số kỹ thuật debug mà bạn có thể đã mong đợi sử dụng.

Các biến được định nghĩa bởi module có phạm vi trong module trừ khi được đính kèm rõ ràng vào global object. Mặt khác, các biến được định nghĩa toàn cục có sẵn trong module. Ví dụ, với code sau:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>Example page</title>
    <link rel="stylesheet" href="" />
  </head>
  <body>
    <div id="main"></div>
    <script>
      // A var statement creates a global variable.
      var text = "Hello";
    </script>
    <script type="module" src="./render.js"></script>
  </body>
</html>
```

```js
/* render.js */
document.getElementById("main").innerText = text;
```

Trang vẫn sẽ render `Hello`, vì các biến toàn cục `text` và `document` có sẵn trong module. (Cũng lưu ý từ ví dụ này rằng một module không nhất thiết cần câu lệnh import/export — điều duy nhất cần là điểm vào phải có `type="module"`.)

## Default export so với named export

Các tính năng chúng ta đã export cho đến nay đều là **named export** — mỗi mục (dù là hàm, `const`, v.v.) đã được tham chiếu bằng tên của nó khi export, và tên đó đã được sử dụng để tham chiếu đến nó khi import.

Ngoài ra còn có một loại export được gọi là **default export** — điều này được thiết kế để dễ dàng có một hàm mặc định được cung cấp bởi một module, và cũng giúp các module JavaScript tương tác với các hệ thống module CommonJS và AMD hiện có (như được giải thích hay trong [ES6 In Depth: Modules](https://hacks.mozilla.org/2015/08/es6-in-depth-modules/) của Jason Orendorff; tìm kiếm "Default exports").

Hãy xem một ví dụ khi chúng ta giải thích cách nó hoạt động. Trong `square.js` basic-modules của chúng ta, bạn có thể tìm thấy một hàm được gọi là `randomSquare()` tạo ra một hình vuông với màu sắc, kích thước và vị trí ngẫu nhiên. Chúng ta muốn export này như mặc định của chúng ta, vì vậy ở cuối file chúng ta viết:

```js
export default randomSquare;
```

Lưu ý không có dấu ngoặc nhọn.

Thay vào đó chúng ta có thể thêm `export default` vào trước hàm và định nghĩa nó là một hàm ẩn danh, như sau:

```js
export default function (ctx) {
  // …
}
```

Trong file `main.js`, chúng ta import hàm mặc định bằng dòng này:

```js
import randomSquare from "./modules/square.js";
```

Một lần nữa, lưu ý không có dấu ngoặc nhọn. Điều này là vì chỉ có một default export được phép cho mỗi module, và chúng ta biết rằng `randomSquare` là nó. Dòng trên về cơ bản là viết tắt của:

```js
import { default as randomSquare } from "./modules/square.js";
```

> [!NOTE]
> Cú pháp `as` để đổi tên các mục được export được giải thích bên dưới trong phần [Đổi tên import và export](#renaming_imports_and_exports).

## Tránh xung đột tên

Cho đến nay, các module vẽ hình canvas của chúng ta có vẻ hoạt động ổn. Nhưng điều gì sẽ xảy ra nếu chúng ta cố thêm một module xử lý việc vẽ một hình dạng khác, như hình tròn hoặc tam giác? Các hình dạng này cũng có thể có các hàm liên quan như `draw()`, `reportArea()`, v.v.; nếu chúng ta cố import các hàm khác nhau có cùng tên vào cùng một file module cấp cao nhất, chúng ta sẽ gặp xung đột và lỗi.

May mắn thay, có một số cách để giải quyết điều này. Chúng ta sẽ xem xét các cách đó trong các phần sau.

## Đổi tên import và export

Bên trong dấu ngoặc nhọn của câu lệnh `import` và `export`, bạn có thể sử dụng từ khóa `as` cùng với một tên tính năng mới, để thay đổi tên nhận dạng bạn sẽ sử dụng cho một tính năng bên trong module cấp cao nhất.

Vì vậy, ví dụ, cả hai câu lệnh sau đây sẽ làm cùng một việc, mặc dù theo cách hơi khác nhau:

```js
// -- module.js --
export { function1 as newFunctionName, function2 as anotherNewFunctionName };

// -- main.js --
import { newFunctionName, anotherNewFunctionName } from "./modules/module.js";
```

```js
// -- module.js --
export { function1, function2 };

// -- main.js --
import {
  function1 as newFunctionName,
  function2 as anotherNewFunctionName,
} from "./modules/module.js";
```

Hãy xem một ví dụ thực tế. Trong thư mục [renaming](https://github.com/mdn/js-examples/tree/main/module-examples/renaming), bạn sẽ thấy cùng hệ thống module như trong ví dụ trước, ngoại trừ chúng ta đã thêm các module `circle.js` và `triangle.js` để vẽ và báo cáo về hình tròn và tam giác.

Bên trong mỗi module này, chúng ta có các tính năng có cùng tên được export, và do đó mỗi module có cùng câu lệnh `export` ở cuối:

```js
export { name, draw, reportArea, reportPerimeter };
```

Khi import vào `main.js`, nếu chúng ta cố sử dụng

```js
import { name, draw, reportArea, reportPerimeter } from "./modules/square.js";
import { name, draw, reportArea, reportPerimeter } from "./modules/circle.js";
import { name, draw, reportArea, reportPerimeter } from "./modules/triangle.js";
```

Trình duyệt sẽ ném lỗi như "SyntaxError: redeclaration of import name" (Firefox).

Thay vào đó chúng ta cần đổi tên các import để chúng là duy nhất:

```js
import {
  name as squareName,
  draw as drawSquare,
  reportArea as reportSquareArea,
  reportPerimeter as reportSquarePerimeter,
} from "./modules/square.js";

import {
  name as circleName,
  draw as drawCircle,
  reportArea as reportCircleArea,
  reportPerimeter as reportCirclePerimeter,
} from "./modules/circle.js";

import {
  name as triangleName,
  draw as drawTriangle,
  reportArea as reportTriangleArea,
  reportPerimeter as reportTrianglePerimeter,
} from "./modules/triangle.js";
```

Lưu ý rằng bạn có thể giải quyết vấn đề trong các file module thay thế, ví dụ

```js
// in square.js
export {
  name as squareName,
  draw as drawSquare,
  reportArea as reportSquareArea,
  reportPerimeter as reportSquarePerimeter,
};
```

```js
// in main.js
import {
  squareName,
  drawSquare,
  reportSquareArea,
  reportSquarePerimeter,
} from "./modules/square.js";
```

Và nó sẽ hoạt động giống nhau. Phong cách bạn sử dụng là tùy bạn, tuy nhiên có lẽ hợp lý hơn khi để nguyên code module của bạn và thực hiện các thay đổi trong các import. Điều này đặc biệt có ý nghĩa khi bạn đang import từ các module của bên thứ ba mà bạn không có quyền kiểm soát.

## Tạo một module object

Phương pháp trên hoạt động ổn, nhưng nó hơi lộn xộn và dài dòng. Một giải pháp tốt hơn là import các tính năng của mỗi module bên trong một module object. Dạng cú pháp sau đây làm điều đó:

```js
import * as Module from "./modules/module.js";
```

Điều này lấy tất cả các export có sẵn bên trong `module.js`, và làm cho chúng có sẵn như các thành viên của một object `Module`, thực tế đặt cho nó không gian tên riêng. Vì vậy, ví dụ:

```js
Module.function1();
Module.function2();
```

Một lần nữa, hãy xem một ví dụ thực tế. Nếu bạn truy cập thư mục [module-objects](https://github.com/mdn/js-examples/tree/main/module-examples/module-objects), bạn sẽ thấy cùng ví dụ đó, nhưng được viết lại để tận dụng cú pháp mới này. Trong các module, các export đều ở dạng đơn giản sau:

```js
export { name, draw, reportArea, reportPerimeter };
```

Mặt khác, các import trông như thế này:

```js
import * as Canvas from "./modules/canvas.js";

import * as Square from "./modules/square.js";
import * as Circle from "./modules/circle.js";
import * as Triangle from "./modules/triangle.js";
```

Trong mỗi trường hợp, bạn có thể truy cập các import của module dưới tên object được chỉ định, ví dụ:

```js
const square = Square.draw(myCanvas.ctx, 50, 50, 100, "blue");
Square.reportArea(square.length, reportList);
Square.reportPerimeter(square.length, reportList);
```

Vì vậy, bây giờ bạn có thể viết code giống như trước (miễn là bạn bao gồm tên object khi cần), và các import gọn gàng hơn nhiều.

## Module và class

Như chúng tôi đã gợi ý trước đó, bạn cũng có thể export và import các class; đây là một tùy chọn khác để tránh xung đột trong code của bạn, và đặc biệt hữu ích nếu bạn đã có code module được viết theo phong cách hướng đối tượng.

Bạn có thể thấy một ví dụ về module vẽ hình của chúng ta được viết lại với các lớp ES trong thư mục [classes](https://github.com/mdn/js-examples/tree/main/module-examples/classes). Ví dụ, file [`square.js`](https://github.com/mdn/js-examples/blob/main/module-examples/classes/modules/square.js) bây giờ chứa tất cả chức năng của nó trong một lớp duy nhất:

```js
class Square {
  constructor(ctx, listId, length, x, y, color) {
    // …
  }

  draw() {
    // …
  }

  // …
}
```

sau đó chúng ta export:

```js
export { Square };
```

Trong [`main.js`](https://github.com/mdn/js-examples/blob/main/module-examples/classes/main.js), chúng ta import nó như sau:

```js
import { Square } from "./modules/square.js";
```

Và sau đó sử dụng lớp để vẽ hình vuông của chúng ta:

```js
const square = new Square(myCanvas.ctx, myCanvas.listId, 50, 50, 100, "blue");
square.draw();
square.reportArea();
square.reportPerimeter();
```

## Tổng hợp module

Sẽ có lúc bạn muốn tổng hợp các module lại với nhau. Bạn có thể có nhiều cấp phụ thuộc, nơi bạn muốn đơn giản hóa mọi thứ, kết hợp một số module con vào một module cha. Điều này có thể thực hiện bằng cú pháp export sau trong module cha:

```js
export * from "x.js";
export { name } from "x.js";
```

Để xem ví dụ, hãy xem thư mục [module-aggregation](https://github.com/mdn/js-examples/tree/main/module-examples/module-aggregation). Trong ví dụ này (dựa trên ví dụ classes trước đó), chúng ta có thêm một module được gọi là `shapes.js`, tổng hợp tất cả các chức năng từ `circle.js`, `square.js` và `triangle.js` lại với nhau. Chúng ta cũng đã chuyển các submodule vào một thư mục con bên trong thư mục `modules` gọi là `shapes`. Vì vậy, cấu trúc module trong ví dụ này là:

```plain
modules/
  canvas.js
  shapes.js
  shapes/
    circle.js
    square.js
    triangle.js
```

Trong mỗi submodule, export có cùng dạng, ví dụ:

```js
export { Square };
```

Tiếp theo là phần tổng hợp. Bên trong [`shapes.js`](https://github.com/mdn/js-examples/blob/main/module-examples/module-aggregation/modules/shapes.js), chúng ta bao gồm các dòng sau:

```js
export { Square } from "./shapes/square.js";
export { Triangle } from "./shapes/triangle.js";
export { Circle } from "./shapes/circle.js";
```

Những dòng này lấy các export từ các submodule riêng lẻ và về cơ bản làm cho chúng có sẵn từ module `shapes.js`.

> [!NOTE]
> Các export được tham chiếu trong `shapes.js` về cơ bản được chuyển hướng qua file và không thực sự tồn tại ở đó, vì vậy bạn sẽ không thể viết bất kỳ code liên quan hữu ích nào bên trong cùng file.

Vì vậy, bây giờ trong file `main.js`, chúng ta có thể truy cập tất cả ba lớp module bằng cách thay thế

```js
import { Square } from "./modules/square.js";
import { Circle } from "./modules/circle.js";
import { Triangle } from "./modules/triangle.js";
```

bằng một dòng duy nhất sau:

```js
import { Square, Circle, Triangle } from "./modules/shapes.js";
```

## Tải module động

Một bổ sung gần đây vào chức năng module JavaScript là tải module động. Điều này cho phép bạn tải module một cách động chỉ khi chúng cần thiết, thay vì phải tải mọi thứ lên trước. Điều này có một số ưu điểm hiệu suất rõ ràng; hãy tiếp tục đọc và xem cách nó hoạt động.

Chức năng mới này cho phép bạn gọi [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import) như một hàm, truyền cho nó đường dẫn đến module như một tham số. Nó trả về một {{jsxref("Promise")}}, được fulfill với một module object (xem [Tạo một module object](#creating_a_module_object)) cung cấp cho bạn quyền truy cập vào các export của object đó. Ví dụ:

```js
import("./modules/myModule.js").then((module) => {
  // Do something with the module.
});
```

> [!NOTE]
> Dynamic import được phép trong luồng chính của trình duyệt, và trong shared và dedicated worker. Tuy nhiên `import()` sẽ ném lỗi nếu được gọi trong service worker hoặc worklet.

<!-- https://whatpr.org/html/6395/webappapis.html#hostimportmoduledynamically(referencingscriptormodule,-specifier,-promisecapability) -->

Hãy xem một ví dụ. Trong thư mục [dynamic-module-imports](https://github.com/mdn/js-examples/tree/main/module-examples/dynamic-module-imports), chúng ta có một ví dụ khác dựa trên ví dụ classes. Tuy nhiên lần này chúng ta không vẽ gì trên canvas khi ví dụ tải. Thay vào đó, chúng ta bao gồm ba nút — "Circle", "Square" và "Triangle" — khi được nhấn, sẽ tải động module cần thiết và sau đó sử dụng nó để vẽ hình dạng liên quan.

Trong ví dụ này chúng ta chỉ thực hiện thay đổi trong các file [`index.html`](https://github.com/mdn/js-examples/blob/main/module-examples/dynamic-module-imports/index.html) và [`main.js`](https://github.com/mdn/js-examples/blob/main/module-examples/dynamic-module-imports/main.js) — các export module vẫn giữ nguyên như trước.

Trong `main.js`, chúng ta đã lấy tham chiếu đến mỗi nút bằng cách gọi [`document.querySelector()`](/en-US/docs/Web/API/Document/querySelector), ví dụ:

```js
const squareBtn = document.querySelector(".square");
```

Sau đó chúng ta đính kèm event listener vào mỗi nút để khi được nhấn, module liên quan được tải động và sử dụng để vẽ hình dạng:

```js
squareBtn.addEventListener("click", () => {
  import("./modules/square.js").then((Module) => {
    const square = new Module.Square(
      myCanvas.ctx,
      myCanvas.listId,
      50,
      50,
      100,
      "blue",
    );
    square.draw();
    square.reportArea();
    square.reportPerimeter();
  });
});
```

Lưu ý rằng vì fulfillment của promise trả về một module object, lớp sau đó được tạo thành một tính năng con của object, do đó bây giờ chúng ta cần truy cập constructor với `Module.` được thêm vào trước, ví dụ `Module.Square( /* … */ )`.

Một ưu điểm khác của dynamic import là chúng luôn có sẵn, ngay cả trong môi trường script. Do đó, nếu bạn có một thẻ `<script>` hiện tại trong HTML không có `type="module"`, bạn vẫn có thể tái sử dụng code được phân phối dưới dạng module bằng cách import nó một cách động.

```html
<script>
  import("./modules/square.js").then((module) => {
    // Do something with the module.
  });
  // Other code that operates on the global scope and is not
  // ready to be refactored into modules yet.
  var btn = document.querySelector(".square");
</script>
```

## Top level await

Top level await là một tính năng có sẵn trong module. Điều này có nghĩa là từ khóa `await` có thể được sử dụng. Nó cho phép các module hoạt động như các [hàm bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS/Introducing) lớn, có nghĩa là code có thể được đánh giá trước khi sử dụng trong các module cha, nhưng không chặn các module anh em khỏi việc tải.

Hãy xem một ví dụ. Bạn có thể tìm thấy tất cả các file và code được mô tả trong phần này trong thư mục [`top-level-await`](https://github.com/mdn/js-examples/tree/main/module-examples/top-level-await), mở rộng từ các ví dụ trước đó.

Đầu tiên chúng ta sẽ khai báo bảng màu của mình trong một file [`colors.json`](https://github.com/mdn/js-examples/blob/main/module-examples/top-level-await/data/colors.json) riêng biệt:

```json
{
  "yellow": "#F4D03F",
  "green": "#52BE80",
  "blue": "#5499C7",
  "red": "#CD6155",
  "orange": "#F39C12"
}
```

Sau đó chúng ta sẽ tạo một module được gọi là [`getColors.js`](https://github.com/mdn/js-examples/blob/main/module-examples/top-level-await/modules/getColors.js) sử dụng fetch request để tải file [`colors.json`](https://github.com/mdn/js-examples/blob/main/module-examples/top-level-await/data/colors.json) và trả về dữ liệu dưới dạng một object.

```js
// fetch request
const colors = fetch("../data/colors.json").then((response) => response.json());

export default await colors;
```

Hãy chú ý dòng export cuối cùng ở đây.

Chúng ta đang sử dụng từ khóa `await` trước khi chỉ định hằng số `colors` để export. Điều này có nghĩa là bất kỳ module nào bao gồm module này sẽ đợi cho đến khi `colors` đã được tải xuống và phân tích trước khi sử dụng nó.

Hãy bao gồm module này trong file [`main.js`](https://github.com/mdn/js-examples/blob/main/module-examples/top-level-await/main.js) của chúng ta:

```js
import colors from "./modules/getColors.js";
import { Canvas } from "./modules/canvas.js";

const circleBtn = document.querySelector(".circle");

// …
```

Chúng ta sẽ sử dụng `colors` thay vì các chuỗi được sử dụng trước đó khi gọi các hàm hình dạng của chúng ta:

```js
const square = new Module.Square(
  myCanvas.ctx,
  myCanvas.listId,
  50,
  50,
  100,
  colors.blue,
);

const circle = new Module.Circle(
  myCanvas.ctx,
  myCanvas.listId,
  75,
  200,
  100,
  colors.green,
);

const triangle = new Module.Triangle(
  myCanvas.ctx,
  myCanvas.listId,
  100,
  75,
  190,
  colors.yellow,
);
```

Điều này hữu ích vì code trong [`main.js`](https://github.com/mdn/js-examples/blob/main/module-examples/top-level-await/main.js) sẽ không thực thi cho đến khi code trong [`getColors.js`](https://github.com/mdn/js-examples/blob/main/module-examples/top-level-await/modules/getColors.js) đã chạy. Tuy nhiên nó sẽ không chặn các module khác tải. Ví dụ module [`canvas.js`](https://github.com/mdn/js-examples/blob/main/module-examples/top-level-await/modules/canvas.js) của chúng ta sẽ tiếp tục tải trong khi `colors` đang được fetch.

## Khai báo import được hoisted

Khai báo import được [hoisted](/en-US/docs/Glossary/Hoisting). Trong trường hợp này, điều đó có nghĩa là các giá trị được import có sẵn trong code của module ngay cả trước khi có phần khai báo chúng, và các side effect của module được import được tạo ra trước khi phần còn lại của code module bắt đầu chạy.

Vì vậy, ví dụ, trong `main.js`, việc import `Canvas` ở giữa code vẫn sẽ hoạt động:

```js
// …
const myCanvas = new Canvas("myCanvas", document.body, 480, 320);
myCanvas.create();
import { Canvas } from "./modules/canvas.js";
myCanvas.createReportList();
// …
```

Tuy nhiên, vẫn được coi là thực hành tốt khi đặt tất cả import ở đầu code, điều này giúp dễ dàng phân tích các phụ thuộc hơn.

## Import vòng tròn (Cyclic imports)

Các module có thể import các module khác, và những module đó có thể import các module khác, và cứ thế tiếp tục. Điều này tạo thành một [đồ thị có hướng](https://en.wikipedia.org/wiki/Directed_graph) được gọi là "dependency graph". Trong một thế giới lý tưởng, đồ thị này là [acyclic](https://en.wikipedia.org/wiki/Directed_acyclic_graph). Trong trường hợp này, đồ thị có thể được đánh giá bằng cách sử dụng duyệt theo chiều sâu đầu tiên.

Tuy nhiên, các chu kỳ thường là không thể tránh khỏi. Import vòng tròn xảy ra nếu module `a` import module `b`, nhưng `b` trực tiếp hoặc gián tiếp phụ thuộc vào `a`. Ví dụ:

```js
// -- a.js --
import { b } from "./b.js";

// -- b.js --
import { a } from "./a.js";

// Cycle:
// a.js ───> b.js
//  ^         │
//  └─────────┘
```

Import vòng tròn không phải lúc nào cũng thất bại. Giá trị của biến được import chỉ được lấy khi biến thực sự được sử dụng (do đó cho phép [live bindings](/en-US/docs/Web/JavaScript/Reference/Statements/import#imported_values_can_only_be_modified_by_the_exporter)), và chỉ nếu biến vẫn chưa được khởi tạo vào thời điểm đó thì [`ReferenceError`](/en-US/docs/Web/JavaScript/Reference/Errors/Cant_access_lexical_declaration_before_init) mới được ném ra.

```js
// -- a.js --
import { b } from "./b.js";

setTimeout(() => {
  console.log(b); // 1
}, 10);

export const a = 2;

// -- b.js --
import { a } from "./a.js";

setTimeout(() => {
  console.log(a); // 2
}, 10);

export const b = 1;
```

Trong ví dụ này, cả `a` và `b` đều được sử dụng bất đồng bộ. Do đó, tại thời điểm module được đánh giá, cả `b` lẫn `a` đều không thực sự được đọc, vì vậy phần còn lại của code được thực thi bình thường, và hai khai báo `export` tạo ra các giá trị của `a` và `b`. Sau đó, sau timeout, cả `a` và `b` đều có sẵn, vì vậy hai câu lệnh `console.log` cũng thực thi bình thường.

Nếu bạn thay đổi code để sử dụng `a` đồng bộ, việc đánh giá module sẽ thất bại:

```js
// -- a.js (entry module) --
import { b } from "./b.js";

export const a = 2;

// -- b.js --
import { a } from "./a.js";

console.log(a); // ReferenceError: Cannot access 'a' before initialization
export const b = 1;
```

Điều này là vì khi JavaScript đánh giá `a.js`, nó cần đánh giá trước `b.js`, phụ thuộc của `a.js`. Tuy nhiên, `b.js` sử dụng `a`, vốn chưa có sẵn.

Mặt khác, nếu bạn thay đổi code để sử dụng `b` đồng bộ nhưng `a` bất đồng bộ, việc đánh giá module thành công:

```js
// -- a.js (entry module) --
import { b } from "./b.js";

console.log(b); // 1
export const a = 2;

// -- b.js --
import { a } from "./a.js";

setTimeout(() => {
  console.log(a); // 2
}, 10);
export const b = 1;
```

Điều này là vì việc đánh giá `b.js` hoàn thành bình thường, vì vậy giá trị của `b` có sẵn khi `a.js` được đánh giá.

Bạn thường nên tránh import vòng tròn trong dự án của mình, vì chúng làm code dễ bị lỗi hơn. Một số kỹ thuật loại bỏ chu kỳ phổ biến là:

- Hợp nhất hai module thành một.
- Chuyển code dùng chung vào một module thứ ba.
- Chuyển một số code từ module này sang module kia.

Tuy nhiên, import vòng tròn cũng có thể xảy ra nếu các thư viện phụ thuộc vào nhau, điều này khó khắc phục hơn.

## Viết module "isomorphic"

Việc giới thiệu module khuyến khích hệ sinh thái JavaScript phân phối và tái sử dụng code theo cách module. Tuy nhiên, điều đó không nhất thiết có nghĩa là một đoạn code JavaScript có thể chạy trong mọi môi trường. Giả sử bạn đã phát hiện một module tạo ra các hash SHA của mật khẩu người dùng. Bạn có thể sử dụng nó trong frontend trình duyệt không? Bạn có thể sử dụng nó trên Node.js server của bạn không? Câu trả lời là: tùy thuộc.

Các module vẫn có quyền truy cập vào các biến toàn cục, như đã minh họa trước đó. Nếu module tham chiếu các biến toàn cục như `window`, nó có thể chạy trong trình duyệt, nhưng sẽ ném lỗi trong Node.js server của bạn, vì `window` không có ở đó. Tương tự, nếu code yêu cầu quyền truy cập vào `process` để hoạt động, nó chỉ có thể được sử dụng trong Node.js.

Để tối đa hóa khả năng tái sử dụng của một module, thường được khuyến nghị làm cho code "isomorphic" — tức là thể hiện cùng hành vi trong mọi runtime. Điều này thường đạt được theo ba cách:

- Tách module của bạn thành "core" và "binding". Đối với "core", tập trung vào logic JavaScript thuần túy như tính toán hash, không có bất kỳ DOM, mạng, quyền truy cập hệ thống file, và expose các hàm tiện ích. Đối với phần "binding", bạn có thể đọc và viết vào ngữ cảnh toàn cục. Ví dụ, "browser binding" có thể chọn đọc giá trị từ input box, trong khi "Node binding" có thể đọc từ `process.env`, nhưng các giá trị được đọc từ một trong hai nơi sẽ được chuyển đến cùng một hàm core và xử lý theo cùng cách. Core có thể được import trong mọi môi trường và sử dụng theo cùng cách, trong khi chỉ có binding, thường nhẹ, cần phải cụ thể cho nền tảng.
- Phát hiện xem có tồn tại một biến toàn cục cụ thể trước khi sử dụng nó hay không. Ví dụ, nếu bạn kiểm tra rằng `typeof window === "undefined"`, bạn biết rằng bạn có thể đang trong môi trường Node.js và không nên đọc DOM.

  ```js
  // myModule.js
  let password;
  if (typeof process !== "undefined") {
    // We are running in Node.js; read it from `process.env`
    password = process.env.PASSWORD;
  } else if (typeof window !== "undefined") {
    // We are running in the browser; read it from the input box
    password = document.getElementById("password").value;
  }
  ```

  Điều này được ưa thích nếu hai nhánh thực sự kết thúc với cùng hành vi ("isomorphic"). Nếu không thể cung cấp cùng chức năng, hoặc nếu làm như vậy đòi hỏi tải lượng lớn code trong khi một phần lớn vẫn không được sử dụng, tốt hơn là sử dụng các "binding" khác nhau thay thế.

- Sử dụng một polyfill để cung cấp fallback cho các tính năng bị thiếu. Ví dụ, nếu bạn muốn sử dụng hàm [`fetch`](/en-US/docs/Web/API/Fetch_API), chỉ được hỗ trợ trong Node.js kể từ v18, bạn có thể sử dụng một API tương tự, như API được cung cấp bởi [`node-fetch`](https://www.npmjs.com/package/node-fetch). Bạn có thể làm như vậy có điều kiện thông qua dynamic import:

  ```js
  // myModule.js
  if (typeof fetch === "undefined") {
    // We are running in Node.js; use node-fetch
    globalThis.fetch = (await import("node-fetch")).default;
  }
  // …
  ```

  Biến [`globalThis`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/globalThis) là một global object có sẵn trong mọi môi trường và hữu ích nếu bạn muốn đọc hoặc tạo các biến toàn cục trong module.

Những thực hành này không chỉ dành riêng cho module. Tuy nhiên, với xu hướng tái sử dụng code và module hóa, bạn được khuyến khích làm cho code của mình đa nền tảng để càng nhiều người có thể hưởng lợi từ nó. Các runtime như Node.js cũng đang tích cực triển khai các web API khi có thể để cải thiện khả năng tương tác với web.

## Khắc phục sự cố

Dưới đây là một vài mẹo có thể giúp bạn nếu bạn gặp khó khăn khi làm cho module hoạt động. Hãy thoải mái thêm vào danh sách nếu bạn phát hiện thêm!

- Chúng tôi đã đề cập điều này trước đó, nhưng để nhắc lại: các file `.mjs` cần được tải với MIME-type là `text/javascript` (hoặc MIME-type tương thích JavaScript khác, nhưng `text/javascript` được khuyến nghị), nếu không bạn sẽ gặp lỗi kiểm tra MIME-type nghiêm ngặt như "The server responded with a non-JavaScript MIME type".
- Nếu bạn cố tải file HTML cục bộ (tức là với URL `file://`), bạn sẽ gặp lỗi CORS do các yêu cầu bảo mật của module JavaScript. Bạn cần thực hiện kiểm thử qua một server. GitHub pages là lý tưởng vì nó cũng phục vụ các file `.mjs` với MIME-type chính xác.
- Vì `.mjs` là phần mở rộng file không chuẩn, một số hệ điều hành có thể không nhận ra nó, hoặc cố thay thế nó bằng thứ gì đó khác. Ví dụ, chúng tôi thấy rằng macOS đang âm thầm thêm `.js` vào cuối các file `.mjs` và sau đó tự động ẩn phần mở rộng file. Vì vậy, tất cả các file của chúng tôi thực sự ra là `x.mjs.js`. Khi chúng tôi tắt tính năng tự động ẩn phần mở rộng file và đào tạo nó chấp nhận `.mjs`, thì ổn.

## Xem thêm

- [JavaScript modules](https://v8.dev/features/modules) on v8.dev (2018)
- [ES modules: A cartoon deep-dive](https://hacks.mozilla.org/2018/03/es-modules-a-cartoon-deep-dive/) on hacks.mozilla.org (2018)
- [ES6 in Depth: Modules](https://hacks.mozilla.org/2015/08/es6-in-depth-modules/) on hacks.mozilla.org (2015)
- [Exploring JS, Ch.16: Modules](https://exploringjs.com/es6/ch_modules.html) by Dr. Axel Rauschmayer

{{Previous("Web/JavaScript/Guide/Internationalization")}}
