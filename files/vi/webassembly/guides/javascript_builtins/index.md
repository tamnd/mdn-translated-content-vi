---
title: Các hàm tích hợp JavaScript WebAssembly
slug: WebAssembly/Guides/JavaScript_builtins
page-type: guide
sidebar: webassemblysidebar
---

Các hàm tích hợp JavaScript WebAssembly là các tương đương Wasm của các phép toán JavaScript cung cấp cách sử dụng các tính năng JavaScript bên trong mô-đun Wasm mà không cần phải nhập khẩu code JavaScript glue để cung cấp cầu nối giữa các giá trị và quy ước gọi hàm của JavaScript và WebAssembly.

Bài viết này giải thích cách các hàm tích hợp hoạt động và những hàm nào có sẵn, sau đó cung cấp ví dụ sử dụng.

## Vấn đề với việc nhập khẩu hàm JavaScript

Đối với nhiều tính năng JavaScript, việc nhập khẩu thông thường hoạt động tốt. Tuy nhiên, việc nhập khẩu code glue cho các kiểu nguyên thủy như {{jsxref("String")}}, {{jsxref("ArrayBuffer")}} và {{jsxref("Map")}} đi kèm với chi phí hiệu suất đáng kể. Trong các trường hợp như vậy, WebAssembly và hầu hết các ngôn ngữ nhắm đến nó mong đợi một chuỗi các phép toán nội tuyến chặt chẽ thay vì một lời gọi hàm gián tiếp, đó là cách các hàm được nhập khẩu thông thường hoạt động.

Cụ thể, việc nhập khẩu hàm từ JavaScript vào các mô-đun WebAssembly tạo ra các vấn đề hiệu suất vì những lý do sau:

- Các API hiện có yêu cầu chuyển đổi để xử lý sự khác biệt xung quanh giá trị [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), mà các lời gọi `import` hàm WebAssembly để là `undefined`.
- Các kiểu nguyên thủy nhất định sử dụng các toán tử JavaScript như [`===`](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) và [`<`](/en-US/docs/Web/JavaScript/Reference/Operators/Less_than) không thể được nhập khẩu.
- Hầu hết các hàm JavaScript rất dễ chấp nhận về các kiểu giá trị chúng nhận, và rất mong muốn tận dụng hệ thống kiểu của WebAssembly để loại bỏ các kiểm tra và ép kiểu đó bất cứ khi nào có thể.

Xem xét những vấn đề này, việc tạo các định nghĩa tích hợp thích ứng chức năng JavaScript hiện có như các kiểu nguyên thủy {{jsxref("String")}} với WebAssembly đơn giản hơn và tốt hơn về hiệu suất so với nhập khẩu nó và dựa vào các lời gọi hàm gián tiếp.

## Các hàm tích hợp JavaScript WebAssembly có sẵn

Các phần bên dưới mô tả chi tiết các hàm tích hợp có sẵn. Các hàm tích hợp khác có thể sẽ được hỗ trợ trong tương lai.

### Các phép toán chuỗi

Các hàm tích hợp {{jsxref("String")}} có sẵn là:

- [`"wasm:js-string" "cast"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-cast)
  - : Ném lỗi nếu giá trị được cung cấp không phải là chuỗi. Xấp xỉ tương đương với:

    ```js
    if (typeof obj !== "string") throw new WebAssembly.RuntimeError();
    ```

- [`"wasm:js-string" "compare"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-compare)
  - : So sánh hai giá trị chuỗi và xác định thứ tự của chúng. Trả về `-1` nếu chuỗi đầu tiên [nhỏ hơn](/en-US/docs/Web/JavaScript/Reference/Operators/Less_than) chuỗi thứ hai, `1` nếu chuỗi đầu tiên [lớn hơn](/en-US/docs/Web/JavaScript/Reference/Operators/Greater_than) chuỗi thứ hai, và `0` nếu các chuỗi [bằng nhau chặt chẽ](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality).
- [`"wasm:js-string" "concat"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-concat)
  - : Tương đương với {{jsxref("String.prototype.concat()")}}.
- [`"wasm:js-string" "charCodeAt"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-charcodeat)
  - : Tương đương với {{jsxref("String.prototype.charCodeAt()")}}.
