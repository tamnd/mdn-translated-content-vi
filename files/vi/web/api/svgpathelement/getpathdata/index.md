---
title: "SVGPathElement: getPathData() method"
short-title: getPathData()
slug: Web/API/SVGPathElement/getPathData
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.SVGPathElement.getPathData
---

{{APIRef("SVG")}}{{SeeCompatTable}}

Phương thức **`SVGPathElement.getPathData()`** trả về chuỗi các đoạn đường dẫn tương ứng với dữ liệu đường dẫn, tùy chọn chuẩn hóa các giá trị và loại đoạn.

## Cú pháp

```js-nolint
getPathData()
getPathData(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn để kiểm soát các khía cạnh của quá trình truy xuất dữ liệu đường dẫn. Đối tượng này có thể chứa các thuộc tính sau:
    - `normalize` {{optional_inline}}
      - : Một giá trị boolean cho biết liệu chuỗi đoạn đường dẫn trả về có được chuyển đổi sang tập lệnh cơ sở của [lệnh tuyệt đối](/en-US/docs/Web/SVG/Reference/Attribute/d#path_commands) (`'M'`, `'L'`, `'C'` và `'Z'`) hay không, với các giá trị được điều chỉnh tương ứng.

### Giá trị trả về

Một mảng các đoạn đường dẫn tương ứng với dữ liệu đường dẫn. Nếu không có dữ liệu đường dẫn hợp lệ, trả về một chuỗi rỗng.

Mỗi đoạn đường dẫn là một đối tượng với các thuộc tính sau:

- `type`
  - : Một [lệnh đường dẫn](/en-US/docs/Web/SVG/Reference/Attribute/d#path_commands).
    Nếu [`options.normalize`](#normalize) là true, đây sẽ là một trong các lệnh tuyệt đối: `'M'`, `'L'`, `'C'` và `'Z'`.
- `values`
  - : Một mảng hoặc giá trị chứa các tham số cho lệnh tương ứng.

## Ví dụ

### Lấy dữ liệu đường dẫn

Xem xét phần tử `<path>` sau, vẽ một hình vuông:

```xml
<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64">
  <path d="M0,0 h64 v64 h-64 z" />
</svg>
```

Phương thức `getPathData()` sẽ trả về một mảng với dữ liệu đường dẫn thô, giống như được thiết lập trong thuộc tính `d`. Với tùy chọn `normalize: true`, nó sẽ trả về dữ liệu đường dẫn được chuẩn hóa theo tập lệnh cơ sở:

```js
const path = document.querySelector("path");

console.log(path.getPathData());

// Output: dữ liệu đường dẫn thô:
// [
//   { type: "M", values: [0, 0] },
//   { type: "h", values: [64] },
//   { type: "v", values: [64] },
//   { type: "h", values: [-64] },
//   { type: "Z", values: [] }
// ]

console.log(path.getPathData({ normalize: true }));

// Output: dữ liệu đường dẫn đã chuẩn hóa:
// [
//   { type: "M", values: [0, 0] },
//   { type: "L", values: [64, 0] },
//   { type: "L", values: [64, 64] },
//   { type: "L", values: [0, 64] },
//   { type: "Z", values: [] }
// ]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
