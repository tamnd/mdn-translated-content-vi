---
title: Chuyển đổi định dạng văn bản WebAssembly thành nhị phân
slug: WebAssembly/Guides/Text_format_to_Wasm
page-type: guide
sidebar: webassemblysidebar
---

WebAssembly có biểu diễn văn bản dựa trên S-expression, một dạng trung gian được thiết kế để hiển thị trong các trình soạn thảo văn bản, công cụ phát triển trình duyệt, v.v. Bài viết này giải thích một chút về cách nó hoạt động và cách sử dụng các công cụ có sẵn để chuyển đổi các tệp định dạng văn bản sang định dạng Wasm.

> [!NOTE]
> Các tệp định dạng văn bản thường được lưu với phần mở rộng `.wat`. Về mặt lịch sử, phần mở rộng `.wast` cũng được sử dụng, tuy nhiên bây giờ nó được sử dụng cho ngôn ngữ scripting được sử dụng bởi bộ kiểm tra WebAssembly.

## Cái nhìn đầu tiên về định dạng văn bản

Hãy xem một ví dụ về điều này — chương trình sau nhập khẩu một hàm có tên `imported_func` từ một mô-đun có tên `my_namespace`, và xuất khẩu một hàm có tên `exported_func`:

```wat
(module
  (func $i (import "my_namespace" "imported_func") (param i32))
  (func (export "exported_func")
    i32.const 42
    call $i
  )
)
```

Hàm WebAssembly `exported_func` được xuất khẩu để sử dụng trong môi trường của chúng ta (ví dụ: ứng dụng web mà chúng ta đang sử dụng mô-đun WebAssembly). Khi nó được gọi, nó gọi một hàm JavaScript được nhập khẩu có tên `imported_func`, chạy với giá trị (42) được cung cấp làm tham số.

## Chuyển đổi .wat văn bản thành tệp nhị phân .wasm

Hãy thử chuyển đổi ví dụ biểu diễn văn bản `.wat` ở trên thành định dạng hợp ngữ `.wasm`.

1. Đầu tiên, hãy tạo một bản sao của danh sách trên bên trong một tệp văn bản; gọi nó là `simple.wat`.
2. Chúng ta cần lắp ráp biểu diễn văn bản này thành ngôn ngữ hợp ngữ mà trình duyệt thực sự đọc trước khi chúng ta có thể sử dụng nó. Để làm điều này, chúng ta có thể sử dụng công cụ wabt, bao gồm các trình biên dịch để chuyển đổi giữa biểu diễn văn bản của WebAssembly và Wasm, và ngược lại, cộng thêm nhiều hơn nữa. Truy cập <https://github.com/webassembly/wabt> — làm theo hướng dẫn trên trang này để thiết lập công cụ.
3. Khi bạn đã xây dựng công cụ, hãy thêm thư mục `/wabt/out/clang/Debug` vào `PATH` hệ thống của bạn.
4. Tiếp theo, thực thi chương trình wat2wasm, truyền cho nó đường dẫn đến tệp đầu vào, tiếp theo là tham số `-o`, tiếp theo là đường dẫn đến tệp đầu ra:

   ```bash
   wat2wasm simple.wat -o simple.wasm
   ```

Điều này sẽ chuyển đổi Wasm thành một tệp có tên `simple.wasm`, chứa code hợp ngữ `.wasm`.

> [!NOTE]
> Bạn cũng có thể chuyển đổi hợp ngữ trở lại biểu diễn văn bản bằng công cụ wasm2wat; ví dụ `wasm2wat simple.wasm -o text.wat`.

## Xem đầu ra hợp ngữ

Vì tệp đầu ra dựa trên hợp ngữ, nó không thể được xem trong trình soạn thảo văn bản thông thường. Tuy nhiên, bạn có thể xem nó bằng tùy chọn `-v` của công cụ wat2wasm. Thử điều này:

```bash
wat2wasm simple.wat -v
```

Điều này sẽ cung cấp cho bạn một đầu ra trong terminal của bạn theo cách sau:

![several strings of binary with textual descriptions beside them. For example: 0000008: 01 ; section code ](assembly-output.png)

## Xem thêm

- [Hiểu định dạng văn bản WebAssembly](/en-US/docs/WebAssembly/Guides/Understanding_the_text_format) — giải thích chi tiết về cú pháp định dạng văn bản.
- [Biên dịch từ C/C++ sang WebAssembly](/en-US/docs/WebAssembly/Guides/C_to_Wasm) — các công cụ như Binaryen/Emscripten đều biên dịch mã nguồn của bạn sang Wasm và tạo code API cần thiết để chạy mô-đun trong ngữ cảnh JavaScript. Tìm hiểu thêm về cách sử dụng chúng.
- [Sử dụng JavaScript API WebAssembly](/en-US/docs/WebAssembly/Guides/Using_the_JavaScript_API) — đọc bài này nếu bạn muốn tìm hiểu thêm về cách code API WebAssembly hoạt động.
- [Định dạng văn bản](https://webassembly.github.io/spec/core/text/index.html) — giải thích thêm về định dạng văn bản, trên repo GitHub WebAssembly.
- [wast-loader](https://github.com/xtuc/webassemblyjs/tree/master/packages/wast-loader) — một loader cho webpack xử lý tất cả những điều này cho bạn.
