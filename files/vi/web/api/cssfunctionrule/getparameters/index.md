---
title: "CSSFunctionRule: getParameters() method"
short-title: getParameters()
slug: Web/API/CSSFunctionRule/getParameters
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CSSFunctionRule.getParameters
---

{{ APIRef("CSSOM") }}{{SeeCompatTable}}

Phương thức **`getParameters()`** của giao diện {{domxref("CSSFunctionRule")}} trả về mảng các đối tượng đại diện cho các tham số của hàm tùy chỉnh.

## Cú pháp

```js-nolint
getParameters()
```

### Tham số

Không có.

### Giá trị trả về

Mảng các đối tượng chứa các thuộc tính sau:

- `name`
  - : Chuỗi đại diện cho tên của tham số hàm.
- `type`
  - : Chuỗi đại diện cho kiểu dữ liệu của tham số, hoặc `*` nếu không có kiểu dữ liệu được chỉ định.
- `defaultValue`
  - : Chuỗi đại diện cho giá trị mặc định của tham số, hoặc `null` nếu không có giá trị mặc định được chỉ định.

Nếu không có tham số nào được chỉ định trong at-rule {{cssxref("@function")}} liên quan, mảng rỗng được trả về.

## Ví dụ

Xem trang tham chiếu chính {{domxref("CSSFunctionRule")}} để xem ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@function")}}
