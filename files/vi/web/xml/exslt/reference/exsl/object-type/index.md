---
title: exsl:object-type()
slug: Web/XML/EXSLT/Reference/exsl/object-type
page-type: exslt-function
sidebar: xmlsidebar
---

`exsl:object-type()` trả về một chuỗi chỉ ra kiểu của đối tượng được chỉ định.

> [!NOTE]
> Hầu hết các kiểu đối tượng [XSLT](/en-US/docs/Web/XML/XSLT) có thể được ép kiểu an toàn cho nhau; tuy nhiên, một số phép ép kiểu có thể gây ra điều kiện lỗi. Cụ thể, việc coi một thứ không phải node-set như node-set sẽ gây ra điều đó. Hàm này cho phép tác giả của các named template và extension function dễ dàng cung cấp sự linh hoạt trong các giá trị tham số.

## Cú pháp

```plain
exsl:object-type(object)
```

### Tham số

- `object`
  - : Đối tượng mà kiểu của nó sẽ được trả về.

### Giá trị trả về

Kiểu của đối tượng, sẽ là một trong các giá trị sau:

- `string`
- `number`
- `boolean`
- `node-set`
- `RTF`
- `external`

## Đặc tả

[EXSLT - EXSL:OBJECT-TYPE](https://exslt.github.io/exsl/functions/object-type/index.html)
