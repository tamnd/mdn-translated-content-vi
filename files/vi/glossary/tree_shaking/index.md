---
title: Tree shaking
slug: Glossary/Tree_shaking
page-type: glossary-definition
sidebar: glossarysidebar
---

**Tree shaking** là thuật ngữ thường được dùng trong ngữ cảnh JavaScript để mô tả việc loại bỏ mã chết (dead code).

Nó dựa vào các câu lệnh [import](/en-US/docs/Web/JavaScript/Reference/Statements/import) và [export](/en-US/docs/Web/JavaScript/Reference/Statements/export) để phát hiện xem các mô-đun mã có được xuất và nhập để sử dụng giữa các file JavaScript hay không.

Trong các ứng dụng JavaScript hiện đại, chúng ta sử dụng các bộ đóng gói mô-đun (ví dụ: [webpack](https://webpack.js.org/) hoặc [Rollup](https://github.com/rollup/rollup)) để tự động loại bỏ mã chết khi đóng gói nhiều file JavaScript thành các file đơn. Điều này quan trọng cho việc chuẩn bị mã sẵn sàng cho môi trường sản xuất, ví dụ với cấu trúc gọn gàng và kích thước file tối thiểu.

## Xem thêm

- ["Lợi ích của việc loại bỏ mã chết trong quá trình đóng gói"](https://exploringjs.com/es6/ch_modules.html#_benefit-dead-code-elimination-during-bundling) trong cuốn sách của Axel Rauschmayer: "Exploring JS: Modules"
- [Triển khai tree shaking với webpack](https://webpack.js.org/guides/tree-shaking/)