- [`"wasm:js-string" "codePointAt"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-codepointat)
  - : Tương đương với {{jsxref("String.prototype.codePointAt()")}}.
- [`"wasm:js-string" "equals"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-equals)
  - : So sánh hai giá trị chuỗi để [bằng nhau chặt chẽ](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality), trả về `1` nếu chúng bằng nhau và `0` nếu không.
    > [!NOTE]
    > Hàm `"equals"` là hàm tích hợp chuỗi duy nhất không ném lỗi cho các đầu vào `null`, vì vậy các mô-đun Wasm không cần phải kiểm tra các giá trị `null` trước khi gọi nó. Tất cả các hàm khác không có cách hợp lý để xử lý các đầu vào `null`, vì vậy chúng ném lỗi cho chúng.
- [`"wasm:js-string" "fromCharCode"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-fromcharcode)
  - : Tương đương với {{jsxref("String.fromCharCode()")}}.
- [`"wasm:js-string" "fromCharCodeArray"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-fromcharcodearray)
  - : Tạo một chuỗi từ một mảng Wasm gồm các giá trị `i16`.
- [`"wasm:js-string" "fromCodePoint"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-fromcodepoint)
  - : Tương đương với {{jsxref("String.fromCodePoint()")}}.
- [`"wasm:js-string" "intoCharCodeArray"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-intocharcodearray)
  - : Ghi các mã char của chuỗi vào một mảng Wasm gồm các giá trị `i16`.
- [`"wasm:js-string" "length"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-length)
  - : Tương đương với {{jsxref("String.prototype.length")}}.
- [`"wasm:js-string" "substring"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-substring)
  - : Tương đương với {{jsxref("String.prototype.substring()")}}.
- [`"wasm:js-string" "test"`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-test)
  - : Trả về `0` nếu giá trị được cung cấp không phải là chuỗi, hoặc `1` nếu nó là chuỗi. Xấp xỉ tương đương với:

    ```js
    typeof obj === "string";
    ```

## Bạn sử dụng các hàm tích hợp như thế nào?

Các hàm tích hợp hoạt động theo cách tương tự như các hàm được nhập khẩu từ JavaScript, ngoại trừ bạn đang sử dụng các tương đương hàm Wasm tiêu chuẩn để thực hiện các phép toán JavaScript được định nghĩa trong một không gian tên dành riêng (`wasm:`). Điều này được tính đến, các trình duyệt có thể dự đoán và tạo code tối ưu cho chúng. Phần này tóm tắt cách sử dụng chúng.

### JavaScript API

Các hàm tích hợp được kích hoạt tại thời gian biên dịch bằng cách chỉ định thuộc tính `compileOptions.builtins` làm đối số khi gọi các phương thức để biên dịch và/hoặc khởi tạo một mô-đun. Giá trị của nó là một mảng chuỗi xác định các bộ hàm tích hợp bạn muốn kích hoạt:

```js
WebAssembly.compile(bytes, { builtins: ["js-string"] });
```

Đối tượng `compileOptions` có sẵn cho các hàm sau:

- [`WebAssembly.compile()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/compile_static)
- [`WebAssembly.compileStreaming()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/compileStreaming_static)
- [`WebAssembly.instantiate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static)
- [`WebAssembly.instantiateStreaming()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiateStreaming_static)
- [`WebAssembly.validate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/validate_static)
- Constructor [`WebAssembly.Module()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Module/Module)

### Các tính năng mô-đun WebAssembly

