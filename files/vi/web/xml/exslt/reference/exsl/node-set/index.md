---
title: exsl:node-set()
slug: Web/XML/EXSLT/Reference/exsl/node-set
page-type: exslt-function
sidebar: xmlsidebar
---

`exsl:node-set()` trả về một node-set từ một result tree fragment, tức là thứ bạn nhận được khi xem `xsl:variable` thay vì thuộc tính select của nó để lấy giá trị của một biến. Điều này cho phép bạn xử lý XML được tạo trong một biến theo nhiều bước.

Bạn cũng có thể dùng `exsl:node-set()` để chuyển chuỗi thành các nút văn bản.

## Cú pháp

```plain
exsl:node-set(object)
```

### Tham số

- `object`
  - : Đối tượng mà từ đó sẽ trả về node-set tương ứng.

### Giá trị trả về

Node-set tương ứng với `object` đã chỉ định.

## Đặc tả

[EXSLT - EXSL:NODE-SET](https://exslt.github.io/exsl/functions/node-set/index.html)
