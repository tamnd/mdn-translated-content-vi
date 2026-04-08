---
title: "Warning: -file- is being assigned a //# sourceMappingURL, but already has one"
slug: Web/JavaScript/Reference/Errors/Already_has_pragma
page-type: javascript-error
sidebar: jssidebar
---

Cảnh báo JavaScript "-file- is being assigned a //# sourceMappingURL, but already has one." xảy ra khi source map được chỉ định nhiều hơn một lần cho một nguồn JavaScript.

## Thông báo

```plain
Warning: -file- is being assigned a //# sourceMappingURL, but already has one.
```

## Loại lỗi

Một cảnh báo. Việc thực thi JavaScript sẽ không bị dừng lại.

## Nguyên nhân?

Source map đã được chỉ định nhiều hơn một lần cho một nguồn JavaScript.

Các nguồn JavaScript thường được kết hợp và thu nhỏ để việc phân phối chúng từ máy chủ hiệu quả hơn. Với [source maps](https://developer.chrome.com/blog/sourcemaps/), trình gỡ lỗi có thể ánh xạ code đang thực thi trở lại các file nguồn gốc. Có hai cách để chỉ định source map, hoặc bằng cách sử dụng comment hoặc bằng cách đặt header cho file JavaScript.

## Ví dụ

### Đặt source maps

Đặt source map bằng cách sử dụng comment trong file:

```js example-good
//# sourceMappingURL=http://example.com/path/to/your/sourcemap.map
```

Hoặc, thay vào đó, bạn có thể đặt header cho file JavaScript của mình:

```http example-good
X-SourceMap: /path/to/file.js.map
```

## Xem thêm

- [Use a source map](https://firefox-source-docs.mozilla.org/devtools-user/debugger/how_to/use_a_source_map/index.html) trong tài liệu nguồn Firefox
- [Introduction to JavaScript source maps](https://developer.chrome.com/blog/sourcemaps/) trên developer.chrome.com (2012)
