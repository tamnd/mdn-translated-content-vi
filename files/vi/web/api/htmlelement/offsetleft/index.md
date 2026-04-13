---
title: "HTMLElement: thuộc tính offsetLeft"
short-title: offsetLeft
slug: Web/API/HTMLElement/offsetLeft
page-type: web-api-instance-property
browser-compat: api.HTMLElement.offsetLeft
---

{{ APIRef("HTML DOM") }}

Thuộc tính chỉ đọc **`offsetLeft`** của giao diện {{domxref("HTMLElement")}} trả về số pixel mà _góc trên bên trái_ của phần tử hiện tại bị lệch sang trái trong nút {{domxref("HTMLElement.offsetParent")}}.

Đối với các phần tử cấp khối, `offsetTop`, `offsetLeft`, `offsetWidth` và `offsetHeight` mô tả hộp viền của một phần tử tương đối với `offsetParent`.

Tuy nhiên, đối với các phần tử cấp nội tuyến (như `<span>`) có thể bao sang dòng tiếp theo, `offsetTop` và `offsetLeft` mô tả vị trí của hộp viền _đầu tiên_ (dùng {{domxref("Element.getClientRects()")}} để lấy chiều rộng và chiều cao của nó), trong khi `offsetWidth` và `offsetHeight` mô tả kích thước của hộp viền _bao quanh_ (dùng {{domxref("Element.getBoundingClientRect()")}} để lấy vị trí của nó). Do đó, hộp có left, top, width và height là `offsetLeft`, `offsetTop`, `offsetWidth` và `offsetHeight` sẽ không phải là hộp bao quanh cho span có văn bản bao dòng.

## Giá trị

Một số nguyên.

## Ví dụ

```js
const colorTable = document.getElementById("t1");
const tOLeft = colorTable.offsetLeft;

if (tOLeft > 5) {
  // large left offset: do something here
}
```

Ví dụ này cho thấy một câu 'dài' bao trong div có viền xanh, và một hộp đỏ mà người ta có thể nghĩ sẽ mô tả ranh giới của span.

![A sentence that reads: Short span. This text is completely within a div with a blue border. A sentence that reads: Long span that wraps within this div. The words "long span that wraps" is within a box with a red border. The words "within this div" are within the div with the blue border. ](offsetleft.jpg)

```html
<div class="span-container">
  <span>Short span.</span>
  <span id="long-span">Long span that wraps within this div.</span>
</div>

<div id="box"></div>
```

```css
.span-container {
  width: 300px;
  border-color: blue;
  border-style: solid;
  border-width: 1px;
}

#box {
  position: absolute;
  border-color: red;
  border-width: 1px;
  border-style: solid;
  z-index: 10;
}
```

```js
const box = document.getElementById("box");
const longSpan = document.getElementById("long-span");
box.style.left = `${longSpan.offsetLeft}${document.body.scrollLeft}px`;
box.style.top = `${longSpan.offsetTop}${document.body.scrollTop}px`;
box.style.width = `${longSpan.offsetWidth}px`;
box.style.height = `${longSpan.offsetHeight}px`;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Xác định kích thước của các phần tử](/en-US/docs/Web/API/CSS_Object_Model/Determining_the_dimensions_of_elements)
- {{domxref("Element.clientLeft")}}
- {{domxref("Element.scrollLeft")}}
- {{domxref("HTMLElement.offsetHeight")}}
- {{domxref("HTMLElement.offsetWidth")}}
- {{domxref("HTMLElement.offsetTop")}}
- {{domxref("Element.getBoundingClientRect()")}}
