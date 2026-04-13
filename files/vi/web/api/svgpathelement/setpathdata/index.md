---
title: "SVGPathElement: setPathData() method"
short-title: setPathData()
slug: Web/API/SVGPathElement/setPathData
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.SVGPathElement.setPathData
---

{{APIRef("SVG")}}{{SeeCompatTable}}

Phương thức **`SVGPathElement.setPathData()`** đặt chuỗi các đoạn đường dẫn làm dữ liệu đường dẫn mới.

## Cú pháp

```js-nolint
setPathData(pathData)
```

### Tham số

- `pathData`
  - : Một mảng các đoạn đường dẫn.
    Mỗi đoạn đường dẫn là một đối tượng với các thuộc tính sau:
    - `type`
      - : Một [lệnh đường dẫn](/en-US/docs/Web/SVG/Reference/Attribute/d#path_commands).
        Nếu [`options.normalize`](/en-US/docs/Web/API/SVGPathElement/getPathData#normalize) là true, đây sẽ là một trong các lệnh tuyệt đối: `'M'`, `'L'`, `'C'` và `'Z'`.
    - `values`
      - : Một mảng hoặc giá trị chứa các tham số cho lệnh tương ứng.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

## Ví dụ

### Đặt dữ liệu đường dẫn

Xem xét phần tử `<path>` sau, vẽ một hình vuông:

```xml
<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64">
  <path d="M0,0 h64 v64 h-64 z" />
</svg>
```

Đoạn mã dưới đây sử dụng phương thức {{domxref("SVGPathElement/getPathData", "getPathData()")}} để trả về dữ liệu đường dẫn đã chuẩn hóa dưới dạng [lệnh tuyệt đối](/en-US/docs/Web/SVG/Reference/Attribute/d#path_commands).
Đặt lại dữ liệu đã trả về vào phần tử `<path>` bằng phương thức `setPathData()` sẽ dẫn đến một tập lệnh đường dẫn khác trong DOM:

```js
const svgPath = document.querySelector("path");
const pathData = path.getPathData({ normalize: true });

svgPath.setPathData(pathData);

// <path d="M 0 0 L 64 0 L 64 64 L 0 64 Z" />
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
