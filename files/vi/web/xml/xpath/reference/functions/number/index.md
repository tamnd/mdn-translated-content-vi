---
title: number
slug: Web/XML/XPath/Reference/Functions/number
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `number` chuyển một đối tượng thành một số và trả về số đó.

## Cú pháp

```plain
number( [object] )
```

### Tham số

- `object` (tùy chọn)
  - : Đối tượng sẽ được chuyển thành số. Nếu bỏ qua đối số này, nút ngữ cảnh hiện tại sẽ được dùng.

### Giá trị trả về

Số kết quả sau khi chuyển đổi đối tượng.

## Mô tả

- Chuỗi được chuyển thành số bằng cách loại bỏ khoảng trắng ở đầu trước số trong chuỗi và bỏ qua khoảng trắng sau số. Nếu chuỗi không khớp mẫu này, chuỗi sẽ được chuyển thành NaN.
- Giá trị boolean true được chuyển thành 1. False được chuyển thành 0.
- Một node-set trước tiên được chuyển thành chuỗi như thể bằng cách gọi hàm [string()](/en-US/docs/Web/XML/XPath/Reference/Functions/string), rồi được chuyển theo cùng cách như một đối số chuỗi.
- Một đối tượng thuộc kiểu khác bốn kiểu cơ bản sẽ được chuyển thành số theo cách phụ thuộc vào kiểu đó.

## Đặc tả

[XPath 1.0 4.4](https://www.w3.org/TR/xpath-10/#function-number)

## Hỗ trợ Gecko

Được hỗ trợ.
