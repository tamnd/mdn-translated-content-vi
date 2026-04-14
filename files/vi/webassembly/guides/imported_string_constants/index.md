---
title: Hằng chuỗi toàn cục được nhập khẩu của WebAssembly
slug: WebAssembly/Guides/Imported_string_constants
page-type: guide
sidebar: webassemblysidebar
---

Các hằng chuỗi toàn cục được nhập khẩu của WebAssembly giúp làm việc với chuỗi JavaScript bên trong các mô-đun Wasm dễ dàng hơn bằng cách loại bỏ nhu cầu về nhiều mã lặp đi lặp lại liên quan đến việc nhập khẩu chuỗi truyền thống.

Bài viết này giải thích cách các hằng chuỗi toàn cục được nhập khẩu hoạt động.

## Vấn đề với việc nhập khẩu chuỗi truyền thống

Hãy bắt đầu bằng cách khám phá cách nhập khẩu chuỗi đã hoạt động truyền thống trong WebAssembly. Trong một mô-đun Wasm, bạn có thể nhập khẩu một vài chuỗi từ một không gian tên gọi là `"string_constants"` với đoạn code sau:

```wat
(global (import "string_constants" "string_constant_1") externref)
(global (import "string_constants" "string_constant_2") externref)
```

Trong JavaScript của bạn, sau đó bạn sẽ cung cấp các chuỗi để nhập khẩu trong một `importObject`:

```js
importObject = {
  // …
  string_constants: {
    string_constant_1: "hello ",
    string_constant_2: "world!",
    // …
  },
};
```

Trước khi biên dịch/khởi tạo mô-đun để sử dụng các hàm của nó:

```js
WebAssembly.instantiateStreaming(fetch("my-module.wasm"), importObject).then(
  (obj) => obj.instance.exports.exported_func(),
);
```

Điều này không tối ưu vì một số lý do:

1. Kích thước tải xuống tăng lên cho mỗi chuỗi mới được nhập khẩu, và sự tăng này nhiều hơn chỉ là các chuỗi chính chúng — đối với mỗi chuỗi bạn cần định nghĩa của toàn cục được nhập khẩu trong mô-đun Wasm, và định nghĩa của giá trị ở phía JavaScript. Đối với một mô-đun Wasm với hàng nghìn chuỗi được nhập khẩu, điều này thực sự có thể cộng dồn.
2. Tất cả những byte này cũng mất thời gian để phân tích cú pháp trước khi mô-đun Wasm có thể được khởi tạo.
3. Đối với tối ưu hóa mô-đun Wasm, đây là sự bất tiện thêm khi phải sửa đổi một tệp JavaScript kèm theo cùng với mô-đun Wasm, ví dụ khi xóa các hằng chuỗi không sử dụng tại thời gian biên dịch.

Tên nhập khẩu có thể là bất kỳ chuỗi unicode nào bạn thích, vì vậy các nhà phát triển thường đặt toàn bộ chuỗi làm tên nhập khẩu để thuận tiện (ví dụ: khi gỡ lỗi). Điều này sẽ dẫn đến đoạn Wasm ở trên được viết lại như sau:

```wat
(global (import "string_constants" "hello ") externref)
(global (import "string_constants" "world!") externref)
```

Và `importObject` kèm theo như thế này:

```js
importObject = {
  // …
  string_constants: {
    "hello ": "hello ",
    "world!": "world!",
    // …
  },
};
```

Nhìn vào code ở trên, có ý nghĩa khi để trình duyệt tự động hóa bớt một số mã lặp đi lặp lại này, và đó chính xác là những gì tính năng hằng chuỗi toàn cục được nhập khẩu thực hiện.

## Sử dụng các hằng chuỗi toàn cục được nhập khẩu

Bây giờ chúng ta sẽ xem cách sử dụng các hằng chuỗi toàn cục được nhập khẩu.

### JavaScript API

