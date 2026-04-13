---
title: "HTMLMapElement: areas property"
short-title: areas
slug: Web/API/HTMLMapElement/areas
page-type: web-api-instance-property
browser-compat: api.HTMLMapElement.areas
---

{{ApiRef("HTML DOM")}}

Thuộc tính chỉ đọc **`areas`** của giao diện {{domxref("HTMLMapElement")}} trả về một tập hợp các phần tử {{HTMLElement("area")}} được liên kết với phần tử {{HTMLElement("map")}}.

## Giá trị

Một đối tượng {{domxref("HTMLCollection")}} của các phần tử {{domxref("HTMLAreaElement")}}.

## Ví dụ

```html
<map id="image-map" name="image-map">
  <area shape="circle" coords="50,50,35" href="#left" alt="left arrow" />
  <area shape="circle" coords="150,50,35" href="#right" alt="right arrow" />
</map>
<img
  usemap="#image-map"
  src="left-right-arrow.png"
  alt="left right arrow image" />
<output></output>
```

```css hidden
output {
  display: block;
}
```

```js
const mapElement = document.getElementById("image-map");
const outputElement = document.querySelector("output");

for (const area of mapElement.areas) {
  area.addEventListener("click", (event) => {
    outputElement.textContent = `You clicked on the ${area.alt} area.\n\n`;
  });
}
```

### Kết quả

{{EmbedLiveSample("Example",100,150)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLAreaElement")}}
- {{domxref("HTMLImageElement.useMap")}}
