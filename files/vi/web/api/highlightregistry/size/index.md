---
title: "HighlightRegistry: size property"
short-title: size
slug: Web/API/HighlightRegistry/size
page-type: web-api-instance-property
browser-compat: api.HighlightRegistry.size
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-get-map.prototype.size
---

{{APIRef("CSS Custom Highlight API")}}

Thuộc tính **`size`** trả về số lượng đối tượng {{domxref("Highlight")}} trong {{domxref("HighlightRegistry")}}.

## Giá trị

Một số nguyên chỉ đọc cho biết sổ đăng ký đang chứa bao nhiêu đối tượng `Highlight`.

## Ví dụ

### Sử dụng size

```js
const highlight1 = new Highlight();
const highlight2 = new Highlight();

CSS.highlights.set("highlight-1", highlight1);
CSS.highlights.set("highlight-2", highlight2);

console.log(CSS.highlights.size); // 2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
