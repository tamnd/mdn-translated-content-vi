---
title: "NamedNodeMap: phương thức item()"
short-title: item()
slug: Web/API/NamedNodeMap/item
page-type: web-api-instance-method
browser-compat: api.NamedNodeMap.item
---

{{APIRef("DOM")}}

Phương thức **`item()`** của giao diện {{domxref("NamedNodeMap")}} trả về mục trong map khớp với chỉ số.

> [!NOTE]
> Phương thức này cũng được gọi khi bạn sử dụng cú pháp toán tử `[]`. Vì vậy, `myMap[i]` tương đương với `myMap.item(i)` khi `i` là một số.

## Cú pháp

```js-nolint
item(index)
[index]
```

### Tham số

- `index`
  - : Một số đại diện cho chỉ số của mục bạn muốn trả về.

### Giá trị trả về

Một {{domxref("Attr")}} hoặc `null` nếu số lớn hơn hoặc bằng `length` của map.

## Ví dụ

```html
<pre class="foo" id="bar" contenteditable></pre>
```

```js
const pre = document.querySelector("pre");
const attrMap = pre.attributes;

pre.textContent = `The attribute map contains:
0: ${attrMap.item(0).name}
1: ${attrMap[1].name}
2: ${attrMap.item(2).name}`;
```

{{EmbedLiveSample("Example", "100%", 120)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