Các hằng chuỗi toàn cục được nhập khẩu được kích hoạt bằng cách bao gồm thuộc tính `compileOptions.importedStringConstants` khi gọi các phương thức để biên dịch và/hoặc khởi tạo một mô-đun. Giá trị của nó là một không gian tên nhập khẩu cho các hằng chuỗi toàn cục được nhập khẩu mà engine Wasm sẽ tự động điền vào:

```js
WebAssembly.compile(bytes, {
  importedStringConstants: "string_constants",
});
```

Chỉ vậy thôi! Không cần danh sách chuỗi trong đối tượng nhập khẩu.

Đối tượng `compileOptions` có sẵn cho các hàm sau:

- [`WebAssembly.compile()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/compile_static)
- [`WebAssembly.compileStreaming()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/compileStreaming_static)
- [`WebAssembly.instantiate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static)
- [`WebAssembly.instantiateStreaming()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiateStreaming_static)
- [`WebAssembly.validate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/validate_static)
- Constructor [`WebAssembly.Module()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Module/Module)

### Các tính năng mô-đun WebAssembly

Trong mô-đun WebAssembly của bạn, bây giờ bạn có thể nhập khẩu các literal chuỗi, chỉ định cùng không gian tên bạn đã chỉ định trong `importedStringConstants` ở phía JavaScript:

```wat
(global $h (import "string_constants" "hello ") externref)
(global $w (import "string_constants" "world!") externref)
```

Engine Wasm sau đó nhìn vào tất cả các toàn cục được nhập khẩu trong không gian tên `string_constants` và tạo một chuỗi bằng với mỗi tên nhập khẩu được chỉ định.

### Ghi chú về việc chọn không gian tên

Ví dụ trên sử dụng `"string_constants"` làm không gian tên chuỗi toàn cục được nhập khẩu cho mục đích minh họa. Tuy nhiên, trong sản xuất, tốt nhất là sử dụng chuỗi rỗng (`""`) để tiết kiệm kích thước tệp mô-đun. Không gian tên được lặp lại cho mỗi literal chuỗi, và các mô-đun thực tế có thể có hàng nghìn literal, vì vậy tiết kiệm có thể đáng kể.

Nếu bạn đã sử dụng không gian tên `""` cho một mục đích khác, bạn nên xem xét sử dụng không gian tên một ký tự cho các chuỗi của mình như `"s"`, `"'"` hoặc `"#"`.

Việc lựa chọn không gian tên thường được thực hiện bởi các tác giả của toolchain sẽ tạo ra các mô-đun Wasm. Khi bạn có tệp `.wasm` và muốn nhúng nó vào JavaScript của mình, bạn không thể tự do chọn không gian tên này nữa; bạn phải sử dụng những gì tệp `.wasm` mong đợi.

## Ví dụ về chuỗi toàn cục được nhập khẩu

Bạn có thể xem một ví dụ sử dụng các chuỗi toàn cục được nhập khẩu [chạy trực tiếp](https://mdn.github.io/webassembly-examples/js-builtin-examples/instantiate/) — mở bảng điều khiển JavaScript của trình duyệt để xem đầu ra ví dụ. Ví dụ này định nghĩa một hàm bên trong mô-đun Wasm nối hai chuỗi được nhập khẩu lại với nhau và in kết quả ra bảng điều khiển, xuất khẩu nó, sau đó gọi hàm được xuất khẩu từ JavaScript.

JavaScript cho ví dụ được hiển thị bên dưới. Bạn có thể thấy cách chúng ta đã sử dụng `importedStringConstants` để kích hoạt các chuỗi toàn cục được nhập khẩu:

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

Biểu diễn văn bản của code mô-đun WebAssembly trông như thế này — chú ý cách nó nhập khẩu hai chuỗi trong không gian tên được chỉ định, được sử dụng sau trong hàm `$concat`:

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

> [!NOTE]
> Ví dụ này cũng sử dụng một hàm tích hợp JavaScript String. Xem [Các hàm tích hợp JavaScript WebAssembly](/en-US/docs/WebAssembly/Guides/JavaScript_builtins) để biết thêm thông tin về chúng và hướng dẫn đầy đủ về ví dụ trên.