Trong mô-đun WebAssembly của bạn, bây giờ bạn có thể nhập khẩu các hàm tích hợp như được chỉ định trong đối tượng `compileOptions` từ không gian tên `wasm:` (trong trường hợp này là hàm [`concat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat); xem thêm [định nghĩa hàm tích hợp tương đương](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-concat)):

```wat
(func $concat (import "wasm:js-string" "concat")
    (param externref externref) (result (ref extern)))
```

## Phát hiện tính năng hàm tích hợp

Khi sử dụng hàm tích hợp, kiểm tra kiểu sẽ nghiêm ngặt hơn so với khi chúng không có — một số quy tắc nhất định được áp đặt lên các import hàm tích hợp.

Do đó, để viết code phát hiện tính năng cho hàm tích hợp, bạn có thể định nghĩa một mô-đun _không hợp lệ_ với tính năng có mặt và _hợp lệ_ khi không có nó. Sau đó bạn trả về `true` khi xác thực thất bại, để chỉ ra hỗ trợ. Một mô-đun cơ bản sẽ đạt được điều này như sau:

```wat
(module
  (function (import "wasm:js-string" "cast")))
```

Không có hàm tích hợp, mô-đun hợp lệ, vì bạn có thể nhập khẩu bất kỳ hàm nào với bất kỳ chữ ký nào bạn muốn (trong trường hợp này: không có tham số và không có giá trị trả về). Với hàm tích hợp, mô-đun không hợp lệ, vì hàm `"wasm:js-string" "cast"` được xử lý đặc biệt phải có chữ ký cụ thể (một tham số `externref` và giá trị trả về `(ref extern)` không nullable).

Sau đó bạn có thể thử xác thực mô-đun này bằng phương thức [`validate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/validate_static), nhưng lưu ý cách kết quả bị phủ nhận với toán tử `!` — hãy nhớ rằng hàm tích hợp được hỗ trợ nếu mô-đun _không hợp lệ_:

```js
const compileOptions = {
  builtins: ["js-string"],
};

fetch("module.wasm")
  .then((response) => response.arrayBuffer())
  .then((bytes) => WebAssembly.validate(bytes, compileOptions))
  .then((result) => console.log(`Builtins available: ${!result}`));
```

Code mô-đun ở trên ngắn đến mức bạn chỉ cần xác thực các byte literal thay vì tải xuống mô-đun. Một hàm phát hiện tính năng có thể trông như thế này:

```js
function JsStringBuiltinsSupported() {
  let bytes = new Uint8Array([
    0, 97, 115, 109, 1, 0, 0, 0, 1, 4, 1, 96, 0, 0, 2, 23, 1, 14, 119, 97, 115,
    109, 58, 106, 115, 45, 115, 116, 114, 105, 110, 103, 4, 99, 97, 115, 116, 0,
    0,
  ]);
  return !WebAssembly.validate(bytes, { builtins: ["js-string"] });
}
```

> [!NOTE]
> Trong nhiều trường hợp có các phương án thay thế để phát hiện hàm tích hợp. Một tùy chọn khác có thể là cung cấp các nhập khẩu thông thường cùng với hàm tích hợp, và các trình duyệt hỗ trợ sẽ chỉ bỏ qua các dự phòng.

## Ví dụ về hàm tích hợp

Hãy thực hiện một ví dụ cơ bản nhưng hoàn chỉnh để thấy cách hàm tích hợp được sử dụng. Ví dụ này sẽ định nghĩa một hàm bên trong mô-đun Wasm nối hai chuỗi lại và in kết quả vào bảng điều khiển, sau đó xuất khẩu nó. Chúng ta sau đó sẽ gọi hàm được xuất khẩu từ JavaScript.

Ví dụ chúng ta sẽ tham khảo sử dụng hàm [`WebAssembly.instantiate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static) trên trang web để xử lý biên dịch và khởi tạo; bạn có thể tìm thấy ví dụ này và các ví dụ khác trong repo `webassembly-examples` của chúng tôi — xem [`js-builtin-examples`](https://github.com/mdn/webassembly-examples/tree/main/js-builtin-examples).

Bạn có thể xây dựng ví dụ bằng cách làm theo các bước bên dưới. Ngoài ra, bạn có thể [xem nó chạy trực tiếp](https://mdn.github.io/webassembly-examples/js-builtin-examples/instantiate/) — mở bảng điều khiển JavaScript của trình duyệt để xem đầu ra ví dụ.

### JavaScript

JavaScript cho ví dụ được hiển thị bên dưới. Để kiểm tra điều này cục bộ, hãy bao gồm nó trong một trang HTML bằng phương thức bạn chọn (ví dụ: bên trong thẻ {{htmlelement("script")}}, hoặc trong một tệp `.js` bên ngoài được tham chiếu thông qua `<script src="">`).

```js
const importObject = {
  // Regular import
  m: {
    log: console.log,
  },
};

const compileOptions = {
  builtins: ["js-string"], // Enable JavaScript string builtins
  importedStringConstants: "string_constants", // Enable imported global string constants
};

fetch("log-concat.wasm")
  .then((response) => response.arrayBuffer())
  .then((bytes) => WebAssembly.instantiate(bytes, importObject, compileOptions))
  .then((result) => result.instance.exports.main());
```

JavaScript:

- Định nghĩa một `importObject` chỉ định hàm `"log"` tại không gian tên `"m"` để nhập khẩu vào mô-đun Wasm trong quá trình khởi tạo. Đó là hàm {{domxref("console.log_static", "console.log()")}}.
- Định nghĩa một đối tượng `compileOptions` bao gồm:
  - thuộc tính `builtins` để kích hoạt hàm tích hợp chuỗi.
  - thuộc tính `importedStringConstants` để kích hoạt [các hằng chuỗi toàn cục được nhập khẩu](/en-US/docs/WebAssembly/Guides/Imported_string_constants).
- Sử dụng {{domxref("Window.fetch", "fetch()")}} để tải mô-đun Wasm (`log-concat.wasm`), chuyển đổi phản hồi thành {{jsxref("ArrayBuffer")}} bằng {{domxref("Response.arrayBuffer")}}, sau đó biên dịch và khởi tạo mô-đun Wasm bằng [`WebAssembly.instantiate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static).
- Gọi hàm `main()` được xuất khẩu từ mô-đun Wasm.

### Mô-đun Wasm

Biểu diễn văn bản của code mô-đun WebAssembly của chúng ta trông như thế này:

```wat
(module
  (global $h (import "string_constants" "hello ") externref)
  (global $w (import "string_constants" "world!") externref)
  (func $concat (import "wasm:js-string" "concat")
    (param externref externref) (result (ref extern)))
  (func $log (import "m" "log") (param externref))
  (func (export "main")
    (call $log (call $concat (global.get $h) (global.get $w))))
)
```

Code này:

- Nhập khẩu hai hằng chuỗi toàn cục, `"hello "` và `"world!"`, với không gian tên `"string_constants"` như được chỉ định trong JavaScript. Chúng được đặt tên là `$h` và `$w`.
- Nhập khẩu hàm tích hợp [`concat`](https://github.com/WebAssembly/js-string-builtins/blob/main/proposals/js-string-builtins/Overview.md#wasmjs-string-concat) từ không gian tên `wasm:`, đặt tên là `$concat` và chỉ định rằng nó có hai tham số và một giá trị trả về.
- Nhập khẩu hàm `"log"` được nhập khẩu từ không gian tên `"m"`, như được chỉ định trong đối tượng `importObject` JavaScript, đặt tên là `$log` và chỉ định rằng nó có một tham số. Chúng ta quyết định bao gồm cả nhập khẩu thông thường và hàm tích hợp trong ví dụ để cho bạn thấy cách hai phương pháp so sánh.
- Định nghĩa một hàm sẽ được xuất khẩu với tên `"main"`. Hàm này gọi `$log`, truyền cho nó một lời gọi `$concat` làm tham số. Lời gọi `$concat` được truyền các hằng chuỗi toàn cục `$h` và `$w` làm tham số.

Để làm cho ví dụ cục bộ của bạn hoạt động:

1. Lưu code mô-đun WebAssembly được hiển thị ở trên vào một tệp văn bản có tên `log-concat.wat`, trong cùng thư mục với HTML/JavaScript của bạn.
2. Biên dịch nó thành mô-đun WebAssembly (`log-concat.wasm`) bằng công cụ `wasm-as`, là một phần của [thư viện Binaryen](https://github.com/WebAssembly/binaryen) (xem [hướng dẫn xây dựng](https://github.com/WebAssembly/binaryen?tab=readme-ov-file#building)). Bạn sẽ cần chạy `wasm-as` với các kiểu tham chiếu và thu gom rác (GC) được kích hoạt để các ví dụ này biên dịch thành công:

   ```sh
   wasm-as --enable-reference-types -–enable-gc log-concat.wat
   ```

   Hoặc bạn có thể sử dụng cờ `-all` thay cho `--enable-reference-types -–enable-gc`:

   ```sh
   wasm-as -all log-concat.wat
   ```

3. Tải trang HTML ví dụ của bạn trong một [trình duyệt hỗ trợ](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static#browser_compatibility) bằng [máy chủ HTTP cục bộ](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server#running_a_simple_local_http_server).

Kết quả sẽ là một trang web trống, với `"hello world!"` được ghi vào bảng điều khiển JavaScript, được tạo bởi một hàm Wasm được xuất khẩu. Việc ghi nhật ký được thực hiện bằng cách sử dụng một hàm được nhập khẩu từ JavaScript, trong khi việc nối hai chuỗi gốc được thực hiện bởi một hàm tích hợp.
