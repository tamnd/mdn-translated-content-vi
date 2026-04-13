---
title: "Highlight: size property"
short-title: size
slug: Web/API/Highlight/size
page-type: web-api-instance-property
browser-compat: api.Highlight.size
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-get-set.prototype.size
---

{{APIRef("CSS Custom Highlight API")}}

Thuộc tính **`size`** trả về số lượng đối tượng {{domxref("Range")}} trong một đối tượng {{domxref("Highlight")}}.

## Giá trị

Giá trị của `size` là một số nguyên chỉ đọc đại diện cho số lượng mục trong đối tượng làm nổi bật.

## Ví dụ

### Sử dụng size

```js
const highlight = new Highlight();
highlight.add(range1);
highlight.add(range2);
highlight.add(range3);

console.log(highlight.size); // 3
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
