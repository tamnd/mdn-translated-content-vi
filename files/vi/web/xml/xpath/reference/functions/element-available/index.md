---
title: element-available
slug: Web/XML/XPath/Reference/Functions/element-available
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `element-available` xác định xem một phần tử có sẵn hay không và trả về true hoặc false.

## Cú pháp

```plain
element-available( QName )
```

### Tham số

- `QName`
  - : Phải đánh giá thành một QName hợp lệ. QName được mở rộng thành expanded-name bằng cách sử dụng các khai báo namespace đang có hiệu lực cho biểu thức.

### Giá trị trả về

Trả về true nếu và chỉ khi expanded-name là tên của một chỉ thị. Nếu expanded-name có một URI namespace bằng với URI namespace XSLT, thì nó tham chiếu đến một phần tử được định nghĩa bởi XSLT. Ngược lại, nó tham chiếu đến một phần tử mở rộng. Nếu expanded-name có URI namespace rỗng, hàm element-available sẽ trả về false.

## Đặc tả

[XSLT 1.0 15](https://www.w3.org/TR/xslt-10/#function-element-available)

## Hỗ trợ Gecko

Được hỗ trợ.
