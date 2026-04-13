---
title: "SVGPathElement: getPathSegmentAtLength() method"
short-title: getPathSegmentAtLength()
slug: Web/API/SVGPathElement/getPathSegmentAtLength
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.SVGPathElement.getPathSegmentAtLength
---

{{APIRef("SVG")}}{{SeeCompatTable}}

Phương thức **`getPathSegmentAtLength()`** của giao diện {{domxref("SVGPathElement")}} trả về đoạn đường dẫn tại một khoảng cách nhất định dọc theo đường dẫn.

## Cú pháp

```js-nolint
getPathSegmentAtLength(distance)
```

### Tham số

- `distance`
  - : Một số cho biết khoảng cách dọc theo đường dẫn.

### Giá trị trả về

Một đối tượng đoạn đường dẫn. Nếu không có đoạn hợp lệ, trả về null.

Đối tượng đoạn có các thuộc tính sau:

- `type`
  - : Một [lệnh đường dẫn](/en-US/docs/Web/SVG/Reference/Attribute/d#path_commands).
- `values`
  - : Một mảng hoặc giá trị chứa các tham số cho lệnh tương ứng.

## Ví dụ

### Lấy đoạn đường dẫn

Xem xét phần tử `<path>` sau, vẽ một hình vuông:

```xml
<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64">
  <path d="M0,0 h64 v64 h-64 z" />
</svg>
```

Phương thức `getPathSegmentAtLength()` sẽ trả về một đối tượng đại diện cho đoạn `v64` nằm ở vị trí 65px dọc theo đường dẫn:

```js
const path = document.querySelector("path");

console.log(path.getPathSegmentAtLength(65));

// Output: đoạn đường dẫn
// {
//   type: "v",
//   values: [64]
// }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
