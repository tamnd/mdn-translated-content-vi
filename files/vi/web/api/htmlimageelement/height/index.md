---
title: "HTMLImageElement: height property"
short-title: height
slug: Web/API/HTMLImageElement/height
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.height
---

{{APIRef("HTML DOM")}}

Thuộc tính **`height`** của giao diện {{domxref("HTMLImageElement")}} cho biết độ cao mà hình ảnh được vẽ, tính bằng {{Glossary("CSS pixel", "CSS pixels")}}, nếu hình ảnh đang được vẽ hoặc hiển thị trên bất kỳ phương tiện trực quan nào như màn hình hoặc máy in. Mặt khác, đó là chiều cao tự nhiên, được điều chỉnh theo mật độ pixel của hình ảnh.

## Giá trị

Một giá trị số nguyên biểu thị chiều cao của hình ảnh. Cách xác định chiều cao tùy thuộc vào việc hình ảnh có được hiển thị trên phương tiện trực quan hay không.

- Nếu hình ảnh đang được hiển thị trên phương tiện trực quan như màn hình hoặc máy in thì chiều cao được biểu thị bằng {{Glossary("CSS pixel", "CSS pixels")}}.
- Mặt khác, chiều cao của hình ảnh được thể hiện bằng chiều cao tự nhiên (nội tại) của nó, được điều chỉnh theo mật độ hiển thị như được biểu thị bằng {{domxref("HTMLImageElement.naturalHeight", "naturalHeight")}}.

## Ví dụ

Trong ví dụ này, hai kích thước khác nhau được cung cấp cho hình ảnh đồng hồ bằng thuộc tính [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset). Một cái rộng 200px và cái kia rộng 400px. Hơn nữa, thuộc tính [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes) được cung cấp để chỉ định chiều rộng mà hình ảnh sẽ được vẽ dựa trên chiều rộng của khung nhìn.

### HTML

Đối với các khung nhìn có chiều rộng tối đa 400px, hình ảnh được vẽ ở chiều rộng 200px. Nếu không, nó sẽ được vẽ ở độ phân giải 400px.

```html
<p>Image height: <span class="size">?</span>px (resize to update)</p>
<img
  src="/en-US/docs/Web/HTML/Reference/Elements/img/clock-demo-200px.png"
  alt="Clock"
  srcset="
    /en-US/docs/Web/HTML/Reference/Elements/img/clock-demo-200px.png 200w,
    /en-US/docs/Web/HTML/Reference/Elements/img/clock-demo-400px.png 400w
  "
  sizes="(width <= 400px) 200px, 300px" />
```

### JavaScript

Mã JavaScript xem xét `height` để xác định chiều cao của hình ảnh dựa trên chiều rộng hiện tại của hình ảnh.

```js
const clockImage = document.querySelector("img");
let output = document.querySelector(".size");

const updateHeight = () => {
  output.innerText = clockImage.height;
};

updateHeight();
window.addEventListener("resize", updateHeight);
```

### Kết quả

{{EmbedLiveSample("Examples", 640, 450)}}

Ví dụ này có thể dễ dàng thử hơn {{LiveSampleLink('Examples', 'in its own window')}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.width")}}
- {{domxref("HTMLImageElement.naturalHeight")}}
- {{domxref("HTMLCanvasElement.height")}}
- {{domxref("HTMLEmbedElement.height")}}
- {{domxref("HTMLIFrameElement.height")}}
- {{domxref("HTMLObjectElement.height")}}
- {{domxref("HTMLSourceElement.height")}}
- {{domxref("HTMLVideoElement.height")}}
