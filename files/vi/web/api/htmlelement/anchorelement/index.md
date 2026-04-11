---
title: "HTMLElement: thuộc tính anchorElement"
short-title: anchorElement
slug: Web/API/HTMLElement/anchorElement
page-type: web-api-instance-property
status:
  - experimental
  - non-standard
browser-compat: api.HTMLElement.anchorElement
---

{{APIRef("HTML DOM")}}{{Non-standard_Header}}{{SeeCompatTable}}

Thuộc tính **`anchorElement`** của giao diện {{domxref("HTMLElement")}} trả về tham chiếu đến phần tử neo của phần tử. Thuộc tính này chỉ hoạt động đối với các phần tử được liên kết với neo thông qua thuộc tính HTML [`anchor`](/en-US/docs/Web/HTML/Reference/Global_attributes/anchor), không áp dụng cho các phần tử được liên kết với neo qua thuộc tính CSS {{cssxref("anchor-name")}} và {{cssxref("position-anchor")}}.

## Giá trị

Một đối tượng {{domxref("HTMLElement")}} đại diện cho phần tử neo của phần tử, hoặc `null` nếu không có.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này liên kết một phần tử với một neo trong HTML, rồi dùng JavaScript để lấy tham chiếu đến phần tử neo.

#### HTML

Trong HTML, chúng ta tạo một phần tử {{htmlelement("div")}} với [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) là `example-anchor`. Đây sẽ là phần tử neo. Tiếp theo, chúng ta thêm một `<div>` khác với class là `infobox` và thuộc tính [`anchor`](/en-US/docs/Web/HTML/Reference/Global_attributes/anchor) được đặt thành `example-anchor`. Điều này chỉ định `<div>` đầu tiên là neo của `<div>` thứ hai, liên kết chúng lại với nhau.

Chúng ta cũng thêm một phần tử {{htmlelement("p")}} để hiển thị kết quả.

```html
<div class="anchor" id="example-anchor">⚓︎</div>

<div class="infobox" anchor="example-anchor">
  <p>This is an information box.</p>
</div>

<p class="output"></p>
```

#### JavaScript

Chúng ta dùng JavaScript để lấy tham chiếu đến phần tử được định vị và phần tử đầu ra, sau đó in giá trị `id` của thuộc tính `anchorElement` của phần tử được định vị ra đầu ra, cho thấy phần tử neo là `anchorElement` của phần tử được định vị.

```js
const posElem = document.querySelector(".infobox");
const outputElem = document.querySelector(".output");

try {
  outputElem.textContent = `The positioned element's anchor element is the ${posElem.anchorElement.id}.`;
} catch (e) {
  outputElem.textContent = `Your browser doesn't support the anchorElement property.`;
}
```

#### Kết quả

Kết quả như sau.

{{EmbedLiveSample("Basic usage", "100%", 110)}}

## Thông số kỹ thuật

Thuộc tính này hiện chưa thuộc đặc tả HTML. Đọc thảo luận về việc thêm thuộc tính `anchorElement` tại [https://github.com/whatwg/html/pull/9144](https://github.com/whatwg/html/pull/9144).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML [`anchor`](/en-US/docs/Web/HTML/Reference/Global_attributes/anchor)
- Thuộc tính CSS {{cssxref("anchor-name")}} và {{cssxref("position-anchor")}}
- Module [định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
