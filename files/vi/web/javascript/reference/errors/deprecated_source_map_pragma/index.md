---
title: "SyntaxError: Using //@ to indicate sourceURL pragmas is deprecated. Use //# instead"
slug: Web/JavaScript/Reference/Errors/Deprecated_source_map_pragma
page-type: javascript-error
sidebar: jssidebar
---

Cảnh báo JavaScript "Using `//@` to indicate sourceURL pragmas is deprecated. Use `//#` instead" xảy ra khi có cú pháp source map lỗi thời trong nguồn JavaScript.

## Thông báo

```plain
Warning: SyntaxError: Using //@ to indicate sourceURL pragmas is deprecated. Use //# instead

Warning: SyntaxError: Using //@ to indicate sourceMappingURL pragmas is deprecated. Use //# instead
```

## Loại lỗi

Cảnh báo rằng một {{jsxref("SyntaxError")}} đã xảy ra. Quá trình thực thi JavaScript sẽ không bị dừng lại.

## Điều gì đã xảy ra?

Có cú pháp source map lỗi thời trong nguồn JavaScript.

Các nguồn JavaScript thường được kết hợp và thu gọn để việc phân phối chúng từ máy chủ hiệu quả hơn. Với [source maps](https://firefox-source-docs.mozilla.org/devtools-user/debugger/how_to/use_a_source_map/index.html), trình gỡ lỗi có thể ánh xạ mã đang được thực thi với các tệp nguồn gốc.

Đặc tả source map đã thay đổi cú pháp do xung đột với IE mỗi khi nó được tìm thấy trong trang sau khi `//@cc_on` được diễn giải để bật biên dịch có điều kiện trong công cụ IE JScript. [Bình luận biên dịch có điều kiện](https://stackoverflow.com/questions/24473882/what-does-this-comment-cc-on-0-do-inside-an-if-statement-in-javascript) trong IE là một tính năng ít được biết đến, nhưng nó đã làm hỏng source maps với [jQuery](https://bugs.jquery.com/ticket/13274/) và các thư viện khác.

## Ví dụ

### Cú pháp lỗi thời

Cú pháp với dấu "@" đã lỗi thời.

```js example-bad
//@ sourceMappingURL=http://example.com/path/to/your/sourcemap.map
```

### Cú pháp chuẩn

Sử dụng dấu "#" thay thế.

```js example-good
//# sourceMappingURL=http://example.com/path/to/your/sourcemap.map
```

Hoặc, thay thế, bạn có thể đặt header {{HTTPHeader("SourceMap")}} cho tệp JavaScript của mình để tránh có bình luận:

```http example-good
SourceMap: /path/to/file.js.map
```

## Xem thêm

- [Sử dụng source map](https://firefox-source-docs.mozilla.org/devtools-user/debugger/how_to/use_a_source_map/index.html) trong tài liệu nguồn Firefox
- [Giới thiệu về JavaScript source maps](https://developer.chrome.com/blog/sourcemaps/) trên developer.chrome.com (2012)
- {{HTTPHeader("SourceMap")}}
