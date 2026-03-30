---
title: Biên dịch
slug: Glossary/Compile
page-type: glossary-definition
sidebar: glossarysidebar
---

**Biên dịch** (Compiling) là quá trình chuyển đổi một chương trình máy tính được viết bằng một {{Glossary("computer programming", "ngôn ngữ")}} nhất định thành một tập hợp các lệnh ở định dạng hoặc ngôn ngữ khác. **Trình biên dịch** (compiler) là chương trình máy tính để thực hiện nhiệm vụ đó.

Thông thường, trình biên dịch chuyển đổi mã được viết bằng ngôn ngữ cấp cao như [C++](https://en.wikipedia.org/wiki/C++), [Rust](<https://en.wikipedia.org/wiki/Rust_(programming_language)>), hoặc [Java](<https://en.wikipedia.org/wiki/Java_(programming_language)>) thành mã thực thi (có thể chạy được) — gọi là **mã nhị phân** hoặc **mã máy**. [WebAssembly](/en-US/docs/WebAssembly), ví dụ, là một dạng mã nhị phân có thể chạy được, [có thể được biên dịch từ mã viết bằng C++, Rust, C#, Go, Swift và một số ngôn ngữ khác](https://webassembly.org/getting-started/developers-guide/) và chạy trên bất kỳ trang web nào, với hầu hết các tính năng được hỗ trợ trong các trình duyệt hiện đại.

Hầu hết các trình biên dịch thực hiện biên dịch trước (AOT - ahead-of-time) hoặc {{glossary("Just In Time Compilation", "biên dịch đúng lúc (JIT)")}}

Trình biên dịch GNU `gcc` là một ví dụ nổi tiếng về trình biên dịch AOT. Trình biên dịch AOT thường được gọi từ dòng lệnh trong môi trường shell (từ bên trong terminal hoặc console) hoặc trong {{Glossary("IDE")}}.

Trình biên dịch JIT thường không được gọi trực tiếp mà được tích hợp trong các môi trường chạy phần mềm để cải thiện hiệu năng. Ví dụ, tất cả các trình duyệt lớn hiện nay đều sử dụng các JavaScript engine có trình biên dịch JIT tích hợp.

Trình biên dịch cũng có thể dịch giữa các ngôn ngữ cấp cao — ví dụ từ TypeScript sang {{Glossary("JavaScript")}} — và trong trường hợp này, chúng thường được gọi là **transpiler**.

## Xem thêm

- [Compiler](https://en.wikipedia.org/wiki/Compiler) trên Wikipedia
- [WebAssembly](/en-US/docs/WebAssembly)
- Các thuật ngữ liên quan:
  - {{glossary("Just In Time Compilation", "Biên dịch đúng lúc (JIT)")}}
