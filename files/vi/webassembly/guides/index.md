---
title: Hướng dẫn WebAssembly
short-title: Hướng dẫn
slug: WebAssembly/Guides
page-type: listing-page
sidebar: webassemblysidebar
---

Các hướng dẫn về [WebAssembly](/en-US/docs/WebAssembly) bao gồm các chủ đề như khái niệm cấp cao, biên dịch từ các ngôn ngữ khác nhau, biểu diễn văn bản của định dạng nhị phân Wasm, và cách chạy WebAssembly.

- [Khái niệm WebAssembly](/en-US/docs/WebAssembly/Guides/Concepts)
  - : Bài viết này giải thích các khái niệm đằng sau cách WebAssembly hoạt động, bao gồm mục tiêu của nó, các vấn đề nó giải quyết, và cách nó chạy bên trong engine JavaScript của trình duyệt web.

## Biên dịch WebAssembly

- [Biên dịch mô-đun C/C++ mới sang WebAssembly](/en-US/docs/WebAssembly/Guides/C_to_Wasm)
  - : Khi bạn đã viết một mô-đun code mới bằng ngôn ngữ như C/C++, bạn có thể biên dịch nó thành WebAssembly bằng công cụ như [Emscripten](https://emscripten.org/). Hãy xem cách thức hoạt động của nó.
- [Biên dịch mô-đun C hiện có sang WebAssembly](/en-US/docs/WebAssembly/Guides/Existing_C_to_Wasm)
  - : Một trường hợp sử dụng cốt lõi của WebAssembly là tận dụng hệ sinh thái thư viện C hiện có và cho phép các nhà phát triển sử dụng chúng trên web.
- [Biên dịch từ Rust sang WebAssembly](/en-US/docs/WebAssembly/Guides/Rust_to_Wasm)
  - : Hướng dẫn này chỉ cho bạn cách biên dịch một dự án Rust thành WebAssembly và sử dụng nó trong ứng dụng web hiện có.

## Hướng dẫn ngôn ngữ WebAssembly

- [Hiểu định dạng văn bản WebAssembly](/en-US/docs/WebAssembly/Guides/Understanding_the_text_format)
  - : Để WebAssembly có thể được đọc và chỉnh sửa bởi con người, có một biểu diễn văn bản của định dạng nhị phân Wasm. Đây là dạng trung gian được thiết kế để hiển thị trong các trình soạn thảo văn bản, công cụ phát triển trình duyệt, và các môi trường tương tự. Bài viết này giải thích cách định dạng văn bản hoạt động về mặt cú pháp thô, và cách nó liên quan đến bytecode cơ bản mà nó đại diện và các đối tượng bọc đại diện cho Wasm trong JavaScript.
- [Chuyển đổi định dạng văn bản WebAssembly thành nhị phân](/en-US/docs/WebAssembly/Guides/Text_format_to_Wasm)
  - : WebAssembly có biểu diễn văn bản dựa trên S-expression, một dạng trung gian được thiết kế để hiển thị trong các trình soạn thảo văn bản, công cụ phát triển trình duyệt, v.v. Bài viết này giải thích một chút về cách nó hoạt động và cách sử dụng các công cụ có sẵn để chuyển đổi các tệp định dạng văn bản sang định dạng Wasm.
- [Các hàm xuất khẩu WebAssembly](/en-US/docs/WebAssembly/Guides/Exported_functions)
  - : Các hàm xuất khẩu WebAssembly là cách các hàm WebAssembly được biểu diễn trong JavaScript. Bài viết này mô tả chi tiết hơn về chúng là gì.
- [Các hàm tích hợp JavaScript WebAssembly](/en-US/docs/WebAssembly/Guides/JavaScript_builtins)
  - : Các hàm tích hợp JavaScript WebAssembly là các tương đương Wasm của các phép toán JavaScript cung cấp cách sử dụng các tính năng JavaScript bên trong mô-đun Wasm mà không cần phải nhập khẩu code glue JavaScript để cung cấp cầu nối giữa các giá trị và quy ước gọi hàm của JavaScript và WebAssembly.
- [Hằng chuỗi toàn cục được nhập khẩu của WebAssembly](/en-US/docs/WebAssembly/Guides/Imported_string_constants)
  - : Các hằng chuỗi toàn cục được nhập khẩu của WebAssembly giúp làm việc với chuỗi JavaScript bên trong các mô-đun Wasm dễ dàng hơn bằng cách loại bỏ nhu cầu về nhiều mã lặp đi lặp lại liên quan đến việc nhập khẩu chuỗi truyền thống.

## Hướng dẫn JavaScript API

- [Sử dụng JavaScript API WebAssembly](/en-US/docs/WebAssembly/Guides/Using_the_JavaScript_API)
  - : Bài viết này hướng dẫn bạn cách sử dụng các tính năng chính của JavaScript API WebAssembly, bao gồm tải mô-đun Wasm và thao tác với bộ nhớ, bảng và biến toàn cục của WebAssembly.
- [Tải và chạy code WebAssembly](/en-US/docs/WebAssembly/Guides/Loading_and_running)
  - : Để sử dụng WebAssembly trong JavaScript, bạn trước tiên cần kéo mô-đun của mình vào bộ nhớ trước khi biên dịch/khởi tạo. Bài viết này cung cấp tài liệu tham khảo về các cơ chế khác nhau có thể được sử dụng để tải bytecode WebAssembly, cũng như cách biên dịch/khởi tạo và chạy nó.

## Xem thêm

- [WebAssembly](/en-US/docs/WebAssembly)
