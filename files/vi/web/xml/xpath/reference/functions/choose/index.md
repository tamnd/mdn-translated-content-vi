---
title: choose
slug: Web/XML/XPath/Reference/Functions/choose
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `choose` trả về một trong các đối tượng được chỉ định dựa trên một tham số boolean.

> [!NOTE]
> Nên dùng phương thức này thay cho `if ()`, vì nó đã bị ngừng dùng.

## Cú pháp

```plain
choose( boolean, object1, object2 )
```

### Tham số

- `boolean`
  - : Phép toán boolean dùng để xác định đối tượng nào sẽ được trả về.
- `object1`
  - : Đối tượng đầu tiên được xem xét để trả về.
- `object2`
  - : Đối tượng thứ hai được xem xét để trả về.

### Giá trị trả về

Nếu tham số boolean là true, đối tượng đầu tiên sẽ được trả về; ngược lại, đối tượng thứ hai sẽ được trả về.

> [!NOTE]
> Tất cả các tham số đều được đánh giá, kể cả tham số không được trả về.

## Đặc tả

[XForms 1.1](https://www.w3.org/TR/xforms11/#fn-choose)

## Hỗ trợ Gecko

Được hỗ trợ.
