---
title: Source map
slug: Glossary/Source_map
page-type: glossary-definition
sidebar: glossarysidebar
---

**Source map** (bản đồ nguồn) là định dạng tệp {{Glossary("JSON")}} ánh xạ giữa code đã được rút gọn hoặc chuyển đổi mà trình duyệt nhận được và dạng gốc chưa sửa đổi của nó, cho phép code gốc được tái tạo lại và sử dụng khi gỡ lỗi.

Code được thực thi bởi trình duyệt thường được chuyển đổi theo một cách nào đó từ mã nguồn gốc ban đầu được tạo ra bởi nhà phát triển. Có một số lý do cho điều này:

- Để việc phân phối code từ máy chủ hiệu quả hơn bằng cách kết hợp và rút gọn các tệp nguồn.
- Để hỗ trợ các trình duyệt cũ hơn bằng cách chuyển đổi các tính năng hiện đại thành các phiên bản tương đương cũ hơn.
- Để sử dụng các ngôn ngữ mà trình duyệt không hỗ trợ, như {{Glossary("TypeScript")}} hay [Sass](https://sass-lang.com/).

Trong các tình huống này, việc gỡ lỗi trực tiếp từ mã nguồn gốc trực quan hơn so với mã ở trạng thái đã chuyển đổi mà trình duyệt đã tải xuống. Trình duyệt phát hiện source map thông qua HTTP header {{HTTPHeader("SourceMap")}} cho một tài nguyên, hoặc chú thích `sourceMappingURL` trong code đã tạo ra.

## Ví dụ

Ví dụ, hãy xem cú pháp SCSS của Sass này:

```scss
ul {
  list-style: none;
  li {
    display: inline;
  }
}
```

Trong quá trình build, SCSS được chuyển đổi thành CSS. Tệp source map `index.css.map` được tạo ra và liên kết từ CSS trong một nhận xét ở cuối:

```css
ul {
  list-style: none;
}
ul li {
  display: inline;
}

/*# sourceMappingURL=index.css.map */
```

Tệp map này không chỉ chứa ánh xạ giữa SCSS gốc và CSS được tạo ra mà còn chứa code nguồn SCSS gốc ở dạng được mã hóa. Nó bị trình phân tích CSS của trình duyệt bỏ qua nhưng được sử dụng bởi DevTools của trình duyệt:

```json
{
  "version": 3,
  "sourceRoot": "",
  "sources": ["index.scss"],
  "names": [],
  "mappings": "AAAA;EACC;;AACA;EACC",
  "file": "index.css"
}
```

Source map cho phép DevTools của trình duyệt liên kết đến các dòng cụ thể trong tệp SCSS gốc và hiển thị code nguồn:

![Firefox DevTools tập trung vào phần tử li trong DOM inspector. Bảng style hiển thị CSS đã được chuyển đổi mà không có lồng nhau và liên kết đến dòng thứ ba của tệp index.scss.](inspector.png)

![Firefox DevTools với tệp index.scss được mở trong style editor. Editor tập trung vào dòng thứ ba của code nguồn ở định dạng SCSS có lồng nhau.](style-editor.png)

## Xem thêm

- [Đặc tả định dạng source map](https://tc39.es/ecma426/2024/)
- HTTP response header {{HTTPHeader("SourceMap")}}
- [Firefox Developer Tools: sử dụng source map](https://firefox-source-docs.mozilla.org/devtools-user/debugger/how_to/use_a_source_map/index.html)
