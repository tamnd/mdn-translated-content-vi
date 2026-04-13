---
title: "NamedNodeMap: phương thức getNamedItem()"
short-title: getNamedItem()
slug: Web/API/NamedNodeMap/getNamedItem
page-type: web-api-instance-method
browser-compat: api.NamedNodeMap.getNamedItem
---

{{APIRef("DOM")}}

Phương thức **`getNamedItem()`** của giao diện {{domxref("NamedNodeMap")}} trả về {{domxref("Attr")}} tương ứng với tên đã cho, hoặc `null` nếu không có thuộc tính tương ứng.

> [!NOTE]
> Phương thức này cũng được gọi khi bạn sử dụng cú pháp toán tử `[]`. Vì vậy, `myMap[str]` tương đương với `myMap.getNamedItem(str)` khi `str` là một chuỗi.

## Cú pháp

```js-nolint
getNamedItem(name)
[name]
```

### Tham số

- `name`
  - : Một chuỗi với tên của thuộc tính mong muốn.

### Giá trị trả về

Một {{domxref("Attr")}} tương ứng với `name` được truyền vào tham số, hoặc `null` nếu không tìm thấy.

## Ví dụ

```html
<pre test="test"></pre>
```

```js
const pre = document.querySelector("pre");
const attrMap = pre.attributes;
const value = attrMap.getNamedItem("test").value;
pre.textContent = `The 'test' attribute contains ${value}.
And 'foo' has ${attrMap["foo"] ? "been" : "not been"} found.`;
```

{{EmbedLiveSample("Example", "100%", 80)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
