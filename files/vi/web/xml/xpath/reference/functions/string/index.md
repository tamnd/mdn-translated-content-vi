---
title: string
slug: Web/XML/XPath/Reference/Functions/string
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `string` chuyển đối số đã cho thành một chuỗi.

## Cú pháp

```plain
string( [object] )
```

### Tham số

- `object` (tùy chọn)
  - : Đối tượng sẽ được chuyển thành chuỗi. Nếu bỏ qua, nút ngữ cảnh sẽ được dùng.

### Giá trị trả về

Một chuỗi

## Mô tả

- Nếu đối tượng là một node-set, giá trị chuỗi của nút đầu tiên trong tập sẽ được trả về.
- Một số được chuyển như sau:
  - NaN được chuyển thành chuỗi NaN.
  - Số 0 dương được chuyển thành chuỗi 0.
  - Số 0 âm được chuyển thành chuỗi 0.
  - Vô cực dương được chuyển thành chuỗi Infinity.
  - Vô cực âm được chuyển thành chuỗi -Infinity.
  - Các số thập phân giữa -1 và 1 được chuyển thành chuỗi có một số 0 đứng trước dấu thập phân.
  - Boolean true được chuyển thành chuỗi true.
  - Boolean false được chuyển thành chuỗi false.

## Thông số kỹ thuật

[XPath 1.0 4.2](https://www.w3.org/TR/xpath-10/#function-string)

## Hỗ trợ Gecko

Được hỗ trợ.
